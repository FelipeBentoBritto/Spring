<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ attribute name="titulo" required="true"%>
<%@ attribute name="bodyClass" required="false"%>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>${titulo }- Loja Online</title>


<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css">

<link href="${cssPath}/cssbase-min.css"
	rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700'
	rel='stylesheet' />
<link href="${cssPath}/fonts.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="${cssPath}/fontello-ie7.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${cssPath}/fontello-embedded.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${cssPath}/fontello.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="${cssPath}/style.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="${cssPath}/layout-colors.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${cssPath}/responsive-style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${cssPath}/guia-do-programador-style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${cssPath}/produtos.css" rel="stylesheet"
	type="text/css" media="all" />


</head>

<%@include file="/WEB-INF/views/cabecalho.jsp"%>

<body class="${bodyClass }">


	<jsp:doBody />




</body>
</html>