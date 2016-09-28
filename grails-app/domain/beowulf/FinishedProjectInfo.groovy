package beowulf

class FinishedProjectInfo {
    String fileName
    String originalFileName
    Boolean haveSuccess = true
    String comment
    Date date
    static belongsTo = [project:Project]

    static constraints = {
        comment nullable: true
    }
}
