package beowulf

import org.springframework.security.access.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ORIENTADOR'])
class VersionController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Version.list(params), model:[versionCount: Version.count()]
    }

    def show(Version version) {
        respond version
    }

    def create(Project project) {
        respond new Version(params), model:[project:project]
    }

    @Transactional
    def save(Version version) {
        def loggedUser = springSecurityService.getPrincipal()
        def user = User.findByUsername(loggedUser.username)
        def _project = Project.get(params.projectId)

        if (version == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        def  file = params.myFile

        int fileExtIndex = file.originalFilename.lastIndexOf(".")
        version.fileName = file.originalFilename
        String extName = file.originalFilename.substring(fileExtIndex)

        if(!extName.equalsIgnoreCase(".pdf") && !extName.equalsIgnoreCase(".txt") && !extName.equalsIgnoreCase(".doc") &&
                !extName.equalsIgnoreCase(".docx") ){

            def errorMSG ="O arquivo deve possuir uma  das extensões: '.doc', '.txt', '.docx' ,'.pdf'"
            version.errors.rejectValue("fileName", errorMSG)

        }
        def versCount = Version.countByProject(_project )
        def fileName = params.projectId + "_" + ++versCount + extName

        version.originalFileName = file.originalFilename
        version.uploadDate = new Date()
        version.uploadedBy = user
        version.project = _project

        if (!version.validate()) {
            transactionStatus.setRollbackOnly()
            respond version.errors, view:'create' , model:[project:_project]
            return
        }

        _project.addToVersions(version)
        _project.save flush:true
        def webrootDir = servletContext.getRealPath("/") //app directory

        file.transferTo(new File("C:\\consumidor\\tcc\\" + version.fileName))


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'version.label', default: 'Version'), version.id])
                redirect version
            }
            '*' { respond version, [status: CREATED] }
        }
    }

    def edit(Version version) {
        respond version
    }

    @Transactional
    def update(Version version) {
        if (version == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (version.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond version.errors, view:'edit'
            return
        }

        version.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'version.label', default: 'Version'), version.id])
                redirect version
            }
            '*'{ respond version, [status: OK] }
        }
    }

    @Transactional
    def delete(Version version) {

        if (version == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        version.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'version.label', default: 'Version'), version.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'version.label', default: 'Version'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
