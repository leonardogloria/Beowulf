package beowulf

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured


@ Secured(['permitAll'])
class UserController {
    def springSecurityService

    def profile(User user) {
        def _loggedUser = springSecurityService.getPrincipal()
        def _user = User.findByUsername(_loggedUser.username)
        def _myProfile = false
        if(user == _user){
            _myProfile = true

        }
        respond user,model:[myProfile : _myProfile]

    }
    def editPersonalInfo(User user){
        respond user
    }
    def doEditPersonalIndo(User user){
        if(!user.validate()){
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'editPersonalInfo'
            return
        }
        user.save flush:true
        flash.message = "Informações pessoais atualiadas com sucesso"
        redirect action:'profile', id: user.id

    }
}
