package com.sr178.iseek.admin.service;

import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.iseek.admin.bo.AdminUser;
import com.sr178.iseek.admin.dao.AdminUserDao;
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
	
	
}
