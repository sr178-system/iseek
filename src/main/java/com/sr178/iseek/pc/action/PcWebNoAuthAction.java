package com.sr178.iseek.pc.action;

import java.util.List;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.pc.bo.RegQuestion;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.web.action.BaseActionSupport;

public class PcWebNoAuthAction extends BaseActionSupport {
    
	
	private List<RegQuestion> regQuestions;
	public String answerQuestion(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		regQuestions = pcService.getRegQuestionList();
		return SUCCESS;
	}
	
	
	
	public String mobileVerify(){
		return SUCCESS;
	}
	
	public String reg(){
		return SUCCESS;
	}

	public List<RegQuestion> getRegQuestions() {
		return regQuestions;
	}

	public void setRegQuestions(List<RegQuestion> regQuestions) {
		this.regQuestions = regQuestions;
	}
}
