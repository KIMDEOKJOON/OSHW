<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<jsp:include page="Link.jsp"/>
<h2>회원제 게시판 - 글쓰기(Write)</h2>
<form name="writeFrm" method="post" action="WriteProcess.jsp" onsubmit="return validateForm(this);">
	<table style="border:1px; width:90%;"> <!-- 인라인style태그로 안먹힌다 -->
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" style="width: 90%;"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" style="width:90%;height:100px;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성 완료</button>
				<button type="reset">다시 입력</button>
				<button type="button" onclick="location.href='List.jsp';">목록 보기</button>
			</td>
		</tr>
	</table>

</form>
<jsp:include page="BS_Footer.jsp"/>
</body>
</html>
