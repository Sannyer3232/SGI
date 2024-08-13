<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.MembroJavaBeans"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html lang="es">
<head>
<title>Inicio</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/card.css">
</head>
<body>
	<!-- SideBar -->
	<section class="full-box cover dashboard-sideBar">
		<div class="full-box dashboard-sideBar-bg btn-menu-dashboard"></div>
		<div class="full-box dashboard-sideBar-ct">
			<!--SideBar Title -->
			<div
				class="full-box text-uppercase text-center text-titles dashboard-sideBar-title">
				company <i class="zmdi zmdi-close btn-menu-dashboard visible-xs"></i>
			</div>
			<!-- SideBar User info -->
			<div class="full-box dashboard-sideBar-UserInfo">
				<figure class="full-box">
					<img src="img/<%out.print(session.getAttribute("userphoto"));%>">
					<figcaption class="text-center text-titles"><%out.print(session.getAttribute("username")); %></figcaption>
				</figure>
				<ul class="full-box list-unstyled text-center">
					<li><a href="#!"> <i class="zmdi zmdi-settings"></i>
					</a></li>
					<li><a href="#!" class="btn-exit-system"> <i
							class="zmdi zmdi-power"></i>
					</a></li>
				</ul>
			</div>
			<!-- SideBar Menu -->
				<ul class="list-unstyled full-box dashboard-sideBar-Menu">
				<li><a href="home.jsp"> <i
						class="zmdi zmdi-view-dashboard zmdi-hc-fw"></i> Panel Principal
				</a></li>
				<li><a href="#!" class="btn-sideBar-SubMenu"> <i
						class="zmdi zmdi-case zmdi-hc-fw"></i> Cadastro <i
						class="zmdi zmdi-caret-down pull-right"></i></a>
					<ul class="list-unstyled full-box">
						<li><a href="cadastroMembros"><i
								class="zmdi zmdi-account"></i> Membros</a></li>
						<li><a href="cadastroTarefa"><i
								class="zmdi zmdi-assignment"></i> Tarefas</a></li>
						<li><a href="student.html"><i
								class="zmdi zmdi-accounts-add zmdi-hc-fw"></i> Grupos</a></li>
						<li><a href="cadastro_eventos.jsp"><i class="zmdi zmdi-calendar"></i>Evento</a></li>

					</ul></li>
				<li><a href="#!" class="btn-sideBar-SubMenu"> <i
						class="zmdi zmdi-calendar-check zmdi-hc-fw"></i> Eventos <i
						class="zmdi zmdi-caret-down pull-right"></i>
				</a>
					<ul class="list-unstyled full-box">
						<li><a href="aniversatiantes.jsp"><i
								class="zmdi zmdi-cake zmdi-hc-fw"></i> Aniversariantes</a></li>
						<li><a href="teacher.html"><i
								class="zmdi zmdi-alarm-plus zmdi-hc-fw"></i>Eventos</a></li>	
						
					</ul></li>
				<li><a href="#!" class="btn-sideBar-SubMenu"> <i
						class="zmdi zmdi-card zmdi-hc-fw"></i> Financeiro <i
						class="zmdi zmdi-caret-down pull-right"></i>
				</a>
					<ul class="list-unstyled full-box">
						<li><a href="CadastroContas"><i
								class="zmdi zmdi-exposure-alt zmdi-hc-fw"></i> Contas</a></li>
						<li><a href="cadastroDoacoes"><i class="zmdi zmdi-favorite zmdi-hc-fw"></i>
								Doações</a></li>
						<li><a href="membroparadizimo.jsp"><i
								class="zmdi zmdi-money zmdi-hc-fw"></i> Dízimos</a></li>
						<li><a href="membroparaoferta.jsp"><i
								class="zmdi zmdi-money-box zmdi-hc-fw"></i> Ofertas</a></li>
						<li><a href="cadastroPatrimonio"><i
								class="zmdi zmdi-chart zmdi-hc-fw"></i> Patrimonio</a></li>
					</ul></li>
	
					
					<li><a href="ajuda.jsp"> <i
						class="zmdi zmdi-pin-help"></i> Ajuda
				</a></li>
					
			</ul>
		</div>
	</section>

	<!-- Content page-->
	<section class="full-box dashboard-contentPage">
		<!-- NavBar -->
		<nav class="full-box dashboard-Navbar">
			<ul class="full-box list-unstyled text-right">
				<li class="pull-left"><a href="#!" class="btn-menu-dashboard"><i
						class="zmdi zmdi-more-vert"></i></a></li>
				<li><a href="#!" class="btn-Notifications-area"> <i
						class="zmdi zmdi-notifications-none"></i> <span class="badge">7</span>
				</a></li>
				<li><a href="#!" class="btn-search"> <i
						class="zmdi zmdi-search"></i>
				</a></li>
				<li><a href="#!" class="btn-modal-help"> <i
						class="zmdi zmdi-help-outline"></i>
				</a></li>
			</ul>
		</nav>
		<!-- Content page -->
		<div class="container-fluid">

			<div class="container-fluid">
				<div class="page-header">
					<h1 class="text-titles">
						ANIVERSARIANTES <small>DO MES</small>
					</h1>
				</div>

				<section id="cd-timeline" class="cd-container" text-align ="center">

					<%
					ArrayList<MembroJavaBeans> lista = (ArrayList<MembroJavaBeans>) request.getAttribute("aniversariantes");
					if(lista == null){
					%>
						<p> Não há aniversariantes</p>
						
						
					<%
					}else {for (int i = 0; i < lista.size(); i++) {
						
					%>
					<div class="results-summary-container" >

						<div class="confetti">
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
							<div class="confetti-piece"></div>
						</div>
						<div class="results-summary-container__result">
							<div class="heading-tertiary">
								<br>
							</div>
							<div class="result-box">
								<div class="heading-primary">
									<img src="img/<%=lista.get(i).getMbrfotoCaminho()%>"
										alt="user-picture" class="foto">
								</div>
								<p class="result">of 100</p>
							</div>
							<div class="result-text-box">
								<div class="heading-secondary">PARABÉNS!!!</div>
								<p class="paragraph"><%=lista.get(i).getMbrmemnome()%>.
								</p>
							</div>
							
						</div>
					</div>
					<br>
					<%
					}
					}
					%>
				
				
			</div>
	</section>
	<br>






	<!-- Notifications area -->
	<section class="full-box Notifications-area">
		<div class="full-box Notifications-bg btn-Notifications-area"></div>
		<div class="full-box Notifications-body">
			<div class="Notifications-body-title text-titles text-center">
				Notifications <i class="zmdi zmdi-close btn-Notifications-area"></i>
			</div>
			<div class="list-group">
				<div class="list-group-item">
					<div class="row-action-primary">
						<i class="zmdi zmdi-alert-triangle"></i>
					</div>
					<div class="row-content">
						<div class="least-content">17m</div>
						<h4 class="list-group-item-heading">Tile with a label</h4>
						<p class="list-group-item-text">Donec id elit non mi porta
							gravida at eget metus.</p>
					</div>
				</div>
				<div class="list-group-separator"></div>
				<div class="list-group-item">
					<div class="row-action-primary">
						<i class="zmdi zmdi-alert-octagon"></i>
					</div>
					<div class="row-content">
						<div class="least-content">15m</div>
						<h4 class="list-group-item-heading">Tile with a label</h4>
						<p class="list-group-item-text">Donec id elit non mi porta
							gravida at eget metus.</p>
					</div>
				</div>
				<div class="list-group-separator"></div>
				<div class="list-group-item">
					<div class="row-action-primary">
						<i class="zmdi zmdi-help"></i>
					</div>
					<div class="row-content">
						<div class="least-content">10m</div>
						<h4 class="list-group-item-heading">Tile with a label</h4>
						<p class="list-group-item-text">Maecenas sed diam eget risus
							varius blandit.</p>
					</div>
				</div>
				<div class="list-group-separator"></div>
				<div class="list-group-item">
					<div class="row-action-primary">
						<i class="zmdi zmdi-info"></i>
					</div>
					<div class="row-content">
						<div class="least-content">8m</div>
						<h4 class="list-group-item-heading">Tile with a label</h4>
						<p class="list-group-item-text">Maecenas sed diam eget risus
							varius blandit.</p>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!-- Dialog help -->
	<div class="modal fade" tabindex="-1" role="dialog" id="Dialog-Help">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Help</h4>
				</div>
				<div class="modal-body">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Nesciunt beatae esse velit ipsa sunt incidunt aut voluptas, nihil
						reiciendis maiores eaque hic vitae saepe voluptatibus. Ratione
						veritatis a unde autem!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-raised"
						data-dismiss="modal">
						<i class="zmdi zmdi-thumb-up"></i> Ok
					</button>
				</div>
			</div>
		</div>
	</div>
	<!--====== Scripts -->
	<script src="./js/jquery-3.1.1.min.js"></script>
	<script src="./js/sweetalert2.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/material.min.js"></script>
	<script src="./js/ripples.min.js"></script>
	<script src="./js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="./js/main.js"></script>
	<script>
		$.material.init();
	</script>
</body>
</html>