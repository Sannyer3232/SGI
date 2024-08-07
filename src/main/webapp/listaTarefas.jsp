<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ page import="model.TarefasJavaBeans"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Cadastro de Tarefas</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="./css/main.css">
<link href="css/cardcss.css" rel="stylesheet">
<link rel="stylesheet" href="./css/janela-modal-sucesso-erro.css">
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
					<img src="./assets/img/icon.jpeg" alt="UserIcon">
					<figcaption class="text-center text-titles">Monkey D
						Luffy</figcaption>
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
						class="zmdi zmdi-caret-down pull-right"></i>
				</a>
					<ul class="list-unstyled full-box">
						<li><a href="cadastroMembros.jsp"><i
								class="zmdi zmdi-account"></i> Membros</a></li>
						<li><a href="cadastroTarefas.jsp"><i
								class="zmdi zmdi-assignment"></i> Tarefas</a></li>

					</ul></li>
				<li><a href="#!" class="btn-sideBar-SubMenu"> <i
						class="zmdi zmdi-calendar-check zmdi-hc-fw"></i> Eventos <i
						class="zmdi zmdi-caret-down pull-right"></i>
				</a>
					<ul class="list-unstyled full-box">
						<li><a href="admin.html"><i
								class="zmdi zmdi-cake zmdi-hc-fw"></i> Aniversariantes</a></li>
						<li><a href="teacher.html"><i
								class="zmdi zmdi-alarm-plus zmdi-hc-fw"></i> Cultos</a></li>
						<li><a href="student.html"><i
								class="zmdi zmdi-accounts-add zmdi-hc-fw"></i> Grupos</a></li>
						<li><a href="representative.html"><i
								class="zmdi zmdi-star zmdi-hc-fw"></i> Festividades</a></li>
						<li><a href="representative.html"><i
								class="zmdi zmdi-pin-help zmdi-hc-fw"></i> Ajuda</a></li>
					</ul></li>
				<li><a href="#!" class="btn-sideBar-SubMenu"> <i
						class="zmdi zmdi-card zmdi-hc-fw"></i> Financeiro <i
						class="zmdi zmdi-caret-down pull-right"></i>
				</a>
					<ul class="list-unstyled full-box">
						<li><a href="cadastrocontas.jsp"><i
								class="zmdi zmdi-exposure-alt zmdi-hc-fw"></i> Contas</a></li>
						<li><a href="cadastrodoacoes.jsp"><i
								class="zmdi zmdi-favorite zmdi-hc-fw"></i> Doações</a></li>
						<li><a href="cadastroDizimo.jsp"><i
								class="zmdi zmdi-money zmdi-hc-fw"></i> Dízimos</a></li>
						<li><a href="cadastroOferta.jsp"><i
								class="zmdi zmdi-money-box zmdi-hc-fw"></i> Ofertas</a></li>
						<li><a href="cadastropatrimonio.jsp"><i
								class="zmdi zmdi-chart zmdi-hc-fw"></i> Patrimonio</a></li>
					</ul></li>
				<li><a href="#!" class="btn-sideBar-SubMenu"> <i
						class="zmdi zmdi-city zmdi-hc-fw"></i> Igrejas Filiadas <i
						class="zmdi zmdi-caret-down pull-right"></i>
				</a>
					<ul class="list-unstyled full-box">
						<li><a href="school.html"><i
								class="zmdi zmdi-balance zmdi-hc-fw"></i> Filial 1</a></li>
					</ul></li>
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
		<!-- Content page -->
		<div class="container-fluid">
			<div class="page-header">
				<h1 class="text-titles">
					<i class="zmdi zmdi-assignment"></i> Tarefas <small>Agendadas</small>
				</h1>
			</div>

		</div>
		<div class="container-fluid">

			<div class="row">
				<div class="col-xs-12">
					<div>
					<ul class="nav nav-tabs" style="margin-bottom: 15px;">
						<li class="active"><a id ="fonte-nav" href="cadastroTarefas.jsp" >Nova Tarefa</a></li>
						<li><a id ="fonte-nav" href="listarTarefas"> Lista de Tarefas Agendadas</a> </li>
						<li><a id ="fonte-nav" href="listarTarefasCanceladas" >Lista de Tarefas Canceladas</a></li>
						<li><a id ="fonte-nav" href="listarTarefasConcluida" >Lista de Tarefas Concluídas</a></li>
					</ul>
						

					</div>
					<div class="conteiner_tabela">
						<div class = "card_padding">
						<div class="card">
							<div class="legenda">Legenda</div>
							<div class="paleta">

								<div class="cores cor1">
									<div class="div1">
										<span class="func">Conluído</span>
									</div>


								</div>
								<div class="cores cor2">
									<div class="div3"></div>
									<div class="div1">
										<span class="func">Agendado</span>
									</div>


								</div>
								<div class="cores cor3">
									<div class="div5"></div>
									<div class="div1">
										<span class="func">Cancelado</span>
									</div>


								</div>
								<div class="cores cor4">
									<div class="div7"></div>
									<div class="div1">
										<span class="func">Atrasado</span>
									</div>


								</div>
							</div>
						</div>
						</div>
						<div id="myTabContent" class="tab-content">

							<div class="tab-pane fade active in" id="new">
								<div class="container-fluid">

									<div class="row">
										<div class="col-xs-12 col-md-10 col-md-offset-1">

											<%
											ArrayList<TarefasJavaBeans> lista = (ArrayList<TarefasJavaBeans>) request.getAttribute("tarefas");

											if (lista == null) {
											%>
											<div class="schedule-card">
												<div class="insidebox">
													<span class="schedule-tag">Sem tarefas</span>

												</div>
											</div>
											<%
											} else {
											%>
											<div class="tab-pane fade active in" id="list">
												<!-- Removido "fade" e adicionado "active" -->
												<div class="table-responsive">
													<table class="table table-hover text-center" id="tabela">
														<thead>
															<tr>
																<th class="text-center">Data</th>
																<th class="text-center">Hora</th>
																<th class="text-center">Filial</th>
																<th class="text-center">Titulo</th>
																<th class="text-center">Descrição</th>
																<th class="text-center">Responsável</th>
																<th class="text-center">Status</th>
															</tr>
														</thead>
														<tbody>


															<%
															for (int i = 0; i < lista.size(); i++) {
																LocalDateTime dataTarefa = LocalDateTime.parse(lista.get(i).getTarefadata() + " " + lista.get(i).getTarefahora(),
																DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

																LocalDateTime dataAtual = LocalDateTime.now();
																SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
																SimpleDateFormat shf = new SimpleDateFormat("HH:mm");
																String dataFormatada = sdf.format(lista.get(i).getTarefadata());
																String horaFormatada = shf.format(lista.get(i).getTarefahora());

																if (dataTarefa.isBefore(dataAtual)) {
															%>
															<tr id="linhaAtrasados">
																<td><%=dataFormatada%></td>
																<td><%=horaFormatada%></td>
																<td><%=lista.get(i).getTrafilnome()%></td>
																<td><%=lista.get(i).getTarefatitulo()%></td>
																<td><%=lista.get(i).getTarefadesc()%></td>
																<td><%=lista.get(i).getTrfmbrnome()%></td>
																<td><a
																	href="detalheTarefa?trfid=<%=lista.get(i).getTarefaid()%>"
																	class="btn btn-success btn-raised btn-xs">Atrasado
																		<i class="zmdi zmdi-refresh"></i>
																</a></td>
															</tr>

															<%
															} else {
															%>
															<tr id="linhaAgendado">
																<td><%=dataFormatada%></td>
																<td><%=horaFormatada%></td>
																<td><%=lista.get(i).getTrafilnome()%></td>
																<td><%=lista.get(i).getTarefatitulo()%></td>
																<td><%=lista.get(i).getTarefadesc()%></td>
																<td><%=lista.get(i).getTrfmbrnome()%></td>
																<td><a
																	href="detalheTarefa?trfid=<%=lista.get(i).getTarefaid()%>"
																	class="btn btn-success btn-raised btn-xs"><%=lista.get(i).getStatus()%>
																		<i class="zmdi zmdi-refresh"></i></a></td>
															</tr>
															<%
															}
															}
															}
															%>
														</tbody>
													</table>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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
<%
String achouMembro = request.getParameter("success");
if (achouMembro != null) {
	if ("true".equals(achouMembro)) {
%>
<div class="janela-modal-sucesso" id="janela-modal-sucesso">
	<div class="modal-sucesso">
		<button class="fechar" id="fechar-sucesso">X</button>
			<div class="container-modal">
				<img class = "icone"alt="sucessoIcon" src="./assets/img/sucesso.png">
				<h1>Sucesso!</h1>
				<p>O cadastro do tarefa foi realizado com sucesso.</p>
			</div>
	</div>
</div>
<%
} else if ("false".equals(achouMembro)) {
%>
<div class="janela-modal-erro" id="janela-modal-erro">
	<div class="modal-erro">
		<button class="fechar" id="fechar-erro">X</button>
			<div class="container-modal">
				<img class="icone"alt="sucessoIcon" src="./assets/img/erro.png">
				<h1>Erro!</h1>
				<p>Erro ao cadastrar nova tarefa!</p>
			</div>
	</div>
</div>
<%
}
}
%>
<script src="js/script-fechar.js"></script>
</html>