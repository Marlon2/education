package cn.edu.education.service;

import java.io.Serializable;
import java.util.Collection;

import net.sf.json.JSONObject;
import cn.edu.education.domain.Subject;

public interface SubjectService {

	public Subject getSubjectById(Serializable id);
	public Collection<Subject> getAllSubject();
	public void saveSubject(Subject subject);
	public void updateSubject(Subject subject);
	public void deleteSubject(Serializable id);
	public JSONObject getResult(int rows, int page);
}
