<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%><!-- Ici on ajoute les balises java -->
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%><!-- Balise de formatage-->
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%><!-- internalisationn des langages-->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des vols</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body class="container">
			<h1>Vos vols</h1>
	

	<table class="table" >
		<tr>
			<th>Numéro de vol</th>
			<th>Heure départ</th>
			<th>Aéroport départ</th>
			<th>Escale 1 arrivée</th>
			<th>Escale 1 reprise</th>
			<th>heure arrivée</th>
			<th>aéroport arrivé</th>
		</tr>
		<c:forEach var="v" items="${vols}">
		<tr>
			<td>${v.id}</td>
			<td><fmt:formatDate value="${v.heureDepart}"pattern="dd/MM/yyyy hh:mm"/></td>
			<td>${v.depart}</td>
			<td>${v.escales.heureArrivee}</td>
			<td>${v.escales.heureDepart}</td>
			<td>${v.heureArrivee}</td>
			<td>${v.arrivee}</td>
			<td><fmt:formatDate value="${p.dataNaissance}" pattern="dd/MM/yyyy"/></td>
			<td><a class="btn btn-warning" href="edit?id=${p.id}">modifier</a></td><!-- On explique vouloir editer et sur qui  -->
			<td><a class="btn btn-danger" href="delete?id=${p.id}">supprimer</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>