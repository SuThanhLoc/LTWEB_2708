package plat.dev.service.Impl;

import plat.dev.model.User;
import plat.dev.service.UserService;
import plat.dev.dao.UserDao;
import plat.dev.dao.impl.UserDaoImpl;

public class UserServiceImpl implements UserService {
	
	UserDao accountDao = new UserDaoImpl();
	@Override
	public User login(String username, String password) {
		User user = this.get(username);
		return user;
	}

	private User get(String username) {
		return accountDao.get(username);
	}

}
