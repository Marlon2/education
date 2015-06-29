package cn.edu.education.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

public class Student implements Serializable{

	private static final long serialVersionUID = 1L;

	private Long sid;
	private String stunumber;//学号
	private Grade grade;//年级
	private Set<Banji> banjis;//班级
	private String name;//姓名
	private String sex;//性别
	private String mobilenumber;//手机
	private String password;//密码
	private Date birthday;//生日
	private String email;//邮箱
	private String address;//地址
	private Date registertime;//注册时间
	private String remark;//备注
	
	public Long getSid() {
		return sid;
	}
	public void setSid(Long sid) {
		this.sid = sid;
	}
	public String getStunumber() {
		return stunumber;
	}
	public void setStunumber(String stunumber) {
		this.stunumber = stunumber;
	}
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public Set<Banji> getBanjis() {
		return banjis;
	}
	public void setBanjis(Set<Banji> banjis) {
		this.banjis = banjis;
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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
	public Date getRegistertime() {
		return registertime;
	}
	public void setRegistertime(Date registertime) {
		this.registertime = registertime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
