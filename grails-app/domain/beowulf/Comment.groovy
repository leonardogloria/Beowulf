package beowulf

class Comment {
    String text
    Date date
    User by

    static belongsTo = [versao:Version]

    static constraints = {
    }
}
