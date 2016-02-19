package domain

class Question {
	String title
	String content
	Date createdAt = new Date()
	Date modifiedAt = new Date()
	Integer views = 0
	Integer totalVotes=0
	Set answers = []
	static belongsTo = [ user : User ]
	static hasMany = [ tags : Tag, answers : Answer, votes : VoteQ, comments : Comment ]

	static mapping = {
		tags lazy: false
	}
    static constraints = {
		title blank : false, nullable : false
		content blank : false, nullable : false
    }
}
