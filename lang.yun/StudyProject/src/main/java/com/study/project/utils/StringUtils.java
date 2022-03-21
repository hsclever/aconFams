package com.study.project.utils;

public class StringUtils {
	public static String NVL(String str, String def) {
		
		if(str == null || "".equals(str))
			return def;
		else
			return str;
	}
	
	public static String NVL(Object str, String def) {
		if(str == null || "".equals(str))
			return def;
		else
			return str.toString();
	}
}


