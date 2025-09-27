package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/logout")
public class LogoutController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    session.invalidate();

	    Cookie usernameCookie = new Cookie("username", null); 
	    usernameCookie.setMaxAge(0);
	    usernameCookie.setPath(req.getContextPath());
	    
	    resp.addCookie(usernameCookie);
	    resp.sendRedirect(req.getContextPath() + "/login");
	}
}
