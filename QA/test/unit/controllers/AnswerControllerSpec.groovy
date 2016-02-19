package controllers

import domain.*
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AnswerController)
@Mock([Answer,User,Question,Tag])
class AnswerControllerSpec extends Specification {

	/*void 'test save'() {
		when:
		def user=User.findById(1);
		session['user']=new User();
		params.id=1;
		params.content="";
		controller.save();

		then:
		view == '/quest'
	}*/
}
