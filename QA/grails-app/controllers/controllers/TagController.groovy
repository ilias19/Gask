package controllers

import domain.*

class TagController {


	// get a list of all tags and the number of question that has that tag
	
	def getTags(){
		//def tags=Tag.list();
		int sum=0;
		Map<String,Integer> map=new HashMap<String,Integer>();
		def tags = Tag.withCriteria {
			projections {
			  distinct("name")
			}
		  }.toList();
	    def questions=Question.list();
		for(int i=0;i<tags.size();i++){
			for(int j=0;j<questions.size();j++){
				def tgs=questions[j].tags.toList();
				  for(int k=0;k<tgs.size();k++){
					  if(tgs[k].name.equals(tags[i])){
						  sum++;
					  }
				  }
			}
			map.put(tags[i], sum);
			sum=0;
		}
		render (view: "/tags",model:['tags':tags,'map':map]);
	}
}
