<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../partials/headAdmin.jsp"></jsp:include>
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
	<jsp:include page="../../partials/navbarAdmin.jsp"></jsp:include>

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
					<button class="btn mx-2" type="button" data-bs-toggle="offcanvas"
						data-bs-target="#offcanvasFormulario"
						aria-controls="offcanvasFormulario">Nueva atracción</button>
				</div>
			</c:if>

			<!-- Offcanvas para crear atracción -->
			<div class="offcanvas offcanvas-start" tabindex="-1"
				id="offcanvasFormulario" aria-labelledby="offcanvasFormularioLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasFormularioLabel">Offcanvas
						con backdrop</h5>
					<button type="button" class="btn-close text-reset"
						data-bs-dismiss="offcanvas" aria-label="Cerrar"></button>
				</div>
				<div class="offcanvas-body">
					<!-- Formulario para crear atracción -->
					<div class="container my-5">
						<form action="atraccionesAdmin.html" method="get"
							class="d-flex flex-column text-light p-2"
							id="formularioAtraccion">
							<div class="mb-3">
								<label for="nombre" class="form-label">Nombre</label> <input
									placeholder="Ingrese un nombre" type="text"
									class="form-control" required id="nombre"
									aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="tipo" class="form-label">Tipo</label> <select
									class="form-select form-select-lg mb-3"
									aria-label=".form-select-lg example" required id="tipo">
									<option selected value="1">AVENTURA</option>
									<option value="2">DEGUSTACION</option>
									<option value="3">PAISAJE</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="costoo" class="form-label">Costo</label> <input
									type="number" step="0.5" min=1 required class="form-control"
									id="costoo">
							</div>
							<div class="mb-3">
								<label for="tiempo" class="form-label">Tiempo</label> <input
									type="number" step="0.5" min=0,5 class="form-control" required
									id="tiempo">
							</div>
							<div class="mb-3">
								<label for="cupo" class="form-label">Cupo</label> <input
									type="number" step="1" min=1 class="form-control" required
									id="cupo">
							</div>

							<button type="submit" class="btn mx-2">Crear atraccion</button>
						</form>
					</div>
				</div>
			</div>

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
										<a href="/turismo/atraccions/edit.do?id=${atraccion.id}"
											class="btn btn-primary rounded-0" role="button"><i
											class="far fa-edit"></i></a>
										<a href="/turismo/atraccions/delete.do?id=${atraccion.id}"
											class="btn btn-danger rounded" role="button"><i
											class="far fa-trash-alt"></i></a>
									</c:if> <c:choose>
										<c:when
											test="${usuario.puedeComprar(atraccion) && atraccion.hayCupo()}">
											<a href="/TierraMediaWebapp/views/admin/buy.do?id=${atraccion.id}"
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
	<jsp:include page="../../partials/footerAdmin.jsp"></jsp:include>
</body>

</html>