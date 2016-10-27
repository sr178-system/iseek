package com.sr178.iseek.pc.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.google.common.base.Strings;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.collect.Lists;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.iseek.common.session.IseekSession;
import com.sr178.iseek.pc.bean.FileUserBO;
import com.sr178.iseek.pc.bean.FilesBO;
import com.sr178.iseek.pc.bean.FriendBO;
import com.sr178.iseek.pc.bean.InfoPageBO;
import com.sr178.iseek.pc.bean.InfoPageLinksBO;
import com.sr178.iseek.pc.bean.LoginBO;
import com.sr178.iseek.pc.bean.NoticeBO;
import com.sr178.iseek.pc.bean.UpFileBO;
import com.sr178.iseek.pc.bean.UpdateBO;
import com.sr178.iseek.pc.bean.UpdatePackageBO;
import com.sr178.iseek.pc.bean.UserFilesBO;
import com.sr178.iseek.pc.bean.UserInfoBO;
import com.sr178.iseek.pc.bo.Files;
import com.sr178.iseek.pc.bo.Friend;
import com.sr178.iseek.pc.bo.News;
import com.sr178.iseek.pc.bo.NewsConfig;
import com.sr178.iseek.pc.bo.Notice;
import com.sr178.iseek.pc.bo.User;
import com.sr178.iseek.pc.bo.UserFileTemp;
import com.sr178.iseek.pc.bo.UserFriends;
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
import com.sr178.iseek.pc.dao.UserFriendsDao;
import com.sr178.iseek.pc.dao.UserMessageDao;
import com.sr178.iseek.pc.dao.UserNoticeStatusDao;
import com.sr178.iseek.pc.dao.VersionDao;
import com.sr178.module.utils.DateUtils;
import com.sr178.module.utils.MD5Security;
import com.sr178.module.utils.ParamCheck;


public class PcService {
	public static final String AND = "and";
	public static final String OR = "or";

  	private Cache<String,IseekSession> iseekSessions = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(20000).build();
  	
  	private Cache<String,Date> userWrongPasswordDate = CacheBuilder.newBuilder().expireAfterAccess(1, TimeUnit.HOURS).maximumSize(20000).build();
  	
  	private Cache<String,Integer> userWrongPasswordTimes = CacheBuilder.newBuilder().expireAfterAccess(1, TimeUnit.HOURS).maximumSize(20000).build();
  	
  	private Cache<String,String> userPcWebToken = CacheBuilder.newBuilder().expireAfterWrite(3, TimeUnit.MINUTES).maximumSize(20000).build();

  	public static int globalMaxNoticeKey;
  	
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
  	@Autowired
  	private UserFriendsDao userFriendsDao;
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
		IseekSession session = iseekSessions.getIfPresent(userId);
		if(session==null){
			return false;
		}
		String authDecryptStr = null;
		authDecryptStr = decrypt(authStr, session.getTrasferKey());
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
			   ciphertext = Base64.encodeBase64String(result);
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
			byte[] result = cipher.doFinal(Base64.decodeBase64(authStr));
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
        IseekSession session = new IseekSession(transferKey,userName);
        session.setMaxNoticeKey(globalMaxNoticeKey);
        iseekSessions.put(user.getUserId()+"", session);
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
	
	/**
	 * 生成pc token
	 * @param userId
	 * @return
	 */
	public String getssostr(String userId){
		String ssoStr = "";
		try {
			ssoStr = MD5Security.md5_32_Big(userId+UUID.randomUUID().toString());
		} catch (Exception e) {
			LogSystem.error(e, "生成pc token失败！");
		}
		userPcWebToken.put(ssoStr, userId);
		return ssoStr;
	}
	
	/**
	 * 获取用户消息（10秒轮训一次）
	 * @param userId
	 * @return
	 */
	public List<NoticeBO> getnotice(String userId){
		IseekSession session = iseekSessions.getIfPresent(userId);
		if(session!=null){
			List<NoticeBO> list = session.getNotices();
			session.resetNoticeList();
			//添加最新公告
			if(session.getMaxNoticeKey()<globalMaxNoticeKey){
				Notice notice =  getMaxKeyNotice();
				NoticeBO bo = new NoticeBO(3, notice.getNoticeContent(), notice.getNoticeUrl());
				list.add(bo);
				session.setMaxNoticeKey(globalMaxNoticeKey);
			}
			return list;
		}
		return new ArrayList<NoticeBO>();
	}
	/**
	 * 给某个用户添加消息
	 * @param userId
	 * @param notice
	 */
	public void addNotice(String userId,NoticeBO notice){
		IseekSession session = iseekSessions.getIfPresent(userId);
		if(session!=null){
		  session.addNoticeBO(notice);
		}
	}
	/**
	 * 获取最新的公告信息
	 * @return
	 */
	public Notice getMaxKeyNotice(){
		return noticeDao.getFirstOne(" order by id desc");
	}
	/**
	 * 服务器启动加载当前最新的消息
	 */
	public void loadMaxNoticeKey(){
		Notice notice = getMaxKeyNotice();
		if(notice==null){
			globalMaxNoticeKey = 0;
		}else{
			globalMaxNoticeKey = notice.getId();
		}
	}
	
