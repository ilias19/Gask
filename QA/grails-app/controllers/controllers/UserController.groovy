package controllers

import domain.Question
import domain.Tag
import domain.User

class UserController {

	

// save a user	
	def save(){
		def user=new User(params);
		user.save(flush: true);
		//def questions=Question.list();
		render (view: "/index1");
	}
	
	def find(){
		User user=User.findByEmailAndPassword(params.get("email"),params.get("password"));
		if(user){
			session["user"]=user;
			session["logged"]=true;
			def questions=Question.list();
			render (view: "/index1",model:['userName':user.userName,'questions':questions]);
		}
		else{
			render (view: "/login");
		}
	}
	
	def getQuestions(){
		def questions=Question.list();
		render (view: "/index1",model:['questions':questions]);
	}
	
	//update the profile of the user
	def update(){
	
		List<String> tags = new ArrayList<String>(Arrays.asList(params.tags.split(",")));
	
	 if(params.website && params.biographie && tags.get(0)!="" && params.userName){
		User user=User.get(session["user"].id);
		user.userName=params.userName;
		user.website=params.website;
		user.bio=params.biographie;
		for(int i=0;i<tags.size();++i){
			Tag tag=new Tag();
			tag.name=tags.get(i);
			user.addToTags(tag);
		}
	
		   user.save(flush:true,failOnError: true);
	 }
		def questions=Question.list();
		render (view: "/index1",model:['questions':questions]);
	}
	
	def getUsers(){
		def users=User.list();
		render (view: "/users",model:['users':users]);
	}
	
	def logout() {
		log.info "User agent: " + request.getHeader("User-Agent");
		session["user"]=null;
		session["logged"]=false;
		
		
		render (view: "/login");
	}

}
