package cn.edu.education.domain;

import java.io.Serializable;
import java.util.Set;

public class Grade implements Serializable{

	private static final long serialVersionUID = 1L;

	private Long gid;
	private String name;
	private Set<Teacher> teachers;
	private String remark;
	
	public Long getGid() {
		return gid;
	}
	public void setGid(Long gid) {
		this.gid = gid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Set<Teacher> getTeachers() {
		return teachers;
	}
	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}
	
}
