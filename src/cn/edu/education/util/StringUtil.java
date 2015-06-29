package cn.edu.education.util;

public class StringUtil {
	public static boolean isEmpty(String str){
		if("".equals(str)|| str==null){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isNotEmpty(String str){
		if(!"".equals(str)&&str!=null){
			return true;
		}else{
			return false;
		}
	}
	
	public static String isNull(String str){
		if(str==null){
			return "";
		}else{
			return str;
		}
	}
}
