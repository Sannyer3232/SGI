<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.MembroDAO" %>
<%@ page import="model.DizimosOfertaDAO" %>
<%@ page import="model.PatrimonioDAO" %>
<%@ page import="model.EventoDAO" %>
<%@ page import="model.MembroJavaBeans" %>
<%@ page import="model.EventoJavaBeans" %>
<%@ page import="controller.JSONGenerators" %>
<%
	MembroDAO daoMembro = new MembroDAO();
	DizimosOfertaDAO daoDizimosOferta = new DizimosOfertaDAO();
	PatrimonioDAO daoPatrimonio = new PatrimonioDAO();
	EventoDAO daoEvento = new EventoDAO();
	JSONGenerators json = new JSONGenerators();
	
	NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
	SimpleDateFormat dataFormatter = new SimpleDateFormat("dd/MM");
	SimpleDateFormat shf = new SimpleDateFormat("HH:mm");
	SimpleDateFormat dataDia = new SimpleDateFormat("dd");
	SimpleDateFormat dataMes = new SimpleDateFormat("MM");
	
	String quantidadeMembros = daoMembro.totalMembros();
	String totalDizimo = nf.format(daoDizimosOferta.totalDizimoOferta("Dizimo"));
	String totalOferta = nf.format(daoDizimosOferta.totalDizimoOferta("Oferta"));
	String totalPatrimonio = nf.format(daoPatrimonio.totalPatrimonio());
	
	ArrayList<MembroJavaBeans> membros = daoMembro.listarAniveriantes();
	ArrayList<EventoJavaBeans> eventos = daoEvento.listarEventoCard();
	String[] meses = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro",
			"Novembro", "Dezembro"};
	
	json.JSONListarTotalDizimoOferta("Dizimo");
	json.JSONListarTotalDizimoOferta("Oferta");
	json.JSONListarTotalcontas();
	
	


%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SGI</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="./css/style_chart.css">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
         <link rel="stylesheet" href="./css/slider.css">

    </head>
    <body>

<!------------------------------------------------------------------------BARRA DE NAVEGAÇÃO-------------------------------------------------------------------------->
<!------------------------------------------------------------------------------------------------------------------------------------------------------>

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
					aria-hidden="true"></i> <span class="link-name"> Grupos</span>
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
					<a href="LogoutController">
					
							<span class="icon"><i class="fa fa-sign-out" aria-hidden="true"></i></span>
							<span class="logout"> Logout</span>
						
					</a>
			</li>
		</ul>
	</div>


<!------------------------------------------------------------------------MAIN-------------------------------------------------------------------------->
<!------------------------------------------------------------------------------------------------------------------------------------------------------>
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

<!------------------------------------------------------------------------CARDS GERAIS-------------------------------------------------------------------------->
<!------------------------------------------------------------------------------------------------------------------------------------------------------>

                <div class="cardBox">
                    <div class="card">
                        <div>
                            <div class="numbers"><%=totalPatrimonio %></div>
                            <div class="cardName">Patrimônios</div>
                        </div>
                        <div class="iconBox">
                            <i class="fa fa-bar-chart" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="card">
                        <div>
                            <div class="numbers"><%=totalDizimo %></div>
                            <div class="cardName">Dízimo</div>
                        </div>
                        <div class="iconBox">
                            <i class="fa fa-money" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="card">
                        <div>
                            <div class="numbers"><%=totalOferta %></div>
                            <div class="cardName">Ofertas</div>
                        </div>
                        <div class="iconBox">
                            <i class="fa fa-usd" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>


<!------------------------------------------------------------------------GRÁFICOS-------------------------------------------------------------------------->
<!------------------------------------------------------------------------------------------------------------------------------------------------------>

                <div class="graphBox">
                    
                    <div class="box">
                        <canvas id="myChart"></canvas>
                    </div>
                    <div class="box">
                        <canvas id="earning"></canvas>
                    </div>

                </div>


            </div>
		    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
        <script src="./js/my_chart.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>
        <script src="./js/script.js"></script>
        <script src="./js/jquery-3.1.1.min.js"></script>
        <script src="./js/slider.js"></script>
	
    </body>
    
