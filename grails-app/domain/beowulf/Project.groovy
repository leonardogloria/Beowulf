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

    static hasMany = [members:User,tasks:Task,versions:Version]

    static constraints = {
        description blank: true, nullable: true
        members nullable: true
        startDate nullable: true
        endDate nullable: true
        model nullable: true


    }
}
