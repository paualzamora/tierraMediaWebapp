<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../partials/headAdmin.jsp"></jsp:include>
<title>Usuarios | Turismo en la Tierra Media</title>
<!-- Script Datatables -->
<script>
	$(document)
			.ready(
					function() {
						$('#tablaUsuarios')
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

		<section id="usuarios">
			<h2>
				<b>Usuarios</b>
			</h2>
			<c:if test="${usuario.isAdmin()}">
				<!-- Botón para crear usuario -->
				<div class="d-flex justify-content-center" id="nuevoUsuario">
					<button class="btn mx-2" type="button" data-bs-toggle="offcanvas"
						data-bs-target="#offcanvasFormulario"
						aria-controls="offcanvasFormulario">Nuevo usuario</button>
				</div>
			</c:if>
			<!-- Offcanvas para crear usuario -->
			<div class="offcanvas offcanvas-start" tabindex="-1"
				id="offcanvasFormulario" aria-labelledby="offcanvasFormularioLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasFormularioLabel">Offcanvas
						con backdrop</h5>
					<button type="button" class="btn-close text-reset"
						data-bs-dismiss="offcanvas" aria-label="Cerrar"></button>
				</div>
				<div class="offcanvas-body">
					<!-- Formulario para crear usuario-->
					<div class="container my-5">
						<form action="usuariosAdmin.html" method="get"
							class="d-flex flex-column text-light p-2"
							id="formularioAtraccion">
							<div class="mb-3">
								<label for="nombre" class="form-label">Nombre</label> <input
									placeholder="Ingrese un nombre" type="text"
									class="form-control" required id="nombre"
									aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="tipo" class="form-label">Tipo de atracción
									preferido</label> <select class="form-select form-select-lg mb-3"
									aria-label=".form-select-lg example" required id="tipo">
									<option selected value="1">AVENTURA</option>
									<option value="2">DEGUSTACION</option>
									<option value="3">PAISAJE</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="costo" class="form-label">Presupuesto</label> <input
									type="number" step="0.5" min=1 required class="form-control"
									id="costo">
							</div>
							<div class="mb-3">
								<label for="tiempo" class="form-label">Tiempo disponible</label>
								<input type="number" step="0.5" min=0,5 class="form-control"
									required id="tiempo">
							</div>

							<button type="submit" class="btn mx-2">Crear usuario</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Tabla de usuarios -->
			<div class="container table-responsive mt-1">
				<table class="table table-light table-striped table-hover"
					id="tablaUsuarios" class="display">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nombre</th>
							<th scope="col">Username</th>
							<th scope="col">Tipo de atracción preferido</th>
							<th scope="col">Presupuesto</th>
							<th scope="col">Tiempo disponible</th>
							<th scope="col">Permisos</th>
							<c:if test="${usuario.isAdmin()}"><th scope="col">Acciones</th></c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${usuarios}" var="tmp_usuario">
							<tr>
								<td><c:out value="${tmp_usuario.getId()}"></c:out></td>
								<td><c:out value="${tmp_usuario.getNombre()}"></c:out></td>
								<td><c:out value="${tmp_usuario.getUsername()}"></c:out></td>
								<td><c:out
										value="${tmp_usuario.getTipoDeAtraccionPreferido()}"></c:out></td>
								<td><c:out value="${tmp_usuario.getPresupuesto()}"></c:out></td>
								<td><c:out value="${tmp_usuario.getTiempoDisponible()}"></c:out></td>
								<td><c:choose>
										<c:when test="${tmp_usuario.isAdmin()}">
									Admin
								</c:when>
										<c:otherwise>
									Usuario
								</c:otherwise>
									</c:choose></td>
								<td><c:if
										test="${usuario.isAdmin() && (!tmp_usuario.isAdmin() || tmp_usuario.id == usuario.id)}">
										<a href="/turismo/usuarios/edit.do?id=${tmp_usuario.id}"
											class="btn btn-primary rounded-0" role="button"><i
											class="far fa-edit"></i></a>
										<a href="/turismo/usuarios/delete.do?id=${tmp_usuario.id}"
											class="btn btn-danger rounded" role="button"><i
											class="far fa-trash-alt"></i></a>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nombre</th>
							<th scope="col">Username</th>
							<th scope="col">Tipo de atracción preferido</th>
							<th scope="col">Presupuesto</th>
							<th scope="col">Tiempo disponible</th>
							<th scope="col">Permisos</th>
							<c:if test="${usuario.isAdmin()}"><th scope="col">Acciones</th></c:if>
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