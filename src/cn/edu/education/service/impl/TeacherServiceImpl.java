package cn.edu.education.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import cn.edu.education.dao.TeacherDao;
import cn.edu.education.domain.Teacher;
import cn.edu.education.service.TeacherService;
import cn.edu.education.util.PageBean;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService{

	@Resource(name="teacherDao")
	private TeacherDao teacherDao;
	@Override
	public Teacher getTeacherById(Serializable id) {
		return (Teacher) this.teacherDao.getEntityById(id);
	}

	@Override
	public Collection<Teacher> getAllTeacher() {
		return this.teacherDao.getAllEntity();
	}

	@Override
	public void saveTeacher(Teacher teacher) {
		this.teacherDao.saveEntity(teacher);
	}

	@Override
	public void updateTeacher(Teacher teacher) {
		this.teacherDao.updateEntity(teacher);
	}

	@Override
	public void deleteTeacher(Serializable id) {
		this.teacherDao.deleteEntity(id);
	}

	@Override
	public Collection<Teacher> getGirlTeachers() {
		return this.teacherDao.getGirlTeachers();
	}

	@Override
	public PageBean<Teacher> getPageBean(int pageSize, int page) {
		PageBean<Teacher> pageBean = new PageBean<Teacher>();
		int allRows = teacherDao.getAllEntity().size();
        System.out.println("总记录数:"+allRows);
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        System.out.println("总页数:"+totalPage);
        int currentPage = pageBean.getCurPage(page);
        System.out.println("当前页:"+currentPage);
        int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
        System.out.println("offset:"+offset);

        List<Teacher> list= teacherDao.queryByPage( offset, pageSize);
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        
        return pageBean;
	}

	@Override
	public JSONObject getResult(int rows, int page, Teacher teacher) {
		int total = this.getAllTeacher().size();
		int offset = rows * (page -1);
		System.out.println(offset+"--"+rows);
		List<Teacher> list = this.teacherDao.queryByPage(offset, rows,teacher);
		JSONArray jsonArray  = new JSONArray();
		for (Teacher tea : list) {
			JSONObject mapObj = new JSONObject();
			mapObj.put("tid", tea.getTid());
			mapObj.put("teachernumber", tea.getTeachernumber());
			mapObj.put("name", tea.getName());
			mapObj.put("sex", tea.getSex());
			mapObj.put("mobilenumber", tea.getMobilenumber());
			mapObj.put("password", tea.getPassword());
			mapObj.put("pictureurl", tea.getPictureurl());
			mapObj.put("introduce", tea.getIntroduce());
			mapObj.put("description", tea.getDescription());
			mapObj.put("birthday", tea.getBirthday()+"");
			mapObj.put("email", tea.getEmail());
			mapObj.put("address", tea.getAddress());
			jsonArray.add(mapObj);
		}
		System.out.println("size--"+jsonArray.size());
		JSONObject result = new JSONObject();
		result.put("rows", jsonArray);
		result.put("total", total);
		return result;
	}

	@Override
	public Teacher getTeacherByTel(String username) {
		return this.teacherDao.getTeacherByTel(username);
	}

}
