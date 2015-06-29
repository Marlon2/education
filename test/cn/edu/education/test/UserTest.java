package cn.edu.education.test;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

import cn.edu.education.domain.Banji;
import cn.edu.education.domain.Grade;
import cn.edu.education.domain.Student;
import cn.edu.education.domain.Teacher;
import cn.edu.education.domain.User;
import cn.edu.education.service.BanjiService;
import cn.edu.education.service.StudentService;
import cn.edu.education.service.UserService;
import cn.edu.education.test.BaseSpring;

public class UserTest extends BaseSpring{

	@Test
	public void testUser(){
		UserService userService = (UserService) context.getBean("userService");
		User user = new User();
		user.setUsername("admin");
		user.setPassword("admin");
		user.setRole("管理员");
		userService.saveUser(user);
	}
	@Test
	public void testqueryByPage(){
		StudentService studentService = (StudentService) context.getBean("studentService");
	}
	@Test
	public void banjiupdateTest(){
		BanjiService banjiService = (BanjiService) context.getBean("banjiService");
		Banji banji = new Banji();
		//banji.setBid(12L);
		banji.setNumber("12");
		banji.setClassname("12");
		banji.setEnddate(new Date());
		Grade grade = new Grade();
		grade.setGid(1L);
		banji.setGrade(grade);
		Teacher tea = new Teacher();
		Set<Student> stu = new HashSet<Student>();
		banji.setStudents(stu);
		Set<Teacher> tes = new HashSet<Teacher>();
		banji.setTeachers(tes);
		
		
		banjiService.updateBanji(banji);
		
		
	}
}
