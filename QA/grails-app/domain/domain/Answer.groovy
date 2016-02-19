package domain

import java.util.Date;

class Answer {
	String content
	Integer totalVotes=0
	Date createdAt = new Date()
	static belongsTo = [ question : Question, author : User ]
	static hasMany = [ votes : Vote, comments : Comment ]
	
	
    static constraints = {
    	content blank : false, nullable : false
    }
	static mapping = {
		sort totalVotes: "desc"
	}
}
