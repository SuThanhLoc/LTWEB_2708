package plat.dev.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        HttpSession session = request.getSession();

        String fullname = (String) session.getAttribute("fullname");
        String phone = (String) session.getAttribute("phone");
        String image = (String) session.getAttribute("image"); // có thể là url, path ổ đĩa, hoặc path trong webapp

        String avatarUrl = null;

        if (image != null && !image.trim().isEmpty()) {
            image = image.trim();

            if (image.startsWith("http://") || image.startsWith("https://")) {
                // URL online
                avatarUrl = image;
            } else if (image.matches("^[a-zA-Z]:\\\\.*") || image.startsWith("/")) {
                // Đường dẫn tuyệt đối trong ổ đĩa
                try {
                    avatarUrl = request.getContextPath() + "/image?path=" + URLEncoder.encode(image, "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    avatarUrl = null;
                }
            } else {
                // Đường dẫn tương đối trong webapp
                avatarUrl = request.getContextPath() + image;
            }
        }

        if (avatarUrl == null) {
            avatarUrl = "https://via.placeholder.com/150?text=No+Image";
        }

        request.setAttribute("fullname", fullname);
        request.setAttribute("phone", phone);
        request.setAttribute("avatarUrl", avatarUrl);

        request.getRequestDispatcher("/WEB-INF/views/profile.jsp").forward(request, response);
    }
}