<%@ page import= "java.util.Map" %>
<%@ page import= "java.util.HashMap" %>
<%@ page import= "java.util.List" %>
<%@ page import= "membership.BoardDTO" %>
<%@ page import= "membership.BoardDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//DAO를 생성해 DB에 연결
BoardDAO dao = new BoardDAO(application);

//사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>(); 
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
 param.put("searchField", searchField);
 param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);  // 게시물 수 확인
List<BoardDTO> boardLists = dao.selectList(param);  // 게시물 목록 받기
dao.close();  // DB 연결 닫기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<title>회원제 게시판</title>
</head>
<body>
 <jsp:include page="BS_Header.jsp"/>
<div class="container" style="margin-top:3%; width:80%;">
<h2>게시판</h2>
<div class="container-fruid shadow" style="margin: 0;">
  <div class="row">
    <div class="col-md-9">
	 <form method="get" style="padding-top: 10px;">  
	 <table width="90%">
	 <tr>
	     <td align="right">
             <select class="form-select" name ="searchField" aria-label="Default select example" style="width:70px;display:inline-block;">
	             <option value="title">제목</option> 
	             <option value="content">내용</option>
			 </select>
	         <input class="form-control me-2 " name="searchWord" type="text" placeholder="Search" aria-label="Search" style="width:200px;display:inline-block;"/>
	         <input class="btn btn-outline-primary" type="submit" value="검색하기" />
	     </td>    
	 </tr>   
	 </table>
	 </form>
    </div>
    
    <div class="col-md-3" align="right" style="padding: 0px;">
    <button type="button" class="btn btn-primary" onclick="location.href='Write.jsp';" style="margin:10px 20px 10px 10px ;padding:5px 10px 5px 10px;">글쓰기</button>
	</div>
    
  </div>
  


 <!-- 게시물 목록 테이블(표) --> 
 <table class="table" width="90%" align="center">
     <!-- 각 칼럼의 이름 --> 
   <thead>  
     <tr>
         <th width="10%" align="left">번호</th>
         <th width="45%">제목</th>
         <th width="20%">작성자</th>
         <th width="10%">조회수</th>
         <th width="15%">작성일</th>
     </tr>
   </thead>
     <!-- 목록의 내용 --> 
     
<%
if (boardLists.isEmpty()) {
 // 게시물이 하나도 없을 때 
%> 
   <tbody>
     <tr>
         <td colspan="5" align="center">
             <b>등록된 게시물이 없습니다!</b>
         </td>
     </tr>
   </tbody>
<%
}
else {
 // 게시물이 있을 때 
 int virtualNum = 0;  // 화면상에서의 게시물 번호
 for (BoardDTO dto : boardLists)
 {
     virtualNum = totalCount--;  // 전체 게시물 수에서 시작해 1씩 감소
%>
   <tbody>
     <tr align="center">
         <td align="left"><%= virtualNum %></td>  <!--게시물 번호-->
         <td align="left">  <!--제목(+ 하이퍼링크)-->
             <a href="View.jsp?num=<%= dto.getNum() %>" style="text-decoration-line:none;"><%= dto.getTitle() %></a> 
         </td>
         <td align="left"><%= dto.getId() %></td>          <!--작성자 아이디-->
         <td align="left"><%= dto.getVisitcount() %></td>  <!--조회수-->
         <td align="center"><%= dto.getPostdate() %></td>    <!--작성일-->
     </tr>
   </tbody>
<%
 }
}
%>
</table>

<nav aria-label="Page navigation example" style="padding-bottom:0.5px;">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link"><<</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">>></a>
    </li>
  </ul>
</nav>

</div>
</div>


<jsp:include page="BS_Footer.jsp"/>
</body>
</html>