package beowulf

class ModelSection {
    String name
    String desciption
    static constraints = {
        desciption nullable: true,blank: true
    }
}
