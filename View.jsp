<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.BoardDTO"%>
<%@ page import="membership.BoardDAO"%>
<%@ page import= "membership.MemberDTO" %>
<%@ page import= "membership.MemberDAO" %>
<%
String num = request.getParameter("num");

BoardDAO dao = new BoardDAO(application);
dao.updateVisitCount(num);
BoardDTO dto = dao.selectView(num);
dao.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<title>회원제 게시판</title>
<script>
function deletePost(){
	let confirmed = confirm("정말로 삭제하겠습니까?");
	if(confirmed){
		let form = document.writeFrm;
		form.method = "post";
		form.action = "DeleteProcess.jsp";
		form.submit();
	}
}
</script>
</head>
<body>
<jsp:include page="BS_Header.jsp"/>
<div class="container" style="margin-top:3%; width:80%;">
<h2>상세보기</h2>
	<div class="container-fruid shadow" style="margin: 0;">
		
		
		<form name="writeFrm">
			<input type="hidden" name="num" value="<%= dto.getNum() %>"/>
			
			<table class="table" width="90%">
			<tr>
				<th>번호</th>
				<td><%=dto.getNum() %></td>
				<th>열람자</th>
<%
if(session.getAttribute("UserId")!= null){ 
	MemberDAO dao2=new MemberDAO(application);
	MemberDTO dto2 = dao2.headerName(session.getAttribute("UserId").toString());
	dao2.close();
%>
				<td><%=dto2.getName()%></td>
<%
}
else{
%>
				<td>Guest</td>
<%
}
%>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getName() %></td>
				<th>작성일</th>
				<td><%=dto.getPostdate() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<th><%=dto.getTitle() %></th>
				<th>조회수</th>
				<th><%=dto.getVisitcount() %></th>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" height="100"><%=dto.getContent().replace("\r\n", "<br/>") %></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<%
					if(session.getAttribute("UserId")!=null && session.getAttribute("UserId").toString().equals(dto.getId())){
					
					%>
					<button type="button" style="margin: 3px 2px;" class="btn btn-outline-dark opacity-75" onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">수정하기</button>
					<button type="button" style="margin: 3px 2px;"class="btn btn-outline-dark opacity-75" onclick="deletePost();">삭제하기</button>
					<%
					}
					%>				
					<button type="button" style="margin: 3px 2px;" class="btn btn-outline-dark opacity-75" onclick="location.href='List.jsp';">목록보기</button>
				</td>
			</tr>
		
		</table>
		</form>
	</div>
</div>


<jsp:include page="BS_Footer.jsp"/>
</body>
</html>