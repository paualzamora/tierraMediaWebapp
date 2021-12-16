<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="../partials/head.jsp"></jsp:include>
<title>Itinerario | Turismo en la Tierra Media</title>
</head>

<body>
	<!-- Navbar -->
	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	<main>
		<c:if test="${flash != null}">
			<div class="alert alert-danger">
				<p>
					<c:out value="${flash}" />
					<c:if test="${errores != null}">
						<ul>
							<c:forEach items="${errores}" var="entry">
								<li><c:out value="${entry.getValue()}"></c:out></li>
							</c:forEach>
						</ul>
					</c:if>
				</p>
			</div>
		</c:if>
		<!-- Itinerario -->
		<section id="itinerario">
			<div class="container-lg">
				<h2>
					<b>Tu itinerario</b>
				</h2>
				<c:out value="${usuario.getItinerarioString()}"></c:out>
				<!-- <c:forEach items="${usuario.itinerario}"
				var="atraccionItinerario">
				<tr>
					<td><c:out value="${tmp_usuario.getId()}"></c:out></td>
					<td><c:out value="${tmp_usuario.getNombre()}"></c:out></td>
					<td><c:out value="${tmp_usuario.getUsername()}"></c:out></td>
					<td><c:out
							value="${tmp_usuario.getTipoDeAtraccionPreferido()}"></c:out></td>
					<td><c:out value="${tmp_usuario.getPresupuesto()}"></c:out></td>
					<td><c:out value="${tmp_usuario.getTiempoDisponible()}"></c:out></td>
			</c:forEach> -->
			</div>
		</section>
	</main>

	<!-- Pie de página -->
	<jsp:include page="../partials/footer.jsp"></jsp:include>
</body>