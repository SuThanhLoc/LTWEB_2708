package vn.iotstar.service;

import vn.iotstar.dao.IUserDao;
import vn.iotstar.dao.UserDaoImpl;
import vn.iotstar.model.UserModel;

public class UserServiceImpl implements IUSerService {

	// sử dụng các phương thức của tầng Dao để tương tác với Controller
	IUserDao userDao = new UserDaoImpl();

	@Override
	public UserModel fiByUserName(String username) {
		return userDao.finByUserName(username);
	}

	@Override
	public UserModel login(String username, String password) {
		UserModel user = this.fiByUserName(username);
		if (user != null && password.equals(user.getPassword())) {
			return user;
		}
		return null;
	}

}
