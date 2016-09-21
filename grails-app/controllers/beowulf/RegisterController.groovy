package beowulf

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.util.Environment

@Secured('permitAll')
class RegisterController {
    def registrationService

    def index() {
        respond new User()
    }
    def doRegister(User userInstance){
        println userInstance as JSON
        userInstance.password = registrationService.generatePassword()
        userInstance.accountLocked = true
        def validation = registrationService.generateValidation(userInstance)
        userInstance.addToValidations(validation)
        userInstance.save(failOnError:true)
        def roleUser = Role.findByAuthority('ROLE_USER')

        new UserRole(user: userInstance,role: roleUser).save(failOnError:true)



        def tokenUrl = "/register/activate?token=${validation.token}"
        def url = "${g.createLink(absolute:true, uri:tokenUrl)}"
        if (Environment.current == Environment.DEVELOPMENT) {
            render (view: 'successDev',model: [url:url])
            return
        } else
        if (Environment.current == Environment.PRODUCTION) {
            // insert Test environment specific code here
            render view: 'success'

        }

    }
    def activate(){
        def token = params.token
        if(token){
            def userInstance = registrationService.findUserByToken(token)
            if(registrationService.activate(userInstance)){
                render view : 'activated'
                return
            }else{
                //Return 404
            }

        }

    }

}
