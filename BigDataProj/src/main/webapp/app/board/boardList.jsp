<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<c:set var="list" value="${requestScope.list }"/>
	<c:set var="boardList" value="${requestScope.boardList }"/>
	<c:set var="totalCnt" value="${requestScope.totalCnt }"/>
	<c:set var="totalPage" value="${requestScope.totalPage }"/>
	<c:set var="nowPage" value="${requestScope.nowPage }"/>
	<c:set var="startPage" value="${requestScope.startPage }"/>
	<c:set var="endPage" value="${requestScope.endPage }"/>
	<c:if test="${ empty userInfo and empty kakaoInfo }">
		<script>
			alert("로그인 후 이용하세요.");
			location.replace("${pageContext.request.contextPath}/index.jsp");
		</script>
	</c:if>
  <!-- #################################################################################################################### -->
  <!-- 네비게이션 시작-->
  <nav class="navbar navbar-expand-md navbar-dark bg-dark px-2 border-bottom fixed-top" aria-label="Third navbar example">
  	<c:choose>
      		<c:when test="${ empty userInfo and empty kakaoInfo }">
        		 <jsp:include page="/fixed/nav_login.jsp"></jsp:include>
      		</c:when>
      		<c:otherwise>
		         <jsp:include page="/fixed/nav.jsp"></jsp:include>
      		</c:otherwise>
      	</c:choose>
  </nav>
  <!-- 네비게이션 끝 -->
  <!-- #################################################################################################################### -->
	
    <!-- Page Wrapper -->
<!--     <div id="page-wrapper"> -->

        <!-- Wrapper 시작 -->
        <div class="container-fluid" id="wrapper">
            
            <h1 style="text-align: center;">${ boardAgeRange }0대 커뮤니티 😎</h1>
            
            <!-- com_container 시작 -->
            <div id="com_container">
                
                <!-- div_table 시작 -->
                <div id="div_table">
               	<div class="justify-content-between">
	 				<div class="d-flex flex-row justify-content-between mb-1" >
						<div class="item col-10">
							<div class="row">
								<div class="col-2">
									<div class="input-group mb-3">
									  	<select class="form-select-sm" id="inputGroupSelect01">
										    <option selected>전체</option>
										    <option value="1">하루</option>
										    <option value="2">일주일</option>
										    <option value="3">한달</option>
									  </select>
									</div>
								</div>
								<div class="col-2" >
									<div class="input-group mb-3">
										<select class="form-select-sm" id="inputGroupSelect01">
											<option selected>제목</option>
											<option value="1">내용</option>
											<option value="2">글쓴이</option>
											<option value="3">아이디</option>
										</select>
									</div>
								</div>
								<!-- form-control-sm 검색창 -->
								<div class="col-8">
									<div class="input-group mb-3">
										<input type="text" class="form-control form-control-sm" placeholder="게시글 검색" aria-label="Recipient's username" aria-describedby="button-addon2">
										<button class="btn btn-outline-secondary btn-sm" type="button" id="button-addon2">검색</button>
									</div>
								</div>
							</div>
						</div>
		                <div class="item">
			                <button class="btn btn-dark" type="button" onclick="location.href='${pageContext.request.contextPath}/board/BoardWrite.bo'">글쓰기</button>
		                </div>
		        	</div>
               	</div>
                    <table>
                        <fmt:parseNumber var="nP" integerOnly="true" type="number" value="${nowPage}" />
                        
                        <c:choose>
                            <c:when test="${boardList != null and fn:length(boardList) > 0}">
                        		<div class="row justify-content-center">
	                                <c:forEach var="board" items="${boardList}" begin="0" end="10" step="1" varStatus="status" >
	                                <c:set var="date" value="${board.board_date }"/>
											<div class="col-lg-4 col-md-6 mb-4">
										<a href="${pageContext.request.contextPath}/board/BoardViewOk.bo?board_no=${board.board_no}">
												<div class="card h-100" >
													<div class="card-header justify-content-between">
														<div class="row mb-0">
															<div class="col">
																${board.board_title }
															</div>
															<div class="col" style="text-align: right;">
																${board.user_name }
															</div>
														</div>
													</div>
													<div class="card-body">
														${ nowPage == 1 ? "" : nowPage - 1 }${ status.count }번째 게시판 콘텐츠 미리보기를 넣을 예정입니다.
													</div>
													<div class="card-footer justify-content-between">
														<div class="row">
															<div class="col-8">
																작성일 : ${fn:substring(date,0,10)}
															</div>
															<div class="col" style="text-align: right;">
															 	❤️ : ${board.likes }
															</div>
														</div>
													</div>
												</div>
	                       				</a>
											</div>
	                                </c:forEach>
                                </div>
                            </c:when>
                            
                            <c:otherwise>
                                <tr height="50px" align="center">
                                    <td colspan="5">등록된 게시물이 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        <tr align="center" valign="middle">
                            <td>
                                <c:if test="${nowPage > 1}">
                                    <a href="${pageContext.request.contextPath}/board/BoardList.bo?ageRange=${ userInfo.age_range }&page=${nowPage-1}">[&lt;]</a>
                                </c:if>
                                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                    <c:choose>
                                        <c:when test="${i eq nowPage}">
                                            <c:out value="[${i}]" />
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/board/BoardList.bo?ageRange=${ userInfo.age_range }&page=${i}">
                                                <c:out value="[${i}]" />
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <c:if test="${nowPage < totalPage}">
                                    <a href="${pageContext.request.contextPath }/board/BoardList.bo?ageRange=${ userInfo.age_range }&page=${nowPage + 1}">[&gt;]</a>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- div_table 끝 -->

                <!-- search_container 시작 -->
<!--                 <div id="search_container" style="margin: 0 auto; width: 400px; height: 40px;"> -->
<!--                     <ul> -->
<!--                         <li style="float: left;"><select id="search_date" name="search_date"> -->
<!--                                 <option value="">일주일</option> -->
<!--                                 <option value="">한달</option> -->
<!--                                 <option value="">세달</option> -->
<!--                                 <option value="all">전체</option> -->
<!--                             </select></li> -->
<!--                         <li style="float: left;"><select id="search_key" name="search_key"> -->
<!--                                 <option value="subject">제목</option> -->
<!--                                 <option value="content">내용</option> -->
<!--                                 <option value="writer">글쓴이</option> -->
<!--                                 <option value="userid">아이디</option> -->
<!--                             </select></li> -->
<!--                         <li style="float: left;"><input id="search" name="search" class="inputTypeText" placeholder="" -->
<!--                                 value="" type="text"></li> -->
<!--                         <li style="float: left;"><a href="#" class="" onclick=""><i class="fa fa-search" -->
<!--                                     aria-hidden="true"></i></a></li> -->
<!--                     </ul> -->
<!--                 </div> -->
                <!-- search_container 끝 -->
<!--             </div> -->
            <!-- com_container 끝 -->
        </div>
        <!-- Wrapper 끝 -->
    </div>
  	<!-- footer 시작 -->
  	<footer class="container-fluid bg-dark p-5" style="margin-top: auto;">
    	<jsp:include page="/fixed/footer.jsp"></jsp:include>
  	</footer>
  	<!--footer 끝 -->
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