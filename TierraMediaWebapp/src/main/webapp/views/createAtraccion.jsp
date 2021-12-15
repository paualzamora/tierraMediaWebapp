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
		<c:if test="${atraccion != null && !atraccion.isValid()}">
			<div class="alert alert-danger">
				<p>Se encontraron errores al crear la atracción.</p>
			</div>
		</c:if>
		<!-- Formulario para crear atracción -->
		<div class="container my-5">
			<form action="/TierraMediaWebapp/views/createAtraccion.do"
				method="post" class="d-flex flex-column text-light p-2"
				id="formularioAtraccion">
				<input type="hidden" name="id" value="${atraccion.id}">
				<div class="mb-3">
					<label for="nombre" class="form-label">Nombre</label> <input
						placeholder="Ingrese un nombre" type="text" class="form-control"
						required id="nombre" name="nombre" aria-describedby="emailHelp"
						value="${atraccion.nombre}">
				</div>
				<div class="mb-3">
					<label for="tipo" class="form-label">Tipo de atracción</label> <input
						placeholder="Ingrese el tipo de atracción" type="text"
						class="form-control" required id="tipo" name="tipo"
						aria-describedby="emailHelp" value="${atraccion.tipo}">
				</div>
				<div class="mb-3">
					<label for="costo" class="form-label">Costo</label> <input
						type="number" step="0.5" min=1 required class="form-control"
						id="costo" name="costo" value="${atraccion.costo}">
				</div>
				<div class="mb-3">
					<label for="tiempo" class="form-label">Tiempo</label> <input
						type="number" step="0.5" min=0,5 class="form-control" required
						id="tiempo" name="tiempo" value="${atraccion.tiempo}">
				</div>
				<div class="mb-3">
					<label for="cupo" class="form-label">Cupo</label> <input
						type="number" step="1" min=1 class="form-control" required
						id="cupo" name="cupo" value="${atraccion.cupo}">
				</div>

				<button type="submit" class="btn mx-2">Crear atraccion</button>
			</form>
		</div>
	</main>

	<!-- Pie de página -->
	<jsp:include page="../partials/footerAdmin.jsp"></jsp:include>
</body>