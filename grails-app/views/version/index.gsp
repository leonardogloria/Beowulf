<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="Versões" />
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
                 Versões
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Versões</a></li>
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
                            <g:link action="create" id="${project.id}" class="btn btn-app" ><i class="fa fa-save"></i>Novo</g:link>
                        </div>

                    </div>
                </g:if>
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
                            <td>Descrição</td>
                            <td>Nome do arquivo</td>
                            <td>Publicado por</td>
                            <td>Data de Publicação</td>
                            <td>Ações</td>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${versions}" status="i" var="version">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td><g:link action="show" id="${version.id}">${version.id}</g:link></td>
                                <td>${version.name}</td>
                                <td>${version.description}</td>
                                <td>${version.originalFileName}</td>
                                <td>${version.uploadedBy?.getFullName()}</td>

                                <td><g:formatDate format="dd/MM/yyyy - HH:mm" date="${version.uploadDate}" /></td>
                                <td>
                                    <g:link action="download" id="${version.id}"><i title="Download" class="fa fa-fw fa-arrow-down"></i></g:link>&nbsp;
                                </td>

                            </tr>
                        </g:each>

                        </tbody>
                    </table>

                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="pagination">
                        <g:paginate total="${versionCount ?: 0}" />
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