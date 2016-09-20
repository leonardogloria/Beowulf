<html>
<head>
	<meta name="layout" content="mainLogin"/>
	<title><g:message code='springSecurity.login.title'/></title>

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
				<input name="${usernameParameter ?: 'username'}" id="username"  class="form-control" placeholder="Email">
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input name="senha" type="password" name="${passwordParameter ?: 'password'}" class="form-control" placeholder="Password">
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
