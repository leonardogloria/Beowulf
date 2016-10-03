package beowulf

import grails.plugin.springsecurity.annotation.Secured

@Secured("permitAll")
class DashboardController {
    def springSecurityService
    def board(){
        def loggedUser = springSecurityService.getPrincipal()
        def user = User.findByUsername(loggedUser.username)
        respond model:[user:user]
    }
}
