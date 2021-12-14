<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="offcanvas offcanvas-start" tabindex="-1"
	id="offcanvasFormulario" aria-labelledby="offcanvasFormularioLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasFormularioLabel">Offcanvas
			con backdrop</h5>
		<button type="button" class="btn-close text-reset"
			data-bs-dismiss="offcanvas" aria-label="Cerrar"></button>
	</div>
	<div class="offcanvas-body">
		<c:if test="${atraccion != null && !atraccion.isValid()}">
			<div class="alert alert-danger">
				<p>Se encontraron errores al crear la atracción.</p>
			</div>
		</c:if>
		<!-- Formulario para crear atracción -->
		<div class="container my-5">
			<form action="/TierraMediaWebapp/views/createAtraccion.do" method="post"
				class="d-flex flex-column text-light p-2" id="formularioAtraccion">
				<div class="mb-3">
					<label for="nombre" class="form-label">Nombre</label> <input
						placeholder="Ingrese un nombre" type="text" class="form-control"
						required id="nombre" aria-describedby="emailHelp"
						value="${atraccion.nombre}">
				</div>
				<div class="mb-3">
					<label for="tipo" class="form-label">Tipo de atracción</label> <input
						placeholder="Ingrese el tipo de atracción" type="text"
						class="form-control" required id="tipo"
						aria-describedby="emailHelp" value="${atraccion.tipo}">
				</div>
				<div class="mb-3">
					<label for="costo" class="form-label">Costo</label> <input
						type="number" step="0.5" min=1 required class="form-control"
						id="costo" value="${atraccion.costo}">
				</div>
				<div class="mb-3">
					<label for="tiempo" class="form-label">Tiempo</label> <input
						type="number" step="0.5" min=0,5 class="form-control" required
						id="tiempo" value="${atraccion.tiempo}">
				</div>
				<div class="mb-3">
					<label for="cupo" class="form-label">Cupo</label> <input
						type="number" step="1" min=1 class="form-control" required
						id="cupo" value="${atraccion.cupo}">
				</div>

				<button type="submit" class="btn mx-2">Crear atraccion</button>
			</form>
		</div>
	</div>
</div>