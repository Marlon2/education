package cn.edu.education.dao;

import java.util.List;

import cn.edu.education.dao.base.BaseDao;
import cn.edu.education.domain.Grade;

public interface GradeDao<T> extends BaseDao<T>{

	List<Grade> queryByPage(int offset, int rows);

}
