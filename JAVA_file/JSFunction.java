package common;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
	
	public static void location(String url, JspWriter out) {
		try {
			String script = ""
					+"<script>"
					+"	location.href='" + url + "';"
					+"</script>";
			out.println(script);			
		}
		catch(Exception e) {
			
		}
	}	
	
	public static void alert(String msg, JspWriter out) {
		try {
			String script = ""
					+"<script>"
					+"	alert('" + msg +"');"
					+"</script>";
			out.println(script);			
		}
		catch(Exception e) {
			
		}
	}	
	
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = ""
					+"<script>"
					+"	alert('" + msg +"');"
					+"	location.href='" + url + "';"
					+"</script>";
			out.println(script);			
		}
		catch(Exception e) {
			
		}
	}
	
	public static void alertBack(String msg,JspWriter out) {
		try {
			String script = ""
					+"<script>"
					+"	alert('" + msg +"');"
					+"	history.back();"
					+"</script>";
			out.println(script);			
		}
		catch(Exception e) {
			
		}	
		
	}
	
}
