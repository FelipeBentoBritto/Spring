<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<tags:pageTemplate titulo="Loja Online">


<section id="index-section" class="container middle">

<ul class="clearfix book-collection">	

	<c:forEach items="${produto }" var="produto">
			<li>
			<a href="${s:mvcUrl('PC#detalhe').arg(0, produto.id).build()}" class="block clearfix">
					<h2 class="product-title">${produto.nome}</h2>
					<img width="143"
						height="202"
						src="https://cdn.shopify.com/s/files/1/0155/7645/products/java8-featured_large.png?v=1411490181"
						alt="Java 8 Prático"
						title="Java 8 Prático"/>
				</a>
				</li>
			
 	</c:forEach>
</ul>

</section>

</tags:pageTemplate>
