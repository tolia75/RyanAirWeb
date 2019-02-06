<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Changer votre vol</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body class="container">
	<h1>edition</h1>
	
	<c:choose>
		<c:when test="${i==1}">	
		<c:url value ="savedepart" var="action"></c:url>
			<form:form method="get" modelAttribute="vol" action ="${action}">
				<form:hidden path="version"/> 
					<div class="form-group">
						<form:label path="id">identifiant</form:label>
						<form:input path="id" cssClass="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<form:label path="depart">Aeroport : </form:label>
						<form:select path="depart" cssClass="form-control">
							<form:option value="">Pas d'aéroport</form:option>
							<form:options items="${aeroports}" itemLabel="nom" ></form:options>
						</form:select>
					</div>
					<div class="form-group">
						<form:label path="dateDepart">Date de départ : </form:label>
						<form:input path="dateDepart" cssClass="form-control" type="date"/>
					</div>
					<div class="form-group">
						<form:label path="heureDepart">Heure de départ : </form:label>
						<form:input path="heureDepart" cssClass="form-control" type="time"/>
					</div>
			<div>
				<button class ="btn btn-success" type="submit">enregistrer</button>
				<a class ="btn btn-warning" href="list">annuler</a>
			</div>
				</form:form>
 			
		</c:when>
		<c:when test="${i==2}">
			<c:url value ="saveescale" var="action"></c:url>
			<form:form method="get" modelAttribute="vol" action ="${action}">
				<form:hidden path="version"/> 
				<c:forEach var="e" items="${escales}"> 
					<div class="form-group">
						<form:label path="id">identifiant</form:label>
						<form:input path="id" cssClass="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<form:label path="${v.e.key.aeroport}">Aeroport : </form:label>
						<form:select path="${v.e.key.aeroport}" cssClass="form-control" items="${aeroport}"/>
					</div>
					<div class="form-group">
						<form:label path="${v.e.heureDepart}">Heure de départ : </form:label>
						<form:input path="${v.e.heureDepart}" cssClass="form-control" type="date"/>
					</div>
						<div class="form-group">
						<form:label path="${v.e.heureArrivee}">Heure d'arrivée : </form:label>
						<form:input path="${v.e.heureArrivee}" cssClass="form-control" type="date"/>
					</div>
					</c:forEach>
			<div>
				<button class ="btn btn-success" type="submit">enregistrer</button>
				<a class ="btn btn-warning" href="list">annuler</a>
			</div> 
				</form:form>
			
			
		</c:when>
		<c:when test="${i==3}">
			<c:url value ="savearrivee" var="action"></c:url>
			<form:form method="get" modelAttribute="vol" action ="${action}">
				<form:hidden path="version"/> 
					<div class="form-group">
						<form:label path="id">identifiant</form:label>
						<form:input path="id" cssClass="form-control" readonly="true"/>
						<form:errors path="id"></form:errors>
					</div>
						<form:label path="arrivee">Aeroport : </form:label>
						<form:select path="arrivee" cssClass="form-control">
							<form:option value="">Pas d'aéroport</form:option>
							<form:options items="${aeroports}" itemLabel="nom" itemValue="arrivee"></form:options>
						</form:select>
					<div class="form-group">
						<form:label path="dateArrivee">Date d'arrivée : </form:label>
						<form:input path="dateArrivee" cssClass="form-control" type="date"/>
						<form:errors path="dateArrivee"></form:errors>
					</div>
					<div class="form-group">
						<form:label path="heureArrivee">Heure d'arrivée : </form:label>
						<form:input path="heureArrivee" cssClass="form-control" type="time"/>
						<form:errors path="heureArrivee"></form:errors>
					</div>
			<div>
				<button class ="btn btn-success" type="submit">enregistrer</button>
				<a class ="btn btn-warning" href="list">annuler</a>
			</div> 
				</form:form>

		</c:when>
		<c:otherwise>
			<c:url value ="save" var="action"></c:url>
			<form:form method="get" modelAttribute="vol" action ="${action}">
				<form:hidden path="version"/> 
					<div class="form-group">
						<form:label path="id">identifiant</form:label>
						<form:input path="id" cssClass="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<form:label path="depart">Aeroport de départ: </form:label>
						<form:select path="depart" cssClass="form-control">
							<form:option value="">Pas d'aéroport</form:option>
							<form:options items="${aeroports}" itemLabel="nom"></form:options>
						</form:select>
					</div>
					<div class="form-group">
						<form:label path="dateDepart">Date de départ : </form:label>
						<form:input path="dateDepart" cssClass="form-control" type="date"/>
					</div>
					<div class="form-group">
						<form:label path="heureDepart">Heure de départ : </form:label>
						<form:input path="heureDepart" cssClass="form-control" type="time"/>
					</div>
					<div class="form-group">
						<form:label path="${v.e.key.aeroport}">Aeroport  d'escale: </form:label>
						<form:select path="${v.e.key.aeroport}" cssClass="form-control">
							<form:option value="">Pas d'aéroport</form:option>
							<form:options items="${aeroports}" itemLabel="nom"></form:options>
						</form:select>
					</div>
					<div class="form-group">
						<form:label path="${v.e.heureArrivee}">Heure d'arrivée d'escale: </form:label>
						<form:input path="${v.e.heureArrivee}" cssClass="form-control" type="date"/>
					</div>
					<div class="form-group">
						<form:label path="${v.e.heureDepart}">Heure de départ d'escale: </form:label>
						<form:input path="${v.e.heureDepart}" cssClass="form-control" type="date"/>
					</div>
					<div class="form-group">
						<form:label path="dateArrivee">Date d'arrivée : </form:label>
						<form:input path="dateArrivee" cssClass="form-control" type="date"/>
					</div>
					<div class="form-group">
						<form:label path="heureArrivee">Heure d'arrivée : </form:label>
						<form:input path="heureArrivee" cssClass="form-control" type="time"/>
					</div>
					<div class="form-group">
						<form:label path="arrivee">Aeroport d'arrivée: </form:label>
						<form:select path="arrivee" cssClass="form-control">
							<form:option value="">Pas d'aéroport</form:option>
							<form:options items="${aeroports}" itemLabel="nom"></form:options>
						</form:select>
					</div>
					 			<div>
				<button class ="btn btn-success" type="submit">enregistrer</button>
				<a class ="btn btn-warning" href="list">annuler</a>
			</div>
				</form:form>

		</c:otherwise>
	</c:choose>	

</html>

