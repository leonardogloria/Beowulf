package beowulf

class PersonalInfo {
    String education = "Não informado"
    String notes = "Não informado"
    String uf = "Não informado"
    String city = "Não informado"


    static constraints = {
        education nullable: true, blank: true
        notes nullable: true, blank: true
        uf nullable: true, blank: true
        city nullable: true, blank: true
    }
}
