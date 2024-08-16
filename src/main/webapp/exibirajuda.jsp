<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Pesquisa de Membros</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/questionario.css">
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
						<li><a href="MembroController"><i
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
		<!-- Content page -->
		<div class="container-fluid">
			<div class="page-header">
				<h1 class="text-titles">
					<i class="zmdi zmdi-pin-help"></i> Ajuda <small>vídeo</small>
				</h1>

			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">


					<ul class="nav nav-tabs" style="margin-bottom: 15px;">

						<li><a href="ajuda.jsp">Voltar</a></li>

					</ul>

					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="new">
							<div class="container-fluid">
								<div class="row">
									<div class="col-xs-12 col-md-10 col-md-offset-1">
                                         <div class="video-questionario-container" style="display: flex; flex-direction: column; align-items: center;" gap="10px;">
        <div class="video" id="video-container" style="width: 100%; max-width: 800px; margin-bottom: 20px;">
      
        </div>

<div class="informacao" id="informacao">
  <div class="icon-container">
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 24 24"
      stroke-width="0"
      fill="currentColor"
      stroke="currentColor"
      class="icon"
    >
      <path
        d="M13 7.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm-3 3.75a.75.75 0 0 1 .75-.75h1.5a.75.75 0 0 1 .75.75v4.25h.75a.75.75 0 0 1 0 1.5h-3a.75.75 0 0 1 0-1.5h.75V12h-.75a.75.75 0 0 1-.75-.75Z"
      ></path>
      <path
        d="M12 1c6.075 0 11 4.925 11 11s-4.925 11-11 11S1 18.075 1 12 5.925 1 12 1ZM2.5 12a9.5 9.5 0 0 0 9.5 9.5 9.5 9.5 0 0 0 9.5-9.5A9.5 9.5 0 0 0 12 2.5 9.5 9.5 0 0 0 2.5 12Z"
      ></path>
    </svg>
  </div>
  <div class="message-text-container">
    <p class="message-text">Atenção</p>
    <p class="sub-text" id="sub-text"></p>
  </div>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    viewBox="0 0 15 15"
    stroke-width="0"
    fill="none"
    stroke="currentColor"
    class="cross-icon"
	id ="fechar"
  >
    <path
      fill="currentColor"
      d="M11.7816 4.03157C12.0062 3.80702 12.0062 3.44295 11.7816 3.2184C11.5571 2.99385 11.193 2.99385 10.9685 3.2184L7.50005 6.68682L4.03164 3.2184C3.80708 2.99385 3.44301 2.99385 3.21846 3.2184C2.99391 3.44295 2.99391 3.80702 3.21846 4.03157L6.68688 7.49999L3.21846 10.9684C2.99391 11.193 2.99391 11.557 3.21846 11.7816C3.44301 12.0061 3.80708 12.0061 4.03164 11.7816L7.50005 8.31316L10.9685 11.7816C11.193 12.0061 11.5571 12.0061 11.7816 11.7816C12.0062 11.557 12.0062 11.193 11.7816 10.9684L8.31322 7.49999L11.7816 4.03157Z"
      clip-rule="evenodd"
      fill-rule="evenodd"
    ></path>
  </svg>
