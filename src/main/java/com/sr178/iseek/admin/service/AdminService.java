package com.sr178.iseek.admin.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.iseek.admin.bo.AdminUser;
import com.sr178.iseek.admin.dao.AdminUserDao;
import com.sr178.iseek.pc.bo.ChargeConfig;
import com.sr178.iseek.pc.bo.MobileVerify;
import com.sr178.iseek.pc.bo.News;
import com.sr178.iseek.pc.bo.NewsConfig;
import com.sr178.iseek.pc.bo.Notice;
import com.sr178.iseek.pc.bo.PaymentLog;
import com.sr178.iseek.pc.bo.PaymentLogMore;
import com.sr178.iseek.pc.bo.User;
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
import com.sr178.iseek.pc.dao.VersionDao;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.utils.DateUtils;
import com.sr178.module.utils.MD5Security;
import com.sr178.module.utils.ParamCheck;
import com.sr178.module.web.session.Session;

public class AdminService {
	public static final String AND = "and";
	public static final String OR = "or";


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
  	private VersionDao versionDao;
  	@Autowired
  	private UserFriendsDao userFriendsDao;
  	@Autowired
  	private AdminUserDao adminUserDao;
  	@Autowired
  	private PcService pcService;
  	
  	private Cache<String,Session> adminUserMap = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();

  	/**
  	 * 根据sessionid查询登录的用户
  	 * @param sessionId
  	 * @return
  	 */
  	public Session getLoginAdminUserName(String sessionId){
		Session adminSession = adminUserMap.getIfPresent(sessionId);
		return adminSession;
	}
	/**
	 * 管理员登录
	 * @param userName
	 * @param password
	 * @param sessionId
	 */
	public void adminLogin(String userName,String password,String sessionId){
		ParamCheck.checkString(userName, 1, "用户名不能为空！");
		ParamCheck.checkString(password, 2, "密码不能为空！");
		AdminUser adminUser = adminUserDao.get(new SqlParamBean("login_name", userName));
		if(adminUser!=null){
			String recoverDataPassword = pcService.getTruePassword(adminUser.getPassWord());
			if(!recoverDataPassword.equals(password.toUpperCase())){
				throw new ServiceException(3, "密码错误！");
			}
			if(adminUser.getStatus()!=0){
				throw new ServiceException(4, "该账号已被管理员禁用！");
			}
			Session session = new Session(userName, System.currentTimeMillis(), sessionId);
			adminUserMap.put(sessionId, session);
			
			adminUserDao.updateUserLoginTime(userName, new Date());
			
		}else{
			throw new ServiceException(3, "用户名不存在！");
		}
	}
	/**
	 * 登出
	 * @param sessionId
	 */
	public void logout(String sessionId){
		adminUserMap.invalidate(sessionId);
	}
	/**
	 * 分页查询管理员用户
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	private static final String[] havePowerContent = new String[]{"客服管理读","客服管理写","会员管理读","会员管理写","财务管理读","财务管理写","系统公告","资讯管理"};
	public IPage<AdminUser> getAdminUserPage(int pageIndex,int pageSize){
		IPage<AdminUser> page =  adminUserDao.getPageList(pageIndex, pageSize, "order by user_id desc");
		if(page!=null&&page.getData()!=null&&page.getData().size()>0){
			for(AdminUser user:page.getData()){
				String powerStr = "";
				int lenght = user.getPower().length();
				if(lenght>havePowerContent.length){
					lenght = havePowerContent.length;
				}
				for(int i=0;i<lenght;i++){
					char p = user.getPower().charAt(i);
					if(p=='1'){
						if(Strings.isNullOrEmpty(powerStr)){
							powerStr = havePowerContent[i];
						}else{
							powerStr = powerStr+","+havePowerContent[i];
						}
					}
				}
				user.setPower(powerStr);
			}
		}
		return page;
	}
	/**
	 * 修改用户密码
	 * @param userName
	 * @param oldPassword
	 * @param newPassword
	 */
	public void updateAdminUserPassword(String userName,String oldPassword,String newPassword){
		AdminUser adminUser = adminUserDao.get(new SqlParamBean("login_name", userName));
		if(adminUser==null){
			throw new ServiceException(1,"用户不存在");
		}
		String nowPassword = pcService.getTruePassword(adminUser.getPassWord());
		if(!oldPassword.toUpperCase().equals(nowPassword)){
			throw new ServiceException(2,"原密码不正确！");
		}
		String newDatabasePassword = pcService.getDatabasePassword(newPassword.toUpperCase());
		adminUserDao.updateUserPassword(userName, newDatabasePassword);
	}
	
