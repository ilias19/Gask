package domain

class Comment {
	String content

	static belongsTo = [ question : Question, answer : Answer, author : User ]
	static hasMany = [ votes : Vote ]
	
    static constraints = {
    	content blank : false, nullable : false
    }
}
