package cn.edu.education.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import cn.edu.education.dao.UserDao;
import cn.edu.education.domain.User;
import cn.edu.education.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource(name="userDao")
	private UserDao userDao;
	@Override
	public User getUserById(Serializable id) {
		return (User) this.userDao.getEntityById(id);
	}

	@Override
	public Collection<User> getAllUser() {
		return this.userDao.getAllEntity();
	}

	@Override
	public void saveUser(User user) {
		this.userDao.saveEntity(user);
	}

	@Override
	public void updateUser(User user) {
		this.userDao.updateEntity(user);
	}

	@Override
	public void deleteUser(Serializable id) {
		this.userDao.deleteEntity(id);
	}

	@Override
	public User getUserByName(String username) {
		return this.getUserByName(username);
	}

	@Override
	public User loginValidate(User user) {
		return this.userDao.findManagerByNameAndPwd(user.getUsername(),user.getPassword());
	}

	@Override
	public JSONObject getResult(int rows, int page) {
		int total = this.getAllUser().size();
		int offset = rows * (page -1);
		List<User> list = this.userDao.queryByPage(offset, rows);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(list);
		result.put("rows", jsonArray);
		result.put("total", total);
		return result;
	}


}
