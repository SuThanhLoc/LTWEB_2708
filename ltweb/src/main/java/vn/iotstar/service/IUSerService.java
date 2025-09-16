package vn.iotstar.service;

import vn.iotstar.model.UserModel;

public interface IUSerService {
	UserModel login(String username, String password);
	UserModel fiByUserName(String username);
}
