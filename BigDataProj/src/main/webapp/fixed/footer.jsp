<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="row-vw d-lg-flex text-white bg-dark">
    
      <div class="col-lg-2 pb-4 mx-auto" >
        <h6 class="pb-2"><strong>Service</strong></h6>
        <ul class="flex-column list-unstyled anchor_tab">
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white" data-anchor="section3">트렌드</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white" data-anchor="searchInput">영향력 순위</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">키워드 검색</a></li>
        </ul>
      </div>

      <div class="col-lg-2 pb-4 mx-auto">
        <h6 class="pb-2"><strong>Legal</strong></h6>
        <ul class="flex-column list-unstyled">
          <li class="mb-1"><a href="${pageContext.request.contextPath}/fixed/term.jsp" class="nav-link p-0 text-white">이용약관</a></li>
          <li class="mb-1"><a href="${pageContext.request.contextPath}/fixed/privacyPolicy.jsp" class="nav-link p-0 text-white">개인정보처리방침</a></li>
        </ul>
      </div>

      <div class="col-lg-2 pb-4 mx-auto">
        <h6 class="pb-2"><strong>Support</strong></h6>
        <ul class="flex-column list-unstyled">
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">제휴 문의</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">070-9395-9711</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">customer@support.com</a></li>
        </ul>
      </div>

      <div class="col-lg-2 pb-4 text-truncate" style="margin-left: auto;">
        <h6 class="pb-2"><strong>Resource</strong></h6>
        <ul class="flex-column list-unstyled">
          <li class="mb-1"><a href="${pageContext.request.contextPath}/fixed/trawlTeam.jsp" class="nav-link p-0 text-white">트롤링 소개</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">멤버십 소개</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">크레딧</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">업데이트 소식</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">도움말/메뉴얼</a></li>
        </ul>
      </div>

    </div>
    
    <div class="d-flex flex-column flex-sm-row justify-content-between py-4 border-top bg-dark" >
      <p class="text-white" style="font-size: 13px">&copy; 2022 daunter, Inc. All rights reserved.</p>
    </div>
</body>
</html>