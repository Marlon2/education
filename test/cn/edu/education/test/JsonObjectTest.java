package cn.edu.education.test;

import net.sf.json.JSONArray;

import org.junit.Test;

public class JsonObjectTest {

	@Test
	public void jsonTest(){
		String str = "[{sid:0,name:'朱义涛',sex:'男',mobilenumber:'13783650504',email:'240003993@qq.com',address:'北京市'},{sid:1,name:'小朱',sex:'男',mobilenumber:'13783650505',email:'123456@qq.com',address:'null'},]";
		JSONArray jsonArray = JSONArray.fromObject(str);
		System.out.println(jsonArray.toString());
	}
}
