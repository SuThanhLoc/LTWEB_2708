package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Category;
import service.CategoryService;
import service.impl.CategoryServiceImpl;
import util.Constant;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/admin/category/edit")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 2 * 1024 * 1024, // 2MB for category icons
    maxRequestSize = 5 * 1024 * 1024 // 5MB
    // Removed location to use system default temp directory
)
public class CategoryEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Category category = cateService.get(id);
            if (category != null) {
                request.setAttribute("category", category);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/edit-category.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/category/list?error=notfound");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/category/list?error=invalidid");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");

            Category categoryToUpdate = cateService.get(id);
            if (categoryToUpdate == null) {
                response.sendRedirect(request.getContextPath() + "/admin/category/list?error=notfound");
                return;
            }
            
            categoryToUpdate.setCatename(name);

            Part filePart = request.getPart("icon");
            
            if (filePart != null && filePart.getSize() > 0) {
                // Validate file size
                if (filePart.getSize() > 2 * 1024 * 1024) { // 2MB limit
                    response.sendRedirect(request.getContextPath() + "/admin/category/list?error=filesize");
                    return;
                }
                
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                
                // Validate file type
                String fileExtension = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
                if (!isValidImageFile(fileExtension)) {
                    response.sendRedirect(request.getContextPath() + "/admin/category/list?error=filetype");
                    return;
                }

                String realPath = request.getServletContext().getRealPath("/");

                String oldIconPath = categoryToUpdate.getIcon();
                if (oldIconPath != null && !oldIconPath.isEmpty()) {
                    File oldFile = new File(realPath + oldIconPath);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }
                
                String newFileName = System.currentTimeMillis() + "_" + fileName;
                
                String uploadDirPath = realPath + Constant.DIR + File.separator + "category";
                
                File uploadDir = new File(uploadDirPath);
                if (!uploadDir.exists()) {
                    boolean created = uploadDir.mkdirs();
                    if (!created) {
                        response.sendRedirect(request.getContextPath() + "/admin/category/list?error=uploaddir");
                        return;
                    }
                }
                
                String filePath = uploadDirPath + File.separator + newFileName;
                
                // Use try-with-resources for better resource management
                try (var inputStream = filePart.getInputStream()) {
                    java.nio.file.Files.copy(inputStream, java.nio.file.Paths.get(filePath), 
                        java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                }
                
                categoryToUpdate.setIcon(Constant.DIR + "/category/" + newFileName);
            }

            cateService.update(categoryToUpdate);
            response.sendRedirect(request.getContextPath() + "/admin/category/list");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/category/list?error=true");
        }
    }
    
    private boolean isValidImageFile(String fileExtension) {
        String[] allowedExtensions = {".jpg", ".jpeg", ".png", ".gif"};
        
        for (String allowed : allowedExtensions) {
            if (fileExtension.equals(allowed)) {
                return true;
            }
        }
        return false;
    }
}