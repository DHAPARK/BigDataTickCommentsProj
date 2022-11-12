<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
 	<c:set var="replylist" value="${requestScope.reply}"/>
 	<c:set var="userInfo" value="${userInfo}"/>
 	
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
                                <li><input type="button" value="목록" class="primary" onclick="goBack();"
                                        style="font-size: 12px !important;">
                                </li>
                                <c:if test="${ userInfo.user_name eq board.user_name }">
                                    <li><input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/board/BoardEdit.bo?board_no=${board.board_no }'" style="font-size: 12px !important;">
                                    </li>
                                    <li>
	                                    <form name="deleteForm" action="${pageContext.request.contextPath}/board/DeletePostOk.bo?board_no=${board.board_no}" method="post">
	                                    	<input type="hidden" name="age_range" value="${userInfo.age_range}">
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
            <div style="width: 62%; margin: 0 auto;">
            	<hr>
                <header class="major" style="text-align: left;">
                    <h3>Comment</h3>
                </header>
	            <form method="post" action="/board/addReply.rp" class="combined"  id="replyForm" style="flex-direction: column; margin: 0; display: contents; font-size: small !important;">
	            	<input name="board_no" value="${board.board_no}" type="hidden">
	            	<input name="user_no" value="${userInfo.user_no}" type="hidden">
	                <div style="display: flex; flex-direction: row; margin-bottom: 3%;">
	                	<div style="width: 96%;">
	                		<textarea name="reply_content" id="content" placeholder="비속어를 사용하지 말아주세요." class="invert" rows="5"
	                		style="border-radius: 0; resize: none; font-size: small !important;"></textarea>
	                	</div>
	                	<div>
	                		<input id="register" type="button" class="primary" value="add" style="font-size: 12px !important;" onclick="addReply()">
	                	</div>
	                </div>
	                
	                
	                <!-- <button onClick="addReply(); return false;">작성</button> -->
	           
		            <c:choose>
						<c:when test="${!empty replylist}">
							<c:forEach items="${replylist}" var="reply">
	<!-- 							<form method="post" id="updateReplyForm"> -->
									<input name="board_no" value="${board.board_no}" type="hidden">
		            				<input name="user_no" value="${userInfo.user_no}" type="hidden">
									<table>
										<tr>
											<td style="padding-left: 10px;"> 
												<textarea id="reply${reply.reply_no}"  name="update_content${reply.reply_no}" style="text-align: left; border: 0px; height: 85px; resize: none; font-size: small;" class="textarea" readonly > ${reply.reply_content} </textarea> 
												<a href="javascript:updateReply(${reply.reply_no});" style="display: none;" id="modifyBtn${reply.reply_no}">[수정]</a>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<a href="javascript:updateReadonly('${userInfo.user_no}','${reply.user_no}',${reply.reply_no});" id="modify${reply.reply_no}">[수정하기]</a>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<a href="javascript:deleteReply('${userInfo.user_no}','${reply.user_no}',${reply.reply_no});">[삭제]</a>
											</td>
										</tr>	
									</table>
	<!-- 							</form> -->
							</c:forEach>
						</c:when>
					<c:otherwise>
						<form id="replies" class="combined"
		                   	style="flex-direction: column; margin: 0; display: contents; font-size: small !important;">
		                 	<p style="width: fit-content;">댓글이 없습니다.</p>
		                </form>
					</c:otherwise>
					</c:choose>
				</form>
             </div>
        </div>
        <!-- container 끝 -->


    </div>
    <!-- Wrapper 끝 -->

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/reply.js"></script>
<script>
function goBack() {
  window.history.go(-1);
}
</script>
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
<script>

// 댓글 수정완료
function updateReply(reply_no){
	if($("#update-content"+reply_no).val==""){
		alert("댓글내용을 입력해주세요.")
		return false;
	}
	$("#replyForm").attr("action","/board/updateReply.rp?reply_no="+reply_no)
	$("#replyForm").submit();
	alert("수정완료")
}
// 댓글 수정가능여부 확인
function updateReadonly(info_user_no ,user_no,reply_no){
	
	if(info_user_no != user_no){
		alert("본인이 작성한 댓글만 수정할 수 있습니다.");
		return false;
	}else{
		$('#reply'+reply_no).attr('readonly',false);
		$('#modify'+reply_no).css("display","none");
		$('#modifyBtn'+reply_no).css("display","inline");
	}
}
/* 댓글 삭제 */
function deleteReply(rp_user_no ,wr_user_no,reply_no){
	alert("삭제 하시겠습니까?")
	if(rp_user_no != wr_user_no){
		alert("본인이 작성한 댓글만 삭제할 수 있습니다.");
		return false;
	}
	$("#replyForm").attr("action","/board/deleteReply.rp?reply_no="+reply_no)
	$("#replyForm").submit();
	alert("삭제완료")
}
// 댓글 입력
function addReply() {
 	if($('#content').val() == ""){
		alert("댓글내용을 입력해주세요.")
		return false;
	}
	
	$('#replyForm').submit();
	alert("댓글등록완료")
}
</script>

</html>