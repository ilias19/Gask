package controllers

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import domain.*
/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(UserController)
@Mock([User,Question])
class UserControllerSpec extends Specification {

   
	void 'test save'() {
		when:
		params.email="julien@gmail.com"
		params.userName="Julien"
		params.password="xx"
		controller.save()

		then:
		view == '/index1'// If we succeed to save a user in database the rendered page is index1.gsp 
	}
	
	
	void 'test getUsers'() {
		when:
		controller.getUsers()

		then:
		view == '/users'// If we succeed to get all users from database the rendered page is users.gsp
	}
	
	void 'test logout'() {
		when:
		controller.logout()

		then:
		session["logged"]==false;
	}
	

		
	
}
