package domain

class Vote {
	Integer value = 0
	Date createdAt = new Date()
	
	static belongsTo = [ user : User, answer : Answer ]
    
	static constraints = {
    }
}
