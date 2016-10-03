package beowulf

class TimeTagLib {
    static defaultEncodeAs = [taglib:'html']
    static namespace = 'time'
    def timeBetween = { attrs, body ->
        Date _dateFrom = attrs.dateFrom
        Date _dateTo = attrs.dateTo

        use(groovy.time.TimeCategory) {
            def duration = _dateTo - _dateFrom
            out <<  "${duration.days} dias e ${duration.hours} horas atrás"

        }


    }

}
