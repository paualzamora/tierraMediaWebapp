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
					<a href="/TierraMediaWebapp/views/createUsuario.do"
						class="btn mx-2" role="button">Nuevo usuario</a>
				</div>
			</c:if>

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
										test="${usuario.isAdmin()&& (!tmp_usuario.isAdmin() || tmp_usuario.id == usuario.id)}">
										<a href="/TierraMediaWebapp/views/editUsuario.do?id=${tmp_usuario.id}"
											class="btn btn-primary rounded" role="button"><i
											class="far fa-edit"></i></a>
										<a href="/TierraMediaWebapp/views/borrarUsuario.do?id=${tmp_usuario.id}"
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