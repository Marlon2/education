package cn.edu.education.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

public class Teacher implements Serializable{

	private static final long serialVersionUID = 1L;

	private Long tid;
	private String teachernumber;//老师编号
	private String name;//姓名
	private String sex;//性别
	private String mobilenumber;//手机�?
	private String password;//密码
	private String pictureurl;//图片地址
	private String introduce;//�?��
	private String description;//详细介绍
	private Date birthday;//生日
	private String email;//邮箱
	private String address;//地址
	private Set<Banji> banjis;//老师教的班级
	private Set<Grade> grades;//老师教的年级
	private Set<Subject> subjects;//老师教的科目
	private String remark;//备注
	
	public Long getTid() {
		return tid;
	}
	public void setTid(Long tid) {
		this.tid = tid;
	}
	public String getTeachernumber() {
		return teachernumber;
	}
	public void setTeachernumber(String teachernumber) {
		this.teachernumber = teachernumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMobilenumber() {
		return mobilenumber;
	}
	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPictureurl() {
		return pictureurl;
	}
	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Set<Banji> getBanjis() {
		return banjis;
	}
	public void setBanjis(Set<Banji> banjis) {
		this.banjis = banjis;
	}
	public Set<Grade> getGrades() {
		return grades;
	}
	public void setGrades(Set<Grade> grades) {
		this.grades = grades;
	}
	public Set<Subject> getSubjects() {
		return subjects;
	}
	public void setSubjects(Set<Subject> subjects) {
		this.subjects = subjects;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
}
