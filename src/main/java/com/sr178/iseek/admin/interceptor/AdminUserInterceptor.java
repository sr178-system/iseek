package com.sr178.iseek.admin.interceptor;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.service.AdminService;

public class AdminUserInterceptor extends AbstractInterceptor {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        AdminService aus = ServiceCacheFactory.getServiceCache()
                .getService(AdminService.class);
        HttpSession sessionhttp = ServletActionContext.getRequest()
                .getSession();
        
        return null;
       
    }
}
