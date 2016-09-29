package beowulf

import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class VersionService {

    def findVersionsBy(project,params) {
        def _versions = []
        if(hasSearch(params)){
            def criteria = Version.createCriteria()
            _versions = criteria.list {
                and {
                    eq("project",project)


                    or {
                        if (params.keywordParam) {
                            or {
                                ilike('name', "${'%' + params.keywordParam + '%'}")
                                ilike("description", "${'%' + params.keywordParam + '%'}")
                            }
                        }
                        if (params.userParam) {

                            eq("uploadedBy", User.get(params.userParam))


                        }
                        if (params.dateParam) {
                            def _dateFrom = params.dateParam.split("-")[0]
                            def _dateTo = params.dateParam.split("-")[1]
                            _dateFrom = Date.parse('MM/dd/yyyy', _dateFrom)
                            _dateTo = Date.parse('MM/dd/yyyy', _dateTo)

                            between("uploadDate", _dateFrom, _dateTo)


                        }


                    }
                }
            }

        }else{

            _versions = Version.findAllByProject(project,[max:20])

        }
        _versions

    }


    private Boolean hasSearch(params){
        Boolean hasSearch = false
        if(params.keywordParam ||  params.userParam || params.dateParam ){
            hasSearch = true
        }
        hasSearch
    }
}
