package cn.edu.education.service;

import java.io.Serializable;
import java.util.Collection;

import net.sf.json.JSONObject;
import cn.edu.education.domain.Grade;

public interface GradeService {

	public Grade getGradeById(Serializable id);
	public Collection<Grade> getAllGrade();
	public void saveGrade(Grade grade);
	public void updateGrade(Grade grade);
	public void deleteGrade(Serializable id);
	public JSONObject getResult(int rows, int page);
}
