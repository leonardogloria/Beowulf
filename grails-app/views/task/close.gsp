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
        <h1>
            Tarefa
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>  Tarefa</a></li>
            <li class="active">Fechar</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Fechar Tarefa</h3>

            </div>
            <div class="box-body">

                <g:hasErrors bean="${this.task}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.task}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>

                <g:form action="doClose" url="[resource:task, action:'doClose']"   class="form-horizontal" role="form">
                    <fieldset class="form">
                        <g:render template="formClose"></g:render>

                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.close.label', default: 'Fechar')}" />
                    </fieldset>
                </g:form>

            </div>
        </div>
    </section>
</div>

</body>
</html>
