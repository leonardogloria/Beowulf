<%@ page import="beowulf.Status" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
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
            Perfil
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Usuário</a></li>
            <li><a href="#">Perfil</a></li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

    <div class="row">
        <div class="col-md-3">

            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <img class="profile-user-img img-responsive img-circle" src="<gravatar:generateAvatarFor email='${user.username}'/> alt="User profile picture">
                    <h3 class="profile-username text-center">${user.getFullName()}</h3>
                    <p class="text-muted text-center">${user.username}</p>

                    <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                            <b>Projetos</b> <a class="pull-right">5</a>
                        </li>

                    </ul>

                    <a href="#" class="btn btn-primary btn-block"><b>Seguir</b></a>
                </div><!-- /.box-body -->
            </div><!-- /.box -->

        <!-- About Me Box -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Sobre mim</h3>
                   <g:if test="${myProfile}">
                       <g:link controller="user" action="editPersonalInfo" id="${user.id}">

                       <div class="box-tools pull-right">

                        <span class="label label-primary">Editar</span>
                       </g:link>
                    </div>
                   </g:if>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <strong><i class="fa fa-book margin-r-5"></i>  Formação</strong>
                    <p class="text-muted">
                        ${user.personalInfo.education}
                    </p>

                    <hr>

                    <strong><i class="fa fa-map-marker margin-r-5"></i> Endereço</strong>
                    <p class="text-muted">${user.personalInfo.uf}, ${user.personalInfo.city}</p>

                    <hr>

                    <strong><i class="fa fa-pencil margin-r-5"></i> Universidades:</strong>
                    <p>
                        <g:each in="${user.institutions}" var="institution">
                            <span class="label label-success">${institution.name}</span>


                        </g:each>


                    </p>

                    <hr>

                    <strong><i class="fa fa-file-text-o margin-r-5"></i> Notas</strong>
                    <p>${user.personalInfo.notes}</p>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
        <div class="col-md-9">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#timeline" data-toggle="tab">Timeline</a></li>
                </ul>
                <div class="tab-content">

                    <div class="active tab-pane" id="timeline">
                        <ul class="timeline timeline-inverse">

                            <!-- The timeline -->
                        <g:each in="${user.timeLine}" var="event">
                            <li class="time-label">
                                <span class="bg-red">
                                    <g:formatDate format="dd/MM/yyyy" date="${event.date}"></g:formatDate>
                                </span>
                            </li>
                            <li>
                                <i class="fa fa-user bg-aqua"></i>
                                <div class="timeline-item">
                                    <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
                                    <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>
                                    <div class="timeline-body">
                                       ${event.eventName}
                                    </div>

                                </div>
                            </li>


                        </g:each>

                            <!-- END timeline item -->
                            <!-- timeline time label -->
                            <li class="time-label">
                                <span class="bg-green">
                                    <g:formatDate format="dd/MM/yyyy" date="${user.userSince}"></g:formatDate>
                                </span>
                            </li>
                            <!-- /.timeline-label -->
                            <!-- timeline item -->
                            <li>
                                 <i class="fa fa-user bg-aqua"></i>
                                <div class="timeline-item">
                                    <span class="time"><i class="fa fa-clock-o"></i> <time:timeBetween dateFrom="${user.userSince}" dateTo="${new Date()}" /></span>
                                    <h3 class="timeline-header"><a href="#">${user.getFullName()}</a> se cadastrou no TCC Online</h3>

                                </div>
                            </li>
                            <!-- END timeline item -->
                            <li>
                                <i class="fa fa-clock-o bg-gray"></i>
                            </li>
                        </ul>
                    </div><!-- /.tab-pane -->


                </div><!-- /.tab-content -->
            </div><!-- /.nav-tabs-custom -->
        </div><!-- /.col -->
    </div><!-- /.row -->


    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->



</body>
</html>