package beowulf
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class RegisterController {

    def index() { }
}
