package cn.edu.education.dao;

import java.util.List;

import cn.edu.education.dao.base.BaseDao;
import cn.edu.education.domain.Subject;

public interface SubjectDao<T> extends BaseDao<T>{

	List<Subject> queryByPage(int offset, int rows);


}
