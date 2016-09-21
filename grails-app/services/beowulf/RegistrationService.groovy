package beowulf

import grails.transaction.Transactional
import groovy.time.TimeCategory

@Transactional
class RegistrationService {

    def generatePassword(){'123456'}

    def generateValidation(User userInstance) {
        def hash = "TccOnLine${System.currentTimeMillis()} "
        String token = "$userInstance.username + hash + ${new Date()}"
        def dataValidade = new Date()
        use (TimeCategory){
            dataValidade = dataValidade + 1.day

        }

        def validacao = new ValidationLogin(user: userInstance,generatedIn: new Date(),expirationDate:dataValidade,token: token.encodeAsSHA256())


    }
    def findUserByToken(String token){
        def criteria = User.createCriteria()
        def userInstance = criteria.get {
            validations {
                eq('token', token)
                eq('isActive', true)
                gt('expirationDate', new Date())
            }
        }
        userInstance

    }
    def activate(User userInstance){
        def validation = userInstance.validations.getAt(0)
        userInstance.accountLocked = false

        if (validation) {
            validation.isActive = false
            validation.activationDate = new Date()
            return userInstance.save(flush :true)
        }else{
            return false
        }


    }


}
