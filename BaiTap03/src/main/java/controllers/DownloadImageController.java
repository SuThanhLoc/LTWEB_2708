package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.commons.io.IOUtils;

@WebServlet("/download-image")
public class DownloadImageController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DownloadImageController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("fname");

        if (fileName == null || fileName.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File name parameter is missing.");
            return;
        }

        // Decode URL encoded characters
        fileName = java.net.URLDecoder.decode(fileName, "UTF-8");
        
        String appRealPath = request.getServletContext().getRealPath("/");
        
        // Handle file path with subdirectories
        String filePath;
        if (fileName.startsWith("uploads/")) {
            // File path already includes uploads directory
            filePath = appRealPath + fileName;
        } else {
            // File path is just filename, add uploads directory
            filePath = appRealPath + "uploads" + File.separator + fileName;
        }
        
        // Normalize path separators
        filePath = filePath.replace("/", File.separator).replace("\\", File.separator);

        File file = new File(filePath);

        if (file.exists()) {
            String mimeType = getServletContext().getMimeType(file.getAbsolutePath());
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }
            response.setContentType(mimeType);
            response.setContentLength((int) file.length());

            try (FileInputStream in = new FileInputStream(file);
                 OutputStream out = response.getOutputStream()) {
                
                IOUtils.copy(in, out);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found: " + fileName);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}