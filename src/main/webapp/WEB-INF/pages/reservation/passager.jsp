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
		<c:when test="${action=='detail'}">
			<form:form action="editPassager" method="post"
				modelAttribute="passager">
				<table class="table">
					<tr>
						<th>id</th>
						<th>prenom</th>
						<th>nom</th>
						<th>pays</th>
						<th>rue</th>
						<th>code postal</th>
						<th>ville</th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td><div class="form-group">
								<form:label path="id">${passager.id}</form:label>
								<form:hidden path="id" />
							</div></td>
						<td><div class="form-group">
								<label>${passager.prenom}</label>
								<form:hidden path="prenom" />
							</div></td>
						<td><div class="form-group">
								<label>${passager.nom}</label>
								<form:hidden path="nom" />
							</div></td>
						<td><div class="form-group">
								<label>${passager.adresse.pays}</label>
								<form:hidden path="adresse.pays" />
							</div></td>
						<td><div class="form-group">
								<label>${passager.adresse.rue}</label>
								<form:hidden path="adresse.rue" />
							</div>
						<td><div class="form-group">
								<label>${passager.adresse.codePostal}</label>
								<form:hidden path="adresse.codePostal" />
							</div></td>
						<td><div class="form-group">
								<label>${passager.adresse.ville}</label>
								<form:hidden path="adresse.ville" />
							</div></td>
						<td><div>
								<button class="btn btn-success" type="submit">modifier</button>
								<a href="list" class="btn btn-warning">annuler</a>
							</div></td>
					</tr>
				</table>
			</form:form>
		</c:when>
		<c:when test="${action=='edit'}">
			<form:form action="savePassager" method="post"
				modelAttribute="passager">
				<div class="form-group">
					<form:label path="id">id</form:label>
					<form:input path="id" cssClass="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<form:label path="prenom">prenom</form:label>
					<form:input path="prenom" cssClass="form-control" />
					<form:errors path="prenom"></form:errors>
				</div>
				<div class="form-group">
					<form:label path="nom">nom</form:label>
					<form:input path="nom" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="adresse.pays">pays</form:label>
					<form:input type="text" path="adresse.pays" cssClass="form-control" />
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
		</c:when>
	</c:choose>
</body>
</html>