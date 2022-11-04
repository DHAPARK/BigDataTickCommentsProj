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
      <a class="navbar-brand" aria-current="page" href="#">Daunter</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample03">
        <ul class="navbar-nav me-auto mb-2 mb-sm-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">키워드 추천</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="#">영향력 순위</a>
          </li>
          <!-- 네브바 줄어들 시 숨길 수 있는 px을 정할 수 있게 css에 정의해놓았다. -->
          <li class="nav-item dropdown">
            <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
              data-bs-toggle="dropdown" aria-expanded="false">
              모든 서비스
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <li><a class="dropdown-item" href="#">키워드 추천</a></li>
              <li><a class="dropdown-item" href="#">키워드 분석</a></li>
              <li><a class="dropdown-item" href="#">영향력 순위</a></li>
              <li><a class="dropdown-item" href="#">키워드 확장</a></li>
              <li><a class="dropdown-item" href="#">트렌드</a></li>
              <li><a class="dropdown-item" href="#">간편 키워드 조회</a></li>
              <li><a class="dropdown-item" href="#">대량 키워드 분석</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
              data-bs-toggle="dropdown" aria-expanded="false">
              리소스
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <li><a class="dropdown-item" href="#">서비스 소개</a></li>
              <li><a class="dropdown-item" href="#">도움말</a></li>
              <li><a class="dropdown-item" href="#">업데이트 소식</a></li>
              <li><a class="dropdown-item" href="#">크레딧</a></li>
            </ul>
          </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">멤버십 구독하기 😎</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/user/UserLogout.us">로그아웃</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">마이페이지</a>
          </li>
        </ul>
      </div>
    </div>
</body>
</html>