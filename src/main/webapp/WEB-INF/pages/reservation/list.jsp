<%@page import="model.Reservation"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>réservation</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body class="container">
	<h1>Liste des réservations</h1>
	<div>
		<a href="add" class="btn btn-link">Ajouter une réservation</a>
	</div>
	<table class="table">
		<tr>
			<th>id</th>
			<th>date</th>
			<th>numéro de la réservation</th>
			<!-- <th>prénom</th> -->
			<th>passager</th>
			<th>id vol</th>
			<th></th>
			<th></th>
			
		</tr>
		<c:forEach var="r" items="${reservations}">
			<tr>
				<td>${r.id}</td>
				<td><fmt:formatDate value="${r.date}"
						pattern="dd/MM/yyyy" /></td>
				<td>${r.numero}</td>
				<td><a href="detailPassager?id=${r.id}">${r.passager.prenom}&nbsp;${r.passager.nom }</a></td>
				
				<td>${r.vol.id}</td>
				
				
				<td><a class="btn btn-info"
					href="edit?id=${r.id}">modifier</a></td>
				<td><a class="btn btn-danger"
					href="delete?id=${r.id}">supprimer</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>