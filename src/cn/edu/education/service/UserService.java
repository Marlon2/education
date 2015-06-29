package cn.edu.education.service;

import java.io.Serializable;
import java.util.Collection;

import net.sf.json.JSONObject;
import cn.edu.education.domain.User;

public interface UserService {

	public User getUserById(Serializable id);
	public Collection<User> getAllUser();
	public void saveUser(User user);
	public void updateUser(User user);
	public void deleteUser(Serializable id);
	
	
	public User getUserByName(String username);
	public User loginValidate(User user);
	public JSONObject getResult(int rows, int page);
}
