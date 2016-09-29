package beowulf

import grails.converters.JSON
import org.springframework.security.access.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ORIENTADOR'])
class VersionController {
    def springSecurityService
    def versionService
    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Project project) {
        def versions = versionService.findVersionsBy(project,params)
        respond versions, model:[versionCount: versions.size(),project:project,versions:versions]
    }

    def show(Version version) {
        respond version
    }
    def download(Version version){
        def file = new File("C:\\consumidor\\tcc\\" + version.fileName)

        if (file.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${version.originalFileName}")
            response.outputStream << file.bytes
            return
        }
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
        def _fileName = params.projectId + "_" + ++versCount + extName

        version.originalFileName = file.originalFilename
        version.uploadDate = new Date()
        version.uploadedBy = user
        version.project = _project
        version.fileName = _fileName

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

    def createComment(Version version){
        respond version
    }
    def saveComment(Comment comment,Version version){

        def loggedUser = springSecurityService.getPrincipal()
        def user = User.findByUsername(loggedUser.username)

        comment.date = new Date()
        comment.versao = version
        comment.by = user

        if (!comment.validate()) {
            //transactionStatus.setRollbackOnly()
            println comment.errors as JSON
            respond comment.errors, view:'createComment' , model:[version:version]
            return
        }
        version.addToComments(comment)

        if( version.save(flush:true)){
            flash.message = "Comentario Adicionado com sucesso"
            redirect(action: 'show', id: version.id)

        }


    }
}
