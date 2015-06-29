package cn.edu.education.dao.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.edu.education.dao.ContentDao;
import cn.edu.education.dao.base.impl.BaseDaoImpl;
import cn.edu.education.domain.Content;
@Repository("contentDao")
public class ContentDaoImpl extends BaseDaoImpl<Content> implements ContentDao<Content>{

	@Override
	public Collection<Content> getContentsByChannel(int channel_id) {
		return this.hibernateTemplate.find("from Content where channel_id=? order by publishdate",channel_id);
	}


	@Override
	public List<Content> bgQueryByPage(int offset, int rows, Content content) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Content.class);
		criteria.add(Restrictions.like("title", content.getTitle()+"%"))
		.add(Restrictions.like("author", content.getAuthor()+"%"))
		.addOrder(Order.desc("publishdate"));
		return this.hibernateTemplate.findByCriteria(criteria,offset,rows);
	}

}
