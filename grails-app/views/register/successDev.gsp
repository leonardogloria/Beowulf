<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mainLogin"/>

    <title></title>

</head>

<body class="hold-transition register-page">
<div class="register-box">
<div class="register-logo">
    <a href="../../index2.html"><b>TCC</b>Online</a>
</div>
<g:form action="register">
    <div class="register-box-body">
        Obrigado por se cadastrar no TCC Online!
        Enviamos um e-mail com instruções de como logar no sistema.
        <a href="${url}">Ativar</a>
    </div><!-- /.form-box -->
    <g:if test="${flash.message}">
        <br />
        <div class="alert alert-error alert-dismissible">

            <h4><i class="icon fa fa-check"></i> Alerta!</h4>
            ${flash.message}
        </div>
    </g:if>
    </div><!-- /.register-box -->
</g:form>

</body>
</html>