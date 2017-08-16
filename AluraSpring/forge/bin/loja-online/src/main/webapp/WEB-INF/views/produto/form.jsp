<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<tags:backTemplate titulo="Cadastro de Produtos">

	<div class="container">
	
		<h1>Cadastro de Produto</h1>
		<form:form action="/lojaonline/produto" method="POST"
			commandName="produto">
			<div class="form-group">
				<label>Nome</label>
				<form:input path="nome" cssClass="form-control" />
				<form:errors path="nome" />
			</div>
			<div class="form-group">
				<label>Descrição</label>
				<form:textarea path="descricao" cssClass="form-control" />
				<form:errors path="descricao" />
			</div>
		<div class="form-group">
			<label>Tipo do Produto</label>
			<select class="btn btn-default" style="display:block" >
			<option value=""></option>
				<c:forEach items="${stateList}" var="option">
				<option value="${option}">
                    <c:out value="${option}"></c:out>
                </option>
				</c:forEach>
				<form:errors path="tipo" />
			</select>
		</div>
		<div class="form-group">
			<label>Imagem</label>
			<input name="imagem" type="file" class="form-control"/>
		</div>
		
		<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form:form>
	</div>

</tags:backTemplate>
</body>
</html>
