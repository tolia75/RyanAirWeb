<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>édition réservation</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body class="container">
	<h1>édition réservation</h1>
	
		<form:form method="post" action="save" modelAttribute="reservation">
		
			<div class="form-group">
				<form:label path="id">identifiant</form:label>
				<form:input path="id" cssClass="form-control" readonly="true" />	
			</div>	
			<div class="form-group">
				<form:label path="date">date</form:label>
				<form:input type="date" path="date" cssClass="form-control"/>	
				
			</div>
			<div class="form-group">
				<form:label path="numero">numero</form:label>
				<form:input type="number" path="numero" cssClass="form-control"/>	
				
			</div>
			<div class="form-group">
				<form:label path="passager.id">id passager</form:label>
				<form:input path="passager.id" cssClass="form-control" readonly="true" />	
			</div>
			<div class="form-group">
				<form:label path="passager.prenom">prenom</form:label>
				<form:input path="passager.prenom" cssClass="form-control"/>	
			
			</div>	
			<div class="form-group">
				<form:label path="passager.nom">nom</form:label>
				<form:input path="passager.nom" cssClass="form-control"/>	
			
			</div>
			<div class="form-group">
				<form:label path="vol.id">id vol</form:label>
				<form:input path="vol.id" cssClass="form-control" readonly="true"/>	
			</div>
			
			<div class="form-group">
				<button class="btn btn-success" type="submit">enregistrer</button>
				<a href="list" class="btn btn-warning">annuler</a>
			</div>		
		</form:form>

</body>
</html>