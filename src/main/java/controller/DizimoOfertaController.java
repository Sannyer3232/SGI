package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DizimosOferta;
import model.DizimosOfertaDAO;
import model.MembroDAO;

/**
 * Servlet implementation class DizimoOfertaController
 */
@WebServlet(urlPatterns = { "/DizimoOfertaController", "/insertDizimo", "/insertOferta" ,"/consultaDizimo","/desativaDizOferta"})
public class DizimoOfertaController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private DizimosOfertaDAO dao = new DizimosOfertaDAO();
    private MembroDAO mbrdao = new MembroDAO();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DizimoOfertaController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected synchronized void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().append("Served at: ").append(request.getContextPath());
        String action = request.getServletPath();
        
        if (action.equals("/insertDizimo")) {
            try {
            	novoDizimo(request, response);
            } catch (Exception e) {
                e.printStackTrace(); 
            }
        }else if(action.equals("/insertOferta")) {
        	try {
				novaOferta(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
        }else if(action.equals("/consultaDizimo")) {
        	try {
        		consultaDizimoOferta(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
        }else if(action.equals("/desativaDizOferta")) {
        	try {
        		excluirDizimoOferta(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
        	
        }
    }

    protected void novoDizimo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DizimosOferta dizimoOferta = new DizimosOferta();
        
        dizimoOferta.setDzombrid(Integer.parseInt(request.getParameter("dzombrid")));
        dizimoOferta.setDzotipo(request.getParameter("dzotipo"));
        dizimoOferta.setDzovalor(Float.parseFloat(request.getParameter("dzovalor")));

        String dateString = request.getParameter("dzodtcontribuicao");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            dizimoOferta.setDzodtcontribuicao(sdf.parse(dateString));
        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Data inválida.");
            RequestDispatcher rd = request.getRequestDispatcher("cadastroDizimo.jsp");
            rd.forward(request, response);
            return;
        }

        if (mbrdao.achaMembro(dizimoOferta.getDzombrid())) {
            dao.insereContribuicao(dizimoOferta);
            response.sendRedirect("cadastroDizimo.jsp?success=true");
        } else {
            response.sendRedirect("cadastroDizimo.jsp?success=false");
        }
    }

    protected void novaOferta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DizimosOferta dizimoOferta = new DizimosOferta();
        
        dizimoOferta.setDzombrid(Integer.parseInt(request.getParameter("dzombrid")));
        dizimoOferta.setDzotipo(request.getParameter("dzotipo"));
        dizimoOferta.setDzovalor(Float.parseFloat(request.getParameter("dzovalor")));

        String dateString = request.getParameter("dzodtcontribuicao");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            dizimoOferta.setDzodtcontribuicao(sdf.parse(dateString));
        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Data inválida.");
            RequestDispatcher rd = request.getRequestDispatcher("cadastroOferta.jsp");
            rd.forward(request, response);
            return;
        }

        if (mbrdao.achaMembro(dizimoOferta.getDzombrid())) {
            dao.insereContribuicao(dizimoOferta);
            response.sendRedirect("cadastroOferta.jsp?success=true");
        } else {
            response.sendRedirect("cadastroOferta.jsp?success=false");
        }
    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    
    protected float totalDizimoOferta(ArrayList<DizimosOferta> dizimosOfertas) {
    	float dizimosOfertasTotal = 0;
    	
    	if(dizimosOfertas != null) {
    		
    		for(DizimosOferta dizmoOferta : dizimosOfertas) {
    			dizimosOfertasTotal += dizmoOferta.getDzovalor();
    		}
    		
    		return dizimosOfertasTotal;
    		
    	}else {
    		return dizimosOfertasTotal;
    	}
    }
    
    protected void consultaDizimoOferta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int mes = Integer.parseInt(request.getParameter("mes"));
        int ano = Integer.parseInt(request.getParameter("ano"));
        String tipo = request.getParameter("tipo");
      
        ArrayList<DizimosOferta> dizimosOfertas= dao.consultaDizimoOferta(mes, ano, tipo);
        
        request.setAttribute("dizimosOfertas", dizimosOfertas);
        request.setAttribute("totalDizimosOfertas", totalDizimoOferta(dizimosOfertas));
        request.setAttribute("p_mes", mes);
        request.setAttribute("p_ano", ano);
        request.setAttribute("p_tipo", tipo);
        System.out.println("mes: " + mes + " ano: " + ano+" tipo:" + tipo );
        RequestDispatcher rd = request.getRequestDispatcher("resultadoConsultaDizimoOferta.jsp");
        rd.forward(request, response);
    }
    
    protected void excluirDizimoOferta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int dzoid = Integer.parseInt(request.getParameter("dzoid"));
        String mes = request.getParameter("p_excluir_mes");
        String ano = request.getParameter("p_excluir_ano");
        String tipo = request.getParameter("p_excluir_tipo");
        System.out.println("Antes de excluir mes: " + mes + " ano: " + ano+"tipo: "+tipo);
        System.out.println(dzoid); 
        

        try {
			dao.excluirRegistroDizOferta(dzoid);
			
	       response.sendRedirect("consultaDizimo?mes=" + mes + "&ano=" + ano + "&tipo=" + tipo);

		} catch (Exception e) {
			// TODO: handle exception
		}
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
