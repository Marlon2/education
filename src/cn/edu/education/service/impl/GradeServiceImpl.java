package cn.edu.education.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import cn.edu.education.dao.GradeDao;
import cn.edu.education.domain.Grade;
import cn.edu.education.service.GradeService;

@Service("gradeService")
public class GradeServiceImpl implements GradeService{

	@Resource(name="gradeDao")
	private GradeDao gradeDao;
	@Override
	public Grade getGradeById(Serializable id) {
		return (Grade) this.gradeDao.getEntityById(id);
	}

	@Override
	public Collection<Grade> getAllGrade() {
		return this.gradeDao.getAllEntity();
	}

	@Override
	public void saveGrade(Grade grade) {
		this.gradeDao.saveEntity(grade);
	}

	@Override
	public void updateGrade(Grade grade) {
		this.gradeDao.updateEntity(grade);
	}

	@Override
	public void deleteGrade(Serializable id) {
		this.gradeDao.deleteEntity(id);
	}

	@Override
	public JSONObject getResult(int rows, int page) {
		int total = this.getAllGrade().size();
		int offset = rows * (page -1);
		List<Grade> list = this.gradeDao.queryByPage(offset, rows);
		JSONArray array = new JSONArray();
		for (Grade grade : list) {
			JSONObject mapObj = new JSONObject();
			mapObj.put("gid", grade.getGid());
			mapObj.put("name", grade.getName());
			array.add(mapObj);
		}
		JSONObject result = new JSONObject();
		result.put("rows", array);
		result.put("total", total);
		return result;
	}

}
