package controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Category;
import model.User;
import service.CategoryService;
import service.impl.CategoryServiceImpl;
import util.Constant;

@MultipartConfig
@WebServlet("/category-management")
public class CategoryManagementController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService categoryService;

    @Override
    public void init() throws ServletException {
        super.init();
        categoryService = new CategoryServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // Check if user is admin or manager
        if (user.getRoleid() != 1 && user.getRoleid() != 2) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        
        try {
            // Get all categories
            List<Category> categories = categoryService.findAll();
            request.setAttribute("categories", categories);
            
            // Forward to category management page
            request.getRequestDispatcher("/views/category-management.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while loading categories: " + e.getMessage());
            request.getRequestDispatcher("/views/category-management.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null || (user.getRoleid() != 1 && user.getRoleid() != 2)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        String action = request.getParameter("action");
        
        try {
            if ("add".equals(action)) {
                handleAddCategory(request, response);
            } else if ("edit".equals(action)) {
                handleEditCategory(request, response);
            } else if ("delete".equals(action)) {
                handleDeleteCategory(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/category-management");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            doGet(request, response);
        }
    }
    
    private void handleAddCategory(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Category name is required");
            doGet(request, response);
            return;
        }
        
        Category category = new Category();
        category.setCatename(name.trim());
        category.setDescription(description != null ? description.trim() : "");
        category.setUserId(1); // Set default user ID
        category.setCreatedDate(new java.sql.Date(System.currentTimeMillis()));
        
        try {
            // Handle file upload
            Part filePart = request.getPart("icon");
            
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                
                // Validate file type
                String fileExtension = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
                if (!fileExtension.matches("\\.(jpg|jpeg|png|gif|webp)$")) {
                    request.setAttribute("error", "Only image files (JPG, PNG, GIF, WebP) are allowed!");
                    doGet(request, response);
                    return;
                }
                
                // Validate file size (5MB)
                if (filePart.getSize() > 5 * 1024 * 1024) {
                    request.setAttribute("error", "File size must not exceed 5MB!");
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
                
                category.setIcon(Constant.DIR + "/" + uniqueFileName);
            }
            
            boolean success = categoryService.insert(category);
            if (success) {
                request.setAttribute("success", "Category added successfully!");
            } else {
                request.setAttribute("error", "Failed to add category");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error processing file upload: " + e.getMessage());
        }
        
        doGet(request, response);
    }
    
    private void handleEditCategory(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        
        if (idStr == null || name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Category ID and name are required");
            doGet(request, response);
            return;
        }
        
        try {
            int id = Integer.parseInt(idStr);
            
            // Get existing category from database
            Category category = categoryService.get(id);
            if (category == null) {
                request.setAttribute("error", "Category not found");
                doGet(request, response);
                return;
            }
            
            // Update category fields
            category.setCatename(name.trim());
            category.setDescription(description != null ? description.trim() : "");
            
            // Handle file upload for edit
            Part filePart = request.getPart("icon");
            
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                
                // Validate file type
                String fileExtension = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
                if (!fileExtension.matches("\\.(jpg|jpeg|png|gif|webp)$")) {
                    request.setAttribute("error", "Only image files (JPG, PNG, GIF, WebP) are allowed!");
                    doGet(request, response);
                    return;
                }
                
                // Validate file size (5MB)
                if (filePart.getSize() > 5 * 1024 * 1024) {
                    request.setAttribute("error", "File size must not exceed 5MB!");
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
                
                category.setIcon(Constant.DIR + "/" + uniqueFileName);
            }
            
            boolean success = categoryService.update(category);
            if (success) {
                request.setAttribute("success", "Category updated successfully!");
            } else {
                request.setAttribute("error", "Failed to update category");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid category ID");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error processing file upload: " + e.getMessage());
        }
        
        doGet(request, response);
    }
    
    private void handleDeleteCategory(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        
        if (idStr == null) {
            request.setAttribute("error", "Category ID is required");
            doGet(request, response);
            return;
        }
        
        try {
            int id = Integer.parseInt(idStr);
            boolean success = categoryService.delete(id);
            if (success) {
                request.setAttribute("success", "Category deleted successfully!");
            } else {
                request.setAttribute("error", "Failed to delete category");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid category ID");
        }
        
        doGet(request, response);
    }
}
