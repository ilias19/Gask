package controllers

import grails.test.mixin.*
import spock.lang.Specification
import domain.Answer
import domain.Question
import domain.Tag

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(QuestionController)
@Mock([Question,Answer,Tag])
class QuestionControllerSpec extends Specification {

	void 'test getQuestion'() {
		/*when:
		controller.params.id=1;
		controller.getQuestion()

		then:
		view == '/quest'*/// If we succeed to get all users from database the rendered page is users.gsp
	}
}
