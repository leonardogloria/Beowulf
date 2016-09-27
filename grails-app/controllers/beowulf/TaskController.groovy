package beowulf

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('ROLE_USER')
class TaskController {
    def springSecurityService


    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Project project) {
        //params.max = Math.min(max ?: 10, 100)
        def tasks = Task.findAllByProject(project,[max:20])

        render view:'index',model:[taskCount: tasks.size(),tasks:tasks]
    }
    def close(Task task){
        respond task
    }


    def show(Task task) {
        respond task
    }

    def create(Project project) {
        respond new Task(params),model:[project:project]
    }

    @Transactional
    def save(Task task) {
        def _loggedUser = springSecurityService.getPrincipal()
        def _user = User.findByUsername(_loggedUser.username)
        def _project = Project.get(params.projectId)
        if (task == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if(task.assignedTo){
            task.status = Status.ASSIGNED
        }
        task.createdDate = new Date()
        task.openBy = _user
        task.project = _project
        _project.addToTasks(task)

        if (!task.validate()) {
            transactionStatus.setRollbackOnly()
            respond task.errors, view:'create', model:[project: _project]
            return
        }

        //task.save flush:true, failOnError:true
        _project.save(flush:true,failOnError:true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'task.label', default: 'Task'), task.id])
                redirect controller: 'project', action: 'dashboard', id: task.project.id
            }
            '*' { respond task, [status: CREATED] }
        }
    }

    def edit(Task task) {
        respond task, model:[project: task.project]
    }

    @Transactional
    def update(Task task) {
        if (task == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (!task.validate()) {
            transactionStatus.setRollbackOnly()
            respond task.errors, view:'edit'
            return
        }

        task.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'task.label', default: 'Task'), task.id])
                redirect controller: 'project', action: 'dashboard', id: task.project.id
            }
            '*'{ respond task, [status: OK] }
        }
    }

    @Transactional
    def delete(Task task) {

        if (task == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        task.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'task.label', default: 'Task'), task.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