</div>

		<div class="questao1"  id="questao1">
        <div class="card" style="width: 100%; max-width: 800px;">
			
            <div class="tools">
                <div class="circle">
                    <span class="red box"></span>
                </div>
                <div class="circle">
                    <span class="yellow box"></span>
                </div>
                <div class="circle">
                    <span class="green box"></span>
                </div>
            </div>
			<h3>Questionário de fixação: Membros!</h3>
            <div class="card__content">
				
				
                <form id="questionario">
					
					<!-- Pergunta 1 -->
					<p>1) No caso do membro não possuir superior, como esse campo deve ser preenchido?</p>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Preencher com "0"
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Deixar vazio
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Com o prórprio nome do membro
						  </label>
						
					</div>
				
					<!-- Pergunta 2 -->
					<p>2) Qual o a informação necessária para buscar um membro?</p>

					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Número de CPF
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="b" />
							<div class="cr-input"></div>
							B) E-mail
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Nome
						  </label>
					</div>
					
					<!-- Pergunta 3 -->
					<p>3) Uma vez desligado, o membro pode ser religado?</p>
					
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Sim, mas refazendo o cadastro
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Sim, apenas atualizando o campo "Ativo"
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Não, não pode mais ser religado
						  </label>
						
					</div>

						<button type="button" onclick="verificarRespostas(1)" class="button">
						<span class="button-content">Verificar Respostas </span>
						</button>

			
				</form>
				
            </div>
        </div>
	</div>
	<div class="questao2"  id="questao2">
		<div class="card" style="width: 100%; max-width: 800px;">
			
            <div class="tools">
                <div class="circle">
                    <span class="red box"></span>
                </div>
                <div class="circle">
                    <span class="yellow box"></span>
                </div>
                <div class="circle">
                    <span class="green box"></span>
                </div>
            </div>
			<h3>Questionário de fixação: Tarefas!</h3>
            <div class="card__content">
                <form id="questionario">
					<!-- Pergunta 1 -->
					<p>1) Quais os status possíveis de uma tarefa?</p>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Agendado e Conluído
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Agendado, Atrasado e Cancelado
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Agendado, Conluído, Cancelado e Atrasado
						  </label>
						
					</div class="alternativa">
				
					<!-- Pergunta 2 -->
					<p>2) Qual cor representa as tarefas agendadas sem atraso?</p>

					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Verde
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Azul
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Amarelo
						  </label>
						</div>
					

			
				
					<!-- Pergunta 3 -->
					<p>3) Como a listagem das Tarefas estar disposta ?</p>
					
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Necessário pesquisar uma por uma
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="b" />
							<div class="cr-input"></div>
							B) São todas Listadas, independente do status
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="c" />
							<div class="cr-input"></div>
							C) As atividades agendadas e atrasadas são listadas na mesma tela,<br> quanto as outras possuem sua prórpria tela
						  </label>
						
					</div >

						<button type="button" onclick="verificarRespostas(2)" class="button">
						<span class="button-content">Verificar Respostas </span>
						</button>

			
				</form>
				
            </div>
        </div>
		</div>
		<div class="questao3"  id="questao3">

		<div class="card" style="width: 100%; max-width: 800px;">
            <div class="tools">
                <div class="circle">
                    <span class="red box"></span>
                </div>
                <div class="circle">
                    <span class="yellow box"></span>
                </div>
                <div class="circle">
                    <span class="green box"></span>
                </div>
            </div>
			<h3>Questionário de fixação: Contas!</h3>
            <div class="card__content">
                <form id="questionario">
					<!-- Pergunta 1 -->
					<p>1) Com relação ao fornecedor, qual o dado a ser preenchido?</p>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="a" />
							<div class="cr-input"></div>
							A) CPF/CNPJ do fornecedor
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Nome do fornecedor
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Número de telefone
						  </label>
						
					</div>
				
					<!-- Pergunta 2 -->
					<p>2) Como as contas são listadas ?</p>

					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Por fornecedor
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Por filial
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Todas as contas são listadas
						  </label>
						</div>
					

			
				
					<!-- Pergunta 3 -->
					<p>3) O que ocorre quando se confirma deleção de um registro de uma conta?</p>
					
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="a" />
							<div class="cr-input"></div>
							A) O Registro é apagado permanentemente
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Nada acontece
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Apenas some da lista, mas é possível recuperar depois
						  </label>
						
					</div>

						<button type="button" onclick="verificarRespostas(3)" class="button">
						<span class="button-content">Verificar Respostas </span>
						</button>

			
				</form>
				
            </div>
        </div>
		</div>
		<div class="questao4"  id="questao4">
		<div class="card" style="width: 100%; max-width: 800px;">
            <div class="tools">
                <div class="circle">
                    <span class="red box"></span>
                </div>
                <div class="circle">
                    <span class="yellow box"></span>
                </div>
                <div class="circle">
                    <span class="green box"></span>
                </div>
            </div>
			<h3>Questionário de fixação: Patrimonio'!</h3>
            <div class="card__content">
                <form id="questionario">
					<!-- Pergunta 1 -->
					<p>1) O que devo considerar como patrimônio?</p>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Objetos, ou bens, pertencentes a igreja
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Apenas dinheiro
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Materiais de limpeza
						  </label>
						
					</div>
				
					<!-- Pergunta 2 -->
					<p>2) Em quais estados o patrimônio pode ser cadastrado ?</p>

					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Apenas como novo
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Novo ou usado
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Novo, usado ou danificado
						  </label>
						</div>


			
				
					<!-- Pergunta 3 -->
					<p>3) Como é listado os patrimônios ?</p>
					
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Por filial
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Por nome do patrimônio
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Por estado
						  </label>
						
					</div>

						<button type="button" onclick="verificarRespostas(4)" class="button">
						<span class="button-content">Verificar Respostas </span>
						</button>

			
				</form>
				
            </div>
        </div>
		</div>

		<div class="questao5"  id="questao5">

		<div class="card" style="width: 100%; max-width: 800px;" >
            <div class="tools">
                <div class="circle">
                    <span class="red box"></span>
                </div>
                <div class="circle">
                    <span class="yellow box"></span>
                </div>
                <div class="circle">
                    <span class="green box"></span>
                </div>
            </div>
			<h3>Questionário de fixação: Dízimos!</h3>
            <div class="card__content">
                <form id="questionario">
					<!-- Pergunta 1 -->
					<p>1) Qual o primeiro passo para cadastrado de dízimo?</p>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Infomrmar o valor do dízimo
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Infomrmar a data da contribuíção
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao1" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Pesquisar o membro pelo nome ou sobrenome
						  </label>
						
					</div>
				
					<!-- Pergunta 2 -->
					<p>2) Como é feito a consulta dos registro de dízimos?</p>

					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Por filial
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Pelo mês e ano que se quer consultar
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao2" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Apenas pelo ano
						  </label>
						</div>	
			

			
				
					<!-- Pergunta 3 -->
					<p>3) É possível emitir algum relatório?</p>
					
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="a" />
							<div class="cr-input"></div>
							A) Sim, um relátorio com os registro da consulta realizada previamente
						  </label>
					</div>
					<div class="alternativa">
						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="b" />
							<div class="cr-input"></div>
							B) Sim, um relatório de todos os registros existentes
						  </label>
						
					</div>
					<div class="alternativa">

						<label class="cr-wrapper">
							<input name="questao3" type="radio" value="c" />
							<div class="cr-input"></div>
							C) Não, não possui essa funcionalidade
						  </label>
						
					</div c>

						<button type="button" onclick="verificarRespostas(5)" class="button">
						<span class="button-content">Verificar Respostas </span>
						</button>

			
				</form>
				
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
	   <script src="./js/videos.js"></script>
	  <script src="./js/verificarRespostas.js"></script>
</body>
</html>