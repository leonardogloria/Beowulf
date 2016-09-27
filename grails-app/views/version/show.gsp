<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'version.label', default: 'Version')}" />
        <title> <g:message message="${entityName}" /></title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <g:javascript>
            $(function () {
                $( "#accordion" ).accordion();
            } );
        </g:javascript>
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
                        <div class="form-group  fieldcontain ">
                            <label for="name" class="col-md-3 control-label">
                                Nome da Versão

                                <span class="required-indicator">*</span>

                            </label>

                            <div class="col-md-7">
                                <input type="text" disabled="disabled" class="form-control" name="name" value="${version.name}" id="name">

                            </div>
                        </div>

                        <div class="form-group  fieldcontain ">
                            <label for="name" class="col-md-3 control-label">
                                Descrição

                            </label>

                            <div class="col-md-7">
                                <input type="text" disabled="disabled" class="form-control" name="description" value="${version.description}" id="description">

                            </div>
                        </div>

                        <div class="form-group  fieldcontain ">
                            <label for="fileName" class="col-md-3 control-label">
                                Data de Envio:

                                <span class="required-indicator">*</span>

                            </label>

                            <div class="col-md-7">
                                <input type="text" disabled="disabled" class="form-control" name="description" value="<g:formatDate format="dd/MM/yyyy - HH:MM" date="${version.uploadDate}"></g:formatDate>" id="uploadDate">

                            </div>
                        </div>
                        <div class="form-group  fieldcontain ">
                            <label for="fileName" class="col-md-3 control-label">
                                Enviado por:

                                <span class="required-indicator">*</span>

                            </label>

                            <div class="col-md-7">
                                <input type="text" disabled="disabled" class="form-control" name="description" value="${version.uploadedBy.firstName + ' '  + version.uploadedBy.lastName}" id="uploadDate">

                            </div>
                        </div>



                        <div class="form-group  fieldcontain ">
                            <label for="fileName" class="col-md-3 control-label">
                                Arquivo:

                                <span class="required-indicator">*</span>

                            </label>

                            <div class="col-md-7">
                                <input type="text" disabled="disabled" class="form-control" name="description" value="${version.originalFileName}" id="description">


                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-6">
                                <div id="accordion">
                                    <g:each in="${version.comments}" var="comment">
                                        <h3>De: ${comment.by.getFullName()} às <g:formatDate format="dd/MM/yyyy - HH:mm" date="${comment.date}" /></h3>
                                        <div>
                                            <p>
                                                ${comment.text}
                                            </p>
                                        </div>

                                    </g:each>

                            </div>
                        </div>

                        <div class="col-lg-3"></div>
                            </div>


                    </form>

                </div> <!-- box body -->
                <div class="box-footer">
                    <g:form url="[resource:cargoInstance, action:'delete']" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="btn btn-primary" action="edit" resource="${this.version}">Editar</g:link>
                            <g:actionSubmit class="btn btn-danger" action="delete" value="Excluir" onclick="return confirm('Tem certeza?');" />
                            <g:link class="btn btn-primary" action="createComment" id="${version.id}"><g:message code="default.button.back.label" default="Comentar" /></g:link>
                            <g:link class="btn btn-primary" controller="project" action="dashboard" id="${version.project.id}"><g:message code="default.button.back.label" default="Voltar" /></g:link>

                        </fieldset>
                    </g:form>
                </div> <!-- box footer -->
            </div> <!--- box -->
        </section>
    </div>



    </body>
</html>
