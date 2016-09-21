package beowulf

class ProjectModel {
    String name


    static hasMany = [sections:ModelSection]
    static constraints = {
    }
}
