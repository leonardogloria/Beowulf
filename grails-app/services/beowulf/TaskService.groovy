package beowulf

import grails.transaction.Transactional

@Transactional
class TaskService {

    def findTasksBy(project,params) {
        def _tasks = []
        if(hasSearch(params)){
            def criteria = Task.createCriteria()
            _tasks = criteria.list {
                or {
                    if (params.keywordParam) {
                        println "Entrei aqui keyword"
                        or {
                            ilike('name', "${'%' + params.keywordParam + '%'}")
                            ilike("description", params.keywordParam)
                        }
                    }
                    if (params.userParam) {
                        println "Entrei aqui user"
                        or {
                            eq("assignedTo", User.get(params.userParam))
                            eq("openBy", User.get(params.userParam))
                        }

                    }
                    if(params.dateParam){
                        println "date"
                        def _dateFrom = params.dateParam.split("-")[0]
                        def _dateTo = params.dateParam.split("-")[1]
                        _dateFrom = Date.parse( 'MM/dd/yyyy', _dateFrom )
                        _dateTo = Date.parse( 'MM/dd/yyyy', _dateTo )
                        or{
                            between("createdDate",_dateFrom,_dateTo)
                            between("closeDate",_dateFrom,_dateTo)

                        }

                    }
                    if(params.statusParam){
                        eq('status', beowulf.Status.valueOf(params.statusParam))
                    }


                }
            }

        }else{

            _tasks = Task.findAllByProject(project,[max:20])

        }
        _tasks

    }
    private Boolean hasSearch(params){
        Boolean hasSearch = false
        if(params.keywordParam ||  params.userParam || params.dateParam || params.statusParam ){
            hasSearch = true
        }
        hasSearch
    }
}
