package beowulf

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PersonalInfoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PersonalInfo.list(params), model:[personalInfoCount: PersonalInfo.count()]
    }

    def show(PersonalInfo personalInfo) {
        respond personalInfo
    }

    def create() {
        respond new PersonalInfo(params)
    }

    @Transactional
    def save(PersonalInfo personalInfo) {
        if (personalInfo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (personalInfo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond personalInfo.errors, view:'create'
            return
        }

        personalInfo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'personalInfo.label', default: 'PersonalInfo'), personalInfo.id])
                redirect personalInfo
            }
            '*' { respond personalInfo, [status: CREATED] }
        }
    }

    def edit(PersonalInfo personalInfo) {
        respond personalInfo
    }

    @Transactional
    def update(PersonalInfo personalInfo) {
        if (personalInfo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (personalInfo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond personalInfo.errors, view:'edit'
            return
        }

        personalInfo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'personalInfo.label', default: 'PersonalInfo'), personalInfo.id])
                redirect personalInfo
            }
            '*'{ respond personalInfo, [status: OK] }
        }
    }

    @Transactional
    def delete(PersonalInfo personalInfo) {

        if (personalInfo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        personalInfo.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'personalInfo.label', default: 'PersonalInfo'), personalInfo.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personalInfo.label', default: 'PersonalInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
