<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
	<!-- #################################################################################################################### -->
	<!-- 로그인 모달창 시작 -->
	<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	      <div class="modal-content">
	
	        <div class="modal-header">
	          <h5 class="modal-title" id="loginModalLabel">
	            로그인
	          </h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body"> 
	          <form action="${pageContext.request.contextPath}/user/UserLoginOk.us" method="post" id="loginForm">
	            <div class="mb-3">
	              <label for="loginId" class="col-form-label">간편 로그인</label>
	              <!-- ################간편 로그인################### -->
	              <input type="text" class="form-control" >
	              <!-- ################간편 로그인################### -->
	            </div>
	            <!-- ---or--- 한줄 넣어야함-->
	
	            <div class="mb-3">
	              <label for="loginId" class="col-form-label">이메일 또는 사용자 이름</label>
	              <input type="text" class="form-control" id="loginId" name="loginId" >
	              <p id="checkLoginId"></p>
	            </div>
	            <div class="mb-3">
	              <label for="loginPw" class="col-form-label">비밀번호</label>
	              <input type="password" class="form-control" id="loginPw" name="loginPw" >
	           	  <p id="checkLoginPw"></p>
	            </div>
	          </form>
	        </div>
	        <div class="modal-footer">
	          <!-- 비밀번호 찾기 -->
	          <!-- <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#findPwModal" data-bs-dismiss="modal">비밀번호 찾기</button> -->
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	          <button type="button" class="btn btn-primary" onclick="login();">로그인</button>
	        </div>
	      </div>
	    </div>
	</div>
	<!-- 로그인 모달창 끝 -->
	
	<!-- 회원가입 모달창 시작 -->
	<div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="joinModalLabel">
	            회원가입
	          </h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body"> 
          	<form action="${pageContext.request.contextPath}/user/UserJoinOk.us" method="post" id="joinForm">
            <div class="mb-3">
              <label for="joinEmail" class="col-form-label">이메일</label>
              <input type="text" class="form-control" id="joinEmail" name="user_email" onkeyup="checkEmail();">
              <p id="emailCheck"></p>
            </div>
            <div class="mb-3">
              <label for="joinPw" class="col-form-label">비밀번호</label>
              <input type="password" class="form-control" id="joinPw" name="user_pw" onkeyup="checkPw();">
              <p id="pwCheck"></p>
            </div>
            <div class="mb-3">
              <label for="joinName" class="col-form-label">사용자 이름</label>
              <input type="text" class="form-control" id="joinName" name="user_name" onkeyup="checkName();">
              <p id="nameCheck"></p>
            </div>
            <!-- <div class="mb-3">
              <label for="joinId" class="col-form-label"></label>
              <input type="text" class="form-control" id="joinId">
            </div> -->
            <!-- <div class="mb-3">
              <label for="joinPhone" class="col-form-label">전화번호</label>
              <input type="text" class="form-control" id="joinPhone">
            </div> -->
            <div class="mb-3">
              <label for="joinBirth" class="col-form-label">생년월일</label>
              <input type="date" class="form-control" id="joinBirth" name="birth_year">
              <p id="birthCheck"></p>
            </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	          <button type="button" class="btn btn-primary" onclick="join();">회원가입</button>
	        </div>
          </form>
        </div>
      </div>
    </div>
 </div>
 <!-- 회원가입 모달창 끝 -->
 <!-- #################################################################################################################### -->
</body>

<!-- <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script> -->

<!-- 가입하기 유효성검사-->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/user.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</html>