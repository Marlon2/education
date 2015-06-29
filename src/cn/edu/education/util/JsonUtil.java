package cn.edu.education.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import cn.edu.education.domain.User;
import net.sf.json.JSONArray;

public class JsonUtil {

	/*public static JSONArray formatCollToJsonArray(Collection col){
		
		return null;
	}
	*/
	public static void main(String[] args) {
		List<User> list =new ArrayList<User>();
		User u1 = new User();
		u1.setUid(1L);
		u1.setUsername("haha");
		u1.setPassword("111");
		User u2 = new User();
		u2.setUid(2L);
		u2.setUsername("hehe");
		u2.setPassword("222");
		list.add(u1);
		list.add(u2);
		/*JSONArray jsonArray2 = JSONArray.fromObject( list ); */
		System.out.println( JSONArray.fromObject( list ).toString() ); 
	}
}
