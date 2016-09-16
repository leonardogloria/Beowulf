package beowulf

class Project {
    String name
    String description


    static constraints = {
        description blank: true, nullable: true
    }
}
