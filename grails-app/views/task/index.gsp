<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>


    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>it all starts here</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> <g:message code="default.new.label" args="[entityName]" /></a></li>
                <li><a href="#">Lista</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title"></h3>
                    <div class="row">
                        <div class="col-md-12 bottom-mg-15">
                            <g:link action="create" class="btn btn-app" ><i class="fa fa-save"></i>Novo</g:link>
                        </div>

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
                                    <g:link action="close" id="${task.id}"><i title="Fechar Tarefa" class="fa fa-fw fa-check-square-o"></i></g:link>&nbsp;
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