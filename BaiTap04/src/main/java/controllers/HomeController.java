package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import java.io.IOException;


@WebServlet (urlPatterns = {"/home", "/manager/home", "/admin/home", "/index"})

public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public HomeController() {
        super();
        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        if ("/home".equals(path) || "/index".equals(path)) {
            // All users can access home page
            request.getRequestDispatcher("/views/home-content.jsp").forward(request, response);
        } else if ("/manager/home".equals(path)) {
            if (user.getRoleid() != 2) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);
        } else if ("/admin/home".equals(path)) {
            if (user.getRoleid() != 1 && user.getRoleid() != 2) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/views/home-content.jsp").forward(request, response);
        }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
