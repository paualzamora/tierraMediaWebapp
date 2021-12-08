<!DOCTYPE html>
<html>

<head>
<jsp:include page="partials/head.jsp"></jsp:include>
<title>Inicio | Turismo en la Tierra Media</title>
</head>

<body>
			<!-- Navbar -->
			<jsp:include page="partials/navbar.jsp"></jsp:include>
			<!-- Banner -->
			<div class="container">
				<img class="img-fluid"
					src="https://www.newzealand.com/assets/Tourism-NZ/Hamilton-Waikato/9f9201e791/img-1536247447-9335-29731-71D979DD-BAD5-3550-744F63801887D344-v2__aWxvdmVrZWxseQo_FocalPointCropWzY2MCwxOTIwLDY0LDUwLDc1LCJqcGciLDY1LDIuNV0.jpg"
					alt="La Comarca" id="banner">
				<div class='console-container'>
					<span id='text'></span>
					<div class='console-underscore' id='cursor'>|</div>
					<p>
						<a class="btn btn-outline-light btn-md" href="#atracciones"
							role="button" id="botonBanner">Descubrí nuestras atracciones</a>
					</p>
				</div>
				<script>
					function typewriter(palabras, colores) {

						var cursor = document.getElementById('cursor'); //cursor
						var text = document.getElementById('text') //text

						var blink = true;
						var wait = false;
						var letters_count = 1;
						var temp = 1;

						text.style.color = colores[0]
						window.setInterval(function() { //wait between words when it starts writting
							if (letters_count === 0 && wait === false) {
								wait = true;

								text.innerHTML = '' // leave a blank
								window.setTimeout(function() {
									var usedColor = colores.splice(0, 1)[0] //remove first element and get it as str
									colores.push(usedColor);
									var usedWord = palabras.splice(0, 1)[0]
									palabras.push(usedWord);
									temp = 1;
									text.style.color = colores[0]
									letters_count += temp;
									wait = false;
								}, 1000)
							} else if (letters_count === palabras[0].length + 1
									&& wait === false) {
								wait = true;
								window.setTimeout(function() { //wait a bit until words finished and start deleting
									temp = -1;
									letters_count += temp;
									wait = false;
								}, 1000)
							} else if (wait === false) { //write words                    
								text.innerHTML = palabras[0].substr(0,
										letters_count)
								letters_count += temp;
							}
						}, 120)
						window.setInterval(function() {
							if (blink) {
								cursor.style.opacity = "0";
								blink = false;
							} else {
								cursor.style.opacity = "1";
								blink = true;
							}
						}, 400)
					}
					typewriter([ 'Aventuras', 'Paisajes', 'Sabores',
							'Experiencias únicas' ], [ '#FFFFFF', '#FFFFFF',
							'#FFFFFF', '#FFFFFF' ]);
				</script>
			</div>
			<main>
				<!-- Carousel atracciones -->
				<section id="atracciones">
					<h2>
						<b>Atracciones populares</b>
					</h2>
					<div id="carouselAtracciones" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselAtracciones"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselAtracciones"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselAtracciones"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
							<button type="button" data-bs-target="#carouselAtracciones"
								data-bs-slide-to="3" aria-label="Slide 4"></button>
							<button type="button" data-bs-target="#carouselAtracciones"
								data-bs-slide-to="4" aria-label="Slide 5"></button>
							<button type="button" data-bs-target="#carouselAtracciones"
								data-bs-slide-to="5" aria-label="Slide 6"></button>
							<button type="button" data-bs-target="#carouselAtracciones"
								data-bs-slide-to="6" aria-label="Slide 7"></button>
							<button type="button" data-bs-target="#carouselAtracciones"
								data-bs-slide-to="7" aria-label="Slide 8"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="https://i.ibb.co/KXGzPpd/moria.jpg"
									class="d-block w-100" alt="Moria">
								<div class="carousel-caption d-none d-md-block">
									<h3>Moria</h3>
									<p>Tipo de atracción: Aventura / Costo: 10 monedas /
										Tiempo: 2 horas</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="https://i.ibb.co/kyJ4Bvb/minas-tirith.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h3>Minas Tirith</h3>
									<p>Tipo de atracción: Paisaje / Costo: 5 monedas / Tiempo:
										2,5 horas</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="https://i.ibb.co/HqhB71D/la-comarca.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h3>La Comarca</h3>
									<p>Tipo de atracción: Degustación / Costo: 3 monedas /
										Tiempo: 6,5 horas</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="https://i.ibb.co/9VkTmJ1/mordor.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h3>Mordor</h3>
									<p>Tipo de atracción: Aventura / Costo: 25 monedas /
										Tiempo: 3 horas</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="https://i.ibb.co/hc1pPK7/abismo-de-helm.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h3>Abismo de Helm</h3>
									<p>Tipo de atracción: Paisaje / Costo: 5 monedas / Tiempo:
										2 horas</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="https://i.ibb.co/0MNL1yv/lothlorien.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h3>Lothlorien</h3>
									<p>Tipo de atracción: Degustación / Costo: 35 monedas /
										Tiempo: 1 hora</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="https://i.ibb.co/T4jb9Tq/erebor.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h3>Erebor</h3>
									<p>Tipo de atracción: Paisaje / Costo: 12 monedas / Tiempo:
										3 horas</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="https://i.ibb.co/nkN1ymw/bosque-negro.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h3>Bosque Negro</h3>
									<p>Tipo de atracción: Aventura / Costo: 3 monedas / Tiempo:
										4 horas</p>
								</div>
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselAtracciones" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Anterior</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselAtracciones" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Siguiente</span>
						</button>
					</div>
				</section>
				<!-- Card carousel de promociones -->
				<section id="promociones">
					<h2>
						<b>¡Conocé nuestras promociones!</b>
					</h2>
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div id="carouselPromos" class="carousel slide"
									data-ride="carousel">
									<div class="carousel-inner">
										<div class="carousel-item active">
											<div class="row">
												<div class="col-md-4 mb-3">
													<div class="card">
														<img class="img-fluid" alt="100%x280"
															src="https://i.ibb.co/sjT71hF/packpaisajes.jpg">
														<div class="card-body">
															<h4 class="card-title">Pack Paisajes</h4>
															<p class="card-text">Comprá Minas Tirith y Abismo de
																Helm, ¡y llevate Erebor gratis!</p>

														</div>

													</div>
												</div>
												<div class="col-md-4 mb-3">
													<div class="card">
														<img class="img-fluid" alt="100%x280"
															src="https://i.ibb.co/vzLWrh0/packaventura.jpg">
														<div class="card-body">
															<h4 class="card-title">Pack Aventura</h4>
															<p class="card-text">Comprá Moria y Bosque Negro, ¡y
																llevate Mordor gratis!</p>

														</div>
													</div>
												</div>
												<div class="col-md-4 mb-3">
													<div class="card">
														<img class="img-fluid" alt="100%x280"
															src="https://i.ibb.co/Q8SVzSf/packdegustacion.jpg">
														<div class="card-body">
															<h4 class="card-title">Pack Degustación</h4>
															<p class="card-text">Comprá Lothlorien, ¡y llevate La
																Comarca gratis!</p>

														</div>
													</div>
												</div>

											</div>
										</div>
										<div class="carousel-item">
											<div class="row">

												<div class="col-md-4 mb-3">
													<div class="card">
														<img class="img-fluid" alt="100%x280"
															src="https://i.ibb.co/kgJD8np/sabor.jpg">
														<div class="card-body">
															<h4 class="card-title">Pack Sabor</h4>
															<p class="card-text">¡Obtené Lothlorien y La Comarca
																por tan solo 36 monedas!</p>

														</div>

													</div>
												</div>
												<div class="col-md-4 mb-3">
													<div class="card">
														<img class="img-fluid" alt="100%x280"
															src="https://i.ibb.co/6RXbMbs/monta-a.jpg">
														<div class="card-body">
															<h4 class="card-title">Pack Montaña</h4>
															<p class="card-text">¡Obtené Abismo de Helm y Erebor
																por tan solo 13 monedas!</p>

														</div>
													</div>
												</div>
												<div class="col-md-4 mb-3">
													<div class="card">
														<img class="img-fluid" alt="100%x280"
															src="https://i.ibb.co/CMfxWdX/historia.jpg">
														<div class="card-body">
															<h4 class="card-title">Pack Historia</h4>
															<p class="card-text">¡Obtené Mordor y Moria por tan
																solo 30 monedas!</p>

														</div>
													</div>
												</div>

											</div>
										</div>
										<div class="carousel-item">
											<div class="row">

												<div class="col-md-4 mb-3">
													<div class="card">
														<img class="img-fluid" alt="100%x280"
															src="https://i.ibb.co/1rHVnWL/d20.jpg">
														<div class="card-body">
															<h4 class="card-title">Pack D20</h4>
															<p class="card-text">¡Comprá Lothlorien y La Comarca
																con un 20% de descuento!</p>

														</div>

													</div>
												</div>
												<div class="col-md-4 mb-3">
													<div class="card">
														<img class="img-fluid" alt="100%x280"
															src="https://i.ibb.co/WcJHKf2/p30.jpg">
														<div class="card-body">
															<h4 class="card-title">Pack P30</h4>
															<p class="card-text">¡Comprá Minas Tirith, Abismo de
																Helm y Erebor con un 30% de descuento!</p>

														</div>
													</div>
												</div>
												<div class="col-md-4 mb-3">
													<div class="card">
														<img class="img-fluid" alt="100%x280"
															src="https://i.ibb.co/fpMh0vK/a50.jpg">
														<div class="card-body">
															<h4 class="card-title">Pack A50</h4>
															<p class="card-text">¡Comprá Moria, Bosque Negro y
																Mordor con un 50% de descuento!</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="controlesPromos">
							<a class="btn btn-outline-dark mb-3 mr-1"
								data-bs-target="#carouselPromos" data-bs-slide="prev"> <i
								class="fa fa-arrow-left"></i></a> <a
								class="btn btn-outline-dark mb-3"
								data-bs-target="#carouselPromos" data-bs-slide="next"> <i
								class="fa fa-arrow-right"></i></a>
						</div>
					</div>
				</section>
			</main>
			<!-- Pie de página -->
			<jsp:include page="partials/footer.jsp"></jsp:include>
</body>

</html>