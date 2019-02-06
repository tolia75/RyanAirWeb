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
	
<br><br><br><br>
		<a type="btn btn-info" href="add">Créer un vol</a>
<br><br><br><br>
	<table class="table" >
		<tr>
			<th>Numéro de vol</th>
			<th>Date de départ</th>
			<th>Heure départ</th>
			<th>Aéroport départ</th>
			<th></th>
			<th>Escale 1 arrivée</th>
			<th>Escale 1 reprise</th>
			<th>Escale 1 aeroport</th>
			<th></th>
			<th>Date d'arrivée</th>
			<th>heure arrivée</th>
			<th>aéroport arrivé</th>
		</tr>
		<c:forEach var="v" items="${vols1}">
		<tr>
			<td>${v.id}</td>
			<td><fmt:formatDate value="${v.dateDepart}" pattern="dd/MM/yyyy"/></td>
			<td><fmt:formatDate value="${v.heureDepart}" pattern="hh:mm"/></td>
			<td>${v.depart.nom}</td>
			<td><a class="btn btn-warning" href="editdepart?id=${v.id}" id="btn1">modifier départ</a></td>
 	 			<c:choose>
 	 			<c:when test="${v.escales.isEmpty()}">
 	 			<td></td><td></td><td></td><td></td>
 	 			</c:when>
 	 			<c:otherwise>
 	 			 <c:forEach var="e" items="${v.escales}">			  
					<td><fmt:formatDate value="${e.heureArrivee}" pattern="hh:mm:ss"/></td>
					<td><fmt:formatDate value="${e.heureDepart}" pattern="hh:mm:ss"/></td>
					<td>${e.key.aeroport.nom}</td>  
					<td><a class="btn btn-warning" href="editscale?id=${e.key}" id="btn2">modifier escale</a></td>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			<td><fmt:formatDate value="${v.dateArrivee}" pattern="dd/MM/yyyy"/></td>
			<td><fmt:formatDate value="${v.heureArrivee}" pattern="hh:mm"/></td>
			<td>${v.arrivee.nom}</td>
			<td><a class="btn btn-warning" href="editarrivee?id=${v.id}" id="btn3">modifier arrivée</a></td><!-- On explique vouloir editer et sur qui  -->
			<td></td><td></td><td></td><td></td><td></td>
			<td><a class="btn btn-danger" href="delete?id=${v.id}">supprimer</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>