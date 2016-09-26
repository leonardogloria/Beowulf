<input type="hidden" class="form-control" name="projectId" value="${project?.id}" id="project">

<div class="form-group  fieldcontain ">
    <label for="name" class="col-md-3 control-label">
        Nome

        <span class="required-indicator">*</span>

    </label>
    <div class="col-md-7">
        <input type="text" class="form-control" name="name" value="${task.name}" id="name">

    </div>
</div>

<div class="form-group  fieldcontain ">
    <label for="description" class="col-md-3 control-label">
        Descrição


    </label>
    <div class="col-md-7">
        <input type="text" class="form-control" name="description" value="${task.description}" id="description">

    </div>
</div>


    <div class="form-group  fieldcontain ">
    <label for="assignedTo" class="col-md-3 control-label">
        Atribuir a:


    </label>
    <div class="col-md-7">
        <g:select     noSelection="${['null':'Selecione...']}"
                      optionKey="id" optionValue="firstName" value="${task.assignedTo}" from="${project.members}" class="form-control" name="assignedTo" id="assignedTo"></g:select>

    </div>
</div>

