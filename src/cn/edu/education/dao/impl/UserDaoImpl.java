package cn.edu.education.dao.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import cn.edu.education.dao.UserDao;
import cn.edu.education.dao.base.impl.BaseDaoImpl;
import cn.edu.education.domain.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao<User>{

	@Override
	public User getUserByName(String username) {
		return null;
	}

	@Override
	public User findManagerByNameAndPwd(String username, String password) {
		List users = this.hibernateTemplate.find("select u from User u where u.username=? and u.password=?", username, password);
		if (users != null && users.size() >= 1) {
			return (User) users.get(0);
		}
		return null;
	}

	@Override
	public List<User> queryByPage(int offset, int rows) {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		return this.hibernateTemplate.findByCriteria(criteria, offset, rows);
	}

}