	/**
	 * 获取用户信息
	 * @param userName
	 * @return
	 */
	public AdminUser getAdminUser(String userName){
		return adminUserDao.get(new SqlParamBean("login_name", userName));
	}
	/**
	 * 批量更新用户状态
	 * @param ids
	 * @param status
	 */
	public void updateAdminUserStatus(long[] ids,int status){
		if(ids!=null&&ids.length>0){
			for(int i=0;i<ids.length;i++){
				if(ids[i]==1){
					continue;
				}
				adminUserDao.updateStatus(ids[i], status);
			}
		}
	}
	/**
	 * 批量删除用户
	 * @param ids
	 */
	public void deleteAdminUser(long[] ids){
		if(ids!=null&&ids.length>0){
			for(int i=0;i<ids.length;i++){
				if(ids[i]==1){
					continue;
				}
				adminUserDao.delete(ids[i]);
			}
		}
	}
	/**
	 * 将客户端的str转为数据库中的权限字符串
	 * @param power
	 * @return
	 */
	private String getDataBasePowerString(int[] power){
		String[] powerStr = new String[]{"0","0","0","0","0","0","0","0"};
		if(power!=null){
			for(int position:power){
				powerStr[position-1] = "1";
			}
		}
		String dataPowerString = "";
		for(String str:powerStr){
			dataPowerString = dataPowerString +str;
		}
		return dataPowerString;
	}
	/**
	 * 更新用户信息
	 * @param userName
	 * @param password
	 * @param name
	 * @param sex
	 * @param power
	 */
	public void updateAdminUser(String userName,String password,String name,int sex,int[] power){
		if(!Strings.isNullOrEmpty(password)){
			password = pcService.getDatabasePassword(password.toUpperCase());
		}
		adminUserDao.updateAdminUser(userName, password, name, sex, getDataBasePowerString(power));
	}
	
