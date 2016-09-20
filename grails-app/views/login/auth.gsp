<html>
<head>
    <meta name="layout" content="mainLogin"/>
    <title><g:message code='springSecurity.login.title'/></title>
    <style type="text/css" media="screen">
    #login {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }

    #login .inner {
        width: 340px;
        padding-bottom: 6px;
        margin: 60px auto;
        text-align: left;
        border: 1px solid #aab;
        background-color: #f0f0fa;
        -moz-box-shadow: 2px 2px 2px #eee;
        -webkit-box-shadow: 2px 2px 2px #eee;
        -khtml-box-shadow: 2px 2px 2px #eee;
        box-shadow: 2px 2px 2px #eee;
    }

    #login .inner .fheader {
        padding: 18px 26px 14px 26px;
        background-color: #f7f7ff;
        margin: 0px 0 14px 0;
        color: #2e3741;
        font-size: 18px;
        font-weight: bold;
    }

    #login .inner .cssform p {
        clear: left;
        margin: 0;
        padding: 4px 0 3px 0;
        padding-left: 105px;
        margin-bottom: 20px;
        height: 1%;
    }

    #login .inner .cssform input[type="text"] {
        width: 120px;
    }

    #login .inner .cssform label {
        font-weight: bold;
        float: left;
        text-align: right;
        margin-left: -105px;
        width: 110px;
        padding-top: 3px;
        padding-right: 10px;
    }

    #login #remember_me_holder {
        padding-left: 120px;
    }

    #login #submit {
        margin-left: 15px;
    }

    #login #remember_me_holder label {
        float: none;
        margin-left: 0;
        text-align: left;
        width: 200px
    }

    #login .inner .login_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }

    #login .inner .text_ {
        width: 120px;
    }

    #login .inner .chk {
        height: 12px;
    }
    </style>
</head>

<body>

<!-- Content Wrapper. Contains page content -->
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>TCC</b>ONLINE</a>
    </div><!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Informe suas credenciais para logar</p>
        <form action="/login/authenticate" method="POST" id="loginForm"  autocomplete="off">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" placeholder="E-Mail"/>

                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="Password" name="${passwordParameter ?: 'password'}" id="password"/>

                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-lg-8">

                    <recaptcha:ifEnabled/>


                </div>
            </div>
            <div class="row">

                <div class="col-xs-4 text-center">
                    <br /> <button type="submit" class="btn btn-primary btn-block btn-flat">Logar</button>
                </div><!-- /.col -->
                <div class="col-xs-6 text-center">


                    <!-- <a href="#">Esqueci minha senha</a> --><br>
                </div><!-- /.col -->



            </div>

        </form>


    </div><!-- /.login-box-body -->
    <g:if test="${flash.message}">
        <br />
        <div class="alert alert-error alert-dismissible">

            <h4><i class="icon fa fa-check"></i> Alerta!</h4>
            ${flash.message}
        </div>
    </g:if>
</div><!-- /.login-box -->



<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
