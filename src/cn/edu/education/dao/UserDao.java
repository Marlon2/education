package cn.edu.education.dao;

import java.util.Collection;
import java.util.List;

import cn.edu.education.dao.base.BaseDao;
import cn.edu.education.domain.User;

public interface UserDao<T> extends BaseDao<T>{

	public User getUserByName(String username);

	public User findManagerByNameAndPwd(String username, String password);

	public List<User> queryByPage(int offset, int rows);
}
