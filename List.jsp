<%@ page import= "java.util.Map" %>
<%@ page import= "java.util.HashMap" %>
<%@ page import= "java.util.List" %>
<%@ page import= "membership.BoardDTO" %>
<%@ page import= "membership.BoardDAO" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);
Map<String,Object> param = new HashMap<String,Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);
List<BoardDTO> boardLists = dao.selectList(param);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 (1유형)</title>
</head>
<body>
<h2>목록 보기(List)</h2>
	<form method="get">
		<table style=" border:1px; width: 90%;">
			<tr>
				<td style="align:center">
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord"/>
					<input type="submit" value="검색하기"/>
				</td>			
			</tr>
		</table>
	</form>
	
	<table style=" border:1px; width: 90%;">
		<tr>
			<th style="width:10%">번호</th>
			<th style="width:50%">제목</th>
			<th style="width:15%">작성자</th>
			<th style="width:10%">조회수</th>
			<th style="width:15%">작성일</th>
		</tr>
<%
if(boardLists.isEmpty()){
%>
		<tr>
			<td style="colspan: 5px; align: center;">등록된 게시물이 없습니다. ^^</td>
		</tr>
<%
}
else{
	int virtualNum=0;
	for (BoardDTO dto : boardLists){
		virtualNum = totalCount--;
%>
 		<tr style="align:center">
 			<td><%= virtualNum %></td>
 			<td style="align:left"><a href="View.jsp?num=<%= dto.getNum() %>"><%=dto.getTitle() %></a></td>
 			<td style="align:center"><%= dto.getId() %></td>
 			<td style="align:center"><%= dto.getVisitcount() %></td>
 			<td style="align:center"><%= dto.getPostdate() %></td>
 		</tr>
<%		
	}
}
%>
	</table>
		
	<table style=" border:1px; width: 90%;">
		<tr style="align:right">
		<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
		</tr>	
	</table>
</body>
</html>