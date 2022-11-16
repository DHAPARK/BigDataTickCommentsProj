<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
      <a class="navbar-brand" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">
      	<img style="height: 30px;" src = "/assets/images/logo.png">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample03" style="font-size: small;">
        <ul class="navbar-nav me-auto mb-2 mb-sm-0">
          <!-- <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">키워드 추천</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="#">영향력 순위</a>
          </li> -->
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item">
            <!-- <a class="nav-link active" aria-current="page" href="#">멤버십 구독하기 😎</a> -->
            <a class="nav-link active" aria-current="page" href="#">${ userInfo.user_name }님 어서오세요 😎</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/user/UserLogout.us">로그아웃</a>
          </li>
          <!-- <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">마이페이지</a>
          </li> -->
        </ul>
      </div>
    </div>
</body>
</html>