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
	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
	  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
	    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
	  </symbol>
	  <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
	    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
	  </symbol>
	  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
	    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
	  </symbol>
	</svg>
</head>

<body>
	<jsp:include page="BS_Header.jsp"/>
		<section class="h-100">
			<div class="container h-100">
				<div class="row justify-content-sm-center h-100">
					<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
						<div class="text-center my-5">
							<img style="filter: drop-shadow(3px 3px 5px #aeaeae);" src="https://getbootstrap.kr/docs/5.0/assets/brand/bootstrap-logo-black.svg" alt="logo" width="100">
						</div>
						<div class="card shadow-lg" Style="border:0px;">
							<div class="card-body p-5">
								<h1 class="fs-4 card-title fw-bold mb-4" style="text-shadow:1px 1px 2px grey;">Login</h1>
								<%
								String Token = request.getParameter("Token");
								if(Token != null){
								%>
								<div class="alert alert-light d-flex align-items-center" role="alert" style="padding:10px 0px 0px 0px;margin-bottom:5px;"> 
								  <svg class="bi flex-shrink-0 me-2" width="15" height="15" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
								  <div>
								    ????????? <%=Token%>??? ???????????????.
								  </div>
								</div>
								<%	
								}
								%>
								<form method="POST" name="loginFrm" class="needs-validation" action="LoginProcess.jsp" onsubmit="return validateForm(this);" novalidate="" autocomplete="off">
									<div class="mb-3">
										<label class="mb-2 text-muted" for="email">ID</label>
										<input id="email" type="text" class="form-control" name="user_id" required autofocus>
										<div class="invalid-feedback">
											???????????? ?????? ?????????.
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
									    	??????????????? ???????????????.
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
if (session.getAttribute("UserId") == null) {  // ????????? ?????? ??????
// ???????????? ??????
%>
    <script>
    function validateForm(form) {
        if (!form.user_id.value) {
            alert("???????????? ???????????????.");
            return false;
        }
        if (form.user_pw.value == "") {
            alert("??????????????? ???????????????.");
            return false;
        }
    }
    </script>
<%
} 
else { // ???????????? ??????
%>
    <%= session.getAttribute("UserName") %> ?????????, ????????????????????????.<br />
    <a href="Logout.jsp">[????????????]</a>
<%
}
%>
	
	<jsp:include page="BS_Footer.jsp"/>
</body>
</html>