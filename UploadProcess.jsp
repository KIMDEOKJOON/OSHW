<%@ page import="membership.MyFileDAO"%>
<%@ page import="membership.MyFileDTO"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String saveDirectory=application.getRealPath("/Upload");
int maxPostSize=1024*1000; 
String encoding="UTF-8";
try{
	MultipartRequest mr=new MultipartRequest(request,saveDirectory,maxPostSize,encoding,new DefaultFileRenamePolicy());
	
	String fileName = mr.getFilesystemName("attachedFile");
	String ext=fileName.substring(fileName.lastIndexOf("."));
	String now= new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	String newFileName=now+ext;
	
	File oldFile=new File(saveDirectory+File.separator+fileName);
	File newFile=new File(saveDirectory+File.separator+newFileName);
	oldFile.renameTo(newFile);
	
	String name=mr.getParameter("name");
	String title=mr.getParameter("Author");
	String[] cateArray=mr.getParameterValues("cate");
	StringBuffer cateBuf=new StringBuffer();
	if(cateArray==null){
		cateBuf.append("선택없음");
	}
	else{
		for(String s:cateArray){
			cateBuf.append(s+",");	
		}
	}
	MyFileDTO dto=new MyFileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);

	MyFileDAO dao=new MyFileDAO();
	dao.insertFile(dto);
	dao.close();

	response.sendRedirect("FileList.jsp");
}
catch(Exception e){
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일 업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>