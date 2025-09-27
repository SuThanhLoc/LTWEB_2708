package controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
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
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/edit-category-content.jsp");
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
            String description = request.getParameter("description");

            Category categoryToUpdate = cateService.get(id);
            if (categoryToUpdate == null) {
                response.sendRedirect(request.getContextPath() + "/admin/category/list?error=notfound");
                return;
            }
            
            categoryToUpdate.setCatename(name);
            
            // Set description if provided
            if (description != null && !description.trim().isEmpty()) {
                categoryToUpdate.setDescription(description.trim());
            } else {
                categoryToUpdate.setDescription(null);
            }

            Part filePart = request.getPart("icon");
            
            if (filePart != null && filePart.getSize() > 0) {
                // Validate file size
                if (filePart.getSize() > 2 * 1024 * 1024) { // 2MB limit
                    response.sendRedirect(request.getContextPath() + "/admin/category/list?error=filesize");
                    return;
                }
                
                String contentDisposition = filePart.getHeader("content-disposition");
                String fileName = extractFileName(contentDisposition);
                
                if (fileName != null && !fileName.isEmpty()) {
                    // Validate file type
                    String fileExtension = getFileExtension(fileName).toLowerCase();
                    if (!isValidImageType(fileExtension)) {
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
                    try (java.io.InputStream inputStream = filePart.getInputStream()) {
                        java.nio.file.Files.copy(inputStream, java.nio.file.Paths.get(filePath), 
                            java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                    }
                    
                    categoryToUpdate.setIcon(Constant.DIR + "/category/" + newFileName);
                }
            }

            cateService.update(categoryToUpdate);
            response.sendRedirect(request.getContextPath() + "/admin/category/list");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/category/list?error=true");
        }
    }
    
    private String getFileExtension(String fileName) {
        if (fileName == null || fileName.isEmpty()) {
            return "";
        }
        int lastDotIndex = fileName.lastIndexOf('.');
        if (lastDotIndex == -1 || lastDotIndex == fileName.length() - 1) {
            return "";
        }
        return fileName.substring(lastDotIndex + 1);
    }
    
    private boolean isValidImageType(String extension) {
        return extension.equals("jpg") || extension.equals("jpeg") || 
               extension.equals("png") || extension.equals("gif");
    }
    
    private String extractFileName(String contentDisposition) {
        if (contentDisposition == null) {
            return null;
        }
        
        String[] parts = contentDisposition.split(";");
        for (String part : parts) {
            part = part.trim();
            if (part.startsWith("filename=")) {
                String fileName = part.substring(9);
                if (fileName.startsWith("\"") && fileName.endsWith("\"")) {
                    fileName = fileName.substring(1, fileName.length() - 1);
                }
                return fileName;
            }
        }
        return null;
    }
}
