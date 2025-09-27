package plat.dev.service;

import plat.dev.model.User;

public interface UserService {
	User login(String username, String password);
}
