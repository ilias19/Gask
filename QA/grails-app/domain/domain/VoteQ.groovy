package domain

import java.util.Date;

class VoteQ {

   Integer value = 0
	Date createdAt = new Date()
	
	static belongsTo = [ user : User, question : Question ]
    
	static constraints = {
    }
}
