<html>
<head>
    <meta name="layout" content="mainLogin"/>
    <title><g:message code='springSecurity.login.title'/></title>
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

<!-- Content Wrapper. Contains page content -->
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>TCC</b>ONLINE</a>
    </div><!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Informe suas credenciais para se tornar um usuário do sistema!</p>
        <g:form action="doRegister" controller="register">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="firstName" id="firstName" placeholder="Nome"/>

                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Sobrenome"/>

                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>


            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="username" id="username" placeholder="E-Mail"/>

                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>


            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10">
                    <!-- Minimal style -->

                    <!-- radio -->
                    <div class="form-group">
                    <g:radioGroup name="type"
                                  values="${beowulf.Type.values()}"
                                  labels="${beowulf.Type?.values()*.name()}"
                                  value="${beowulf.Type?.values()}">
                        ${it.radio} <g:message code="${it.label}" />&nbsp;
                    </g:radioGroup>
                    </div>
                </div>
                <div class="col-md-1"></div>



            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Instituição de Ensino</label>
                        <g:select optionValue="name" optionKey="id" class="form-control select2" name="institutions" from="${beowulf.Institution.list()}" multiple="multiple" style="width: 100%;"></g:select>

                    </div><!-- /.form-group -->
            </div>
            <div class="row">
                <div class="col-lg-8">

                    <recaptcha:ifEnabled/>


                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 text-center"></div>

                    <div class="col-xs-4 text-center">
                    <br /> <button type="submit" class="btn btn-primary btn-block btn-flat">Registrar-se</button>
                </div><!-- /.col -->
                <div class="col-xs-4 text-center">


               </div><!-- /.col -->



            </div>

        </g:form>


    </div><!-- /.login-box-body -->
    <g:if test="${flash.message}">
        <br />
        <div class="alert alert-error alert-dismissible">

            <h4><i class="icon fa fa-check"></i> Alerta!</h4>
            ${flash.message}
        </div>
    </g:if>
</div><!-- /.login-box -->




</body>
</html>
