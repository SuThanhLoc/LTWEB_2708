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

@MultipartConfig 
@WebServlet({"/admin/category/add"})
public class CategoryAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CategoryService cateService = new CategoryServiceImpl();

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/add-category-content.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Category category = new Category();

        try {
            String cateName = request.getParameter("name");
            String description = request.getParameter("description");
            
            if (cateName == null || cateName.trim().isEmpty()) {
                request.setAttribute("error", "Tên danh mục không được để trống!");
                doGet(request, response);
                return;
            }
            category.setCatename(cateName.trim());
            
            // Set description if provided
            if (description != null && !description.trim().isEmpty()) {
                category.setDescription(description.trim());
            }
            
            // Set userId (assuming admin user with id = 1 for now)
            category.setUserId(1);
            
            // Set created date
            category.setCreatedDate(new java.sql.Date(System.currentTimeMillis()));

            Part filePart = request.getPart("icon");

            if (filePart != null && filePart.getSize() > 0) {
                String contentDisposition = filePart.getHeader("content-disposition");
                String fileName = extractFileName(contentDisposition);
                
                if (fileName != null && !fileName.isEmpty()) {
                    // Validate file type
                    String fileExtension = getFileExtension(fileName).toLowerCase();
                    if (!isValidImageType(fileExtension)) {
                        request.setAttribute("error", "Chỉ được upload file ảnh (JPG, PNG, GIF)!");
                        doGet(request, response);
                        return;
                    }
                    
                    String realPath = request.getServletContext().getRealPath("/");
                    String uploadPath = realPath + Constant.DIR;
                    
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                    String filePath = uploadPath + File.separator + uniqueFileName;
                    
                    filePart.write(filePath);
                    
                    // Set the correct path for database storage
                    category.setIcon(Constant.DIR + "/" + uniqueFileName);
                }
            }

            boolean success = cateService.insert(category);
            
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/category/list");
            } else {
                request.setAttribute("error", "Không thể thêm danh mục. Vui lòng thử lại!");
                doGet(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã có lỗi xảy ra trong quá trình xử lý: " + e.getMessage());
            doGet(request, response);
        }
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
}
