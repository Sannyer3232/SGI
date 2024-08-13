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
<%
	MembroDAO daoMembro = new MembroDAO();
	DizimosOfertaDAO daoDizimosOferta = new DizimosOfertaDAO();
	PatrimonioDAO daoPatrimonio = new PatrimonioDAO();
	EventoDAO daoEvento = new EventoDAO();
	
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


%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SGI</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="./css/style.css">

    </head>
    <body>

<!------------------------------------------------------------------------BARRA DE NAVEGAÇÃO-------------------------------------------------------------------------->
<!------------------------------------------------------------------------------------------------------------------------------------------------------>

        <div class="container">
            <div class="navigation">
                <ul>
                    <li>
                        <a href="#">
                            <span class="icon"><img src="./assets/img/logo.png" alt="Logo SGI"></span>
                            <span class="title"><h2>SGI</h2></span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="btn-exit-system">
                            <span class="icon"><i class="fa fa-home" aria-hidden="true"></i></span>
                            <span class="title"> Painel Principal</span>
                            
                        </a>
                        
                    </li>
                    <li>
                        <a href="#">
                            <span class="icon"><i class="fa fa-users" aria-hidden="true"></i></span>
                            <span class="title"> Cadastro</span>
                            <div class="icon-nav">
                                <i class="fa fa-caret-down" aria-hidden="true"></i>
                            </div>
                        </a>
                        <!--<ul class="sub-menu">
                            <li><a href="#">Membros</a></li>
                            <li><a href="#">Filiais</a></li>
                            <li><a href="#">Grupos</a></li>
                            <li><a href="#">Tarefas</a></li>
                        </ul>-->
                    </li>
                    <li>
                        <a href="#">
                            <span class="icon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                            <span class="title"> Eventos</span>
                            <div class="icon-nav">
                                <i class="fa fa-caret-down" aria-hidden="true"></i>
                            </div>
                        </a>
                        
                    </li>
                    <li>
                        <a href="#">
                            <span class="icon"><i class="fa fa-line-chart" aria-hidden="true"></i></span>
                            <span class="title"> Financeiro</span>
                            <div class="icon-nav">
                                <i class="fa fa-caret-down" aria-hidden="true"></i>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="icon"><i class="fa fa-info-circle" aria-hidden="true"></i></span>
                            <span class="title"> Ajuda</span>
                        </a>
                    </li>
                    <li>
                        <a href="LogoutController">
                            <span class="icon"><i class="fa fa-power-off" aria-hidden="true"></i></span>
                            <span class="title"> Sair</span>
                        </a>
                    </li>
                </ul>

            </div>

<!------------------------------------------------------------------------MAIN-------------------------------------------------------------------------->
<!------------------------------------------------------------------------------------------------------------------------------------------------------>


            <div class="main">
                <div class="topbar">
                    <div class="toggle" onclick="toggleMenu();"></div>

                    <!--BARRA DE PESQUISA-->
                    <div class="search">
                        <label>
                            <input type="text" placeholder="Buscar">
                            <i class="fa fa-search" aria-hidden="true"></i>
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
                            <div class="numbers"><%=quantidadeMembros %></div>
                            <div class="cardName">Membros</div>
                        </div>
                        <div class="iconBox">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </div>
                    </div>
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


<!------------------------------------------------------------------------PAINEL PRINCIPAL - ANIVERSARIANTES-------------------------------------------------------------------------->
<!------------------------------------------------------------------------------------------------------------------------------------------------------>

                <div class="details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2>Aniversariantes do mês</h2>
                            <a href="#" class="btn">Geral</a>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <td>Foto</td>
                                    <td>Data</td>
                                    <td>Nome</td>
                                </tr>
                            </thead>
                            <tbody>
                            <%if(membros != null){
                            	for(MembroJavaBeans membro : membros){
                            		String dataFormatada = dataFormatter.format(membro.getMbrata_nascimento());
                            	
                            	%>
                            
                                <tr>
                                    <td width="60px"><div class="imgbx"><img src="img/<%=membro.getMbrfotoCaminho()%>"></div></td>
                                    <td><%=dataFormatada%></td>
                                    <td><span><%=membro.getMbrmemnome()%></span></td>
                                </tr>
                              <%}
                            	}%>
                                
                            </tbody>
                        </table>
                    </div>

<!------------------------------------------------------------------------PAINEL PRINCIPAL - EVENTOS -------------------------------------------------------------------------->
<!------------------------------------------------------------------------------------------------------------------------------------------------------>

                    <div class="eventosProximos">
                        <h2>Próximos Eventos</h2>
                            <div class="parent">
                            <%if(eventos != null){
                            	
                            	for(EventoJavaBeans evento : eventos){
                            		
                            		int mes = Integer.parseInt(dataMes.format(evento.getEvedata()));
                            		String horaFormatada = shf.format(evento.getEvehora());
                            	
                            	%>
                            
                                <div class="card">
                                    <div class="content-box">
                                        <span class="card-title"><%=evento.getEvetitulo() %></span>
                                        <p class="card-content">
                                            <i class="fa fa-clock-o" aria-hidden="true"><%=horaFormatada %></i> 
                                        </p>
                                        <span class="see-more">Ver mais</span>
                                    </div>
                                    <div class="date-box">
                                        <span class="month"><%=meses[mes-1] %></span>
                                        <span class="date"><%=dataDia.format(evento.getEvedata()) %></span>
                                    </div>
                                </div>
                              <%}
                            } %>
                            </div>
                    </div>

                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
        <script src="./js/my_chart.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>
        <script src="./js/script.js"></script>
        <script src="./js/jquery-3.1.1.min.js"></script>
	
    </body>
</html>
