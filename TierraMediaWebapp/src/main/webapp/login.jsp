<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="partials/head.jsp"></jsp:include>
<title>Iniciar sesión | Turismo en la Tierra Media</title>
</head>
<body>
	<main>
		<div class="col-lg-12 mx-auto p-3 py-md-5">

			<div id="titulo">
				<img src="https://i.ibb.co/PZbyspc/mapita.png" alt="logo">
				<h1 style="text-align: center">Tierra Media</h1>
			</div>
			<p style="text-align: center">Por favor, inicie sesión para
				continuar.</p>

			<c:if test="${flash != null}">
				<div class="alert alert-danger">
					<p>
						<c:out value="${flash}" />
					</p>
				</div>
			</c:if>

			<form action="login" method="post">

				<div class="mb-3">
					<label for="username" class="form-label">Usuario</label> <input
						class="form-control" name="username">
				</div>

				<div class="mb-3">
					<label for="password" class="form-label">Contraseña</label> <input
						type="password" class="form-control" name="password">
				</div>

				<div class="d-grid gap-2">
					<button type="submit" class="btn btn-lg btn-outline-dark"
						id="loginbtn">Ingresar</button>
				</div>
			</form>
		</div>
	</main>
	<!-- Pie de página -->
	<jsp:include page="partials/footer.jsp"></jsp:include>
</body>
</html>