package com.sr178.iseek.pc.action;

import java.util.List;

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
	
	private String loginName;
	private String password;
	private String nickName;
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
			pcService.reg(loginName, password, nickName, sex, email, mobile);
			return "ok";
		}
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
	
}
