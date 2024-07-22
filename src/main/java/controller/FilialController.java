package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FilialJavaBeans;
import model.MembroDAO;

/**
 * Servlet implementation class FilialController
 */
@WebServlet(name = "FilialControllers", urlPatterns = { "/FilialControllers" })
public class FilialController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MembroDAO dao = new MembroDAO();
    public FilialController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
		dao.testeConexao();
		ArrayList<FilialJavaBeans> lista = dao.listarFiliais();
		for(int i = 0; i < lista.size(); i++) {
			System.out.println(lista.get(i).getIdfilial());
			System.out.println(lista.get(i).getFilnome());
		}
		
	}
	protected void listarFilial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<FilialJavaBeans> lista = dao.listarFiliais();
		request.setAttribute("filiais", lista);
		RequestDispatcher rd = request.getRequestDispatcher("cadastroMembros.jsp");
		rd.forward(request, response);

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
