<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../partials/headAdmin.jsp"></jsp:include>
<title>Atracciones | Turismo en la Tierra Media</title>
    <!-- Script Datatables -->
    <script defer>
        $(document).ready(function () {
            $('#tablaUsuarios').DataTable({
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
	<jsp:include page="../partials/navbarAdmin.jsp"></jsp:include>

	    <main>
        <section id="usuarios">
            <h2>
                <b>Usuarios</b>
            </h2>
            <!-- Botón para crear usuario -->
            <div class="d-flex justify-content-center" id="nuevoUsuario">
                <button class="btn mx-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasFormulario"
                    aria-controls="offcanvasFormulario">Nuevo usuario</button>
            </div>

            <!-- Offcanvas para crear usuario -->
            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasFormulario"
                aria-labelledby="offcanvasFormularioLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasFormularioLabel">Offcanvas con backdrop</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Cerrar"></button>
                </div>
                <div class="offcanvas-body">
                    <!-- Formulario para crear usuario-->
                    <div class="container my-5">
                        <form action="usuariosAdmin.html" method="get" class="d-flex flex-column text-light p-2"
                            id="formularioAtraccion">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label> <input
                                    placeholder="Ingrese un nombre" type="text" class="form-control" required
                                    id="nombre" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="tipo" class="form-label">Tipo de atracción preferido</label> <select
                                    class="form-select form-select-lg mb-3" aria-label=".form-select-lg example"
                                    required id="tipo">
                                    <option selected value="1">AVENTURA</option>
                                    <option value="2">DEGUSTACION</option>
                                    <option value="3">PAISAJE</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="costo" class="form-label">Presupuesto</label> <input type="number" step="0.5"
                                    min=1 required class="form-control" id="costo">
                            </div>
                            <div class="mb-3">
                                <label for="tiempo" class="form-label">Tiempo disponible</label> <input type="number" step="0.5"
                                    min=0,5 class="form-control" required id="tiempo">
                            </div>

                            <button type="submit" class="btn mx-2">Crear
                                usuario</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Tabla de usuarios -->
            <div class="container table-responsive mt-1">
                <table class="table table-light table-striped table-hover" id="tablaUsuarios" class="display">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Tipo de atracción preferido</th>
                            <th scope="col">Presupuesto</th>
                            <th scope="col">Tiempo disponible</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Eowyn</td>
                            <td>AVENTURA</td>
                            <td>10</td>
                            <td>8</td>
                            <td>
                                <button type="button" class="btn btn-primary mx-2" title="Editar">
                                    <i class="far fa-edit"></i>
                                </button>
                                <button type="button" class="btn btn-danger mx-2" title="Eliminar">
                                    <i class="far fa-trash-alt"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Gandalf</td>
                            <td>PAISAJE</td>
                            <td>100</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="btn btn-primary mx-2" title="Editar">
                                    <i class="far fa-edit"></i>
                                </button>
                                <button type="button" class="btn btn-danger mx-2" title="Eliminar">
                                    <i class="far fa-trash-alt"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Sam</td>
                            <td>DEGUSTACION</td>
                            <td>36</td>
                            <td>8</td>
                            <td>
                                <button type="button" class="btn btn-primary mx-2" title="Editar">
                                    <i class="far fa-edit"></i>
                                </button>
                                <button type="button" class="btn btn-danger mx-2" title="Eliminar">
                                    <i class="far fa-trash-alt"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>Galadriel</td>
                            <td>PAISAJE</td>
                            <td>120</td>
                            <td>6</td>
                            <td>
                                <button type="button" class="btn btn-primary mx-2" title="Editar">
                                    <i class="far fa-edit"></i>
                                </button>
                                <button type="button" class="btn btn-danger mx-2" title="Eliminar">
                                    <i class="far fa-trash-alt"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Tipo de atracción preferido</th>
                            <th scope="col">Presupuesto</th>
                            <th scope="col">Tiempo disponible</th>
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