	/**
	 * 获取用户信息
	 * @param userId
	 * @return
	 */
	public UserInfoBO getUserInfo(long userId){
		User user = userDao.get(new SqlParamBean("user_id", userId));
		 return createUserBO(user);
	}
	
	
	private UserInfoBO createUserBO(User user){
		UserInfoBO bo = new UserInfoBO();
		if(user!=null){
			bo.setEmail(user.getEmail());
			bo.setLogin_name(user.getLoginName());
			bo.setMember_expiry_day(user.getMemberExpiryDay().getTime());
			bo.setMobile(user.getMobile());
			bo.setNickname(user.getNickName());
			bo.setSex(user.getSex());
			bo.setShare_compress(user.getShareCompress());
		}
		return bo;
	}
	/**
	 * 获取好友列表
	 * @param userId
	 * @return
	 */
	public List<FriendBO> getFriendBOList(long userId){
		List<Friend> list = userFriendsDao.getFriendList(userId);
		return createFriendBOList(list);
	}
	/**
	 * 
	 * @param list
	 * @return
	 */
	private List<FriendBO> createFriendBOList(List<Friend> list){
		List<FriendBO> result = Lists.newArrayList();
		for(Friend friend:list){
			result.add(new FriendBO(friend.getUserId(), friend.getLoginName(), friend.getNickName()));
		}
		return result;
	}
	
	/**
	 * 取消或关注好友
	 * @param userId   用户id
	 * @param friendId  好哟uid
	 * @param isFriend 1关注  2取消关注
	 */
	public void setFriends(long userId,long friendId,String isFriend){
		if(userId==friendId){
			throw new ServiceException(2, "自己不能关注自己！");
		}
		
		if("1".equals(isFriend)){//关注好友
			 UserFriends userFriends = userFriendsDao.get(new SqlParamBean("user_id", userId),new SqlParamBean("and", "friend_id", friendId));
			 if(userFriends!=null){
				 throw new ServiceException(1, "已是好友！请勿重复关注");
			 }
			 UserFriends friends = new UserFriends();
			 friends.setCreatedTime(new Date());
			 friends.setFriendId(friendId);
			 friends.setUserId(userId);
			 userFriendsDao.add(friends);
		}else if("2".equals(isFriend)){//取消关注好友
			userFriendsDao.delete(new SqlParamBean("user_id", userId),new SqlParamBean("and", "friend_id", friendId));
		}else{
			throw new ServiceException(3, "isFriend传输错误，只能是1或2！收到的为"+isFriend);
		}
	}
	
	/**
	 * 搜索文件
	 * @param key_word
	 * @param file_type
	 * @return
	 */
	public List<FilesBO> seekFileList(long userId,String key_word,String file_type,String style_type){
		//判断是否在会员有效期内
		User user = userDao.get(new SqlParamBean("user_id", userId));
		if(user.getMemberExpiryDay()==null||user.getMemberExpiryDay().getTime()<new Date().getTime()){
			throw new ServiceException(1, "会员已过期！");
		}
		if(user.getShareFileCount()<10){
			throw new ServiceException(2, "共享文件个数必须大于等于10个！");
		}
		List<Files> list = userFilesDao.seekFiles(key_word, file_type, style_type);
		if(list!=null&&list.size()>0){
			return createdFilesBOList(list);
		}
		return Lists.newArrayList();
	}
	
	
	private List<FilesBO> createdFilesBOList(List<Files> list){
		List<FilesBO>  result = Lists.newArrayList();
		for(Files files:list){
			FilesBO bo = new FilesBO(files.getId(), files.getHash(), files.getType(), files.getName(), files.getSize(), files.getTimeSpan(), files.getKbps(), files.getSrcCount());
			result.add(bo);
		}
		return result;
	}
	/**
	 * 获取文件所有者信息
	 * @param userId
	 * @param fileId
	 * @return
	 */
	public List<FileUserBO> getfileowners(long userId,long fileId){
		List<User> ownerList = userFilesDao.getFileOwnerList(fileId);
		return createFileUserBO(userId, ownerList);
	}
	
	private List<FileUserBO> createFileUserBO(long userId,List<User> ownerList){
		List<UserFriends> list = userFriendsDao.getList(new SqlParamBean("user_id", userId));
		Map<Long,Long> friendsMap = new HashMap<Long,Long>();
		for(UserFriends friends:list){
			friendsMap.put(friends.getFriendId(), 0l);
		}
		List<FileUserBO> result = Lists.newArrayList();
		for(User user:ownerList){
			FileUserBO  bo = new FileUserBO(user.getUserId(), user.getLoginName(), user.getNickName(), user.getShareFileCount(), friendsMap.containsKey(user.getUserId())?1:2);
			result.add(bo);
		}
		return result;
	}
	/**
	 * 获取用户文件列表
	 * @param userId
	 * @return
	 */
	public List<UserFilesBO> getUserFilesBO(long userId){
		List<UserFileTemp> tempList = userFilesDao.getUserFileTempInfo(userId);
		return creatUserFilesBO(tempList);
	}
	
	private List<UserFilesBO> creatUserFilesBO(List<UserFileTemp> tempList){
		List<UserFilesBO> result = new ArrayList<UserFilesBO>();
		for(UserFileTemp files:tempList){
			UserFilesBO bo = new UserFilesBO(files.getId(), files.getHash(), files.getType(), files.getName(), files.getSize(), files.getTimeSpan(), files.getKbps(), files.getSrcCount(),files.getSubDir(),files.getShareDir());
			result.add(bo);
		}
		return result;
	}
	
	
	public void upFiles(String files){
		LogSystem.info("json String = "+files);
		List<UpFileBO> upFileBOs = JSON.parseArray(files, UpFileBO.class);
		List<Files> list = Lists.newArrayList();
		for(UpFileBO upFileBO:upFileBOs){
			
		}
		
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
