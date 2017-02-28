package com.sr178.iseek.pc.interceptor;




import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.web.action.JsonBaseActionSupport;

public class PcUserInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		
		JsonBaseActionSupport appAction = null;
		Object obj = actionInvocation.getAction();
		String className = obj.getClass().getCanonicalName();
		if (obj instanceof JsonBaseActionSupport) {
			appAction = (JsonBaseActionSupport) obj;
		} else {
			throw new RuntimeException("ACTION继承的类非AppBaseActionSupport"+className);
		}
		
		if(!className.equals("com.sr178.iseek.pc.action.PcNoAuthAction")){
			PcService aus = ServiceCacheFactory.getServiceCache()
					.getService(PcService.class);
			Map<String,Object> map = actionInvocation.getInvocationContext().getParameters();
			Object userIdvalues = map.get("user_id");
			Object authStrvalues = map.get("auth_str");
			String userId = userIdvalues==null?null:((String[])userIdvalues)[0];//用户id
			String authStr = authStrvalues==null?null:((String[])authStrvalues)[0];//加密校验串
			if(authStr!=null){
				authStr = authStr.replace(" ", "+");
			}
			//校验是否登录用户
			if(!aus.isLogin(userId, authStr)){
				appAction.renderErrorResult("秘钥失效或未登陆！");
				return "json";
			}
			//将userid视为tokenid
			appAction.setTokenId(userId);
		}
		
		String result = actionInvocation.invoke();
		return result;
	}
}
