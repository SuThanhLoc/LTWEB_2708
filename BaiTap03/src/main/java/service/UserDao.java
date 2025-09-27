package service;
import model.ResetPasswordStatus;
import model.User;

public interface UserDao {
	User get(String username);
	User findById(int id);
	ResetPasswordStatus resetPassword(String name, String email, String newPassword, String confirmPassword);
	void insert(User user); 
	void update(User user);
	boolean checkExistEmail(String email); 
	boolean checkExistUsername(String username); 
	boolean checkExistPhone(String phone);
}
