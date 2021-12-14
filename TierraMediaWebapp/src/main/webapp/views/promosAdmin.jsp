<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../partials/headAdmin.jsp"></jsp:include>
<title>Promociones | Turismo en la Tierra Media</title>
    <!-- Script Datatables -->
    <script defer>
        $(document).ready(function () {
            $('#tablaPromociones').DataTable({
                "language": {
                    "url": "https://cdn.datatables.net/plug-ins/1.11.3/i18n/es-mx.json"
                }
            }
            );
        });
    </script>
</head>

<body>
	<!-- Navbar -->
	<jsp:include page="../../partials/navbarAdmin.jsp"></jsp:include>

	<main>
		<section id="promociones">
			<h2>
				<b>Promociones</b>
			</h2>
			<!-- Botón para crear promoción -->
			<div class="d-flex justify-content-center" id="nuevaPromocion">
				<button class="btn mx-2" type="button" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasFormulario"
					aria-controls="offcanvasFormulario">Nueva promoción</button>
			</div>

			<!-- Offcanvas para crear promoción -->
			<div class="offcanvas offcanvas-start" tabindex="-1"
				id="offcanvasFormulario" aria-labelledby="offcanvasFormularioLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasFormularioLabel">Offcanvas
						con backdrop</h5>
					<button type="button" class="btn-close text-reset"
						data-bs-dismiss="offcanvas" aria-label="Cerrar"></button>
				</div>
				<div class="offcanvas-body">
					<!-- Formulario para crear promoción -->
					<div class="container my-5">
						<form action="promosAdmin.html" method="get"
							class="d-flex flex-column text-light p-2"
							id="formularioPromocion">
							<div class="mb-3">
								<label for="nombre" class="form-label">Nombre</label> <input
									placeholder="Ingrese un nombre" type="text"
									class="form-control" required id="nombre"
									aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="tipoPromocion" class="form-label">Tipo de
									promoción</label> <select class="form-select form-select-lg mb-3"
									aria-label=".form-select-lg example" required
									id="tipo Promocion">
									<option selected value="1">AXB</option>
									<option value="2">PORCENTUAL</option>
									<option value="3">ABSOLUTA</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="tipoAtraccion" class="form-label">Tipo de
									atracción</label> <select class="form-select form-select-lg mb-3"
									aria-label=".form-select-lg example" required
									id="tipoAtraccion">
									<option selected value="1">AVENTURA</option>
									<option value="2">DEGUSTACION</option>
									<option value="3">PAISAJE</option>
								</select>
								<div class="mb-3">
									<label for="atraccionesCheckbox" class="form-label">Atracciones
									</label>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="moriaCheck"> <label class="form-check-label"
											for="moriaCheck"> Moria </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="minasTirithCheck"> <label
											class="form-check-label" for="minasTirithCheck">
											Minas Tirith </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="laComarcaCheck"> <label class="form-check-label"
											for="laComarcaCheck"> La Comarca </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="mordorCheck"> <label class="form-check-label"
											for="mordorCheck"> Mordor </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="abismoDeHelmCheck"> <label
											class="form-check-label" for="abismoDeHelmCheck">
											Abismo de Helm </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="lothlorienCheck"> <label class="form-check-label"
											for="lothlorienCheck"> Lothlorien </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="ereborCheck"> <label class="form-check-label"
											for="ereborCheck"> Erebor </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="bosqueNegroCheck"> <label
											class="form-check-label" for="bosqueNegroCheck">
											Bosque Negro </label>
									</div>
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

								<div class="d-flex justify-content-center">
									<button type="submit" class="btn mx-2">Crear atraccion</button>
								</div>
						</form>
					</div>
				</div>
			</div>
			</div>


			<!-- Tabla de promociones -->
			<div class="container table-responsive mt-1">
				<table class="table table-light table-striped table-hover"
					id="tablaPromociones" class="display">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nombre</th>
							<th scope="col">Tipo de promoción</th>
							<th scope="col">Tipo de atracción</th>
							<th scope="col">Atracciones</th>
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
							<td>AXB</td>
							<td>AVENTURA</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>AVENTURA</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>AVENTURA</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>DEGUSTACION</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>DEGUSTACION</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>PAISAJE</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>PAISAJE</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>PAISAJE</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>PAISAJE</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>PAISAJE</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>PAISAJE</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>PAISAJE</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>PAISAJE</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>PAISAJE</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<td>AXB</td>
							<td>PAISAJE</td>
							<td>Minas Tirith, Moria, Mordor</td>
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
							<th scope="col">Tipo de promoción</th>
							<th scope="col">Tipo de atracción</th>
							<th scope="col">Atracciones</th>
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