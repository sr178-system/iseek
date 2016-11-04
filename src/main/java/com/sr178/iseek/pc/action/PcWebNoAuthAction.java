package com.sr178.iseek.pc.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.pc.bo.RegQuestion;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.web.action.JsonBaseActionSupport;

public class PcWebNoAuthAction extends JsonBaseActionSupport {
    
	
	public PcWebNoAuthAction(){
		this.setErrorResult(SUCCESS);
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<RegQuestion> regQuestions;
	public String answerQuestion(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		regQuestions = pcService.getRegQuestionList();
		return SUCCESS;
	}
	/**
	 * 验证手机号及验证码
	 */
	private String mobile;
	private String verifyCode;
	private int st;
	public String mobileVerify(){
		if(st==0){
			return SUCCESS;
		}else{
			this.setErrorResult("json");
			PcService pcService = ServiceCacheFactory.getService(PcService.class);
			pcService.verifyMobileCode(mobile, verifyCode);
			return this.renderSuccessResult();
		}
	}
	/**
	 * 发送短信验证码
	 * @return
	 */
	public String sendSms(){
		this.setErrorResult("json");
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		return this.renderKeyValueResult("verifyCode", pcService.sendMobileVerify(mobile));
	}
	
	private String username;
	private String password;
	private String nickname;
	private int sex;
	private String email;
	/**
	 * 注册
	 * @return
	 */
	public String reg(){
		if(st==0){
			return SUCCESS;
		}else{
			PcService pcService = ServiceCacheFactory.getService(PcService.class);
			pcService.reg(username, password, nickname, sex, email, mobile);
			return "ok";
		}
	}
	
	/**
	 * 重置密码
	 * @return
	 */
	public String resetPassword(){
		if(st==0){
			return SUCCESS;
		}else{
			PcService pcService = ServiceCacheFactory.getService(PcService.class);
			pcService.resetPassword(username, mobile);
			return "ok";
		}
	}
	
	
	private String out_trade_no;
	private String trade_no;
	private String trade_status;
	private String seller_id;
	@SuppressWarnings("rawtypes")
	public String aliPaynotify() throws IOException {
		// 获取支付宝POST过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = ServletActionContext.getRequest().getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
       boolean result = pcService.aliPayNotify(out_trade_no, trade_no, trade_status,seller_id, params);
       if(result){
    	   ServletActionContext.getResponse().getWriter().print("success");
       }else{
    	   ServletActionContext.getResponse().getWriter().print("fail");
       }
       return null;
	}
	
	/**
	 * 返回
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public String aliPayReturn() {
		// 获取支付宝POST过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = ServletActionContext.getRequest().getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		pcService.aliPayNotify(out_trade_no, trade_no, trade_status, seller_id, params);
		return SUCCESS;
	}
	/**
	 * 支付成功界面显示
	 * @return
	 */
	public String paySuccess(){
		return SUCCESS;
	}
	
	public List<RegQuestion> getRegQuestions() {
		return regQuestions;
	}

	public void setRegQuestions(List<RegQuestion> regQuestions) {
		this.regQuestions = regQuestions;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getVerifyCode() {
		return verifyCode;
	}
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
