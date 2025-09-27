package plat.dev.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.URLEncoder;
import plat.dev.dao.*;
import plat.dev.dao.impl.*;

@WebServlet("/setting")
public class SettingController extends HttpServlet {
	UserDao userDao = new UserDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String fullname = (String) session.getAttribute("fullname");
        String phone = (String) session.getAttribute("phone");
        String image = (String) session.getAttribute("image"); // có thể là URL, path ổ đĩa, hoặc path trong webapp

        String avatarUrl = null;

        if (image != null && !image.trim().isEmpty()) {
            image = image.trim();

            if (image.startsWith("http://") || image.startsWith("https://")) {
                // Link online
                avatarUrl = image;
            } else if (image.matches("^[a-zA-Z]:\\\\.*") || image.startsWith("/")) {
                // Đường dẫn tuyệt đối trên ổ đĩa hoặc Linux path
                avatarUrl = request.getContextPath() + "/image?path=" + URLEncoder.encode(image, "UTF-8");
            } else {
                // Đường dẫn tương đối trong webapp
                avatarUrl = request.getContextPath() + image;
            }
        }

        if (avatarUrl == null) {
            avatarUrl = "https://via.placeholder.com/150?text=No+Image";
        }
        
        // Set sang JSP
        request.setAttribute("fullname", fullname);
        request.setAttribute("phone", phone);
        request.setAttribute("image", avatarUrl);
        fullname = (String) session.getAttribute("fullname");
        phone = (String) session.getAttribute("phone");
        image = (String) session.getAttribute("image"); 
        userDao.update(username, fullname, phone, image);
        // Forward sang setting.jsp
        request.getRequestDispatcher("/WEB-INF/views/setting.jsp").forward(request, response);
    }
}