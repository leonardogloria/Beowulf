<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>


    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Meus Projetos
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Projetos</a></li>
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
                            <td>Descricao</td>
                            <td>Status</td>
                            <td>Data de Inicio</td>
                            <td>Data de Encerramento</td>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${projectList}" status="i" var="project">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td><g:link action="dashboard" id="${project.id}">${project.id}</g:link></td>
                                <td>${project.name}</td>
                                <td>${project.description}</td>
                                <td>${project.status}</td>

                                <td><g:formatDate format="dd/MM/yyyy - HH:mm" date="${project.startDate}" /></td>
                                <td><g:formatDate format="dd/MM/yyyy - HH:mm" date="${project.endDate}" /></td>


                            </tr>
                        </g:each>
                        <g:if test="${projectList == null}">
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
                        <g:paginate total="${projectCount ?: 0}" />
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