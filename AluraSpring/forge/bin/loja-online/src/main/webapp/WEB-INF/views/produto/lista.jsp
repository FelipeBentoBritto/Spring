<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<tags:backTemplate titulo="Lista de Produtos">

	
	<div class="container">
	
	<h1>Lista de Produtos</h1>
	<div>${sucesso }</div>
	<div>${falha}</div>
	<table class="table table-bordered table-striped">
	<tr>
		<th>Nome</th>
		<th>Descrição</th>
		<th>Tipo</th>
	</tr>
	
	<c:forEach items="${produto}" var="produto">
		<tr>
			<td>
			<a href="${s:mvcUrl('PC#detalhe').arg(0, produto.id).build()}">${produto.nome}</a>
			</td>
			<td>${produto.descricao}</td>
			<td>${produto.tipo}</td>
	
	</c:forEach>
	</table>
	
	</div>
</tags:backTemplate>
</body>
</html>
