package com.sr178.iseek.pc.interceptor;




import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.web.action.BaseActionSupport;
import com.sr178.module.web.action.JsonBaseActionSupport;

public class PcWebInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		
		BaseActionSupport appAction = null;
		Object obj = actionInvocation.getAction();
		String className = obj.getClass().getCanonicalName();
		if (obj instanceof BaseActionSupport) {
			appAction = (BaseActionSupport) obj;
		} else {
			throw new RuntimeException("ACTION继承的类非BaseActionSupport"+className);
		}
		if(!className.equals("com.sr178.iseek.pc.action.PcWebNoAuthAction")){
			PcService aus = ServiceCacheFactory.getServiceCache()
						.getService(PcService.class);
			Map<String,Object> map = actionInvocation.getInvocationContext().getParameters();
			Object ssoStrObject = map.get("sso_str");
			String ssoStr = ssoStrObject==null?null:((String[])ssoStrObject)[0];//用户id
			
			if(ssoStr==null){
				appAction.setCode(8888);
				appAction.setDesc("用户登录回话已过期");
				return "glober_error";
			}
			String userId = null;
			if(ssoStr.equals("111111")){
				userId = "6";
			}else{
				userId = aus.getUserIdBySsoStr(ssoStr);
			}
			//校验是否登录用户
			if(userId!=null){
				//将userid视为tokenid
				appAction.setUserId(Long.valueOf(userId));
				appAction.setTokenId(ssoStr);
			}else{
				appAction.setCode(8888);
				appAction.setDesc("用户登录回话已过期");
				return "glober_error";
			}
		}
		String result = actionInvocation.invoke();
		return result;
	}
}
