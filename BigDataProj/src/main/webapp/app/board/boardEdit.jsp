<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<!-- <html lang="en"> 폰트깜빡임 없애기 위해서 아래로 대체 -->
<html lang="ko" id="no-fouc">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>트롤링</title>
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

    <!-- 섬머노트 시작 -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <!-- 섬머노트 끝 -->

    <!-- style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css">
</head>

<body>
	<c:set var="board" value="${requestScope.board }"/>
	
	<c:if test="${ empty userInfo }">
		<script>
			alert("로그인 후 이용하세요.");
			location.replace("${pageContext.request.contextPath}/index.jsp");
		</script>
	</c:if>

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
    
    
    <!-- 글 작성 섹션 -->
    <section class="container-sm mb-5" style="max-width: 700px; margin-top: 100px;">
    	<form action="${pageContext.request.contextPath}/board/BoardEditOk.bo" method="post" name="editForm">
    		<input type="hidden" name="board_no" value="${board.board_no}">
        	<div>
            	<article class="d-flex justify-content-between">
	                <!-- <select class="form-select form-select-sm mb-3" aria-label=".form-select-lg example" style="width: 200px;">
	                    <option selected>시연용 연령대 셀렉터</option>
	                    <option value="1">10대</option>
	                    <option value="2">20대</option>
	                    <option value="3">30대</option>
	                    <option value="4">40대</option>
	                    <option value="5">50대</option>
	                </select> -->
                	<div style="margin-left: auto;">
                    	<button type="button" class="btn btn-outline-dark btn-sm mb-3" onclick="goBack();">취소</button>
<!-- 	                    <button type="button" class="btn btn-primary btn-sm mb-3" onclick="location.href='javascript:document.boardForm.submit();'">등록</button> -->
	                    <button type="button" class="btn btn-primary btn-sm mb-3" onclick="editForm.submit()">등록</button>
                	</div>
            	</article>
	            <article>
	            	<input type="hidden" name="user_name" value="${userInfo.user_name}"/>
	                <!-- 제목을 입력해주세요. -->
	                <input id="board_title" name="board_title" type="text" class="form-control form-control-sm mb-3" value="${board.board_title }" />
	            </article>
	            <article>
	                <textarea id="summernote" name="board_content">${board.board_content }</textarea>
	            </article>
        	</div>
        </form>
    </section>  
    <!-- 글 작성 섹션 끝 -->

	<!-- #################################################################################################################### -->
  	<!-- footer 시작 -->
  	<footer class="container-fluid bg-dark p-5" style="margin-top: auto;">
    	<jsp:include page="/fixed/footer.jsp"></jsp:include>
  	</footer>
  	<!--footer 끝 -->
	<!-- #################################################################################################################### -->
	
	
	<!-- #################################################################################################################### -->
	  <!-- 로그인 & 회원가입 모달창 시작 -->
	 <jsp:include page="/app/user/loginAndRegister.jsp"></jsp:include>
	  <!-- 로그인 & 회원가입 모달창 끝 -->
	<!-- #################################################################################################################### -->


<script>
function goBack() {
  window.history.go(-1);
}
</script>

<!-- 섬머노트 스크립트 시작 -->
<script>
    $('#summernote').summernote({
        placeholder: '내용을 입력해주세요.',
        tabsize: 2,
        height: 360,
        toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['insert', ['link', 'picture', 'video']]
        ]
    });
</script>
<!-- 섬머노트 스크립트 끝 -->

<!-- 폰트 깜박임 방지 시작 -->
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {  
  $("#no-fouc").delay(250).animate({"opacity": "1"}, 250);
});
</script>
<!-- 폰트 깜박임 방지 끝 -->
<!-- 부트스트랩 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script> -->
</body>
</html>