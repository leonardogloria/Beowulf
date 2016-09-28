<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
    <title> <g:message message="${entityName}" /></title>
    <g:javascript>
        $(function (){
            $(".select2").select2();

            //iCheck for checkbox and radio inputs
            $('input[type="checkbox"].minimal, input[type="radio"]').iCheck({
                checkboxClass: 'icheckbox_minimal-blue',
                radioClass: 'iradio_minimal-blue'
            });
        });
    </g:javascript>
</head>
<body>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Finalizar Projeto</h1>

            <br />
            <div class="alert alert-warning alert-dismissible">

                <h4><i class="icon fa fa-check"></i> Alerta!</h4>
                Atenção! Se você finalizar o projeto não serão permitidas quaisquer alterações!
            </div>
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

                <g:uploadForm  url="[resource:project, action:'doFinish']"  enctype="multipart/form-data" useToken="true"  class="form-horizontal" role="form">
                    <fieldset class="form">
                        <g:render template="finishForm"></g:render>

                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.finish.label', default: 'Finzalizar')}" />
                    </fieldset>
                </g:uploadForm>




            </div> <!-- box body -->

            </div> <!-- box footer -->
        </div> <!--- box -->
    </section>
</div>



</body>
</html>
