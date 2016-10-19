package com.sr178.iseek.pc.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.collect.Lists;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.iseek.pc.bean.InfoPageBO;
import com.sr178.iseek.pc.bean.InfoPageLinksBO;
import com.sr178.iseek.pc.bean.LoginBO;
import com.sr178.iseek.pc.bean.UpdateBO;
import com.sr178.iseek.pc.bean.UpdatePackageBO;
import com.sr178.iseek.pc.bo.News;
import com.sr178.iseek.pc.bo.NewsConfig;
import com.sr178.iseek.pc.bo.User;
import com.sr178.iseek.pc.bo.Version;
import com.sr178.iseek.pc.dao.ChargeConfigDao;
import com.sr178.iseek.pc.dao.FilesDao;
import com.sr178.iseek.pc.dao.MobileVerifyDao;
import com.sr178.iseek.pc.dao.NewsConfigDao;
import com.sr178.iseek.pc.dao.NewsDao;
import com.sr178.iseek.pc.dao.NoticeDao;
import com.sr178.iseek.pc.dao.PaymentLogDao;
import com.sr178.iseek.pc.dao.PaymentOrderDao;
import com.sr178.iseek.pc.dao.RegQuestionDao;
import com.sr178.iseek.pc.dao.UserDao;
import com.sr178.iseek.pc.dao.UserFilesDao;
import com.sr178.iseek.pc.dao.UserMessageDao;
import com.sr178.iseek.pc.dao.UserNoticeStatusDao;
import com.sr178.iseek.pc.dao.VersionDao;
import com.sr178.module.utils.DateUtils;
import com.sr178.module.utils.MD5Security;
import com.sr178.module.utils.ParamCheck;


public class PcService {
	public static final String AND = "and";
	public static final String OR = "or";

  	private Cache<String,String> userTransferKeys = CacheBuilder.newBuilder().maximumSize(20000).build();
  	
  	private Cache<String,Date> userWrongPasswordDate = CacheBuilder.newBuilder().maximumSize(2000).build();
  	
  	private Cache<String,Integer> userWrongPasswordTimes = CacheBuilder.newBuilder().maximumSize(2000).build();

  	@Autowired
  	private ChargeConfigDao chargeConfigDao;
  	@Autowired
  	private FilesDao filesDao;
  	@Autowired
  	private MobileVerifyDao mobileVerifyDao;
  	@Autowired
  	private NewsConfigDao newsConfigDao;
  	@Autowired
  	private NewsDao newsDao;
  	@Autowired
  	private NoticeDao noticeDao;
  	@Autowired
  	private PaymentOrderDao paymentOrderDao;
  	@Autowired
  	private PaymentLogDao paymentLogDao;
  	@Autowired
  	private RegQuestionDao regQuestionDao;
  	@Autowired
  	private UserDao userDao;
  	@Autowired
  	private UserFilesDao userFilesDao;
  	@Autowired
  	private UserMessageDao userMessageDao;
  	@Autowired
  	private UserNoticeStatusDao userNoticeStatusDao;
  	@Autowired
  	private VersionDao versionDao;
	/**
	 * 查看是否登录了
	 * 
	 * @param sessionId
	 * @return
	 */
	public boolean isLogin(String userId,String authStr) {
		if (userId == null || "".equals(userId) || authStr ==null || "".equals(authStr)) {
			return false;
		}
		return checkAhthStr(userId, authStr);
	}
	/**
	 * 检查用户id和加密串是否合法
	 * @param userId
	 * @param authStr
	 * @return
	 */
	private boolean checkAhthStr(String userId,String authStr){
		String transferKey = userTransferKeys.getIfPresent(userId);
		if(Strings.isNullOrEmpty(transferKey)){
			return false;
		}
		String authDecryptStr = null;
		authDecryptStr = decrypt(authStr, transferKey);
		if(authDecryptStr!=null){
			LogSystem.info("解密后的authStr = ["+authDecryptStr+"]");
			return true;
		}else{
			return false;
		}
		
	}
	
