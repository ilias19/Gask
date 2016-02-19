package domain

class User {
    String userName
	String realName
	String password
	String email
	String bio
	Date birthday = new Date()
	String website
	String location
	Date createdAt = new Date()
	Date lastLogin = new Date()
	Integer profileViews = 0
	boolean isAdmin = false
	
	static hasMany = [questions : Question, answers : Answer, comments : Comment, tags : Tag, votes : Vote, qvotes: VoteQ ]
	
	static mapping = {
		questions lazy: false
		answers lazy: false
		comments lazy: false
		tags lazy: false
		votes lazy: false
		qvotes lazy: false
	}
	
    static constraints = {
		 userName blank : false, nullable : false
		 
		 realName blank : false, nullable : true

		 password blank : false, nullable : false

		 email blank : false, nullable : false

		 bio blank : false, nullable : true

		 website blank : false, nullable : true

		 location blank : false, nullable : true
    }
	
	
}
