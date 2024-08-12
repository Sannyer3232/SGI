<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.FilialDAO" %>
<%@ page import="model.FilialJavaBeans" %>
<%@ page import="java.util.ArrayList"%>
<%
	FilialDAO dao = new FilialDAO();
	ArrayList<FilialJavaBeans> filiais = dao.listarFilial();
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>editar Eventos/Cultos</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="./css/main.css">

</head>
<body>
	<!-- SideBar -->
	<section class="full-box cover dashboard-sideBar">
		<div class="full-box dashboard-sideBar-bg btn-menu-dashboard"></div>
		<div class="full-box dashboard-sideBar-ct">
			<!--SideBar Title -->
			<div
				class="full-box text-uppercase text-center text-titles dashboard-sideBar-title">
				SGI <i class="zmdi zmdi-close btn-menu-dashboard visible-xs"></i>
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
				<li><a href="home.html"> <i
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
						class="zmdi zmdi-view-list-alt"></i></a></li>
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

		<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
		<!-- Content page -->
		<div class="container-fluid">
			<div class="page-header">
				<h1 class="text-titles">
					<i class="zmdi zmdi-money-box zmdi-hc-fw"></i> Editar Eventos/Cultos
				</h1>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<ul class="nav nav-tabs" style="margin-bottom: 15px;">
					    <li class="active"><a href="cadastro_eventos.html">Cadastrar
								Cultos</a></li>
						<li><a href="main">Lista Cultos</a></li>
						<li class="active"><a href="update" data-toggle="tab">Editar
								Cultos</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="new">
							<div class="container-fluid">
								<div class="row">
									<div class="col-xs-12 col-md-10 col-md-offset-1">
									
										<form name="formEvento" action="updateEvento" method="get">
											<div class="form-group label-floating onsubmit=">
												<label class="control-label">Id</label> <input
													type="text" name="idevento" readonly
													value="<%out.print(request.getAttribute("idevento"));%>">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Evento</label> <input
													class="form-control" type="text" name="evetitulo"
													value="<%out.print(request.getAttribute("evetitulo"));%>">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Descrição</label> <input
													class="form-control" type="text" name="evedescricao"
													value="<%out.print(request.getAttribute("evedescricao"));%>">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Data</label> <input
													class="form_group" type="date" name="evedata" required
													value="<%out.print(request.getAttribute("evedata"));%>">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Hora</label> <input
													class="form_group" type="time" name="evehora" required
													value="<%out.print(request.getAttribute("evehora"));%>">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Local</label> <input
													class="form-control" type="text" name="evelocalizacao"
													value="<%out.print(request.getAttribute("evendereco"));%>">
											</div>
											 <div class="custom-select">
												<label class="select-fonte">Status</label> <select
													class="form_group" name="evestatus">
													<option value="Agendado">Agendado</option>
													<option value="Concluido">Concluído</option>
													<option value="Cancelado">Cancelado</option>
													
												</select>
											</div>
											  <div class="custom-select">
												<label class="select-fonte">Filial</label> <select
													class="form_group" name="evefilial">
													<option value="">---- Selecionar Filial ----</option>
													<%for(FilialJavaBeans filial : filiais){ %>
													<option value="<%=filial.getIdfilial()%>"><%=filial.getFilnome() %></option>
													<%} %>
												</select>
											</div>
											<p class="text-center">
												<input type="submit" class="btn btn-info btn-raised btn-sm"
													value="Salvar">
											</p>
										</form>
										
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!------------------------------------------------------------------------------------------------------------------------------------------------------>

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