<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table border="1" width="90%"> 
    <tr>
        <td align="center">
        <!-- 로그인 여부에 따른 메뉴 변화 -->
        	<a href="SignUp.jsp">회원가입</a>
        	&nbsp;&nbsp;&nbsp; <!-- 3칸 공백 -->
            <a href="List.jsp">게시판</a> 
            &nbsp;&nbsp;&nbsp; 
        <% if (session.getAttribute("UserId") == null) { %>
            <a href="LoginForm.jsp">로그인</a>
        <% } else { %>
            <a href="Logout.jsp"><img alt="오리" src="330&_v=20210325103140">로그아웃</a>
        <% } %>
        </td>
    </tr>
</table>
