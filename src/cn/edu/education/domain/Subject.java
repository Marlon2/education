package cn.edu.education.domain;

import java.io.Serializable;
import java.util.Set;

public class Subject implements Serializable{

	private static final long serialVersionUID = 1L;

	private Long kid;
	private String name;
	private String description;
	private String remark;
	private Set<Teacher> teachers;
	
	public Long getKid() {
		return kid;
	}
	public void setKid(Long kid) {
		this.kid = kid;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
