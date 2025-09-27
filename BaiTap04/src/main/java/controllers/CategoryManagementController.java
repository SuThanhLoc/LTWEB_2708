package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.User;
import service.CategoryService;
import service.impl.CategoryServiceImpl;

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
            request.getRequestDispatcher("/views/category-management-content.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while loading categories: " + e.getMessage());
            request.getRequestDispatcher("/views/category-management-content.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Category name is required");
            doGet(request, response);
            return;
        }
        
        Category category = new Category();
        category.setName(name.trim());
        category.setDescription(description != null ? description.trim() : "");
        
        boolean success = categoryService.insert(category);
        if (success) {
            request.setAttribute("success", "Category added successfully!");
        } else {
            request.setAttribute("error", "Failed to add category");
        }
        
        doGet(request, response);
    }
    
    private void handleEditCategory(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
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
            Category category = new Category();
            category.setId(id);
            category.setName(name.trim());
            category.setDescription(description != null ? description.trim() : "");
            
            boolean success = categoryService.update(category);
            if (success) {
                request.setAttribute("success", "Category updated successfully!");
            } else {
                request.setAttribute("error", "Failed to update category");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid category ID");
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
