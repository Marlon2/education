package cn.edu.education.dao.base.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collection;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.edu.education.dao.base.BaseDao;

public class BaseDaoImpl<T> implements BaseDao<T>{

	public Class classt;
	
	public BaseDaoImpl(){
		ParameterizedType type = (ParameterizedType)this.getClass().getGenericSuperclass();
		this.classt = (Class)type.getActualTypeArguments()[0];
	}
	
	@Resource(name="hibernateTemplate")
	public HibernateTemplate hibernateTemplate;
	@Override
	public Collection<T> getAllEntity() {
		return this.hibernateTemplate.find("from "+this.classt.getName());
	}

	@SuppressWarnings("unchecked")
	@Override
	public T getEntityById(Serializable id) {
		return (T)this.hibernateTemplate.get(this.classt, id);
	}

	@Override
	public void saveEntity(T t) {
		this.hibernateTemplate.save(t);
	}

	@Override
	public void updateEntity(T t) {
		this.hibernateTemplate.update(t);
	}

	@Override
	public void deleteEntity(Serializable id) {
		T t = this.getEntityById(id);
		this.hibernateTemplate.delete(t);
	}

}
