<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ attribute name="bodyClass" required="false"%>
<%@ attribute name="titulo" required="true"%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />


<title>${titulo }- Loja Online</title>


<c:url value="/resources/css" var="cssPath" />

<link rel="stylesheet" href="${cssPath }/bootstrap.min.css">

<link rel="stylesheet" href="${cssPath }/bootstrap-theme.min.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/lojaonline/resources/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	padding: 60px 0px;
}
</style>

</head>
<body class="${bodyClass }">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Casa do Código</a>
			<a class="navbar-brand" href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a>
			<a class="navbar-brand" href="${s:mvcUrl('PC#listar').build()}">Lista de Produtos</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
			</ul>
		</div>
	</nav>


	<jsp:doBody />




</body>
</html>