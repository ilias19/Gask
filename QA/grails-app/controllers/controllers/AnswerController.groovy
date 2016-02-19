package controllers

import domain.*

class AnswerController {

  
	
	//save an answer of a question
	
	def save(){
	  if(session.getAttribute("user")!=null){
		def user=session.getAttribute("user");
		def question=Question.findById(params.id);
		def answer=new Answer();
		answer.content=params.content;
		user.addToAnswers(answer);
		question.addToAnswers(answer);
		answer.save(flush:true);
		def answers = question.answers;
		def tags=question.tags;
		render (view: "/quest",model:['question':question,'answers':answers,'tags':tags]);
	}
	else{
		
		render (view: "/login");
	}
  }
}
