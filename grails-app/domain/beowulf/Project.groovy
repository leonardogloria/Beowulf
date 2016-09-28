package beowulf

import org.grails.databinding.BindingFormat

class Project {
    String name
    String description

    @BindingFormat('dd/mm/yyyy')
    Date startDate

    @BindingFormat('dd/mm/yyyy')
    Date endDate
    User owner
    ProjectModel model
    Institution institution

    ProjectStatus status = ProjectStatus.STARTED
    static hasMany = [members:User,tasks:Task,versions:Version]
    static  hasOne = [finishInfo:FinishedProjectInfo]

    static constraints = {
        description blank: true, nullable: true
        members nullable: true
        startDate nullable: true
        endDate nullable: true
        model nullable: true
        finishInfo nullable: true


    }

}
enum ProjectStatus{
    STARTED("Iniciado"),
    PAUSED("Pausado"),
    FINISHED("Finalizado")

    ProjectStatus(String status){
        this.status = status
    }
    public String status


}