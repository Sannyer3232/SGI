<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Contas</title>
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
				company <i class="zmdi zmdi-close btn-menu-dashboard visible-xs"></i>
			</div>
			<!-- SideBar User info -->
			<div class="full-box dashboard-sideBar-UserInfo">
				<figure class="full-box">
					<img src="./assets/img/fotoPerfil.png" alt="UserIcon">
					<figcaption class="text-center text-titles">Usuário</figcaption>
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
						class="zmdi zmdi-view-dashboard zmdi-hc-fw"></i> Painel Principal
				</a></li>
				<li><a href="#!" class="btn-sideBar-SubMenu"> <i
						class="zmdi zmdi-account-add zmdi-hc-fw"></i> Cadastro <i
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
						<li><a href="payments.html"><i
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

		<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
		<!-- Content page -->
		<div class="container-fluid">
			<div class="page-header">
				<h1 class="text-titles">
					<i class="zmdi zmdi-money-box zmdi-hc-fw"></i> Contas a pagar
				</h1>
			</div>
			<p class="lead">Área reservada ao cadastro de contas e
				visualização das contas pagas e pendentes</p>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<ul class="nav nav-tabs" style="margin-bottom: 15px;">
						<li class="active"><a href="#new" data-toggle="tab">Editar
								Contas</a></li>
						<li><a href="main">Lista de contas</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="new">
							<div class="container-fluid">
								<div class="row">
									<div class="col-xs-12 col-md-10 col-md-offset-1">
										<form name="frmConta" action="ContasUpdate" method="get">
											<div class="form-group label-floating">
												<label class="control-label">Nome do Fornecedor</label> <input
													type="text" name="idcontapagar" readonly
													value="<%out.print(request.getAttribute("idcontapagar"));%>">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Nome do Fornecedor</label> <input
													class="form-control" type="text" name="nomefornecedor"
													value="<%out.print(request.getAttribute("nome"));%>">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Filial</label> <select
													class="form_group" name="filial">
													<option value="">---- Selecionar Filial ----</option>
													<option value="1">Filial Campos Elisios</option>
													<option value="2">Filial Coroado</option>
													<option value="3">Filial Cachoeirinha</option>
												</select>
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Descrição da conta</label> <input
													class="form-control" type="text" name="descricao"
													value="<%out.print(request.getAttribute("descricaoconta"));%>">

											</div>
											<div class="form-group label-floating">
												<label class="control-label">Data de Vencimento</label> <input
													class="form_group" type="date" name="vencimento" required
													value="<%out.print(request.getAttribute("vencimento"));%>">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Valor</label> <input
													class="form-control" type="text" name="valor"
													value="<%out.print(request.getAttribute("valor"));%>">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Situação</label> <select
													class="form_group" name="status"
													value="<%out.print(request.getAttribute("status"));%>">
													<option value="">---- Status de Pagamento ----</option>
													<option value="Pendente">Pendente</option>
													<option value="Pago">Pago</option>
												</select>
											</div>

											<p class="text-center">
												<input type="submit" class="btn btn-info btn-raised btn-sm"
													value="Salvar" onclick="validar()">
											</p>
										</form>
										<script src="scripts/validador.js"></script>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="list">
							<div class="table-responsive">
								<table class="table table-hover text-center">
									<thead>
										<tr>
											<th class="text-center">#</th>
											<th class="text-center">Payment</th>
											<th class="text-center">Amount</th>
											<th class="text-center">Pending</th>
											<th class="text-center">Student</th>
											<th class="text-center">Section</th>
											<th class="text-center">Year</th>
											<th class="text-center">Update</th>
											<th class="text-center">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>$70</td>
											<td>$40</td>
											<td>$30</td>
											<td>Carlos Alfaro</td>
											<td>Section</td>
											<td>2017</td>
											<td><a href="#!"
												class="btn btn-success btn-raised btn-xs"><i
													class="zmdi zmdi-refresh"></i></a></td>
											<td><a href="#!"
												class="btn btn-danger btn-raised btn-xs"><i
													class="zmdi zmdi-delete"></i></a></td>
										</tr>
										<tr>
											<td>2</td>
											<td>$70</td>
											<td>$70</td>
											<td>$0</td>
											<td>Claudia Rodriguez</td>
											<td>Section</td>
											<td>2017</td>
											<td><a href="#!"
												class="btn btn-success btn-raised btn-xs"><i
													class="zmdi zmdi-refresh"></i></a></td>
											<td><a href="#!"
												class="btn btn-danger btn-raised btn-xs"><i
													class="zmdi zmdi-delete"></i></a></td>
										</tr>
										<tr>
											<td>3</td>
											<td>$70</td>
											<td>$70</td>
											<td>$0</td>
											<td>Alicia Melendez</td>
											<td>Section</td>
											<td>2017</td>
											<td><a href="#!"
												class="btn btn-success btn-raised btn-xs"><i
													class="zmdi zmdi-refresh"></i></a></td>
											<td><a href="#!"
												class="btn btn-danger btn-raised btn-xs"><i
													class="zmdi zmdi-delete"></i></a></td>
										</tr>
										<tr>
											<td>4</td>
											<td>$70</td>
											<td>$70</td>
											<td>$0</td>
											<td>Alba Bonilla</td>
											<td>Section</td>
											<td>2017</td>
											<td><a href="#!"
												class="btn btn-success btn-raised btn-xs"><i
													class="zmdi zmdi-refresh"></i></a></td>
											<td><a href="#!"
												class="btn btn-danger btn-raised btn-xs"><i
													class="zmdi zmdi-delete"></i></a></td>
										</tr>
									</tbody>
								</table>
								<ul class="pagination pagination-sm">
									<li class="disabled"><a href="#!">«</a></li>
									<li class="active"><a href="#!">1</a></li>
									<li><a href="#!">2</a></li>
									<li><a href="#!">3</a></li>
									<li><a href="#!">4</a></li>
									<li><a href="#!">5</a></li>
									<li><a href="#!">»</a></li>
								</ul>
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