<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.FilialJavaBeans"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.MembroJavaBeans"%>
<%@ page import="model.MembroDAO"%>
<%
MembroDAO dao = new MembroDAO();
ArrayList<FilialJavaBeans> filiais = (ArrayList<FilialJavaBeans>) request.getAttribute("filiais");
int totalPastor = dao.contarMembrosGrupo("Pastor");
int totalPresbitero = dao.contarMembrosGrupo("Presbítero");
int totalSecretaria = dao.contarMembrosGrupo("Secretaria");
int totalDiacono = dao.contarMembrosGrupo("Diácono");
int totalPorteiro = dao.contarMembrosGrupo("Porteiro");
int totalMusico = dao.contarMembrosGrupo("Músico");
int totalCoralLouvor = dao.contarMembrosGrupo("Coral de Louvor");
int totalOracao = dao.contarMembrosGrupo("Oração e Intercessão");
int totalSonoplastia = dao.contarMembrosGrupo("Sonoplastia");
int totalComum = dao.contarMembrosGrupo("Comum");
%><!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SGI - Grupos</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/cardgrupo.css">
 <link rel="stylesheet" href="./css/slider.css">


</head>

<body>
	<div class="container close">
		<div class="logo">
			<span class="icon"><img src="assets/img/logo.png"
				alt="Logo SGI"></span> <span class="title">SGI</span>
		</div>

		<ul class="nav-list">
			<li><a href="home.jsp"> <i class="fa fa-home"
					aria-hidden="true"></i> <span class="link-name"> Painel
						Principal</span>
			</a></li>

			<%
			if (session.getAttribute("nivel").equals("Administrador")) {
			%>
			<li><a href="grupos.jsp"> <i class="fa fa-users"
					aria-hidden="true"></i> <span class="link-name"> 
						Grupos</span>
			</a></li>
			<li>
				<div class="icon-link">
					<a href="#"> <i class="fa fa-users" aria-hidden="true"></i> <span
						class="link-name"> Cadastro </span>
					</a> <i class="fa fa-caret-down arrow" aria-hidden="true"></i>
				</div>

				<ul class="sub-menu">
					<li><a href="#" class="link-name"></a></li>
					<li><a href="cadastroMembros">Membros</a></li>
					<li><a href="cadastro_eventos.jsp">Eventos</a></li>
					<li><a href="cadastroTarefa">Tarefas</a></li>
				</ul>
			</li>
			<%
			}
			%>

			<li>
				<div class="icon-link">
					<a href="#"> <i class="fa fa-calendar" aria-hidden="true"></i>
						<span class="link-name"> Eventos</span>
					</a> <i class="fa fa-caret-down arrow" aria-hidden="true"></i>
				</div>

				<ul class="sub-menu">
					<li><a href="#" class="link-name"></a></li>
					<li><a href="MembroController">Aniversariantes</a></li>
					<li><a href="eventos.jsp">Cultos</a></li>
				</ul>
			</li>

			<li>
				<div class="icon-link">
					<a href="#"> <i class="fa fa-line-chart" aria-hidden="true"></i>
						<span class="link-name"> Financeiro</span>
					</a> <i class="fa fa-caret-down arrow" aria-hidden="true"></i>
				</div>

				<ul class="sub-menu">
					<li><a href="#" class="link-name"></a></li>
					<li><a href="metricas.jsp">Métricas</a></li>
					<li><a href="CadastroContas">Contas</a></li>
					<li><a href="membroparadizimo.jsp">Dízimos</a></li>
					<li><a href="cadastroDoacoes">Doações</a></li>
					<li><a href="membroparaoferta.jsp">Ofertas</a></li>
					<li><a href="cadastroPatrimonio">Patrimônios</a></li>
				</ul>
			</li>

			<li><a href="ajuda.jsp"> <i class="fa fa-info-circle"
					aria-hidden="true"></i> <span class="link-name"> Ajuda</span>
			</a></li>

			<li>
				<div class="profile-details">
					<div class="profile-content">
						<img src="img/<%out.print(session.getAttribute("userphoto"));%>"
							alt="">
					</div>

					<div class="name-job">
						<div class="name">
							<%
							out.print(session.getAttribute("username"));
							%>
						</div>
					</div>
					<a href="LogoutController"> <i class="fa fa-sign-out"
						aria-hidden="true"></i></a>
				</div>
			</li>
		</ul>
	</div>

	<div class="home-container">
		<div class="home-content">
			<div class="ic">
				<i class="fa fa-bars" aria-hidden="true"></i>
			</div>

			<!--BARRA DE PESQUISA-->
			<div class="search">
				<label> <input type="text" placeholder="Buscar"> <i
					class="fa fa-search" aria-hidden="true"></i>
				</label>
			</div>

			<!--BARRA DE USUÁRIO-->
			<div class="user">
				<img src="img/<%out.print(session.getAttribute("userphoto"));%>">
			</div>
		</div>
		<!------------------------------------------------------------------------OPÇÕES/HOME-CONTAINER-------------------------------------------------------------------------->
		<!------------------------------------------------------------------------------------------------------------------------------------------------------>
		<!------------------------------------------------------------------------HOME-CONTAINER-------------------------------------------------------------------------->
		<!------------------------------------------------------------------------------------------------------------------------------------------------------>

		<div class="container-grupo">
			<div class="card-grupo" onclick="listarGrupo('Pastor')">
				<div class="card-content">
					<div class="card-top">
						<span class="card-title">01.</span>
						<p>Pastores</p>
					</div>
					<div class="card-bottom">
						<span class="card-title">Cadastrados: <%=totalPastor%>
						</span>
					</div>
				</div>
				<div class="card-image">
					<i class="fa fa-users fa-5x" aria-hidden="true"></i>
				</div>
			</div>

			<div class="card-grupo" onclick="listarGrupo('Presbítero')">
				<div class="card-content">
					<div class="card-top">
						<span class="card-title">02.</span>
						<p>Presbíteros</p>
					</div>
					<div class="card-bottom">
						<span class="card-title">Cadastrados: <%=totalPresbitero%>
						</span>
					</div>
				</div>
				<div class="card-image">
					<i class="fa fa-users fa-5x" aria-hidden="true"></i>
				</div>
			</div>

			<div class="card-grupo" onclick="listarGrupo('Secretaria')">
				<div class="card-content">
					<div class="card-top">
						<span class="card-title">03.</span>
						<p>Secretaria</p>
					</div>
					<div class="card-bottom">
						<span class="card-title">Cadastrados: <%=totalSecretaria%>
						</span>
					</div>
				</div>
				<div class="card-image">
					<i class="fa fa-users fa-5x" aria-hidden="true"></i>
				</div>
			</div>

			<div class="card-grupo" onclick="listarGrupo('Diácono')">
				<div class="card-content">
					<div class="card-top">
						<span class="card-title">04.</span>
						<p>Diáconos</p>
					</div>
					<div class="card-bottom">
						<span class="card-title">Cadastrados: <%=totalDiacono%>
						</span>
					</div>
				</div>
				<div class="card-image">
					<i class="fa fa-users fa-5x" aria-hidden="true"></i>
				</div>
			</div>

			<div class="card-grupo" onclick="listarGrupo('Porteiro')">
				<div class="card-content">
					<div class="card-top">
						<span class="card-title">05.</span>
						<p>Porteiros</p>
					</div>
					<div class="card-bottom">
						<span class="card-title">Cadastrados: <%=totalPorteiro%>
						</span>
					</div>
				</div>
				<div class="card-image">
					<i class="fa fa-users fa-5x" aria-hidden="true"></i>
				</div>
			</div>

			<div class="card-grupo" onclick="listarGrupo('Músico')">
				<div class="card-content">
					<div class="card-top">
						<span class="card-title">06.</span>
						<p>Músicos</p>
					</div>
					<div class="card-bottom">
						<span class="card-title">Cadastrados: <%=totalMusico%>
						</span>
					</div>
				</div>
				<div class="card-image">
					<i class="fa fa-music fa-5x" aria-hidden="true"></i>
				</div>
			</div>

			<div class="card-grupo" onclick="listarGrupo('Coral de Louvor')">
				<div class="card-content">
					<div class="card-top">
						<span class="card-title">07.</span>
						<p>Coral de Louvor</p>
					</div>
					<div class="card-bottom">
						<span class="card-title">Cadastrados: <%=totalCoralLouvor%>
						</span>
					</div>
				</div>
				<div class="card-image">
					<i class="fa fa-music fa-5x" aria-hidden="true"></i>
				</div>
			</div>

			<div class="card-grupo" onclick="listarGrupo('Oração e Intercessão')">
				<div class="card-content">
					<div class="card-top">
						<span class="card-title">08.</span>
						<p>Oração e Intercessão</p>
					</div>
					<div class="card-bottom">
						<span class="card-title">Cadastrados: <%=totalOracao%>
						</span>
					</div>
				</div>
				<div class="card-image">
					<i class="fa fa-users fa-5x" aria-hidden="true"></i>
				</div>
			</div>

			<div class="card-grupo" onclick="listarGrupo('Sonoplastia')">
				<div class="card-content">
					<div class="card-top">
						<span class="card-title">09.</span>
						<p>Sonoplastia</p>
					</div>
					<div class="card-bottom">
						<span class="card-title">Cadastrados: <%=totalSonoplastia%>
						</span>
					</div>
				</div>
				<div class="card-image">
					<i class="fa fa-music fa-5x" aria-hidden="true"></i>
				</div>
			</div>

			<div class="card-grupo" onclick="listarGrupo('Comum')">
				<div class="card-content">
					<div class="card-top">
						<span class="card-title">10.</span>
						<p>Membros Comuns</p>
					</div>
					<div class="card-bottom">
						<span class="card-title">Cadastrados: <%=totalComum%>
						</span>
					</div>
				</div>
				<div class="card-image">
					<i class="fa fa-users fa-5x" aria-hidden="true"></i>
				</div>
			</div>


		</div>



		<script
			src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
		<script src="my_chart.js"></script>
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>
		<script src="./js/script.js"></script>
		<script src="./js/grupoListar.js"></script>
		<script src="./js/slider.js"></script>
</body>
v

</html>