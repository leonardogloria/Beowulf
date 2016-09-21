package beowulf

import grails.plugin.springsecurity.annotation.Secured

class TesteLayoutController {
    @Secured('ROLE_ADMIN')
    def index() {
        println "Only Authorized personal"

    }
}
