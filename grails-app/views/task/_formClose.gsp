<ol class="property-list task">
    <div class="form-group  fieldcontain">
        <label class="col-md-3 control-label" for="name">
            Nome
        </label>
        <div class="col-md-7">
            <input type="text" class="form-control" name="name" required="" value="${task.name}" disabled="disable" id="name">
        </div>
    </div>


    <div class="form-group  fieldcontain">
        <label class="col-md-3 control-label" for="description">
            Descrição
        </label>
        <div class="col-md-7">
            <input type="text" class="form-control" name="description" required="" value="${task.description}" disabled="disable" id="description">
        </div>
    </div>




    <div class="form-group  fieldcontain">
        <label class="col-md-3 control-label" for="assignedTo">
            Atribuída à
        </label>
        <div class="col-md-7">
            <input type="text" class="form-control" name="assignedTo" required="" value="${task.assignedTo?.getFullName()}" disabled="disable" id="assignedTo">
        </div>
    </div>


    <div class="form-group  fieldcontain">
        <label class="col-md-3 control-label" for="project">
            Projeto
        </label>
        <div class="col-md-7">
            <input type="text" class="form-control" name="project" required="" value="${task.project?.name}"  disabled="disable" >
        </div>
    </div>


    <div class="form-group  fieldcontain">
        <label class="col-md-3 control-label" for="status">
            Status
        </label>
        <div class="col-md-7">
            <input type="text" class="form-control" name="status" required="" value="${task.status}" disabled="disable" id="status">
        </div>
    </div>




    <div class="form-group  fieldcontain">
        <label class="col-md-3 control-label" for="openBy">
            Aberta por
        </label>
        <div class="col-md-7">
            <input type="text" class="form-control" name="openBy" required="" value="${task.openBy?.getFullName()}" disabled="disable" id="openBy" >
        </div>
    </div>


    <div class="form-group  fieldcontain">
        <label class="col-md-3 control-label" for="createdDate">
            createdDate
        </label>
        <div class="col-md-7">

            <input type="text" class="form-control" name="createdDate" required="" value="<g:formatDate format="HH:mm - dd/MM/yyyy" date="${task.createdDate}" />" disabled="disable" id="createdDate">
        </div>
    </div>
    <div class="form-group  fieldcontain">
        <label class="col-md-3 control-label" for="createdDate">
            Informações
        </label>
        <div class="col-md-7">
            <g:textArea class="form-control" name="closeInfo">

            </g:textArea>


        </div>
    </div>



</ol>