package cn.edu.education.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

public class Banji implements Serializable{

	private static final long serialVersionUID = 1L;

	private Long bid;
	private String number;//编号
	private Grade grade;//年级
	private String classname;//班级名称
	private String description;//班级描述
	private Long studentnumber;//班级人数
	private Long signnumber;//已报人数
	private int classnumber;//课时数
	private Date startdate;//开始日期
	private Date enddate;//结束日期
	private String startime;//上课时间8:00-11:00
	private String address;//上课地址
	private double price;//价格
	private Set<Teacher> teachers;//上课老师
	private Set<Student> students;//上课学生
	private String remark;//备注
	
	public Long getBid() {
		return bid;
	}
	public void setBid(Long bid) {
		this.bid = bid;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public Long getStudentnumber() {
		return studentnumber;
	}
	public void setStudentnumber(Long studentnumber) {
		this.studentnumber = studentnumber;
	}
	public Long getSignnumber() {
		return signnumber;
	}
	public void setSignnumber(Long signnumber) {
		this.signnumber = signnumber;
	}
	public int getClassnumber() {
		return classnumber;
	}
	public void setClassnumber(int classnumber) {
		this.classnumber = classnumber;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getStartime() {
		return startime;
	}
	public void setStartime(String startime) {
		this.startime = startime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Set<Teacher> getTeachers() {
		return teachers;
	}
	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}
	public Set<Student> getStudents() {
		return students;
	}
	public void setStudents(Set<Student> students) {
		this.students = students;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
