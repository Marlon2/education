package cn.edu.education.dao.base;

import java.io.Serializable;
import java.util.Collection;

public interface BaseDao<T> {

public Collection<T> getAllEntity();
	
	public T getEntityById(Serializable id);
	public void saveEntity(T t);
	public void updateEntity(T t);
	public void deleteEntity(Serializable id);
}
