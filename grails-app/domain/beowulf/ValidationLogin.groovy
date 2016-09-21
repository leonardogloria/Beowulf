package beowulf

class ValidationLogin {
    String token
    Date generatedIn
    Date expirationDate
    Date activationDate
    Boolean isActive = true

    static  belongsTo = [user:User]
    static constraints = {
        activationDate nullable: true
    }
}