	/**
	 * 添加用户
	 * @param userName
	 * @param password
	 * @param name
	 * @param sex
	 * @param power
	 */
	public void addAdminUser(String userName,String password,String name,int sex,int[] power){
		AdminUser adminUser =  adminUserDao.get(new SqlParamBean("login_name", userName));
		if(adminUser!=null){
			throw new ServiceException(1,"用户已存在！");
		}
		password = pcService.getDatabasePassword(password.toUpperCase());
		adminUser = new AdminUser(userName, name, sex, password, 0, getDataBasePowerString(power), null, new Date());
		adminUserDao.add(adminUser);
	}
	/**
	 * 获取用户列表
	 * @param loginName
	 * @param nickeName
	 * @param startRegDate
	 * @param endRegDate
	 */
	public IPage<User> getUserList(String loginName,String nickeName,int type,String startRegDate,String endRegDate,int pageIdex,int pageSize){
		if(!Strings.isNullOrEmpty(startRegDate)&&!Strings.isNullOrEmpty(endRegDate)){
			startRegDate = startRegDate +" 00:00:00";
			endRegDate = endRegDate+" 23:59:59";
		}
		return userDao.getPageUserList(loginName, nickeName,type, startRegDate, endRegDate, pageIdex, pageSize);
	}
	/**
	 * 更新用户状态
	 * @param ids
	 * @param status
	 */
	public void updateUserStatus(long[] ids,int status){
		if(ids!=null&&ids.length>0){
			for(int i=0;i<ids.length;i++){
				userDao.updateStatus(ids[i], status);
			}
		}
	}
	/**
	 * 批量删除用户
	 * @param ids
	 */
	public void deleteUser(long[] ids){
		if(ids!=null&&ids.length>0){
			for(int i=0;i<ids.length;i++){
				userDao.delete(ids[i]);
			}
		}
	}
	/**
	 * 禁止或启用用户可否共享压缩文件
	 * @param ids
	 * @param status
	 */
	public void updateUserShareCompresStatus(long[] ids,int status){
		if(ids!=null&&ids.length>0){
			for(int i=0;i<ids.length;i++){
				userDao.updateUserCanShareZipStatus(ids[i], status);
			}
		}
	}
	/**
	 * 管理员修改用户信息
	 * @param userId
	 * @param nickerName
	 * @param email
	 * @param sex
	 * @param password
	 * @param memberExpireTimeStr
	 */
	public void updateUserInfoByAdmin(long userId,String nickerName,String email,String mobile,int sex,String password,String memberExpireTimeStr){
		ParamCheck.checkString(nickerName, 1, "昵称不能为空");
		ParamCheck.checkString(email, 2, "邮箱不能为空");
		ParamCheck.checkString(mobile, 5, "手机号码不能为空");
		User user = userDao.get(new SqlParamBean("user_id", userId));
		if(user==null){
			throw new ServiceException(3,"用户不存在");
		}
		if(sex!=1&&sex!=2){
			throw new ServiceException(4, "性别填写错误！");
		}
		if(!Strings.isNullOrEmpty(password)){
			password = pcService.getDatabasePassword(password.toUpperCase());
		}
		Date memberExpireTime = null;
		if(!Strings.isNullOrEmpty(memberExpireTimeStr)){
			memberExpireTime = DateUtils.StringToDate(memberExpireTimeStr, "yyyy-MM-dd");
		}
		userDao.updateUserInfoByAdmin(userId, nickerName, email,mobile, sex, password, memberExpireTime);
	}
	/**
	 * 管理员添加用户
	 * @param loginName
	 * @param password
	 * @param nickName
	 * @param sex
	 * @param email
	 * @param mobile
	 */
	public void addUserByAdmin(String loginName,String password,String nickName,int sex,String email,String mobile,String memberExpiryDay){
		ParamCheck.checkString(loginName, 1, "登录名不能为空");
		ParamCheck.checkString(password, 2, "密码不能为空");
		ParamCheck.checkString(nickName, 3, "昵称不能为空");
		ParamCheck.checkString(email, 4, "邮箱不能为空");
		ParamCheck.checkString(mobile, 5, "手机号码不能为空");
		if(sex!=1&&sex!=2){
			throw new ServiceException(6, "性别错误！");
		}
		User user = userDao.get(new SqlParamBean("login_name", loginName));
		if(user!=null){
			throw new ServiceException(8, "用户名已存在！");
		}
		user = userDao.get(new SqlParamBean("mobile", mobile));
		if(user!=null){
			throw new ServiceException(9, "手机号已注册！");
		}
		password = password.toUpperCase();
		String dataBasePass = pcService.getDatabasePassword(password);
		
		Date memberExpiryDayDate = null;
		if(!Strings.isNullOrEmpty(memberExpiryDay)){
			memberExpiryDayDate = DateUtils.StringToDate(memberExpiryDay, "yyyy-MM-dd");
		}
		
		user = new User();
		user.setCreatedTime(new Date());
		user.setEmail(email);
		user.setLastLoginTime(null);
		user.setLoginName(loginName);
		user.setMemberExpiryDay(memberExpiryDayDate);
		user.setMobile(mobile);
		user.setNickName(nickName);
		user.setPassWord(dataBasePass);
		user.setSex(sex);
		user.setShareCompress(2);
		user.setShareFileCount(0);
		user.setStatus(0);
		userDao.add(user);
	}
	/**
	 * 获取充值
	 * @param loginName
	 * @param nickeName
	 * @param startChargeDate
	 * @param endChargeDate
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<PaymentLogMore> getPagePamentLogList(String loginName,String nickeName,String startChargeDate,String endChargeDate,int pageIndex,int pageSize){
		if(!Strings.isNullOrEmpty(startChargeDate)&&!Strings.isNullOrEmpty(endChargeDate)){
			startChargeDate = startChargeDate +" 00:00:00";
			endChargeDate = endChargeDate+" 23:59:59";
		}
		return paymentLogDao.getPageList(loginName, nickeName, startChargeDate, endChargeDate, pageIndex, pageSize);
	}
	/**
	 * 获取充值总额
	 * @param loginName
	 * @param nickeName
	 * @param startChargeDate
	 * @param endChargeDate
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public double getSum(String loginName,String nickeName,String startChargeDate,String endChargeDate){
		if(!Strings.isNullOrEmpty(startChargeDate)&&!Strings.isNullOrEmpty(endChargeDate)){
			startChargeDate = startChargeDate +" 00:00:00";
			endChargeDate = endChargeDate+" 23:59:59";
		}
		return paymentLogDao.getSumAmount(loginName, nickeName, startChargeDate, endChargeDate);
	}
	/**
	 * 更新充值配置
	 * @param feePerMonth
	 * @param remindDay
	 * @return
	 */
	public boolean updateChargeConfig(double feePerMonth,int remindDay){
		return chargeConfigDao.update(feePerMonth, remindDay);
	}
	/**
	 * 获取冲至配置
	 * @return
	 */
	public ChargeConfig getChargeConfig(){
		return chargeConfigDao.getFirstOne("");
	}
	/**
	 * 修改系统公告
	 * @param content
	 * @param url
	 */
	public void updateNotice(String content,String url){
//		ParamCheck.checkString(content, 1, "公告内容不能为空");
		Notice notice = new Notice();
		if(content==null){
			content="";
		}
		notice.setNoticeContent(content);
		notice.setNoticeUrl(url);
		notice.setCreatedTime(new Date());
		int maxNoticeKey = noticeDao.addBackKey(notice);
		PcService.globalMaxNoticeKey = maxNoticeKey;
	} 
	/**
	 * 获取咨询列表
	 * @param nums
	 * @return
	 */
	public List<News> getNewsList(){
		return newsDao.getAllOrder("order by news_id desc");
	}
	/**
	 * 获取资讯页配置
	 * @return
	 */
	public NewsConfig getNewsConfig(){
		return newsConfigDao.getFirstOne(" order by id desc");
	}
	/**
	 * 添加咨询
	 * @param content
	 * @param url
	 */
	public void addNews(String content,String url){
		ParamCheck.checkString(content, 1, "咨询内容不能为空！");
		News news = new News();
		news.setNewTitle(content);
		news.setNewsUrl(url);
		news.setCreatedTime(new Date());
		news.setUpdatedTime(new Date());
		newsDao.add(news);
	}
	/**
	 * 删除资讯
	 * @param id
	 */
	public void deleteNews(int[] ids){
		if(ids!=null&&ids.length>0){
			for(int id:ids){
				newsDao.delete(new SqlParamBean("news_id", id));
			}
		}
	}
	
	
	
