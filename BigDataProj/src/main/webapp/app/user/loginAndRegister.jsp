<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
	a { text-decoration: none; }
	.form-control { line-height: 2.3rem; }
	.modal-body { width: 380px; margin: 0 auto; }
/* 	#joinForm { width: 390px; margin: 0 auto; } */
	#choice { font-size: small; }
</style>
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
	          <div class="mb-3" id="kakaologin">
	              <label for="loginId" class="col-form-label">간편 로그인</label>
	              <!-- ################간편 로그인################### -->
	              <form id="kakaoJoinForm" action="${pageContext.request.contextPath}/user/KakaoLoginOk.us" method="post">
					<a><img onclick="kakaoLogin()" src="${pageContext.request.contextPath}/assets/images/kakao_login_large_wide.png" style="width: -webkit-fill-available;"></a>					
	              	<input type="hidden" name="age_range" id="age_range" />
	              	<input type="hidden" name="email" id="email" />
	              	<input type="hidden" name="kakao_id" id="kakao_id">
	              </form>
	              	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	              
	              <!-- ################간편 로그인################### -->
	          </div>
	          <form action="${pageContext.request.contextPath}/user/UserLoginOk.us" method="post" id="loginForm" name="loginForm">
	            
	            <!-- ---or--- 한줄 넣어야함-->
	
	            <div class="mb-3">
	              <label for="loginId" class="col-form-label">사용자 이름 또는 이메일</label>
	              <input type="text" class="form-control" id="loginId" name="loginId" placeholder="Username or email"/>
	              <p id="checkLoginId"></p>
	            </div>
	            <div class="mb-3">
	              <label for="loginPw" class="col-form-label">비밀번호</label>
	              <input type="password" class="form-control" id="loginPw" name="loginPw" placeholder="Password" />
	           	  <!-- 로그인 상태 유지 체크박스 -->
				<div class="checkbox mt-4">
	                <label>
	                  <input type="checkbox" name="autoLogin" value="true" />
	                  로그인 상태 유지
	                </label>
	            </div>

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
	              <input type="text" class="form-control" id="joinEmail" name="user_email" placeholder="Email" onkeyup="checkEmail();"/>
	              <p id="emailCheck"></p>
	            </div>
	            <div class="mb-3">
	              <label for="joinName" class="col-form-label">사용자 이름</label>
	              <input type="text" class="form-control" id="joinName" name="user_name" placeholder="Username" onkeyup="checkName();"/>
	              <p id="nameCheck"></p>
	            </div>
	            <div class="mb-3">
	              <label for="joinPw" class="col-form-label">비밀번호</label>
	              <input type="password" class="form-control" id="joinPw" name="user_pw" placeholder="Password" onkeyup="checkPw();"/>
	              <p id="pwCheck"></p>
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
	          <div class="mb-3">
	            <label><input type="checkbox" class=""> <span id="choice">&nbsp;이벤트 등 프로모션 알림 메일 수신에 동의합니다. (선택)</span></label>
	            <label><input type="checkbox" class="" checked >
	              <a href="${pageContext.request.contextPath}/fixed/privacyPolicy.jsp" target="_blank"> <span id="choice">&nbsp;개인정보처리방침</span>
	                <svg class="style__SVG-sc-17sew62-0 eWSRQr" size="1" aria-hidden="true" focusable="false" role="img"
	                  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="width: 0.7rem; height: 0.7rem;">
	                  <path fill="currentColor" d="M432,320H400a16,16,0,0,0-16,16V448H64V128H208a16,16,0,0,0,16-16V80a16,16,0,0,0-16-16H48A48,48,0,0,0,0,112V464a48,48,0,0,0,48,48H400a48,48,0,0,0,48-48V336A16,16,0,0,0,432,320ZM488,0h-128c-21.37,0-32.05,25.91-17,41l35.73,35.73L135,320.37a24,24,0,0,0,0,34L157.67,377a24,24,0,0,0,34,0L435.28,133.32,471,169c15,15,41,4.5,41-17V24A24,24,0,0,0,488,0Z"></path>
	                </svg>
	              </a> <span id="choice">및 </span>

	                <a href="${pageContext.request.contextPath}/fixed/term.jsp" target=" _blank"><span id="choice">이용약관</span>
	                <svg class="" size="1" aria-hidden="true" focusable="false" role="img"
	                  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="width: 0.7rem; height: 0.7rem;">
	                  <path fill="currentColor" d="M432,320H400a16,16,0,0,0-16,16V448H64V128H208a16,16,0,0,0,16-16V80a16,16,0,0,0-16-16H48A48,48,0,0,0,0,112V464a48,48,0,0,0,48,48H400a48,48,0,0,0,48-48V336A16,16,0,0,0,432,320ZM488,0h-128c-21.37,0-32.05,25.91-17,41l35.73,35.73L135,320.37a24,24,0,0,0,0,34L157.67,377a24,24,0,0,0,34,0L435.28,133.32,471,169c15,15,41,4.5,41-17V24A24,24,0,0,0,488,0Z"></path>
	                </svg>
	                </a><span id="choice"> 에 동의합니다. (필수)</span></label>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/kakao.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</html>