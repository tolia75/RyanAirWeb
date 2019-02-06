<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edition passager</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body class="container">
	<h1>edition passager</h1>
	<c:choose>
		<c:when test="${action=='detail'}"></c:when>
		<form action="action?m=editPassager" method="post">
			<div class="form-group">
				<label>${passager.prenom}</label>
			</div>
			<div class="form-group">
				<label>${passager.nom}</label>
			</div>
			<div class="form-group">
				<label>${passager.adresse.numero}</label>
			</div>
			<div class="form-group">
				<label>${passager.adresse.rue}</label>
			</div>
			<div class="form-group">
				<label>${passager.adresse.codePostal}</label>
			</div>
			<div class="form-group">
				<label>${passager.adresse.ville}</label>
			</div>
			<div>
				<button class="btn btn-success" type="submit">enregistrer</button>
				<a href="list" class="btn btn-warning">annuler</a>
			</div>
		</form>
		<c:when test="${action=='edit'}"></c:when>
		<form:form action="action?m=savePassager" method="post"
			modelAttribute="passager">
			<div class="form-group">
				<form:label path="prenom">code</form:label>
				<form:input path="prenom" cssClass="form-control" />
				<form:errors path="prenom"></form:errors>
			</div>
			<div class="form-group">
				<form:label path="nom">ram</form:label>
				<form:input path="nom" cssClass="form-control" />
			</div>
			<div class="form-group">
				<form:label path="adresse.numero">numero</form:label>
				<form:input type="number" path="adresse.numero"
					cssClass="form-control" />
			</div>
			<div class="form-group">
				<form:label path="adresse.rue">rue</form:label>
				<form:input path="adresse.rue" cssClass="form-control" />
			</div>
			<div class="form-group">
				<form:label path="adresse.codePostal">code postal</form:label>
				<form:input path="adresse.codePostal" cssClass="form-control" />
			</div>
			<div class="form-group">
				<form:label path="adresse.ville">ville</form:label>
				<form:input path="adresse.ville" cssClass="form-control" />
			</div>
			<div>
				<button class="btn btn-success" type="submit">enregistrer</button>
				<a href="list" class="btn btn-warning">annuler</a>
			</div>
		</form:form>
	</c:choose>
</body>
</html>