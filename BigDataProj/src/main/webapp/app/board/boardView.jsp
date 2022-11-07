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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/boardView.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <!-- favicon -->
  	<link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/x-icon">
</head>
<style>
    img { width: 240px; border-radius: 0.5em; }
    .name { font-weight: 600; }
    .box { border: none !important; margin-top: -2% !important; }
    .top { margin-left: 6% !important; margin-right: 6% !important; }
    form textarea { border-radius: 0; resize: none; color: black !important; }
    form div#brag_reply { display: flex; margin-bottom: 3%; }
    input[type='submit']:not(#register), input[type='button'] { border-radius: 0; }
    ul.actions li { padding: 0 0 0 0.2em; }
    p.content { width: 63%; }
    p.writer { width: 20%; font-weight: bold; }
    
    .bi-heart{ font-size: 30px; line-height: 30px; color:crimson; }
	.bi-heart-fill{ font-size: 30px; line-height: 30px; color:crimson; }
</style>

<body class="is-preload">
	<c:set var="board" value="${requestScope.board }"/>

    <!-- Page Wrapper -->
    <div id="page-wrapper">

        <!-- Wrapper 시작 -->
        <div id="wrapper">

            <!-- container 시작 -->
            <div class="container">
                <div class="inner">

                    <div class="top">
                        <h3>제목 ${board.board_title }</h3>
                        <div class="name" style="font-size: 14px;">작성자 : ${board.user_name }</div>
                        <c:set var="date" value="${board.board_date }"/>
                        <div style="font-size: 14px;">${fn:substring(date,0,16) }</div>
                        <div>
                            <ul style="display: flex; justify-content: flex-end; font-size: 10px;">
                            	<li><i class="bi bi-heart"></i></li>
                                <li><input type="button" value="글쓰기" class="primary" onclick="location.href='${pageContext.request.contextPath}/board/BoardWrite.bo'"
                                        style="font-size: 12px !important;">
                                </li>
                                <li><input type="button" value="목록" class="primary" onclick="location.href='${pageContext.request.contextPath}/board/BoardList.bo'"
                                        style="font-size: 12px !important;">
                                </li>
                                <c:if test="${ userInfo.user_name eq board.user_name }">
                                    <li><input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/board/BoardEdit.bo?board_no=${board.board_no }'" style="font-size: 12px !important;">
                                    </li>
                                    <%-- <li><input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/board/DeletePostOk.bo?board_no=${board.board_no}'" style="font-size: 12px !important;">
                                    </li> --%>
                                    <li>
	                                    <form name="deleteForm" action="${pageContext.request.contextPath}/board/DeletePostOk.bo?board_no=${board.board_no}" method="post">
	                                    	<input type="button" value="삭제" onclick="deletePost()" style="font-size: 12px !important;">
	                                    </form>
                                    </li>
                                </c:if>
                            </ul>
                        </div>

                        <hr>
                        <c:if test="">
                            <c:forEach var="files" items="${files}">
                                <a href="">
                                    <c:out value="" />
                                </a>
                                <br>
                                <img class="" src="" style="width: 100%;">
                            </c:forEach>
                        </c:if>
                    </div>

                    <div class="col-6" style="float: left; width: 53%; padding-left: 6%;">
                        <img src="${pageContext.request.contextPath}/assets/images/sadness.jpg" style="width: 60%">

                    </div>
                    <div class="box">
                        <fieldset style="width: 43%; padding-left: 2%;">
                            <h3>
                                ${board.board_content }
                            </h3>
                        </fieldset>
                    </div>
                </div>
            </div>

            <!-- 댓글 -->
            <!-- <section class="main accent2" style="padding: 3%; margin: 0 14% 0 14%;"> -->
                <div style="width: 75%; margin: 0 auto; padding-left: 5%;">
                	<header class="major" style="text-align: left;">
                    <h3>Comment</h3>
                </header>
                <form method="post" action="#" class="combined" style="width: auto;">
                    <textarea name="content" id="content" placeholder="비속어를 사용하지 말아주세요." class="invert" rows="5"
                        style="border-radius: 0; resize: none; font-size: 12px !important; float: left; width: 90% !important;"></textarea>
                    <input id="register" type="button" class="primary" value="add" style="font-size: 12px !important;"
                        onclick="">
                </form>
                <form id="replies" class="combined"
                    style="flex-direction: column; margin: 0; display: contents; font-size: 12px !important;">
                    <p style="width: fit-content;">댓글이 없습니다.</p>
                </form>
                </div>
            <!-- </section> -->
        </div>
        <!-- container 끝 -->


    </div>
    <!-- Wrapper 끝 -->

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function deletePost() {
		
		//console.log(`${userInfo.getUser_pw()}`) ;
		//if( '123456' == `${userInfo.getUser_pw()}` )
		
       	pw = prompt('비밀번호를 입력해주세요.');
        
        if(pw == `${userInfo.getUser_pw()}`){
        	document.deleteForm.submit();
        } else {
            alert('비밀번호가 틀렸습니다.');
        }
	}
</script>
<script>
    var i = 0;
    $('.bi-heart').on('click',function(){
        if(i==0){
            $(this).removeClass('bi-heart');
            $(this).addClass('bi-heart-fill');
            i++;
        }else if(i==1){
            $(this).removeClass('bi-heart-fill');
            $(this).addClass('bi-heart');
            i--;
        }
        
    });
</script>
</html>