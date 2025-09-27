package plat.dev.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        System.out.println("Đã vào AuthFilter");
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String uri = request.getRequestURI();
        HttpSession session = request.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("username") != null);
        boolean loginRequest = uri.endsWith("login") || uri.endsWith("login.jsp");
        if (loggedIn || loginRequest) {
        	System.out.println("Đi tiếp đi");
            chain.doFilter(req, res); // Cho phép đi tiếp
        } else {
        	System.out.println("Không cho");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Nếu cần khởi tạo filter
    }

    @Override
    public void destroy() {
        // Nếu cần dọn dẹp
    }
}
