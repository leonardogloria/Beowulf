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
                    <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">New Members</span>
                        <span class="info-box-number">2,000</span>
                    </div><!-- /.info-box-content -->
                </div><!-- /.info-box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    <div class="row">
        <div class="col-md-6">
            <!-- USERS LIST -->
            <div class="box box-danger">
                <div class="box-header with-border">
                    <h3 class="box-title">Membros do Projeto</h3>
                    <div class="box-tools pull-right">
                        <span class="label label-danger">8 New Members</span>
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
                                        <g:link action="removeMember" resource="${project}" params="${[memberId:member.id]}" onclick="return confirm('Tem certeza?');">Att</g:link>


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
            <div class="row">


            </div><!-- inner row -->
</div>


    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>

</html>