<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../partials/headAdmin.jsp"></jsp:include>
<title>Atracciones | Turismo en la Tierra Media</title>
<!-- Script Datatables -->
<script>
	$(document)
			.ready(
					function() {
						$('#tablaAtracciones')
								.DataTable(
										{
											"language" : {
												"url" : "https://cdn.datatables.net/plug-ins/1.11.3/i18n/es-mx.json"
											}
										});
					});
</script>
</head>

<body>
	<!-- Navbar -->
	<jsp:include page="../partials/navbarAdmin.jsp"></jsp:include>

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

		<section id="atracciones">
			<h2>
				<b>Atracciones</b>
			</h2>
			<c:if test="${usuario.isAdmin()}">
				<!-- Botón para crear atracción -->
				<div class="d-flex justify-content-center" id="nuevaAtraccion">
					<a href="/TierraMediaWebapp/views/createAtraccion.do"
						class="btn mx-2" role="button">Nueva atracción</a>
				</div>
			</c:if>
			<!-- Tabla de atracciones -->
			<div class="container table-responsive mt-1">
				<table class="table table-light table-striped table-hover"
					id="tablaAtracciones" class="display">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nombre</th>
							<th scope="col">Tipo</th>
							<th scope="col">Costo</th>
							<th scope="col">Tiempo</th>
							<th scope="col">Cupo</th>
							<th scope="col">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${atracciones}" var="atraccion">
							<tr>
								<td><c:out value="${atraccion.getId()}"></c:out></td>
								<td><strong><c:out value="${atraccion.nombre}"></c:out></strong></td>
								<td><c:out value="${atraccion.getTipoDeAtraccion()}"></c:out></td>
								<td><c:out value="${atraccion.getCosto()}"></c:out></td>
								<td><c:out value="${atraccion.getTiempo()}"></c:out></td>
								<td><c:out value="${atraccion.getCupoMaximo()}"></c:out></td>

								<td><c:if test="${usuario.isAdmin()}">
										<a
											href="/TierraMediaWebapp/views/editAtraccion.do?id=${atraccion.id}"
											class="btn btn-primary rounded" role="button"><i
											class="far fa-edit"></i></a>
										<a
											href="/TierraMediaWebapp/views/borrarAtraccion.do?id=${atraccion.id}"
											class="btn btn-danger rounded" role="button"><i
											class="far fa-trash-alt"></i></a>
									</c:if> <c:choose>
										<c:when
											test="${usuario.puedeComprar(atraccion) && atraccion.hayCupo()}">
											<a href="/TierraMediaWebapp/views/buy.do?id=${atraccion.id}"
												class="btn btn-success rounded" role="button">Comprar</a>
										</c:when>
										<c:otherwise>
											<a href="#" class="btn btn-secondary rounded disabled"
												role="button">Comprar</a>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nombre</th>
							<th scope="col">Tipo</th>
							<th scope="col">Costo</th>
							<th scope="col">Tiempo</th>
							<th scope="col">Cupo</th>
							<th scope="col">Acciones</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</section>
	</main>

	<!-- Pie de página -->
	<jsp:include page="../partials/footerAdmin.jsp"></jsp:include>
</body>

</html>