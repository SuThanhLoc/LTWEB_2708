package controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import service.UserService;
import service.impl.UserServiceImpl;

@WebServlet("/profile")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB - files larger than this will be written to disk
    maxFileSize = 5 * 1024 * 1024, // 5MB
    maxRequestSize = 10 * 1024 * 1024 // 10MB
    // Removed location to use system default temp directory
)
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;
    
    // Upload directory
    private static final String UPLOAD_DIR = "uploads";
    private static final int MAX_FILE_SIZE = 5 * 1024 * 1024; // 5MB
    private static final int MAX_REQUEST_SIZE = 10 * 1024 * 1024; // 10MB

    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserServiceImpl();
        
        // Create upload directory if it doesn't exist
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            boolean created = uploadDir.mkdirs();
            if (!created) {
                throw new ServletException("Could not create upload directory: " + uploadPath);
            }
        }
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
        
        // Get updated user data from database
        User updatedUser = userService.findById(user.getId());
        if (updatedUser != null) {
            session.setAttribute("user", updatedUser);
            request.setAttribute("user", updatedUser);
        }
        
        request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            String fullName = null;
            String phone = null;
            String avatarFileName = null;
            
            // Process multipart form data
            for (Part part : request.getParts()) {
                String fieldName = part.getName();
                
                if (part.getSubmittedFileName() == null) {
                    // Form field
                    String fieldValue = new String(part.getInputStream().readAllBytes(), "UTF-8");
                    
                    if ("fullName".equals(fieldName)) {
                        fullName = fieldValue;
                    } else if ("phone".equals(fieldName)) {
                        phone = fieldValue;
                    }
                } else {
                    // File upload
                    String fileName = part.getSubmittedFileName();
                    
                    if (fileName != null && !fileName.isEmpty() && part.getSize() > 0) {
                        // Check file size
                        if (part.getSize() > MAX_FILE_SIZE) {
                            request.setAttribute("error", "File size exceeds 5MB limit.");
                            request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
                            return;
                        }
                        
                        // Check file type
                        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                        if (!isValidImageFile(fileExtension)) {
                            request.setAttribute("error", "Invalid file type. Only JPG, PNG, and GIF are allowed.");
                            request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
                            return;
                        }
                        
                        // Save file
                        avatarFileName = "avatar_" + user.getId() + "_" + System.currentTimeMillis() + fileExtension;
                        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs();
                        }
                        
                        Path targetPath = Paths.get(uploadPath + File.separator + avatarFileName);
                        Files.copy(part.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);
                        
                        // Delete old avatar
                        if (user.getAvatar() != null && !user.getAvatar().isEmpty()) {
                            File oldAvatar = new File(uploadPath + File.separator + user.getAvatar());
                            if (oldAvatar.exists()) {
                                oldAvatar.delete();
                            }
                        }
                    }
                }
            }
            
            // Update user
            boolean hasChanges = false;
            
            if (fullName != null && !fullName.trim().isEmpty() && !fullName.trim().equals(user.getFullName())) {
                user.setFullName(fullName.trim());
                hasChanges = true;
            }
            
            if (phone != null && !phone.trim().isEmpty() && !phone.trim().equals(user.getPhone())) {
                user.setPhone(phone.trim());
                hasChanges = true;
            }
            
            if (avatarFileName != null) {
                user.setAvatar(avatarFileName);
                hasChanges = true;
            }
            
            if (hasChanges) {
                boolean success = userService.update(user);
                if (success) {
                    session.setAttribute("user", user);
                    request.setAttribute("success", "Profile updated successfully!");
                } else {
                    request.setAttribute("error", "Failed to update profile.");
                }
            } else {
                request.setAttribute("error", "No changes detected.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error updating profile: " + e.getMessage());
        }
        
        request.setAttribute("user", user);
        request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
    }
    
    private boolean isValidImageFile(String fileExtension) {
        String[] allowedExtensions = {".jpg", ".jpeg", ".png", ".gif"};
        String lowerExtension = fileExtension.toLowerCase();
        
        for (String allowed : allowedExtensions) {
            if (lowerExtension.equals(allowed)) {
                return true;
            }
        }
        return false;
    }
}