<div class="janela-modal-ajuda" id="janela-modal-ajuda">
	<div class="modal-ajuda">
		<button class="fechar" id="fechar-ajuda">X</button>
		<div class="container-modal-ajuda">
			<h1 class="modal-titulo"></h1>
			<h2 class=modal-subtitulo id="modal-subtitulo">Grave na Memória
				a palavra: Benção</h2>
			<div class="container-slide">
				<i id="left" class="fa fa-chevron-left" aria-hidden="true"></i>
				<div class="slider">
					<div class="slides">
						<!-- Slides Imagens -->
						<div class="slide first">

							<img src="assets/img/Acessando_eventos.gif" alt="imagem1">
						</div>
						<div class="slide">
							<img src="assets/img/cadastrando_eventos.gif" alt="imagem2">
						</div>
						<div class="slide">
							<img src="assets/img/Pesquisar_membro.gif" alt="imagem3">
						</div>
						<div class="slide">
							<img src="assets/img/cadastro_dizimo.gif" alt="imagem4">
						</div>
						<div class="slide">
							<img src="assets/img/consulta_e_emissão_relatorio_ofertap.gif"
								alt="imagem5">
						</div>
						<div class="slide" id="slide-final">

							<a class="link-mais-ajuda" href="ajuda.jsp">Para mais ajuda,
								clique aqui!</a>
							<div class="info" id="info">
								<div class="info__icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="24"
										viewBox="0 0 24 24" height="24" fill="none">
										<path fill="#393a37"
											d="m12 1.5c-5.79844 0-10.5 4.70156-10.5 10.5 0 5.7984 4.70156 10.5 10.5 10.5 5.7984 0 10.5-4.7016 10.5-10.5 0-5.79844-4.7016-10.5-10.5-10.5zm.75 15.5625c0 .1031-.0844.1875-.1875.1875h-1.125c-.1031 0-.1875-.0844-.1875-.1875v-6.375c0-.1031.0844-.1875.1875-.1875h1.125c.1031 0 .1875.0844.1875.1875zm-.75-8.0625c-.2944-.00601-.5747-.12718-.7808-.3375-.206-.21032-.3215-.49305-.3215-.7875s.1155-.57718.3215-.7875c.2061-.21032.4864-.33149.7808-.3375.2944.00601.5747.12718.7808.3375.206.21032.3215.49305.3215.7875s-.1155.57718-.3215.7875c-.2061.21032-.4864.33149-.7808.3375z"></path></svg>
								</div>
								<div class="info__title" id="info__title"></div>
								<div class="info__close" id="info_close">
									<svg height="20" viewBox="0 0 20 20" width="20"
										xmlns="http://www.w3.org/2000/svg">
										<path
											d="m15.8333 5.34166-1.175-1.175-4.6583 4.65834-4.65833-4.65834-1.175 1.175 4.65833 4.65834-4.65833 4.6583 1.175 1.175 4.65833-4.6583 4.6583 4.6583 1.175-1.175-4.6583-4.6583z"
											fill="#393a37"></path></svg>
								</div>
							</div>
							<div class="form-container-geral">
								<div class="formularios-container">
									<div class="forms">
										<div class="form-title">
											<h2>Digite a palavra do início</h2>
										</div>
										<form id="verificacao-form">
											
										<div class="form">
											<div class="column">
												<div class="input-box">
													<label>Resposta</label>
													<input required="" placeholder="Digite a palavra" type="text" name="resposta" id="resposta">
												</div>
											
										</div>
										<br>
										<div class="submit">
											<button  id="btn-sim" type="submit">Responder</button>
										</div>
										</div>
										
											
									
									</form>
								</div>
							</div>
						</div>
							

                        </div>
            
					</div>
				
            </div>
        
           
        	<i id="right" class="fa fa-chevron-right" aria-hidden="true"></i>
                
            </div>
            
        </div>
    </div>
</div>

<div class="card-mensagem-ajuda" id="card-mensagem-ajuda">
	<p class="time-text"><span>Precisando de Ajuda com o sistema?</span></p>
	<div class="day-text">
		<button id="btn-sim" type="button" onclick="abrirModalAjuda()">Sim</button>
		<button id="btn-nao" type="button">Não</button>
	</div>
	<div class="moon">
		<button class="fechar-mensagem-ajuda" id="fechar-mensagem-ajuda">X</button>
	</div>
</div>
</html>
