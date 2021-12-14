<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed-center">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img class="img-responsive"
				src="https://i.ibb.co/ggPpVRM/minimapa.png" /> <strong>Tierra
					Media</strong>
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Inicio</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/TierraMediaWebapp/views/atraccionesAdmin.do">Reservas</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Itinerario</a>
					</li>
				</ul>
			</div>
			<c:choose>
				<c:when test="${usuario == null}">
					<ul class="navbar-nav justify-content-end mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="/TierraMediaWebapp/views/login.jsp">Iniciar
								sesión</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="navbar-nav justify-content-end mb-2 mb-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<c:out value="${usuario.nombre}"></c:out>
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item disabled" style="color: black;">
										<i class="fas fa-coins" style="color: gold;"></i> <c:out
											value="${usuario.presupuesto}"></c:out>
								</a></li>
								<li><a class="dropdown-item disabled" style="color: black;">
										<i class="fas fa-user-clock" style="color: gold;"></i> <c:out
											value="${usuario.tiempoDisponible} hs"></c:out>
								</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item"
									href="/TierraMediaWebapp/views/logout">Cerrar sesión</a></li>
							</ul></li>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>

</header>