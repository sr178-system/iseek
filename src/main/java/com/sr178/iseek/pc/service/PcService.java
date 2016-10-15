package com.sr178.iseek.pc.service;

import java.util.UUID;
import java.util.concurrent.TimeUnit;


import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;


public class PcService {
	public static final String AND = "and";
	public static final String OR = "or";

  	private Cache<String,String> userToken = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();

	/**
	 * 查看是否登录了
	 * 
	 * @param sessionId
	 * @return
	 */
	public String isLogin(String tokenId) {
		if (tokenId == null || "".equals(tokenId)) {
			return null;
		}
		return userToken.getIfPresent(tokenId);
	}

	/**
	 * 登录
	 * 
	 * @param userName
	 * @param passWord
	 */
//	public String login(String userName, String passWord) {
//		ParamCheck.checkString(userName, 1, "用户名不能为空");
//		ParamCheck.checkString(userName, 2, "密码不能为空");
//		User user = userDao.get(new SqlParamBean("user_name", userName), new SqlParamBean(AND, "pass_word", passWord));
//		if (user == null) {
//			throw new ServiceException(3, "错误的用户名或密码");
//		}
//		if(user.getStatus()!=0){
//			throw new ServiceException(4, "该账户已被禁用，请及时联系管理员！");
//		}
//		String tokenId = UUID.randomUUID().toString();
//		userToken.put(tokenId, user.getUserName());
//		return tokenId;
//	}

}
