<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container { 
		width:520px;
		border:1px solid black;
		padding:20px 40px;
		margin:0 auto;
	}
fieldset { margin-bottom:15px; }
legend { font-weight:bold; }
ul {list-style-type: none;}
li { line-height:30px;}
</style>
</head>
<body>
    <jsp:include page="Link.jsp" />
	<div id="container">
		<h1>조선대학교 IT융합대학 에브리타임 회원가입 </h1>
		<p>HTML, CSS, Javascript에 대한 기술적 이해와 경험이 있는 분을 찾습니다.</p>
		<hr>
		<form method="post" action="SignUpProcess.jsp">
			<h4>개인정보</h4>
			<ul>
				<li>
					<label for="sname"> 이름 </label>
					<input type="text" id="sname" autofocus placeholder="공백없이 입력하세요">
				</li>
				<li>
					<label for="sname"> 생년월일 </label>
					<input type="text" id="sname" autofocus placeholder="년(4자)">
					<select>
						<option>1월</option>
						<option>2월</option>
						<option>3월</option>
						<option>4월</option>
						<option>5월</option>
						<option>6월</option>
						<option>7월</option>
						<option>8월</option>
						<option>9월</option>
						<option>10월</option>
						<option>11월</option>
						<option>12월</option>												
					</select>
					<input type="text" id="sname" autofocus placeholder="일">
				</li>				
				<li>
					<label for="snumber"> 휴대전화 </label>
					<input type="text" id="snum" placeholder="010-0000-0000">
				</li>
				<li>
					<label for="snumber"> 학번 </label>
					<input type="text" id="snum">
					<select>
						<option>학과선택</option>
						<option>전자공학부</option>
						<option>컴퓨터공학과</option>
						<option>정보통신공학부</option>
						<option>인공지능학과</option>
					</select>
					<ul>
						<li>
							<label><input type="radio" name="field" value="an"> 이미지1</label>
						</li>
						<li>
							<label><input type="radio" name="field" value="pd"> 이미지2</label>
						</li>
						<li>
							<label><input type="radio" name="field" value="eng"> 이미지3</label>
						</li>
					</ul>					
				</li>				

				<li>
					<label for="snumber"> 아이디 </label>
					<input type="text" id="snum">
					<button type="button">아이디 중복확인</button>
				</li>
				<li>
					<label for="snumber"> 이메일(선택) </label>
					<input type="text" id="snum">
				</li>
				<li>
					<label for="snumber"> 비밀번호 </label>
					<input type="text" id="snum">
				</li>
				<li>
					<label for="snumber"> 비밀번호 확인 </label>
					<input type="text" id="snum">
				</li>
			</ul>
		<input type="submit" value="가입하기">
		</form>
	</div>		
</body>
</html>