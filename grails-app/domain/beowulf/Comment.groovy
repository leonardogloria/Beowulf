package beowulf

class Comment {
    String text
    Date date
    User commentBy

    static belongsTo = [version:Version]

    static constraints = {
    }
}
