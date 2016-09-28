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
        assignedTo

    </label>
    <div class="col-md-7">
        <g:select name="assignedTo" optionKey="id" optionValue="fullName" from="${task?.project?.members}" value="${task.assignedTo?.id}" class="form-control"></g:select>
    </div>
</div>
<div class="form-group  fieldcontain ">
    <label for="status" class="col-md-3 control-label">
        status

        <span class="required-indicator">*</span>

    </label>
    <div class="col-md-7">
        <g:select class="form-control" value="${task.status}" name="status" from="${beowulf.Status.values() - beowulf.Status.CLOSED}"></g:select>
    </div>
</div>

