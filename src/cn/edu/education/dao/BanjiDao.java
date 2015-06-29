package cn.edu.education.dao;

import java.util.List;

import cn.edu.education.dao.base.BaseDao;
import cn.edu.education.domain.Banji;

public interface BanjiDao<T> extends BaseDao<T>{

	public List<Banji> queryByPage(int offset, int pageSize);

	public List<Banji> bgQueryByPage(int offset, int rows, Banji banji);

	public List<Banji> queryByPage(int offset, int pageSize, List<Long> bidlist);

}
