package beowulf

class Project {
    String name
    String description
    Date startDate
    Date endDate
    User owner
    ProjectModel model
    static hasMany = [members:User]



    static constraints = {
        description blank: true, nullable: true
        members nullable: true
        startDate nullable: true
        endDate nullable: true


    }
}
