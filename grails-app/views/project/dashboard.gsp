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
            Dashboard
            <small>Version 2.0</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    <g:if test="${flash.message}">
        <br />
        <div class="alert alert-success alert-dismissible">

            <h4><i class="icon fa fa-check"></i> Alerta!</h4>
            ${flash.message}
        </div>
    </g:if>
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">CPU Traffic</span>
                        <span class="info-box-number">90<small>%</small></span>
                    </div><!-- /.info-box-content -->
                </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-red"><i class="fa fa-google-plus"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Likes</span>
                        <span class="info-box-number">41,410</span>
                    </div><!-- /.info-box-content -->
                </div><!-- /.info-box -->
            </div><!-- /.col -->

        <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green"><i class="ion ion-ios-cart-outline"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Sales</span>
                        <span class="info-box-number">760</span>
                    </div><!-- /.info-box-content -->
                </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-red"><i class="ion ion-checkmark"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">
                            <h3>
                                <g:if test="${project.status != beowulf.ProjectStatus.FINISHED}">
                                    <g:link controller="project" action="finish" id="${project?.id}"> Finalizar</g:link>
                                </g:if>
                                <g:else>
                                    Finalizado
                                </g:else>
                            </h3>
                        </span>
                    </div><!-- /.info-box-content -->
                </div><!-- /.info-box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    <div class="row">
        <div class="col-md-4">
            <!-- USERS LIST -->
            <div class="box box-danger">
                <div class="box-header with-border">
                    <h3 class="box-title">Membros do Projeto</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                    <ul class="users-list clearfix">


                        <li>
                            <asset:image src="user2-160x160.jpg" alt="Avatar"></asset:image>
                            <a class="users-list-name" href="#">${project.owner.firstName } </a>

                            <span class="users-list-date">Orientador</span>
                        </li>
                        <g:each in="${project.members - project.owner}" var="member">
                            <li>
                                <asset:image src="user2-160x160.jpg" alt="Avatar"></asset:image>
                                <a class="users-list-name" href="#">${member.firstName} </a>

                                <span class="users-list-date">

                                    <sec:ifAnyGranted roles='ROLE_ORIENTADOR'>
                                        <g:link action="removeMember" resource="${project}" params="${[memberId:member.id]}" onclick="return confirm('Tem certeza?');">Remover</g:link>


                                    </sec:ifAnyGranted>
                                    <sec:ifNotGranted roles='ROLE_ORIENTADOR'>
                                        Membro
                                    </sec:ifNotGranted>

                            </span>
                        </li>
                        </g:each>


                    </ul><!-- /.users-list -->
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                <g:link action="addMember" id="${project.id}" class="btn btn-sm btn-info btn-flat pull-left">Convidar Participante</g:link>

            </div><!-- /.box-footer -->
            </div><!--/.box -->

</div>
    <div class="col-md-4">
        <!-- PRODUCT LIST -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Últimas Tarefas</h3>

                <div class="box-tools pull-right">
                    <g:link controller="task" action="create" id="${project.id}"><span class="label label-primary">Nova Tarefa</span></g:link>

                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <ul class="products-list product-list-in-box">

                    <g:each in="${tasks}" var="task">
                        <li class="item">
                            <div class="product-img">
                                <asset:image src="task.png"></asset:image>
                            </div>
                            <div class="product-info">
                                <g:link controller="task" action="edit" id="${task.id}" class="product-title">${task.name} <span class="label label-warning pull-right">${task.status}</span></g:link>
                                <span class="product-description">
                                    ${task.description}
                                </span>
                            </div>
                        </li><!-- /.item -->

                    </g:each>
                </ul>
            </div><!-- /.box-body -->
            <div class="box-footer text-center">
                <a href="javascript::;" class="uppercase">Ver todas as Tarefas</a>
            </div><!-- /.box-footer -->
        </div><!-- /.box -->
    </div>


    <div class="col-md-4">
        <!-- PRODUCT LIST -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Últimas Versões</h3>
                <div class="box-tools pull-right">
                    <g:link controller="version" action="create" id="${project.id}">
                        <span class="label label-primary">Nova Versão</span>
                    </g:link>

                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <ul class="products-list product-list-in-box">

                    <g:each in="${project.versions}" var="version">
                        <li class="item">
                            <div class="product-img">
                                <asset:image src="doc_icon.png"></asset:image>
                            </div>
                            <div class="product-info">
                                <g:link controller="version" action="show" id="${version.id}"  class="product-title">${version.name} <span class="label label-warning pull-right">${version.description}</span></g:link>
                                <span class="product-description">
                                    ${version.description}
                                </span>
                            </div>
                        </li><!-- /.item -->

                    </g:each>
                </ul>
            </div><!-- /.box-body -->
            <div class="box-footer text-center">
                <a href="javascript::;" class="uppercase">Ver todas as Tarefas</a>
            </div><!-- /.box-footer -->
        </div><!-- /.box -->
    </div>

</div>


    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>

</html>