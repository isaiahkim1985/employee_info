package com.firstTest.common.util;

public class Main_Util {
	
	public static int nvl(String text) {
		return nvl(text, 0);
	}
	
	
	
	public static int nvl(String text, int def) {
		int ret = def;
		try {
			ret = Integer.parseInt(text);
		} catch (Exception e) {
			ret = def;
		}
		return ret;
	}
	
	public static String nvl(Object text, String def) {
		if(text==null || "".equals(text.toString().trim())){
			return def;
		} else {
			return text.toString();
		}
	}

}
