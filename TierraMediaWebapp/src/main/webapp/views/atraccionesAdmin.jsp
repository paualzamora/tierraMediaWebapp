<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="../partials/headAdmin.jsp"></jsp:include>
<title>Atracciones | Turismo en la Tierra Media</title>
</head>

<body>
	<!-- Navbar -->
	<jsp:include page="../partials/navbarAdmin.jsp"></jsp:include>

	<main>
		<section id="atracciones">
			<h2>
				<b>Atracciones</b>
			</h2>
			<!-- Botón para crear atracción -->
			<div class="d-flex justify-content-center" id="nuevaAtraccion">
				<button class="btn mx-2" type="button" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasFormulario"
					aria-controls="offcanvasFormulario">Nueva atracción</button>
			</div>

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
								<label for="costo" class="form-label">Costo</label> <input
									type="number" step="0.5" min=1 required class="form-control"
									id="costo">
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
						<tr>
							<th scope="row">1</th>
							<td>Mordor</td>
							<td>AVENTURA</td>
							<td>10</td>
							<td>1</td>
							<td>8</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Minas Ithil</td>
							<td>AVENTURA</td>
							<td>110</td>
							<td>12</td>
							<td>7</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Monte Mindolluin</td>
							<td>AVENTURA</td>
							<td>12</td>
							<td>13</td>
							<td>80</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>La comarca</td>
							<td>DEGUSTACION</td>
							<td>17</td>
							<td>18</td>
							<td>81</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>Entaguas</td>
							<td>DEGUSTACION</td>
							<td>45</td>
							<td>58</td>
							<td>4</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td>Jardines de Isengard</td>
							<td>PAISAJE</td>
							<td>4</td>
							<td>5</td>
							<td>43</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">7</th>
							<td>Senderos de los muertos</td>
							<td>PAISAJE</td>
							<td>55</td>
							<td>57</td>
							<td>40</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">8</th>
							<td>Jardines de Isengard</td>
							<td>PAISAJE</td>
							<td>4</td>
							<td>5</td>
							<td>43</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">9</th>
							<td>Senderos de los muertos</td>
							<td>PAISAJE</td>
							<td>55</td>
							<td>57</td>
							<td>40</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">10</th>
							<td>Jardines de Isengard</td>
							<td>PAISAJE</td>
							<td>4</td>
							<td>5</td>
							<td>43</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">11</th>
							<td>Senderos de los muertos</td>
							<td>PAISAJE</td>
							<td>55</td>
							<td>57</td>
							<td>40</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">12</th>
							<td>Jardines de Isengard</td>
							<td>PAISAJE</td>
							<td>4</td>
							<td>5</td>
							<td>43</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">13</th>
							<td>Senderos de los muertos</td>
							<td>PAISAJE</td>
							<td>55</td>
							<td>57</td>
							<td>40</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">14</th>
							<td>Colina Parda</td>
							<td>PAISAJE</td>
							<td>47</td>
							<td>50</td>
							<td>33</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">15</th>
							<td>Montañas Nubladas</td>
							<td>PAISAJE</td>
							<td>15</td>
							<td>27</td>
							<td>30</td>
							<td>
								<button type="button" class="btn btn-primary mx-2"
									title="Editar">
									<i class="far fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger mx-2"
									title="Eliminar">
									<i class="far fa-trash-alt"></i>
								</button>
							</td>
						</tr>
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