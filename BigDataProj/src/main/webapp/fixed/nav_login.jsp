<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

      <div class="collapse navbar-collapse" id="navbarsExample03">
        <ul class="navbar-nav me-auto mb-2 mb-sm-0 anchor_tab">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#" data-anchor="section3">트렌드</a>
          </li>
          <li class="nav-item">
          	<c:choose>
	      		<c:when test="${ not empty userInfo }">
	      			<a class="nav-link active" href="${pageContext.request.contextPath}/board/BoardList.bo?ageRange=${ userInfo.age_range }">커뮤니티</a>
	      		</c:when>
	      		<c:otherwise>
			         <a class="nav-link active" href="${pageContext.request.contextPath}/board/BoardList.bo?ageRange=${ kakaoInfo.age_range }">커뮤니티</a>
	      		</c:otherwise>
      		</c:choose>
          </li>
          <!-- 네브바 줄어들 시 숨길 수 있는 px을 정할 수 있게 css에 정의해놓았다. -->
          <li class="nav-item dropdown">
            <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
              data-bs-toggle="dropdown" aria-expanded="false">
              모든 서비스
            </a>
            <ul class="dropdown-menu anchor_tab" aria-labelledby="navbarDropdownMenuLink">
              <li><a class="dropdown-item" aria-current="page" href="#" data-anchor="section3">트렌드</a></li>
              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/BoardList.bo?ageRange=${ userInfo.age_range }">커뮤니티</a></li>
              <li><a class="dropdown-item" aria-current="page" href="#" data-anchor="searchInput">키워드 분석</a></li>
              <li><a class="dropdown-item" href="#">영향력 순위</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
              data-bs-toggle="dropdown" aria-expanded="false">
              리소스
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/fixed/term.jsp">이용약관</a></li>
              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/fixed/privacyPolicy.jsp">개인정보처리방침</a></li>
              <li><a class="dropdown-item" href="#">서비스 소개</a></li>
              <li><a class="dropdown-item" href="#">도움말</a></li>
            </ul>
          </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item">
            <c:choose>
	      		<c:when test="${ not empty userInfo }">
	        		 <a class="nav-link active" aria-current="page" href="#">${ userInfo.user_name }님 어서오세요 😎</a>
	      		</c:when>
	      		<c:otherwise>
			         <a class="nav-link active" aria-current="page" href="#">${ kakaoInfo.user_name }님 어서오세요 😎</a>
	      		</c:otherwise>
      		</c:choose>
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