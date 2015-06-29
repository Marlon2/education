package cn.edu.education.dao;

import java.util.Collection;
import java.util.List;

import cn.edu.education.dao.base.BaseDao;
import cn.edu.education.domain.Content;

public interface ContentDao<T> extends BaseDao<T>{

	public Collection<Content> getContentsByChannel(int channel_id);


	public List<Content> bgQueryByPage(int offset, int rows, Content content);
}
