<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Cadastro</title>
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
						<li><a href="registration.html"><i
								class="zmdi zmdi-exposure-alt zmdi-hc-fw"></i> Contas</a></li>
						<li><a href="payments.html"><i
								class="zmdi zmdi-favorite zmdi-hc-fw"></i> Doa��es</a></li>
						<li><a href="payments.html"><i
								class="zmdi zmdi-money zmdi-hc-fw"></i> D�zimos</a></li>
						<li><a href="payments.html"><i
								class="zmdi zmdi-money-box zmdi-hc-fw"></i> Ofertas</a></li>
						<li><a href="payments.html"><i
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
					<i class="zmdi zmdi-account"></i> Membros <small>Cadastro</small>
				</h1>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">

					<ul class="nav nav-tabs" style="margin-bottom: 15px;">
						<li class="active"><a id="fonte-nav"
							href="pesquisaMembros.jsp">Buscar Membros</a></li>
					</ul>

					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="new">
							<div class="container-fluid">
								<div class="row">
									<div class="col-xs-12 col-md-10 col-md-offset-1">
										<form method="post" enctype="multipart/form-data"
											name="frmMembro" action="insert">
											<div class="form-group label-floating">
												<label class="control-label">Nome</label> <input
													class="form-control" type="text" name="mbrnome">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">CPF</label> <input
													class="form-control" type="text" name="mbrcpf">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Id Superior</label> <input
													class="form-control" type="text" name="mbrsuperior"></input>
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Identidade</label> <input
													class="form-control" type="text" name="mbridentidade"></input>
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Email</label> <input
													class="form-control" type="email" name="mbremail">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Telefone</label> <input
													class="form-control" type="text" name="mbrtelefone">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Senha de Acesso</label> <input
													class="form-control" type="text" name="mbrsenha">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Data de Nascimento</label> <input
													class="form_group" type="date" id="mbrnascimento"
													name="mbrdatanascimento" required>
											</div>

											<div class="form-group label-floating">
												<label class="control-label">Estado Civil</label> <select
													class="form_group" name="mbrestadocivil">
													<option value="1">Solteiro(a)</option>
													<option value="2">Divorciado(a)</option>
													<option value="3">Vi�vo(a)</option>
													<option value="4">Casado(a)</option>

												</select>
											</div>


											<div class="form-group label-floating">
												<label class="control-label">Sede</label> <select
													class="form_group" name="mbrsede">
													<option value="1">Sede Manaus</option>
												</select>
											</div>
											
											<div class="form-group label-floating">
												<label class="control-label">Filial</label> <select
													class="form_group" name="mbrfilial">
													<option value="">---- Selecionar Filial ----</option>
													<option value="1">Filial Campos Elisios</option>
													<option value="2">Filial Coroado</option>
													<option value="3">Filial Cachoeirinha</option>
												</select>
											</div>

											<div class="form-group label-floating">
												<label class="control-label">Ativo</label> <select
													class="form_group" name="mbrativo">
													<option value="1">Ativo</option>
													<option value="0">Desligado</option>
												</select>
											</div>

											<div class="form-group label-floating">
												<label class="control-label">N�vel de acesso</label> <select
													class="form_group" name="mbracesso">
													<option value="Administrador">Administrador</option>
													<option value="Usuario">Usu�rio</option>
												</select>
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Cargo</label> <select
													class="form_group" name="cargo">
													<option value="">---Selecione o Cargo---</option>
													<option value="10">Membro Comum</option>
													<option value="1">Pastor</option>
													<option value="2">Presbitero</option>
													<option value="3">Secretaria</option>
													<option value="4">Diacono</option>
													<option value="5">Porteiro</option>
													<option value="6">M�sico</option>
													<option value="7">Coral e Louvor</option>
													<option value="8">Ora��o e Intercess�o</option>
													<option value="9">Sonoplastia</option>
												</select>
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Rua</label> <input
													class="form-control" type="text" name="endrua">
											</div>

											<div class="form-group label-floating">
												<label class="control-label">N�mero</label> <input
													class="form-control" type="text" name="endnumero">
											</div>

											<div class="form-group label-floating">
												<label class="control-label">Bairro</label> <input
													class="form-control" type="text" name="endbairro">
											</div>

											<div class="form-group label-floating">
												<label class="control-label">CEP</label> <input
													class="form-control" type="text" name="endcep">
											</div>

											<div class="form-group label-floating">
												<label class="control-label">Cidade</label> <input
													class="form-control" type="text" name="endcidade">
											</div>
											<div class="form-group label-floating">
												<label class="control-label">Estado</label> <input
													class="form-control" type="text" name="endestado">
											</div>

											<div class="form-group">
												<label class="control-label">Photo</label>
												<div>
													<input type="text" readonly="" class="form-control"
														placeholder="Browse..."> <input type="file"
														id="mbrfoto" name="mbrfoto">
												</div>
											</div>



											<p class="text-center">

												<button type="submit" class="btn btn-info btn-raised btn-sm">
													<i class="zmdi zmdi-floppy"></i> Save
												</button>
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