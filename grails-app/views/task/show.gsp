<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
        <title> <g:message message="${entityName}" /></title>
    </head>
    <body>

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>

            <g:if test="${flash.message}">
                <br />
                <div class="alert alert-success alert-dismissible">

                    <h4><i class="icon fa fa-check"></i> Alerta!</h4>
                    ${flash.message}
                </div>
            </g:if>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>  <g:message message="${entityName}" /></a></li>
                <li class="active">Show</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title"> <g:message message="${entityName}" /></h3>
                </div>

                <div class="box-body">
                    <form  class="form-horizontal">

                        <ol class="property-list task">

                            <div class="form-group  fieldcontain">
                                <label class="col-md-3 control-label" for="name">
                                    Nome da tarefa
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
                                <label class="col-md-3 control-label" for="openBy">
                                    Aberto por
                                </label>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" name="openBy" disabled="disabled" required="" value="${task.openBy?.getFullName()}">
                                </div>
                            </div>



                            <div class="form-group  fieldcontain">
                                <label class="col-md-3 control-label" for="closeDate">
                                    Encerrada em
                                </label>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" name="closeDate" required="" value=" <g:formatDate format="HH:mm - dd/MM/yyyy" date="${task.closeDate}" />
                                    " disabled="disable" id="closeDate">
                                </div>
                            </div>
                            <div class="form-group  fieldcontain">
                                <label class="col-md-3 control-label" for="createdDate">
                                    Criada em
                                </label>
                                <div class="col-md-7">

                                    <input type="text" class="form-control" name="createdDate" required="" value="<g:formatDate format="HH:mm - dd/MM/yyyy" date="${task.createdDate}"/>" disabled="disable" id="createdDate">
                                </div>
                            </div>


                            <div class="form-group  fieldcontain">
                                <label class="col-md-3 control-label" for="assignedTo">
                                    Atribuída a:
                                </label>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" name="assignedTo" required="" value="${task.assignedTo?.getFullName()}" disabled="disable" id="assignedTo" />
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
                                <label class="col-md-3 control-label" for="closeInfo">
                                    Mensagem de encerramento
                                </label>
                                <div class="col-md-7">
                                    <g:textArea name="closeInfo" class="form-control"value="${task.closeInfo}" disabled="disable" id="closeInfo"></g:textArea>
                                </div>
                            </div>

                        </ol>

                    </form>



                </div> <!-- box body -->
                <div class="box-footer">
                    <g:form url="[resource:cargoInstance, action:'delete']" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="btn btn-primary" action="edit" resource="${this.task}">Editar</g:link>
                            <g:actionSubmit class="btn btn-danger" action="delete" value="Excluir" onclick="return confirm('Tem certeza?');" />
                            <g:link class="btn btn-primary" action="index" id="${task.project.id}"><g:message code="default.button.back.label" default="Voltar" /></g:link>
                            <g:if test="${task.status == beowulf.Status.NEW || task.status == beowulf.Status.ASSIGNED }">
                                <g:link class="btn btn-primary" action="close" id="${task.id}"><g:message code="default.button.close.label" default="Close" /></g:link>

                            </g:if>

                        </fieldset>
                    </g:form>
                </div> <!-- box footer -->
            </div> <!--- box -->
        </section>
    </div>



    </body>
</html>
