package com.sr178.iseek.admin.interceptor;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.service.AdminService;
import com.sr178.module.web.action.BaseActionSupport;
import com.sr178.module.web.session.Session;

public class AdminUserInterceptor extends AbstractInterceptor {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		AdminService admin = ServiceCacheFactory.getServiceCache().getService(AdminService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest().getSession();
		Object obj = actionInvocation.getAction();
		String className = obj.getClass().getCanonicalName();
		if(!className.equals("com.sr178.iseek.admin.action.LoginAction")){
			Session session = admin.getLoginAdminUserName(sessionhttp.getId());
			if (session == null) {
				return "nologin";
			}
			String userName = session.getUserName();
			if (userName == null) {
				return "nologin";
			} else {
				BaseActionSupport aldAction = null;
				if (obj instanceof BaseActionSupport) {
					aldAction = (BaseActionSupport) obj;
					aldAction.setUserName(userName);
					aldAction.setUserSession(session);
				} else {
					throw new RuntimeException("ACTION继承的类非ALDAdminActionSupport" + className);
				}
			}
		}
		return actionInvocation.invoke();
	}
}
