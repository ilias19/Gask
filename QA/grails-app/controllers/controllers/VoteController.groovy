package controllers

import domain.Answer
import domain.Question
import domain.Vote
import domain.VoteQ

class VoteController {


// upvote an answer 	
	def addVote(){
	if(session.getAttribute("user")!=null){
		def answer = Answer.get(params.idA);
		def user=session.getAttribute("user");
		def question = Question.get(params.idQ);
		//def tags=question.tags;
		def answers = question.answers;
		if(!Vote.findByUserAndAnswer(user,answer)){
			def vote=new Vote();
			vote.value=1;
			answer.totalVotes++;
			
			user.addToVotes(vote);
			answer.addToVotes(vote);
			answer.save(flush: true);
			vote.save(flush: true);
		}
		//render (view: "/quest",model:['question':question,'answers':answers,'tags':tags]);
		render(answer.totalVotes);
	  }
	  else{
		  render (view: "/login");
	  }
	}
	
	// downvote an answer
	def deleteVote(){
	  if(session.getAttribute("user")!=null){
		def answer = Answer.findById(params.idA);
		def user=session.getAttribute("user");
		def question = Question.findById(params.idQ);
		//def tags=question.tags;
		def answers = question.answers;
		if(Vote.findByUserAndAnswer(user,answer)){
			def vote=Vote.findByUserAndAnswer(user,answer);
			answer.totalVotes--;
		
			//user.removeFromVotes(vote);
			//answer.removeFromVotes(vote);
			answer.save(flush: true);
			//user.save(flush:true);
			vote.delete(flush: true);
		}
		//render (view: "/quest",model:['question':question,'answers':answers,'tags':tags]);
		//render(answer.content)
		render(answer.totalVotes);
	  }
	  else{
		  render (view: "/login");
	  }
	}
	// upvote a question
	def addVoteToQuestion(){
	  if(session.getAttribute("user")!=null){
		def question = Question.get(params.idQ);
		def user=session.getAttribute("user");
		//def question = Question.get(1);
		//def tags=question.tags;
		def answers = question.answers;
		if(!VoteQ.findByUserAndQuestion(user,question)){
			def vote=new VoteQ();
			vote.value=1;
			question.totalVotes++;
			
			user.addToQvotes(vote);
			question.addToVotes(vote);
			question.save(flush: true);
			vote.save(flush: true);
		}
		//render (view: "/quest",model:['question':question,'answers':answers,'tags':tags]);
		render(question.totalVotes);
	  }
	  else{
		  render (view: "/login");
	  }
	}
	//downvote a question
	def deleteVoteFromQuestion(){
	  if(session.getAttribute("user")!=null){
		def question = Question.findById(params.idQ);
		def user=session.getAttribute("user");
		
		if(VoteQ.findByUserAndQuestion(user,question)){
			def vote=VoteQ.findByUserAndQuestion(user,question);
			question.totalVotes--;

			question.save(flush: true);
			//user.save(flush:true);
			vote.delete(flush: true);
		}

		render(question.totalVotes);
	  }else{
	    render (view: "/login");
	  }
	}
}
