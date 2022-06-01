<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="author" content="Muhamad Nauval Azhar">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta name="description" content="This is a login page template based on Bootstrap 5">
	<title>Bootstrap 5 Login Page</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<jsp:include page="BS_Header.jsp"/>
		<section class="h-100">
			<div class="container h-100">
				<div class="row justify-content-sm-center h-100">
					<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
						<div class="text-center my-5">
							<img src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg" alt="logo" width="100">
						</div>
						<div class="card shadow-lg" Style="border:0px;">
							<div class="card-body p-5">
								<h1 class="fs-4 card-title fw-bold mb-4" style="text-shadow:1px 1px 2px grey;">Login</h1>
								<%
								String Token = request.getParameter("Token");
								if(Token != null){
								%>
								<p><b style="color:red;">로그인 <%=Token%>회 오류입니다.</b></p>
								<%	
								}
								%>
								<form method="POST" name="loginFrm" class="needs-validation" action="LoginProcess.jsp" onsubmit="return validateForm(this);" novalidate="" autocomplete="off">
									<div class="mb-3">
										<label class="mb-2 text-muted" for="email">ID</label>
										<input id="email" type="text" class="form-control" name="user_id" required autofocus>
										<div class="invalid-feedback">
											아이디를 입력 하세요.
										</div>
									</div>
	
									<div class="mb-3">
										<div class="mb-2 w-100">
											<label class="text-muted" for="password">Password</label>
											<a href="forgot.html" class="float-end">
												Forgot Password?
											</a>
										</div>
										<input id="password" type="password" class="form-control" name="user_pw" required>
									    <div class="invalid-feedback">
									    	비밀번호를 입력하세요.
								    	</div>
									</div>
	
									<div class="d-flex align-items-center">
										<div class="form-check">
											<input type="checkbox" name="remember" id="remember" class="form-check-input">
											<label for="remember" class="form-check-label">Remember Me</label>
										</div>
										<button type="submit" class="btn btn-warning ms-auto shadow opacity-75">
										Login
										</button>
									</div>
								</form>
							</div>
							<div class="card-footer py-3 border-0">
								<div class="text-center">
									Don't have an account? <a href="register.html" class="text-dark">Create One</a>
								</div>
							</div>
						</div>
						<div class="text-center mt-5 text-muted">
			
						</div>
					</div>
				</div>
			</div>
		</section>
	<script src="js/login.js"></script>
	    <span style="color: red; font-size: 1.2em;"> 
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>
    </span>
<%
if (session.getAttribute("UserId") == null) {  // 로그인 상태 확인
// 로그아웃 상태
%>
    <script>
    function validateForm(form) {
        if (!form.user_id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (form.user_pw.value == "") {
            alert("패스워드를 입력하세요.");
            return false;
        }
    }
    </script>
<%
} 
else { // 로그인된 상태
%>
    <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
    <a href="Logout.jsp">[로그아웃]</a>
<%
}
%>
	
	<jsp:include page="BS_Footer.jsp"/>
</body>
</html>