package beowulf

class Version {
    String name
    String description
    User uploadedBy
    Date uploadDate
    String fileName
    String originalFileName
    Project project


    static constraints = {
        description nullable: true, blank: true
    }
    public String getFileFormat(){
        def fileExtIndex = originalFileName.lastIndexOf(".")
        originalFileName.substring(fileExtIndex)

    }
}
