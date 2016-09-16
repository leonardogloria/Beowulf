<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cargo.label', default: 'Cargo')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Empresa | Visualizar Cargos
        </h1>
        <g:if test="${flash.message}">
            <br />
            <div class="alert alert-success alert-dismissible">

                <h4>	<i class="icon fa fa-check"></i> Alerta!</h4>
                ${flash.message}
            </div>
        </g:if>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa ion-ios-home"></i> Cargo</a></li>
            <li><a href="#">Lista</a></li>

        </ol>
    </section>


    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <div class="row">
                    <div class="col-md-12 bottom-mg-15">
                        <g:link action="create" class="btn btn-app" ><i class="fa fa-save"></i>Novo</g:link>
                        <g:link action="importarIndex" class="btn btn-app btn-sm" ><i class="fa fa-upload"></i>Importar</g:link>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"
                        <f:table collection="${projectList}" />

                        <g:form role="form" class="form-inline" action="index">
                            <div class="form-group">
                                <g:textField value="${params.criteriaParam}" name="criteriaParam" maxlength="100" size="80	px" class="form-control input"></g:textField>
                                <button type="submit" class="btn btn-default">
                                    <span class="glyphicon glyphicon-search"></span> Buscar
                                </button>
                            </div>
                        </g:form>
                    </div><!-- col -->
                </div>
            </div>
            <div class="box-body">
                <div id="list-fornecedor" class="scaffold-list" role="main">

                </div>
            </div>
            <div class="box-footer">
                <div class="pagination-control">
                    <g:paginate total="${projectCount ?: 0}" />
                </div>
            </div><!-- /.box-footer-->
        </div>
    </section>
</div>


</body>
</html>