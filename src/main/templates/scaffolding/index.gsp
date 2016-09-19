<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="\${message(code: '${propertyName}.label', default: '${className}')}" />
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
                    <f:table collection="\${${propertyName}List}" />
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="pagination">
                        <g:paginate total="\${${propertyName}Count ?: 0}" />
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