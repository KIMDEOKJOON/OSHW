<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.BoardDTO"%>
<%@ page import="membership.BoardDAO"%>
<%@ include file="IsLoggedIn.jsp" %>
<%
BoardDAO dao = new BoardDAO(application);
String num=request.getParameter("num");
BoardDTO dto = dao.selectView(num);
String sessionId=session.getAttribute("UserId").toString();
if(!sessionId.equals(dto.getId())){
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.",out);
	return;
}
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
<script type="text/javascript">
function validateForm(form){
	if(form.title.value == ""){
		alert("제목을 입력하세요");
		form.title.focus();
		return false;
	}
	if(form.content.value == ""){
		alert("내용을 입력하세요");
		form.content.focus();
		return false;
	}
	 
}
</script>
</head>
<body>
<jsp:include page="BS_Header.jsp"/>
<div class="container" style="margin-top:3%; width:80%;">
	<h2 align="left" style="text-shadow:1px 1px 1px #c2c2c2;">수정하기</h2>
	<div class="container-fruid shadow" style="margin: 0;">
		<form name="writeFrm" method="post" action="EditProcess.jsp" onsubmit="return validateForm(this);">
			<input type="hidden" name="num" value="<%= dto.getNum()%>"/>
			<table class="table" style="width:90%;"> <!-- 인라인style태그로 안먹힌다 -->
				<tr>
					<th style="padding:7px 0px 0px 14px ;">제목</th>
					<td><input class="form-control me-2 " type="text" name="title" style="width: 90%;" value="<%= dto.getTitle()%>"/></td>
				</tr>
				<tr>
					<th style="padding:7px 0px 0px 14px ;">내용</th>
					<td><textarea class="form-control me-2 " name="content" style="border-color:#c2c2c2;width:90%;height:200px;"><%= dto.getContent()%></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button style="margin: 3px 2px;" class="btn btn-outline-dark opacity-75" type="submit">작성 완료</button>
						<button style="margin: 3px 2px;" class="btn btn-outline-dark opacity-75" type="reset">다시 입력</button>
						<button style="margin: 3px 2px;" class="btn btn-outline-dark opacity-75" type="button" onclick="location.href='List.jsp';">목록 보기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<img style="max-width: 100%; height: auto;" src="LINTFX.png" alt=""/>
<jsp:include page="BS_Footer.jsp"/>
</body>
</html>
