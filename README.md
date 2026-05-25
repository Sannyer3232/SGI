# SGI - Sistema de Gerenciamento de Igreja

O **SGI** é uma aplicação web completa desenvolvida para facilitar a administração de igrejas e congregações. O sistema permite o controle de membros, gestão financeira (dízimos, ofertas e contas), gerenciamento de patrimônio, tarefas e eventos.

## 🚀 Funcionalidades Principais

*   **Gestão de Membros:** Cadastro completo com foto, controle de status (ativo/inativo), cargos, filiais e acompanhamento de aniversariantes.
*   **Financeiro:** Registro e consulta de dízimos e ofertas, além de um módulo para controle de contas a pagar/receber.
*   **Patrimônio:** Inventário de bens da igreja.
*   **Eventos e Tarefas:** Organização de cronogramas, atribuição de tarefas e gestão de eventos da comunidade.
*   **Segurança:** Filtro de autenticação para proteger rotas restritas e criptografia de senhas (MD5).
*   **Relatórios:** Geração de documentos (PDF) e visualização de métricas de crescimento.

## 🛠️ Tecnologias Utilizadas

*   **Linguagem:** Java (Java EE - Servlets)
*   **Frontend:** JSP (JavaServer Pages), HTML5, CSS3, JavaScript (jQuery e Bootstrap)
*   **Banco de Dados:** MySQL
*   **Bibliotecas:** 
    *   `mysql-connector-j` (Conectividade com banco)
    *   `itextpdf` (Geração de PDFs)
    *   `json-simple` (Manipulação de dados JSON)
    *   `commons-fileupload` (Upload de fotos dos membros)

## 📋 Pré-requisitos e Instalação

Como este é um projeto **Eclipse Dynamic Web Project** (sem Maven/Gradle), siga estes passos:

1.  **Banco de Dados:**
    *   Certifique-se de ter o MySQL instalado.
    *   Execute os scripts localizados em `src/main/SQL/` na ordem: `scriptbancoSGI.sql`, `scriptSGI.sql` e `PROCEDURES SGI.sql`.
    *   A base de dados padrão é `bdsgi` com usuário/senha `root`.

2.  **Ambiente de Desenvolvimento:**
    *   Importe o projeto no **Eclipse IDE for Enterprise Java**.
    *   Configure um servidor de aplicação (recomendado **Apache Tomcat 9.0**).
    *   Certifique-se de que os arquivos `.jar` em `src/main/webapp/WEB-INF/lib` estão no seu *Build Path*.

3.  **Execução:**
    *   Clique com o botão direito no projeto > `Run As` > `Run on Server`.

## 👥 Desenvolvedores (Créditos)

Este projeto foi desenvolvido como parte de um esforço colaborativo por:

*   **Fani Tamires de Souza Batista**
*   **Wallace Almeida dos Santos**
*   **Sannyer Cardoso Carvalho Nery**

---
*Este projeto é software livre sob a licença [MIT](LICENSE).*
