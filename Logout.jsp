<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "common.JSFunction" %>
<%
	session.removeAttribute("UserId");
	session.removeAttribute("UserName");
	
	session.invalidate();
	JSFunction.alertLocation("정상적으로 로그아웃 되었습니다.", "BS_LoginForm.jsp", out);	
%>