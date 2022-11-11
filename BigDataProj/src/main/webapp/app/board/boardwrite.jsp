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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/js/summernote/summernote-lite.js"></script>
	<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
    <!-- 섬머노트 끝 -->

    <!-- style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css">
  
</head>

<body>
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
    	<form action="${pageContext.request.contextPath}/board/BoardWriteOk.bo" method="post" name="boardForm">
        	<div>
            	<article class="d-flex justify-content-between">
	                <!-- <select class="form-select form-select-sm mb-3" aria-label=".form-select-lg example" style="width: 200px;" >
	                    <option selected>시연용 연령대 셀렉터</option>
	                    <option value="1">10대</option>
	                    <option value="2">20대</option>
	                    <option value="3">30대</option>
	                    <option value="4">40대</option>
	                    <option value="5">50대</option>
	                </select> -->
                	<div style="margin-left: auto;">
                    	<button type="button" class="btn btn-outline-dark btn-sm mb-3" onclick="goBack();">취소</button>
						<!-- <button type="button" class="btn btn-primary btn-sm mb-3" onclick="location.href='javascript:document.boardForm.submit();'">등록</button> -->
	                    <button type="button" class="btn btn-dark btn-sm mb-3" onclick="sendForm()">등록</button>
                	</div>
            	</article>
	            <article>
	            	<input type="hidden" name="user_name" value="${userInfo.user_name}">
	            	<input type="hidden" name="age_range" value="${userInfo.age_range}">
	                <!-- 제목을 입력해주세요. -->
	                <input id="board_title" name="board_title" type="text" class="form-control form-control-sm mb-3" placeholder="제목을 입력해주세요.">
	            </article>
	            <article>
	                <textarea id="summernote" name="board_content"></textarea>
	            </article>
	            <div id="등록시디비에보드넘을박습니다">        
	            </div>
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
<script>
	function sendForm(){
		if(!$("input#board_title").val()){
			alert("제목을 작성해주세요.");
			return;
		}
		if(!$("textarea[name='board_content']").val()){
			alert("내용을 작성해주세요.");
			return;
		}
		
		document.boardForm.submit();
	}
</script>

<!-- 섬머노트 스크립트 시작 -->
<script>
    $('#summernote').summernote({
        placeholder: '내용을 입력해주세요.',
        tabsize: 2,
        height: 360,
		lang: 'ko-KR', // default: 'en-US'
        callbacks: {
        	onImageUpload : function(file) {
				var result = confirm("이미지를 수정하시겠습니까?");
				if(result){
					window.open("/board/ImgEdit.bo","imgEdit","width=700px; height=800px");
				} else {
        			sendFile(file[0],this);
        		}
        	}
        }
    ,	toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['insert', ['link', 'picture', 'video']]
        ]
    });
    
    // 썸머노트 url 접속을 위한 설정
	function sendFile(file, editor) {
	   // 파일 전송을 위한 폼생성
		data = new FormData();
		data.append("uploadFile", file);
		
		$.ajax({
	        data: data,
	        type: "post",
	        url: "/board/IMGUpload.bo",
	     	// 원래 있던 기능을 막기 위해
	        contentType : false,	
	        processData : false,
	        
	        success : function(data){
				


	        	alert("이미지가 업로드되었습니다.");
	        	$(editor).summernote('editor.insertImage', data.url);
	        	let html = "";
	        	html = '<input name="이행의데이터를전송시보드넘을박습니다" value="' + data.fileName + '"/>';
	        	$('#등록시디비에보드넘을박습니다').append(html);
	        }
		});
	}
</script>
<!-- 섬머노트 스크립트 끝 -->

<!-- 폰트 깜박임 방지 시작 -->
<!-- <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script> -->

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