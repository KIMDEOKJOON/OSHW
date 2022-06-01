<%@ page import = "membership.MemberDTO" %>
<%@ page import = "membership.MemberDAO" %>
<%@ page import="common.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name=request.getParameter("name");
String id = request.getParameter("id");
String pass = request.getParameter("pass");

MemberDAO dao = new MemberDAO(application);
int Result=dao.setMemberDTO(id, pass, name);
dao.close();

if(Result == 1){
	JSFunction.alertLocation("회원가입을 축하합니다.", "LoginForm.jsp", out);
}
else{
	JSFunction.alertBack("회원가입에 실패하였습니다.",out);
}
%>