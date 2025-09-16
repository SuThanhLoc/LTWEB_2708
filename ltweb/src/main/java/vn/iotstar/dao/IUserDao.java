package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.model.UserModel;

public interface IUserDao {

	List<UserModel> findAll(); // lấy toàn bộ user

	UserModel findById(int id); // lấy một user

	void insert(UserModel user); // thêm user

	UserModel finByUserName(String username); // dùng để login

}
