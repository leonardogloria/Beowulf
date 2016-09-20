<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="\${message(code: '${propertyName}.label', default: '${className}')}" />
        <title> <g:message message="\${entityName}" /></title>
    </head>
    <body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <g:message message="\${entityName}" />
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>  <g:message message="\${entityName}" /></a></li>
                <li class="active">Novo</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Novo  <g:message message="\${entityName}" /></h3>

                </div>
                <div class="box-body">

                    <g:hasErrors bean="\${this.${propertyName}}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="\${this.${propertyName}}" var="error">
                                <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>

                    <g:form action="save"  class="form-horizontal" role="form">
                        <fieldset class="form">

                            <f:all bean="${propertyName}"/>

                        </fieldset>
                        <fieldset class="buttons">
                            <g:submitButton name="create" class="btn btn-primary" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
                        </fieldset>
                    </g:form>

                </div>
            </div>
        </section>
    </div>

    </body>
</html>
