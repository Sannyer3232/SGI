package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import model.DoacoesDAO;
import model.DoacoesJavaBeans;
import model.FilialDAO;
import model.FilialJavaBeans;

@WebServlet(urlPatterns = { "/ControllerDoacoes", "/maindoacao", "/insertdoacao", "/selectdoacao", "/updatedoacao",
		"/deletedoacao", "/reportdoacao", "/cadastroDoacoes"})
public class ControllerDoacao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DoacoesDAO dao = new DoacoesDAO();
	DoacoesJavaBeans doacao = new DoacoesJavaBeans();
	FilialDAO daoFilial = new FilialDAO();
	FilialJavaBeans filial = new FilialJavaBeans();

	public ControllerDoacao() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getServletPath();

		System.out.println(action);
		if (action.equals("/maindoacao")) {
			doacao(request, response);
		} else if (action.equals("/insertdoacao")) {
			try {
				novaDoacao(request, response);
				System.out.println(action);
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (action.equals("/selectdoacao")) {
			listarDoacao(request, response);
		} else if (action.equals("/updatedoacao")) {
			editarDoacao(request, response);
		} else if (action.equals("/deletedoacao")) {
			removerDoacao(request, response);
		} else if (action.equals("/reportdoacao")) {
			comprovanteDoacao(request, response);
		} else if(action.equals("/cadastroDoacoes")) {
			listarFilial(request, response);
		}else {
		
			response.sendRedirect("cadastrodoacoes.jsp");
		}
	}

	// Listar Doações cadastradas
	protected void doacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int filial = Integer.parseInt(request.getParameter("doaidfilial"));
		System.out.println(filial);

		// Criando um objeto que irá receber os dados JavaBeansDoacoes
		ArrayList<DoacoesJavaBeans> lista = dao.listarDoacao(filial);
		request.setAttribute("doacao", lista);
		RequestDispatcher rd = request.getRequestDispatcher("listardoacoes.jsp");
		rd.forward(request, response);
	}
	protected void listarFilial(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ArrayList<FilialJavaBeans> filiais = daoFilial.listarFilial();
		request.setAttribute("filiais", filiais);
		RequestDispatcher rd = request.getRequestDispatcher("cadastrodoacoes.jsp");
		rd.forward(request, response);
		
	
	}

	// NOVA DOAÇÃO
	protected void novaDoacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Setar as variáveis JavaBeansDoacao
		doacao.setDoanomedoador(request.getParameter("doanomedoador"));
		doacao.setDoamembroid(request.getParameter("doamembroid"));
		doacao.setDoadescricao(request.getParameter("doadescricao"));
		String dateStr = request.getParameter("doadtdoacao");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			doacao.setDoadtdoacao(sdf.parse(dateStr));

		} catch (Exception e) {

		}
		doacao.setDoavalor(Double.parseDouble(request.getParameter("doavalor")));
		doacao.setStatus(request.getParameter("status"));
		doacao.setDoaidfilial(request.getParameter("doaidfilial"));

		// Invocar o método inserirDoacao passando o objeto doacao
		if (dao.inserirdoacao(doacao)) {
			// redirecionar para o documento com parametro para exibir tela de cadastro
			// realizado
			response.sendRedirect("cadastroDoacoes?success=true");

		} else {
			// redirecionar para o documento com parametro para exibir tela de falha no
			// cadastro
			response.sendRedirect("cadastroDoacoes?success=false");

		}

	}

	// EDITAR Doacao
	protected void listarDoacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String iddoacao = request.getParameter("iddoacao");
		System.out.println(iddoacao);

		doacao = dao.selecionarDoacao(iddoacao);
		request.setAttribute("iddoacao", doacao.getIddoacao());
		request.setAttribute("doanomedoador", doacao.getDoanomedoador());
		request.setAttribute("doamembroid", doacao.getDoamembroid());
		request.setAttribute("doadescricao", doacao.getDoadescricao());
		request.setAttribute("doadtdoacao", doacao.getDoadtdoacao());
		request.setAttribute("doavalor", doacao.getDoavalor());
		request.setAttribute("status", doacao.getStatus());
		request.setAttribute("doaidfilial", doacao.getDoaidfilial());
		System.out.println();

		RequestDispatcher rd = request.getRequestDispatcher("editardoacoes.jsp");
		rd.forward(request, response);
	}

	protected void editarDoacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doacao.setIddoacao(request.getParameter("iddoacao"));
		doacao.setDoanomedoador(request.getParameter("doanomedoador"));
		doacao.setDoamembroid(request.getParameter("doamembroid"));
		doacao.setDoadescricao(request.getParameter("doadescricao"));
		String dateStr = request.getParameter("doadtdoacao");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			doacao.setDoadtdoacao(sdf.parse(dateStr));

		} catch (Exception e) {

		}
		doacao.setDoavalor(Double.parseDouble(request.getParameter("doavalor")));
		doacao.setStatus(request.getParameter("status"));
		doacao.setDoaidfilial(request.getParameter("doaidfilial"));

		if (dao.alterarDoacao(doacao)) {
			response.sendRedirect("cadastroDoacoes?success=true-edit");
		} else {
			response.sendRedirect("cadastroDoacoes?success=false-edit");
		}

		System.out.println("Matricula do membro na edicao: " + doacao.getDoamembroid());
		System.out.println("doaidfilial: " + doacao.getDoaidfilial());
	}

	// REMOVER DOAÇÃO
	protected void removerDoacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// recebimento do id do patrimonio a ser removido
		String iddoacao = request.getParameter("iddoacao");
		System.out.println("ID para remoção: " + iddoacao);
		// setar a variavel idpatrimonio JavabeansDoacao
		doacao.setIddoacao(iddoacao);
		// executar o metodo deletarDoacao (DAODOACAO) passando o objeto doacao
		dao.deletarDoacao(doacao);
		// redirecionar para o documento atualizando as alterações
		response.sendRedirect("cadastrodoacoes.jsp");
	}

	// COMPROVANTE DOAÇÃO
	protected void comprovanteDoacao(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    // Criando um objeto de documento para gerar o PDF
	    Document documento = new Document();
	    try {
	        // Definindo o tipo de conteúdo como PDF
	        response.setContentType("apllication/pdf");
	        // Definindo o cabeçalho para o nome do arquivo PDF
	        response.addHeader("Content-Disposition", "inline; filename=comprovante.pdf");
	        // Inicializando o PdfWriter com o OutputStream da resposta
	        PdfWriter.getInstance(documento, response.getOutputStream());
	        
	        // Abrindo o documento para adicionar conteúdo
	        documento.open();
	        documento.add(new Paragraph("Comprovante de doação: "));
	        documento.add(new Paragraph(" "));
	       
	        
	        // Criando e configurando a tabela
	        
	        PdfPTable tabela = new PdfPTable(7);
	        PdfPCell col1 = new PdfPCell(new Paragraph("Nome"));
	        PdfPCell col2 = new PdfPCell(new Paragraph("Cod Membro"));
	        PdfPCell col3 = new PdfPCell(new Paragraph("Descriçao"));
	        PdfPCell col4 = new PdfPCell(new Paragraph("Data"));
	        PdfPCell col5 = new PdfPCell(new Paragraph("Valor"));
	        PdfPCell col6 = new PdfPCell(new Paragraph("Status"));
	        PdfPCell col7 = new PdfPCell(new Paragraph("Filial"));
	        tabela.addCell(col1);
	        tabela.addCell(col2);
	        tabela.addCell(col3);
	        tabela.addCell(col4);
	        tabela.addCell(col5);
	        tabela.addCell(col6);
	        tabela.addCell(col7);
	        
	        // Populando a tabela com dados
	        String iddoacao = request.getParameter("iddoacao");
	        DoacoesJavaBeans doacao = dao.selecionarDoacao(iddoacao);
	        tabela.addCell(doacao.getDoanomedoador());
	        tabela.addCell(doacao.getDoamembroid());
	        tabela.addCell(doacao.getDoadescricao());
	        tabela.addCell(doacao.getDoadtdoacao().toString());
	        tabela.addCell(String.valueOf(doacao.getDoavalor()));
	        tabela.addCell(doacao.getStatus());
	        tabela.addCell(doacao.getDoaidfilial());
	        
	        documento.add(tabela);
	        documento.close();
	     
	        
	    } catch (Exception e) {
	        System.out.println(e);
	        documento.close();
	    } finally {
	        if (documento.isOpen()) {
	            documento.close();
	        }
	    }
	}
	
}
