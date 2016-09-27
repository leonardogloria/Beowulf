package beowulf

class Task {
    String name
    String description
    Date createdDate
    Date closeDate
    User assignedTo
    User openBy
    Status status = Status.NEW
    String closeInfo
    static belongsTo = [project:Project]

    static constraints = {
        description nullable: true, blank: true
        closeDate nullable: true
        assignedTo nullable: true
        closeInfo nullable: true

    }
}
enum Status {
    NEW("Novo"),ASSIGNED('Atribuido'),CLOSED('Fechado')
    Status(String Status){
        this.status = status
    }
    String status

    public String getStatus(){
        this.status
    }

}
