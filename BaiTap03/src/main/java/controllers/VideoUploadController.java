package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import model.Video;
import service.VideoService;
import service.impl.VideoServiceImpl;
import util.Constant;

@WebServlet("/video-upload")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 10,  // 10 MB
    maxFileSize = 1024 * 1024 * 50,        // 50 MB
    maxRequestSize = 1024 * 1024 * 100     // 100 MB
)
public class VideoUploadController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoService videoService;

    public void init() {
        videoService = new VideoServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(Constant.Path.UPLOAD_VIDEO).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Ensure upload directories exist
            createUploadDirectories();

            // Get form fields
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            
            // Generate unique video ID
            String videoId = UUID.randomUUID().toString();
            
            // Process video file
            Part videoPart = request.getPart("video");
            String videoFileName = videoId + "_" + getFileName(videoPart);
            String videoPath = Constant.VIDEO_UPLOAD_DIRECTORY + File.separator + videoFileName;
            videoPart.write(videoPath);
            
            // Process poster image if provided
            String posterFileName = null;
            Part posterPart = request.getPart("poster");
            if (posterPart != null && posterPart.getSize() > 0) {
                posterFileName = videoId + "_" + getFileName(posterPart);
                String posterPath = Constant.POSTER_UPLOAD_DIRECTORY + File.separator + posterFileName;
                posterPart.write(posterPath);
            }
            
            // Create and save video entity
            Video video = new Video();
            video.setVideoId(videoId);
            video.setTitle(title);
            video.setDescription(description);
            video.setPoster(posterFileName);
            video.setActive(true);
            video.setViews(0);
            
            videoService.create(video);
            
            request.setAttribute("message", "Video uploaded successfully!");
        } catch (Exception e) {
            request.setAttribute("message", "Error uploading video: " + e.getMessage());
        }
        
        request.getRequestDispatcher(Constant.Path.UPLOAD_VIDEO).forward(request, response);
    }
    
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
    
    private void createUploadDirectories() {
        new File(Constant.VIDEO_UPLOAD_DIRECTORY).mkdirs();
        new File(Constant.POSTER_UPLOAD_DIRECTORY).mkdirs();
    }
    
    public void destroy() {
        if (videoService != null) {
            ((VideoServiceImpl) videoService).close();
        }
    }
}
