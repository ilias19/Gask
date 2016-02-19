package domain

class Tag {
	String name
	
	static hasMany = [ questions : Question, users : User ]
	static belongsTo = [ Question, User]
	

    static constraints = {
    	name blank : false, nullable : false
    }
}
