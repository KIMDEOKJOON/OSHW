<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
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
<script type="text/javascript">
function validateForm(form){
	if(form.name.value == ""){
		alert("이름을 입력하세요");
		form.name.focus();
		return false;
	}
	if(form.id.value == ""){
		alert("아이디를 입력하세요");
		form.id.focus();
		return false;
	}
	if(form.pass.value == ""){
		alert("비밀번호를 입력하세요");
		form.pass.focus();
		return false;
	}
	
}
</script>
</head>
<body>
	<jsp:include page="BS_Header.jsp"/>
	<div id="container">
		<h1>조선대학교 IT융합대학 에브리타임 회원가입 </h1>
		<p>IT융합대학 학생들의 정보공유 및 커뮤니티</p>
		<hr>
		<form name="signupFrm" method="post" action="SignUpProcess.jsp" onsubmit="return validateForm(this);">
			<h4>개인정보</h4>
			<ul>
				<li>
					<label for="sname"> 이름 </label>
					<input type="text" id="sname" name="name" autofocus placeholder="공백없이 입력하세요">
					성별
					<select>
						<option>선택</option>
						<option>남성</option>
						<option>여성</option>
						<option>선택안함</option>
					</select>
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
					<input type="tel" id="snum" placeholder="010-0000-0000">
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
				</li>				

				<li>
					<label for="snumber"> 아이디(6글자 이상)</label>
					<input type="text" id="snum" name="id">
					<button type="button">아이디 중복확인</button>
				</li>
				<li>
					<label for="snumber"> 이메일(선택) </label>
					<input type="email" id="snum">
					@
					<select>
						<option>이메일 선택</option>					
						<option>gmail.com</option>					
						<option>naver.com</option>
						<option>daum.net</option>
						<option>nate.com</option>
						<option>outlook.com</option>
					</select>
				</li>
				<li>
					<label for="snumber"> 비밀번호 </label>
					<input type="password" id="snum" name="pass">
				</li>
				<li>
					<label for="snumber"> 비밀번호 확인 </label>
					<input type="password" id="snum">
				</li>
			</ul>
		<input type="submit" value="가입하기">
		</form>
	</div>
<jsp:include page="BS_Footer.jsp"/>			
</body>
</html>