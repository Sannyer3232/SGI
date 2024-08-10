<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.DizimosOferta"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%
	String[] meses = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro",
		"Novembro", "Dezembro"};
%>

<%
	int mes = (int) request.getAttribute("p_mes");
	int ano = (int) request.getAttribute("p_ano");
	String tipo = (String) request.getAttribute("p_tipo");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/janela-modal-alerta.css">
<title>Resultado Consulta de <%=tipo %> </title>
</head>
<body>
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
						class="zmdi zmdi-caret-down pull-right"></i></a>
					<ul class="list-unstyled full-box">
						<li><a href="cadastroMembros"><i
								class="zmdi zmdi-account"></i> Membros</a></li>
						<li><a href="cadastroTarefa"><i
								class="zmdi zmdi-assignment"></i> Tarefas</a></li>
						<li><a href="student.html"><i
								class="zmdi zmdi-accounts-add zmdi-hc-fw"></i> Grupos</a></li>

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
						
						<li><a href="representative.html"><i
								class="zmdi zmdi-star zmdi-hc-fw"></i> Festividades</a></li>
						<li><a href="cadastro_eventos.jsp"><i class="zmdi zmdi-calendar"></i> Cadastrar Evento</a></li>
						
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
						<li><a href="cadastroOferta.jsp"><i
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
		<!-- Content page -->
		<div class="container-fluid">
			<div class="page-header">
				<h1 class="text-titles">
				<%if(tipo.equals("Dizimo")){ %>
					<i class="zmdi zmdi-money zmdi-hc-fw"></i> Dízimo <small>Consulta</small>
				<%}else if(tipo.equals("Oferta")){ %>
					<i class="zmdi zmdi-money-box"></i> Ofertas <small>Consulta</small>
				<%} %>
				</h1>

			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">


					<ul class="nav nav-tabs" style="margin-bottom: 15px;">
						<%if(tipo.equals("Dizimo")){ %>
						<li><a id="fonte-nav" href="consultarDizimo.jsp"> Nova Consulta
								Dízimo</a></li>
						<%}else if(tipo.equals("Oferta")){ %>
						<li><a id="fonte-nav" href="consultaOferta.jsp"> Nova Consulta
								Oferta</a></li>
						<%} %>
			
					</ul>


					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="new">
							<div class="container-fluid">
								<div class="row">
									<div class="col-xs-12 col-md-10 col-md-offset-1">
										<%
											ArrayList<DizimosOferta> listaDizimosOfertas = (ArrayList<DizimosOferta>) request.getAttribute("dizimosOfertas");
											float total = (float) request.getAttribute("totalDizimosOfertas");
											NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
											
											if (listaDizimosOfertas != null) {
										%>
										<div class="cardDizOferta">

											<div class="title">
												<p class="title-text">
													Total de <%=tipo%> do Mês de
													<%=meses[mes - 1]%>
													de
													<%=ano%></p>
											</div>
											<div class="data">
												<p><%=nf.format(total)%></p>
											</div>
										</div>
										<br> <br> <br>
										<table class="table table-hover text-center">

											<thead>
												<tr>
													<th class="text-center">ID</th>
													<th class="text-center">Nome do Membro</th>
													<th class="text-center">Filial</th>
													<th class="text-center">Data da Contribuição</th>
													<th class="text-center">Tipo</th>
													<th class="text-center">Valor</th>
													<th class="text-center">Excluir</th>
												</tr>
											</thead>
											<tbody>

												<%
													for (DizimosOferta dizimoOferta : listaDizimosOfertas) {
													LocalDateTime data = LocalDateTime.parse(dizimoOferta.getDzodtcontribuicao() + " " + "00:00:00",
																DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
													LocalDateTime dataAtual = LocalDateTime.now();
													SimpleDateFormat dataFormatter = new SimpleDateFormat("dd/MM/yyyy");
													String dataFormatada = dataFormatter.format(dizimoOferta.getDzodtcontribuicao());
												%>
												<tr>
													<td><%=dizimoOferta.getIddizimooferta()%></td>
													<td><%=dizimoOferta.getDzomembronome()%></td>
													<td><%=dizimoOferta.getDzoFilialNome()%></td>
													<td><%=dataFormatada%></td>
													<td><%=dizimoOferta.getDzotipo()%></td>
													<td><%=nf.format(dizimoOferta.getDzovalor())%></td>
													<td>
														<button class="btn btn-danger btn-raised btn-xs"
															onclick="abrirModalAlerta('<%=dizimoOferta.getIddizimooferta()%>', '<%=mes%>', '<%=ano%>','<%=tipo%>')">
															<i class="zmdi zmdi-delete"></i>
														</button>

													</td>

												</tr>


												<%
												}
												%>
												<%
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
	<script src="js/script-fecha-alerta.js"></script>

	<script>
		$.material.init();
	</script>
</body>

<div class="janela-modal-alerta" id="janela-modal-alerta">
	<div class="modal-alerta">
		<button class="fechar" id="fechar">X</button>
		<div class="container-modal">
			<img class="icone" alt="alertaIcone"
				src="./assets/img/alertaIcone.png">
			<h1>Alerta!</h1>
			<p>Deseja realmente exlcuir esse registro permanentemente?</p>
			<div class="container-btn">
				<button class="btn btn-danger btn-raised btn-xs" id="fechar-alerta">
					<p id='fechar-alerta'>Cancelar</p>
				</button>
				<br> <a class="btn btn-success btn-raised btn-xs"
					id="confirma-exclusao">Confirmar</a>
			</div>
		</div>

	</div>
</div>

</html>