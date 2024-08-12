package controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class FiltroAutenticacao
 */
@WebFilter("/*")
public class FiltroAutenticacao extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public FiltroAutenticacao() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        String loginURI = req.getContextPath() + "/LoginController";
        String requestedURI = req.getRequestURI();

        boolean loggedIn = session != null && session.getAttribute("username") != null;
        boolean loginRequest = requestedURI.equals(loginURI);

        // Verifica se a URI requisitada é para a página de login ou um recurso público
        boolean resourceRequest = requestedURI.endsWith("index.jsp") 
        						  || requestedURI.endsWith("pesquisarUsuario.jsp")
        						  || requestedURI.endsWith("TrocarSenhaController")
        						  || requestedURI.endsWith("trocarSenha.jsp")
                                  || requestedURI.startsWith(req.getContextPath() + "/css/") 
                                  || requestedURI.startsWith(req.getContextPath() + "/js/") 
                                  || requestedURI.startsWith(req.getContextPath() + "/assets/")
                                  || requestedURI.startsWith(req.getContextPath() + "/css2/");

        if (loggedIn || loginRequest || resourceRequest) {
            // Adiciona cabeçalhos para evitar cache
            res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            res.setDateHeader("Expires", 0); // Proxies.
            
            chain.doFilter(request, response);
        } else {
            res.sendRedirect("index.jsp");
        }
    }

    @Override
    public void destroy() {}
}