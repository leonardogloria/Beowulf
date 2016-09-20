<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
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
                        <f:display bean="project" />

                    </form>



                </div> <!-- box body -->
                <div class="box-footer">
                    <g:form url="[resource:cargoInstance, action:'delete']" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="btn btn-primary" action="edit" resource="${this.project}">Editar</g:link>
                            <g:actionSubmit class="btn btn-danger" action="delete" value="Excluir" onclick="return confirm('Tem certeza?')');" />
                            <g:link class="btn btn-primary" action="index"><g:message code="default.button.back.label" default="Voltar" /></g:link>

                        </fieldset>
                    </g:form>
                </div> <!-- box footer -->
            </div> <!--- box -->
        </section>
    </div>



    </body>
</html>