	/**
	 * 256位aes加密
	 * @param encryptStr
	 * @param key32
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws NoSuchPaddingException 
	 * @throws NoSuchAlgorithmException 
	 * @throws InvalidKeyException 
	 * @throws BadPaddingException 
	 * @throws IllegalBlockSizeException 
	 */
	private static String encrypt(String encryptStr,String key32){
		String ciphertext = null;
		try {
			SecretKeySpec key = new SecretKeySpec(key32.getBytes("utf-8"), "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(1, key);
			byte[] result = cipher.doFinal(encryptStr.getBytes("utf-8"));
			if ((null != result) && (result.length > 0))
			{
			   ciphertext = Base64.getEncoder().encodeToString(result);
			}
		} catch (Exception e) {
			 LogSystem.error(e, "AES加密失败，加密字符串="+encryptStr+"，加密key为="+key32);
		}
		
		return ciphertext;
	}
	/**
	 * aes 256位解密
	 * @param authStr
	 * @param key32
	 * @return
	 */
	private static String decrypt(String authStr,String key32) {
		String decryptStr = null;
		SecretKeySpec key;
		try {
			key = new SecretKeySpec(key32.getBytes("utf-8"), "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(2, key);
			byte[] result = cipher.doFinal(Base64.getDecoder().decode(authStr));
			if ((null != result) && (result.length > 0))
			{
				decryptStr = new String(result, "utf-8");
			}
		} catch (Exception e) {
			 LogSystem.error(e, "AES解密失败，解密字符串="+authStr+"，解密key为="+key32);
		}
		return decryptStr;
	}
    /**
     * 将数据库中的密码解密出来 当做秘钥
     * @param dataBasePassword
     * @return
     */
	private String getTruePassword(String dataBasePassword){
			return decrypt(dataBasePassword, "6A38719F22424b2d94227923E966F9AC");
	}
	/**
	 * 登录
	 * 
	 * @param userName
	 * @param passWord
	 */
	public LoginBO login(String userName, String loginStr) {
		ParamCheck.checkString(userName, 1, "用户名不能为空");
		ParamCheck.checkString(loginStr, 2, "密码不能为空");
		User user = userDao.get(new SqlParamBean("user_name", userName));
		if (user == null) {
			throw new ServiceException(3, "用户名不存在");
		}
		Date date = userWrongPasswordDate.getIfPresent(user.getUserId()+"");
		if(date!=null&&(date.getTime()+1800*1000)>new Date().getTime()){
			throw new ServiceException(8, "账号尝试密码次数超过10次！禁止登陆30分钟！！");
		}
		if(user.getStatus()!=0){
			throw new ServiceException(5, "该账户已被禁用，请及时联系管理员！");
		}
		String truePassword = getTruePassword(user.getPassWord());
		
 		String decryptLoginStr = decrypt(loginStr, truePassword);
 		if(decryptLoginStr==null){
 			Integer times = userWrongPasswordTimes.getIfPresent(user.getUserId()+"");
 			if(times==null){
 				times=1;
 			}else{
 				times = times+1;
 			}
 			if(times>10){
 				userWrongPasswordDate.put(user.getUserId()+"", new Date());
 			}
 			throw new ServiceException(4, "密码错误");
 		}
 		String clientKey = decryptLoginStr.substring(0, 32);
// 		String time = decryptLoginStr.substring(decryptLoginStr.length()-14,decryptLoginStr.length());
 		String loginUserName = decryptLoginStr.substring(32, decryptLoginStr.length()-14);
		if(!loginUserName.equals(userName)){
			throw new ServiceException(6, "加密串中的用户名和要登录的用户名不一致！");
		}
		
		LoginBO result = new LoginBO();
		result.setUser_id(user.getUserId());
		String transferKey = null;
		try {
			transferKey = MD5Security.md5_32_Big(UUID.randomUUID().toString());
		} catch (Exception e) {
			throw new ServiceException(7, "未知错误，生成传输秘钥失败！");
		}
		String encryptStr = transferKey+userName+DateUtils.DateToString(new Date(), "yyyyMMddhhmmss");
        result.setLogin_ret_str(encrypt(encryptStr, clientKey));
        userTransferKeys.put(user.getUserId()+"", transferKey);
        //清理密码错误留下的记录
        userWrongPasswordDate.invalidate(user.getUserId()+"");
        userWrongPasswordTimes.invalidate(user.getUserId()+"");
		return result;
	}
	/**
	 * 版本检查
	 * @param clientVer
	 * @return
	 */
	public UpdateBO checkVersion(int clientVer){
		UpdateBO bo = new UpdateBO();
		Version version = versionDao.getFirstOne(" order by version_num desc");
		if(version==null|| version.getVersionNum()<=clientVer){
			bo.setUpdate_flag(1);
		}else{
			bo.setUpdate_flag(version.getUpdateFlag());
			List<UpdatePackageBO> pList = Lists.newArrayList();
			if(!Strings.isNullOrEmpty(version.getUrlandtype())){
				String[] array = version.getUrlandtype().split("\\|");
				for(String str:array){
					String[] strTemp = str.split("@");
					if(strTemp.length!=2){
						continue;
					}
					UpdatePackageBO updatePackageBO = new UpdatePackageBO(strTemp[0],Integer.valueOf(strTemp[1]));
					pList.add(updatePackageBO);
				}
			}
			bo.setUpdate_file(pList);
		}
		return bo;
	}
	
	/**
	 * 获取咨询页信息
	 * @return
	 */
	public InfoPageBO getInfoPageBO(){
		InfoPageBO result = new InfoPageBO();
		NewsConfig newsConfig = newsConfigDao.getFirstOne("");
		if(newsConfig!=null){
			result.setBig_picture_url(newsConfig.getBigPictureUrl());
			result.setSmall_picture_url(newsConfig.getSmallPictureUrl());
		}
		List<InfoPageLinksBO> links = Lists.newArrayList();
		List<News> list = newsDao.getAllOrder(" order by created_time desc");
		if(list!=null&&list.size()>0){
			for(News news:list){
				InfoPageLinksBO bo = new InfoPageLinksBO(news.getUpdatedTime().getTime(), news.getNewTitle(), news.getNewsUrl());
				links.add(bo);
			}
		}
		result.setLinks(links);
		return result;
	}
	

	public static void main(String[] args) throws Exception {
		String decryptLoginStr = "6A38719F22424b2d94227923E966F9AC"+"dogdog7788dddd"+"20161018132220";
		
		String clientKey = decryptLoginStr.substring(0, 32);
 		String time = decryptLoginStr.substring(decryptLoginStr.length()-14,decryptLoginStr.length());
 		String loginUserName = decryptLoginStr.substring(32, decryptLoginStr.length()-14);
 		
 		System.out.println(clientKey);
 		System.out.println(time);
 		System.out.println(loginUserName);
		
		
		String md516 = MD5Security.md5_16_Big(UUID.randomUUID().toString());
		
		String hex32 = Hex.encodeHexString(md516.getBytes("utf-8"));
		
		String aesStr = encrypt(md516, md516);
		System.out.println(md516);
		System.out.println(hex32);
		System.out.println(aesStr);
		System.out.println(decrypt(aesStr, md516));
		
		
	}
}
