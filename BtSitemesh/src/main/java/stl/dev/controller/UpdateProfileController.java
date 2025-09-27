package plat.dev.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

@WebServlet("/updateProfile")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 15    // 15MB
)
public class UpdateProfileController extends HttpServlet {

    private static final String UPLOAD_DIR = "D:\\HinhAnhWeb\\images\\user"; // nơi lưu ảnh

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");

        // Xử lý upload ảnh
        Part filePart = request.getPart("avatar");
        String fileName = null;
        String filePath = null;

        if (filePart != null && filePart.getSize() > 0) {
            fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            filePath = UPLOAD_DIR + File.separator + fileName;
            filePart.write(filePath);
        }

        // Lưu thông tin vào session (thực tế thì nên update DB nữa)
        if (fullname != null) session.setAttribute("fullname", fullname);
        if (phone != null) session.setAttribute("phone", phone);
        if (filePath != null) session.setAttribute("image", filePath);

        // Redirect về trang profile
        response.sendRedirect(request.getContextPath() + "/profile");
    }
}
