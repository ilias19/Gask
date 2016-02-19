package controllers

import domain.*



class QuestionController {

  
	// Save a question with its tags
	def save(){
		
	if(session.getAttribute("user")!=null){
		List<String> tags = new ArrayList<String>(Arrays.asList(params.tags.split(",")));
		def user=session.getAttribute("user");
		def question=new Question();
		question.title=params.title;
		question.content=params.content;
		
		user.addToQuestions(question);
		for(int i=0;i<tags.size();++i){
			Tag tag=new Tag();
			tag.name=tags.get(i);
			question.addToTags(tag);
		}
		
		
		question.save(flush: true)
		def questions=Question.list();
		render (view: "/index1",model:['questions':questions]);
		
	}
	else{
		render (view: "/login");
	}
		
	}
	
	//get all the questions asked
	def getQuestions(){
		def questions=Question.list();
		render (view: "/questions",model:['questions':questions]);
	}

	
// get a question by id		
	def getQuestion(){

		def question=Question.findById(params.id);
		def answers = question.answers;
		def tags=question.tags
	   
    
		render (view: "/quest",model:['question':question,'answers':answers,'tags':tags]);
	}
	
	//get all the questions of a tag
	def getQuestionsByTag(){
		def questions=Question.list();
		def quests=new ArrayList<Question>();
		for(int i=0;i<questions.size();i++){
			def tags=questions[i].tags;
			 for(int j=0;j<tags.size();j++){
				 if(tags[j].name.equals(params.tagName)){
					 quests.add(questions[i]);
					 break;
				 }
			 }
		}
		render (view: "/questions",model:['questions':quests]);
	}
	
	//get all questions asked by a user
	def getQuestionsByUser(){
		def user=User.findById(params.id);
		def questions=user.questions;
		render (view: "/usser",model:['questions':questions,'user':user]);
	}
}
