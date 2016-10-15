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
		PcService aus = ServiceCacheFactory.getServiceCache()
				.getService(PcService.class);
		Map<String,Object> map = actionInvocation.getInvocationContext().getParameters();
		Object values = map.get("tokenId");
		String tokenId = values==null?null:((String[])values)[0];
		String userName = aus.isLogin(tokenId);
		if (userName==null&&!className.equals("com.sr178.iseek.pc.action.PcNoAuthAction")) {
			appAction.renderErrorResult("token失效或没有登录");
			return "json";
		} else {
			appAction.setUserName(userName);
			String result = actionInvocation.invoke();
			return result;
		}
	}
}
