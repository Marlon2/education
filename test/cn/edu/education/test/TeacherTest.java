package cn.edu.education.test;

import java.util.List;

import org.junit.Test;

import cn.edu.education.domain.Teacher;
import cn.edu.education.service.TeacherService;

public class TeacherTest extends BaseSpring{

	@Test
	public void getGirlTeacher(){
		TeacherService teacherService = (TeacherService) context.getBean("teacherService");
		List<Teacher> teachers1 =  (List<Teacher>) teacherService.getGirlTeachers();
		System.out.println(teachers1.size()+"==");
	}
}
