package util;

public final class Constant {
    
	public static final String DIR = "uploads";
    public static final String UPLOAD_DIRECTORY = "uploads";
    public static final String VIDEO_UPLOAD_DIRECTORY = UPLOAD_DIRECTORY + "/videos";
    public static final String POSTER_UPLOAD_DIRECTORY = UPLOAD_DIRECTORY + "/posters";
    public static final String DEFAULT_FILENAME = "default.file";
    
    public static int UserId = 0;

	private Constant() {}

    public static final class Path {
        private Path() {}

        public static final String REGISTER = "/views/register.jsp";
        public static final String LOGIN = "/views/login-content.jsp";
        public static final String HOME_PAGE = "/views/index.jsp";
        public static final String FORGOT_PASS = "/views/reset-password-simple.jsp";
        public static final String UPLOAD_VIDEO = "/views/admin/upload-video.jsp";
        
        public static final String HOME = "/home";
        public static final String LOGOUT = "/logout";
        public static final String WAITING = "/waiting";
        public static final String ADMIN_HOME = "/admin/home";
    }
}
