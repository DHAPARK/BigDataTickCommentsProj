<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE HTML>
<html>
<head>
    <title>트롤링</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
  	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous"> -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board.css" />
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
  	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

	<!-- favicon -->
  	<link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/x-icon">

  <!-- 스택 오버플로우 시작 -->
  <style type="text/css">
    #no-fouc { opacity: 0; }
  </style>
  <!-- 스택 오버플로우 끝 -->

  <!-- 폰트링크 시작 나중에 바꿀 것-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
  <!-- 폰트링크 끝 -->

</head>

<body class="is-preload">
	<c:set var="boardList" value="${requestScope.boardList }"/>
	<c:set var="totalCnt" value="${requestScope.totalCnt }"/>
	<c:set var="totalPage" value="${requestScope.totalPage }"/>
	<c:set var="nowPage" value="${requestScope.nowPage }"/>
	<c:set var="startPage" value="${requestScope.startPage }"/>
	<c:set var="endPage" value="${requestScope.endPage }"/>
	
  <!-- #################################################################################################################### -->
  <!-- 네비게이션 시작-->
  <nav class="navbar navbar-expand-md navbar-dark bg-dark px-2 border-bottom fixed-top" aria-label="Third navbar example">
  	<c:choose>
      		<c:when test="${ empty userInfo }">
        		 <jsp:include page="/fixed/nav.jsp"></jsp:include>
      		</c:when>
      		<c:otherwise>
		         <jsp:include page="/fixed/nav_login.jsp"></jsp:include>
      		</c:otherwise>
      	</c:choose>
  </nav>
  <!-- 네비게이션 끝 -->
  <!-- #################################################################################################################### -->
	
    <!-- Page Wrapper -->
    <div id="page-wrapper">

        <!-- Wrapper 시작 -->
        <div id="wrapper">
            
            <h1 style="text-align: center;">커뮤니티 😎</h1>
            <!-- com_container 시작 -->
            <div id="com_container">
                <!-- age_range 시작 -->
                <div id="age_range">
                	<%-- <a href="${pageContext.request.contextPath }/customerService/CS_BoardList.bo?CS_BOARD_SELECT=상품문의">상품문의</a> --%>

                    <a href="">10대</a>
                    <a href="">20대</a>
                    <a href="">30대</a>
                    <a href="">40대</a>
                    <a href="">50대</a>
                    <!-- age_range 끝 -->
                </div>
                <!-- div_table 시작 -->
                <div id="div_table">
                 
                    <table>
                        <thead>
                            <tr>
                                <th class="th-no1">번호</th>
                                <th class="th-title1">제목</th>
                                <th class="th-writer1">작성자</th>
                                <th class="th-date1">작성일</th>
                                <th class="th-no1">좋아요</th>
                            </tr>
                        </thead>
                        <c:choose>
                            <c:when test="${boardList != null and fn:length(boardList) > 0}">
                                <c:forEach var="board" items="${boardList}">
                                <c:set var="date" value="${board.board_date }"/>
                                    <tr align="center" valign="middle">
                                        <td height="24px">${board.board_no }</td>
                                        <td><a href="${pageContext.request.contextPath}/board/BoardViewOk.bo?board_no=${board.board_no}" style="color: #777777 !important">${board.board_title }</a></td>
                                        <td>${board.user_name }</td>
                                        <td>${fn:substring(date,0,10) }</td>
                                        <td>${board.likes }</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr height="50px" align="center">
                                    <td colspan="5">등록된 게시물이 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </table>
                    

                   <table>
                        <tr align="center" valign="middle">
                            <td>
                                <c:if test="${nowPage > 1}">
                                    <a href="${pageContext.request.contextPath}/board/BoardList.bo?page=${nowPage-1}">[&lt;]</a>
                                </c:if>
                                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                    <c:choose>
                                        <c:when test="${i eq nowPage}">
                                            <c:out value="[${i}]" />
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/board/BoardList.bo?page=${i}">
                                                <c:out value="[${i}]" />
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <c:if test="${nowPage < totalPage}">
                                    <a href="${pageContext.request.contextPath }/board/BoardList.bo?page=${nowPage + 1}">[&gt;]</a>
                                </c:if>
                            </td>
                        </tr>
                    </table>

                    
                    <div id="write_button_div">
                    	<c:if test="${ not empty userInfo }">
                        	<button class="btn btn-dark" type="button" onclick="location.href='${pageContext.request.contextPath}/board/BoardWrite.bo'" style="font-size:12px;">글쓰기</button>
                        </c:if>
                    </div>

                </div>
                <!-- div_table 끝 -->

                <!-- search_container 시작 -->
                <div id="search_container" style="margin: 0 auto; width: 400px; height: 40px;">
                    <ul>
                        <li style="float: left;"><select id="search_date" name="search_date">
                                <option value="">일주일</option>
                                <option value="">한달</option>
                                <option value="">세달</option>
                                <option value="all">전체</option>
                            </select></li>
                        <li style="float: left;"><select id="search_key" name="search_key">
                                <option value="subject">제목</option>
                                <option value="content">내용</option>
                                <option value="writer">글쓴이</option>
                                <option value="userid">아이디</option>
                            </select></li>
                        <li style="float: left;"><input id="search" name="search" class="inputTypeText" placeholder=""
                                value="" type="text"></li>
                        <li style="float: left;"><a href="#" class="" onclick=""><i class="fa fa-search"
                                    aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                <!-- search_container 끝 -->
            </div>
            <!-- com_container 끝 -->
        </div>
        <!-- Wrapper 끝 -->
    </div>

	<!-- #################################################################################################################### -->
	  <!-- 로그인 & 회원가입 모달창 시작 -->
	 <jsp:include page="/app/user/loginAndRegister.jsp"></jsp:include>
	  <!-- 로그인 & 회원가입 모달창 끝 -->
	<!-- #################################################################################################################### -->
	
	
</body>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- 가입하기 유효성검사-->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/user.js"></script>
</html>