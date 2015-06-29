package cn.edu.education.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import cn.edu.education.dao.SubjectDao;
import cn.edu.education.domain.Subject;
import cn.edu.education.service.SubjectService;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService{

	@Resource(name="subjectDao")
	private SubjectDao subjectDao;
	

	@Override
	public Collection<Subject> getAllSubject() {
		return this.subjectDao.getAllEntity();
	}

	@Override
	public void saveSubject(Subject subject) {
		this.subjectDao.saveEntity(subject);
	}

	@Override
	public void updateSubject(Subject subject) {
		this.subjectDao.updateEntity(subject);
	}

	@Override
	public void deleteSubject(Serializable id) {
		this.subjectDao.deleteEntity(id);
	}

	@Override
	public Subject getSubjectById(Serializable id) {
		return (Subject) this.subjectDao.getEntityById(id);
	}

	@Override
	public JSONObject getResult(int rows, int page) {
		int total = this.getAllSubject().size();
		int offset = rows * (page -1);
		List<Subject> list = this.subjectDao.queryByPage(offset, rows);
		JSONArray array = new JSONArray();
		for (Subject sub : list) {
			JSONObject mapObj = new JSONObject();
			mapObj.put("kid", sub.getKid());
			mapObj.put("name", sub.getName());
			mapObj.put("description", sub.getDescription());
			array.add(mapObj);
		}
		JSONObject result = new JSONObject();
		result.put("rows", array);
		result.put("total", total);
		return result;
	}

}
