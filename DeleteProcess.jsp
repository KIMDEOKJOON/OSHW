<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.BoardDTO"%>
<%@ page import="membership.BoardDAO"%>
<%@ include file="IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num"); 
BoardDAO dao = new BoardDAO(application);
BoardDTO dto= new BoardDTO();
dto = dao.selectView(num);

String sessionId=session.getAttribute("UserId").toString();
int delResult=0;

if(sessionId.equals(dto.getId())){
	dto.setNum(num); //왜 해줘야하는지 모름 나중에 빼고 해보기
	delResult = dao.deletePost(dto);
	dao.close();
	if(delResult==1){
		JSFunction.alertLocation("삭제되었습니다.","List.jsp",out);
	}
	else{
		JSFunction.alertBack("삭제에 실패하였습니다.",out);
	}
}
else{
	JSFunction.alertBack("본인만 삭제할 수 있습니다.",out);
	return;
}

%>
