<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
<!-- 가입하기 유효성검사-->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/user.js"></script>
</html>