	/**
	 * 保存图片
	 * 
	 * @param files
	 * @param fileNames
	 * @param taskId
	 * @param type
	 */
	public String saveAttach(int type,File file, String names, String descPath) {
		String oldFileName = names;
		String[] prefixArray = oldFileName.split("\\.");
		String prefix = prefixArray[prefixArray.length - 1];
		String fileName = MD5Security.md5_16_Small(UUID.randomUUID().toString()) + "." + prefix;
		try {
			FileUtils.copyFile(file, new File(descPath + fileName));
		} catch (IOException e) {
			LogSystem.error(e, "上传附件失败");
			throw new ServiceException(3, "上传附件失败！请重新上传！");
		}
		if(type==1){
			newsConfigDao.updateSmallPicUrl(fileName);
		}else if(type==2){
			newsConfigDao.updateBigPicUrl(fileName);
		}else{
			throw new ServiceException(1,"错误的类型type");
		}
		return fileName;
	}
	
	/**
	 * 权限检查
	 * @param userName
	 * @param pos
	 */
	public void checkPower(String userName,int pos){
		AdminUser adminUser = adminUserDao.get(new SqlParamBean("login_name", userName));
		String power = adminUser.getPower();
		if(power.charAt(pos-1)=='0'){
			throw new ServiceException(200,"您没有该功能权限，请联系管理员开通");
		}
	}
	/**
	 * 检查权限
	 * @param userName
	 * @param pos
	 * @return
	 */
	public boolean checkPowerTitle(String userName,int pos){
		AdminUser adminUser = adminUserDao.get(new SqlParamBean("login_name", userName));
		String power = adminUser.getPower();
		if(power.charAt(pos-1)=='0'){
			return false;
		}
		return true;
	}
}
