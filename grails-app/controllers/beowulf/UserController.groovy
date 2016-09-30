package beowulf

import grails.plugin.springsecurity.annotation.Secured


@ Secured(['permitAll'])
class UserController {

    def profile(User user) {
        respond user

    }
}
