<%@ page import="beowulf.Status" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript>
            $(function () {
                $('#reservation').daterangepicker({
                    locale: {
                        format: 'dd/MM/yyyy'
                    }

                })

            });


        </g:javascript>
    </head>
    <body>


    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Tarefas
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Tarefas</a></li>
                <li><a href="#">Lista</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title"></h3>
                    <g:if test="${project.status != beowulf.ProjectStatus.FINISHED}">

                    <div class="row">
                        <div class="col-md-12 bottom-mg-15">
                            <g:link action="create" id="${project.id}" class="btn btn-app" ><i class="fa fa-save"></i>Nova</g:link>
                        </div>

                    </div>
                    </g:if>
                    <br />
                    <div class="row">
                        <g:form action="index" id="${project.id}" class="form-horizontal">
                            <div class="col-xs-3">
                                <input name="keywordParam" placeholder="Palavra - Chave" type="text" class="form-control" >
                            </div>
                            <div class="col-xs-2">
                                <g:select  noSelection="${['':'Usuario...']}" class="form-control" optionKey="id" optionValue="firstName" name="userParam" from="${project.members + project.owner}"></g:select>

                            </div>
                            <div class="col-xs-3">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input name="dateParam" placeholder="De - Até" type="text" class="form-control pull-right" id="reservation">
                                    </div><!-- /.input group -->
                                </div><!-- /.form group -->
                            </div>
                            <div class="col-xs-2">
                                <g:select noSelection="${['':'Status...']}" class="form-control"  name="statusParam" from="${beowulf.Status.values()}"></g:select>

                            </div>


                            <div class="col-xs-2">
                                <g:submitButton name="Filtrar" class="btn btn-primary"></g:submitButton>

                            </div>
                        </g:form>
                    </div>

                </div>
                <div class="box-body">


                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td>ID</td>
                            <td>Nome</td>
                            <td>Atribuído à</td>
                            <td>Status</td>
                            <td>Data de Abertura</td>
                            <td>Data de Encerramento</td>
                            <td>Ações</td>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${tasks}" status="i" var="task">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td><g:link action="show" id="${task.id}">${task.id}</g:link></td>
                                <td>${task.name}</td>
                                <td>${task.assignedTo?.getFullName()}</td>
                                <td>${task.status}</td>

                                <td><g:formatDate format="dd/MM/yyyy - HH:mm" date="${task.createdDate}" /></td>
                                <td><g:formatDate format="dd/MM/yyyy - HH:mm" date="${task.closeDate}" /></td>
                                <td>
                                    <g:if test="${task.status == beowulf.Status.NEW || task.status == beowulf.Status.ASSIGNED }">
                                    <g:link action="close" id="${task.id}"><i title="Fechar Tarefa" class="fa fa-fw fa-check-square-o"></i></g:link>&nbsp;

                                    </g:if>
                                </td>

                            </tr>
                        </g:each>
                        <g:if test="${tasks == null}">
                            <tr>
                                <td class="text-center">Não há tarefas cadastradas.</td>
                            </tr>
                        </g:if>
                        </tbody>
                    </table>


                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="pagination">
                        <g:paginate total="${taskCount ?: 0}" />
                    </div>
                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->



    </body>
</html>