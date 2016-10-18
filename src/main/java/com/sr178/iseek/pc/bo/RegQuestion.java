package com.sr178.iseek.pc.bo;

   /**
    * reg_question 实体类
    */ 


public class RegQuestion{
	private int id;
	private String question;
	private String answerOne;
	private String answerTwo;
	private String answerThree;
	private String answerFour;
	private String rightAnswer;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setQuestion(String question){
	this.question=question;
	}
	public String getQuestion(){
		return question;
	}
	public void setAnswerOne(String answerOne){
	this.answerOne=answerOne;
	}
	public String getAnswerOne(){
		return answerOne;
	}
	public void setAnswerTwo(String answerTwo){
	this.answerTwo=answerTwo;
	}
	public String getAnswerTwo(){
		return answerTwo;
	}
	public void setAnswerThree(String answerThree){
	this.answerThree=answerThree;
	}
	public String getAnswerThree(){
		return answerThree;
	}
	public void setAnswerFour(String answerFour){
	this.answerFour=answerFour;
	}
	public String getAnswerFour(){
		return answerFour;
	}
	public void setRightAnswer(String rightAnswer){
	this.rightAnswer=rightAnswer;
	}
	public String getRightAnswer(){
		return rightAnswer;
	}
}

