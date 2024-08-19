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
					<li><a href="grupos.jsp"> <i class="fa fa-home"
					aria-hidden="true"></i> <span class="link-name"> Painel
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
		<div class="grupo-conteiner">
            <article class="full-box tile" onclick="listarGrupo('Pastor')" id="card-grupo">
                <div
                    class="full-box tile-title text-center text-titles text-uppercase">
                    Pastores</div>
                <div class="full-box tile-icon text-center">
                    <i class="zmdi zmdi-accounts"></i>
                </div>
                <div class="full-box tile-number text-titles">
                    <p class="full-box"><%=totalPastor%></p>
                    <small>Cadastrados</small>
                </div>
            </article>
            <article class="full-box tile" onclick="listarGrupo('Presbítero')" id="card-grupo">
                <div
                    class="full-box tile-title text-center text-titles text-uppercase">
                    Presbítero</div>
                <div class="full-box tile-icon text-center">
                    <i class="zmdi zmdi-accounts"></i>
                </div>
                <div class="full-box tile-number text-titles">
                    <p class="full-box"><%=totalPresbitero%></p>
                    <small>Cadastrados</small>
                </div>
            </article>
            <article class="full-box tile" onclick="listarGrupo('Secretaria')" id="card-grupo">
                <div
                    class="full-box tile-title text-center text-titles text-uppercase">
                    Secretaria</div>
                <div class="full-box tile-icon text-center">
                    <i class="zmdi zmdi-accounts"></i>
                </div>
                <div class="full-box tile-number text-titles">
                    <p class="full-box"><%=totalSecretaria%></p>
                    <small>Cadastrados</small>
                </div>
            </article>
            <article class="full-box tile" onclick="listarGrupo('Diácono')" id="card-grupo">
                <div
                    class="full-box tile-title text-center text-titles text-uppercase">
                    Diácono</div>
                <div class="full-box tile-icon text-center">
                    <i class="zmdi zmdi-accounts"></i>
                </div>
                <div class="full-box tile-number text-titles">
                    <p class="full-box"><%=totalDiacono%></p>
                    <small>Cadastrados</small>
                </div>
            </article> 
            <article class="full-box tile" onclick="listarGrupo('Porteiro')" id="card-grupo">
                <div
                    class="full-box tile-title text-center text-titles text-uppercase">
                    Porteiro</div>
                <div class="full-box tile-icon text-center">
                    <i class="zmdi zmdi-accounts"></i>
                </div>
                <div class="full-box tile-number text-titles">
                    <p class="full-box"><%=totalPorteiro%></p>
                    <small>Cadastrados</small>
                </div>
            </article>
            <article class="full-box tile" onclick="listarGrupo('Músico')" id="card-grupo">
                <div
                    class="full-box tile-title text-center text-titles text-uppercase">
                    Músico</div>
                <div class="full-box tile-icon text-center">
                    <i class="zmdi zmdi-accounts"></i>
                </div>
                <div class="full-box tile-number text-titles">
                    <p class="full-box"><%=totalMusico%></p>
                    <small>Cadastrados</small>
                </div>
            </article>
            <article class="full-box tile" onclick="listarGrupo('Coral de Louvor')" id="card-grupo">
                <div
                    class="full-box tile-title text-center text-titles text-uppercase">
                    Coral de Louvor</div>
                <div class="full-box tile-icon text-center">
                    <i class="zmdi zmdi-accounts"></i>
                </div>
                <div class="full-box tile-number text-titles">
                    <p class="full-box"><%=totalCoralLouvor%></p>
                    <small>Cadastrados</small>
                </div>
            </article>
            <article class="full-box tile" onclick="listarGrupo('Oração e Intercessão')" id="card-grupo">
                <div
                    class="full-box tile-title text-center text-titles text-uppercase">
                    Oração e Intercessão</div>
                <div class="full-box tile-icon text-center">
                    <i class="zmdi zmdi-accounts"></i>
                </div>
                <div class="full-box tile-number text-titles">
                    <p class="full-box"><%=totalOracao%></p>
                    <small>Cadastrados</small>
                </div>
            </article>
            <article class="full-box tile" onclick="listarGrupo('Sonoplastia')" id="card-grupo">
                <div
                    class="full-box tile-title text-center text-titles text-uppercase">
                    Sonoplastia</div>
                <div class="full-box tile-icon text-center">
                    <i class="zmdi zmdi-accounts"></i>
                </div>
                <div class="full-box tile-number text-titles">
                    <p class="full-box"><%=totalSonoplastia%></p>
                    <small>Cadastrados</small>
                </div>
            </article>
            <article class="full-box tile" onclick="listarGrupo('Comum')" id="card-grupo">
                <div
                    class="full-box tile-title text-center text-titles text-uppercase">
                    Membros Comuns</div>
                <div class="full-box tile-icon text-center">
                    <i class="zmdi zmdi-accounts"></i>
                </div>
                <div class="full-box tile-number text-titles">
                    <p class="full-box"><%=totalComum%></p>
                    <small>Cadastrados</small>
                </div>
            </article>
        </div>
        


		<script
			src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
		<script src="my_chart.js"></script>
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>
		<script src="./js/script.js"></script>
        <script src="./js/grupoListar.js"></script>
</body>

</html>