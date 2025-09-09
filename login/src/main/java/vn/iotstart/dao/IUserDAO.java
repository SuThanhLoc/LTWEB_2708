package vn.iotstart.dao; // đinh nghĩa các phương thức (abstract class)

import java.util.List;

import vn.iotstart.model.UserModel; // lấy danh sách từ cơ sở dữ liệu (Model)

// interface: đinh nghĩa các phương thức trừu tượng
public interface IUserDAO {
	
	List<UserModel> findAll(); // lấy toàn bộ user
	
	UserModel findById(int id); // lấy một user
	
	void insert(UserModel user); // thêm user
	UserModel finByUserName(String username); // dùng để login 
	
}
