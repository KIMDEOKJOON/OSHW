<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
  <title>회원가입 화면 샘플 - Bootstrap</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>


    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
</head>

<body>
<jsp:include page="BS_Header.jsp"/>  
<form name="signupFrm" method="post" action="SignUpProcess.jsp" onsubmit="return validateForm(this);">
  <div class="container" style="margin-top:3%;">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto" style="padding:3% 12%; width: 1000px;">
        <div style="margin-bottom:30px;"><h3 class="mb-3">회원가입</h3></div>
        <form class="validation-form" novalidate>
        
        
          <div class="row">
            <div class="col-md-4 mb-3">
	          <div class="mb-3">
              	<label for="code">이름</label>
              	<input type="text" name="name" class="form-control" id="code" placeholder="공백없이 입력하세요." required>
             	<div class="invalid-feedback">
              	  이름을 입력해주세요.
            	</div>
              </div>
            </div>
            <div class="col-md-3 mb-3">
	          <div class="mb-3">
	           <label for="code">성별</label>
               <select class="form-select" id ="code" aria-label="Default select example">
				  <option selected>선택안함</option>
				  <option value="1">남성</option>
				  <option value="2">여성</option>
			    </select>	
            </div>
          </div>
        
          <div class="col-md-8 mb-3" >
            <label for="address">생년월일</label>
            <input type="text" class="form-control" id="address" placeholder="1999-09-20" >
            <div class="invalid-feedback">
              생년월일을 입력해주세요.
            </div>
          </div>

          <div class="col-md-8 mb-3" >
            <label for="address">이메일<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="email" class="form-control" id="address" placeholder="you@example.com" >
            <div class="invalid-feedback">
              이메일 주소를 입력해주세요.
            </div>
          </div>

          <div class="row">
            <div class="col-md-4 mb-3">
	          <div class="mb-3">
              	<label for="code">학번</label>
              	<input type="text" class="form-control" id="code" placeholder="20184218" required>
             	<div class="invalid-feedback">
              	  학번을 입력해주세요.
            	</div>
              </div>
            </div>
            <div class="col-md-3 mb-3">
	          <div class="mb-3">
	           <label for="code">학과</label>
               <select class="form-select" id ="code" aria-label="Default select example">
				  <option selected>전자공학부</option>
				  <option value="1">컴퓨터공학과</option>
				  <option value="2">정보통신공학부</option>
				  <option value="3">인공지능학과</option>
			    </select>	
            </div>
          </div>

          <div class="row">
          <div class="col-md-6 mb-3">
            <label for="address">아이디</label>
            <input type="text" name="id" class="form-control" id="address" placeholder="6글자 이상" required>
            <div class="invalid-feedback">
              아이디를 입력해주세요.
            </div>         
          </div>   
            <div class="col-md-6 mb-3">
	          <div class="mb-3">

              <input type="button" class="btn btn-warning opacity-75" value="중복 확인" style="margin-top:24px;">
            </div>
          </div>
                
          
          <div class="row">
            <div class="col-md-6 mb-3">
	          <div class="mb-3">
              	<label for="code">비밀번호</label>
              	<input type="password" name="pass" class="form-control" id="code" placeholder="영문, 숫자, 특수문자 중 2종류 이상을 조합하여 최소 10자리 이상" required>
             	<div class="invalid-feedback">
              	  비밀번호를 입력해주세요.
            	</div>
              </div>
            </div>
            <div class="col-md-6 mb-3">
	          <div class="mb-3">
              	<label for="code">비밀번호 재확인</label>
              	<input type="password" class="form-control" id="code" placeholder="" required>
             	<div class="invalid-feedback">
              	  비밀번호를 재확인해주세요.
            	</div>
            </div>
          </div>
         
          
          <div class="row">
            <div class="col-md-4 mb-3">
              <label for="root">가입 경로</label>
              <select class="custom-select d-block w-100" id="root">
                <option value=""></option>
                <option>검색</option>
                <option>지인권유</option>
              </select>
              <div class="invalid-feedback">
                가입 경로를 선택해주세요.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="code">추천인 코드</label>
              <input type="text" class="form-control" id="code" placeholder="">
            </div>
          </div>
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-warning btn-lg btn-block opacity-75" type="submit" style="width:100px;margin-left:85%;">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
    </footer>
  </div>
</form>
  <script>
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
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
  <jsp:include page="BS_Footer.jsp"/>
</body>

</html>