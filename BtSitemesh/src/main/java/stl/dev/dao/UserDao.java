package plat.dev.dao;
import plat.dev.model.*;
public interface UserDao {
	User get(String username);
	void update(String username, String hovaten, String sodienthoai, String hinhanh);
}
