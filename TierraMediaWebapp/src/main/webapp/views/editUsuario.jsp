<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../partials/headAdmin.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../partials/navbarAdmin.jsp"></jsp:include>
	<main class="container">
		<c:if test="${usuario != null && !usuario.isValid()}">
			<div class="alert alert-danger">
				<p>Se encontraron errores al editar el usuario.</p>
			</div>
		</c:if>
		<!-- Formulario para crear atracción -->
		<div class="container my-5">
			<form action="/TierraMediaWebapp/views/createUsuario.do"
				method="post" class="d-flex flex-column text-light p-2"
				id="formularioUsuario">
				<input type="hidden" name="id" value="${usuario.id}">
				<div class="mb-3">
					<label for="nombre" class="form-label">Nombre</label> <input
						placeholder="Ingrese un nombre" type="text" class="form-control"
						required id="nombre" aria-describedby="emailHelp"
						value="${usuario.nombre}">
				</div>
				<div class="mb-3">
					<label for="username" class="form-label">Username</label> <input
						placeholder="Ingrese un nombre de usuario" type="text"
						class="form-control" required id="username"
						aria-describedby="emailHelp" value="${usuario.username}">
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Contraseña</label> <input
						placeholder="Ingrese una contraseña" type="password"
						class="form-control" required id="password"
						aria-describedby="emailHelp" value="${usuario.password}">
				</div>
				<div class="mb-3">
					<label for="tipoDeAtraccionPreferido" class="form-label">Tipo de
						atracción preferido</label> <input
						placeholder="Ingrese el tipo de atracción preferido" type="text"
						class="form-control" required id="tipoDeAtraccionPreferido"
						aria-describedby="emailHelp" value="${usuario.tipoDeAtraccionPreferido}">
				</div>
				<div class="mb-3">
					<label for="presupuesto" class="form-label">Presupuesto</label> <input
						type="number" step="0.5" min=1 required class="form-control"
						id="presupuesto" value="${usuario.presupuesto}">
				</div>
				<div class="mb-3">
					<label for="tiempoDisponible" class="form-label">Tiempo disponible</label> <input
						type="number" step="0.5" min=0,5 class="form-control" required
						id="tiempoDisponible" value="${usuario.tiempoDisponible}">
				</div>
				<div class="form-check form-switch">
					<input class="form-check-input" <c:if test="${usuario.isAdmin()}">checked=checked</c:if> type="checkbox" id="admin" value="${usuario.isAdmin()}">
					<label class="form-check-label" for="admin">Admin</label>
				</div>

				<button type="submit" class="btn mx-2">Crear usuario</button>
			</form>
		</div>
	</main>

	<!-- Pie de página -->
	<jsp:include page="../partials/footerAdmin.jsp"></jsp:include>
</body>