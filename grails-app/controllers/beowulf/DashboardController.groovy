package beowulf

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_USER")
class DashboardController {

    def index() {
        def loggedUser = springSecurityService.getPrincipal()
        def user = User.findByUsername(loggedUser.username)

        def _myTasks = Task.findAllByAssignedTo(user)
    }
}
