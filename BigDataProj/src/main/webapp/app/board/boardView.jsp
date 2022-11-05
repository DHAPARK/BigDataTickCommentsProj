<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/boardView.css" />
</head>
<style>
    img {
        width: 240px;
        border-radius: 0.5em;
    }

    .name {
        font-weight: 600;
    }

    .box {
        border: none !important;
        margin-top: -2% !important;
    }

    .top {
        margin-left: 6% !important;
        margin-right: 6% !important;
    }

    form textarea {
        border-radius: 0;
        resize: none;
        color: black !important;
    }

    form div#brag_reply {
        display: flex;
        margin-bottom: 3%;
    }

    input[type='submit']:not(#register),
    input[type='button'] {
        border-radius: 0;
    }

    ul.actions li {
        padding: 0 0 0 0.2em;
    }

    p.content {
        width: 63%;
    }

    p.writer {
        width: 20%;
        font-weight: bold;
    }
</style>

<body class="is-preload">

    <!-- Page Wrapper -->
    <div id="page-wrapper">

        <!-- Wrapper 시작 -->
        <div id="wrapper">

            <!-- container 시작 -->
            <div class="container">
                <div class="inner">

                    <div class="top">
                        <h3>제목 첫번째 게시글</h3>
                        <div class="name" style="font-size: 14px;">작성자 : 김비버</div>
                        <div style="font-size: 14px;">2022-10-31</div>
                        <div>
                            <ul style="display: flex; justify-content: flex-end; font-size: 10px;">
                                <li><input type="button" value="글쓰기" class="primary" onclick="location.href='${pageContext.request.contextPath}/app/board/boardWrite.jsp'"
                                        style="font-size: 12px !important;">
                                </li>
                                <li><input type="button" value="목록" class="primary" onclick="location.href='${pageContext.request.contextPath}/app/board/BoardList.bo'"
                                        style="font-size: 12px !important;">
                                </li>
                                <c:if test="">
                                    <!-- <li><input type="button" value="수정" onclick="" style="font-size: 12px !important;">
                                    </li>
                                    <li><input type="button" value="삭제" onclick="" style="font-size: 12px !important;">
                                    </li> -->
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
                                <img class="downloadImage" src="" style="width: 100%;">
                            </c:forEach>
                        </c:if>
                        <!-- <hr> -->
                    </div>

                    <div class="col-6" style="float: left; width: 53%; padding-left: 6%;">
                        <img src="${pageContext.request.contextPath}/assets/img/sadness.jpg" style="width: 60%">

                    </div>
                    <div class="box">
                        <fieldset style="width: 43%; padding-left: 2%;">
                            <h3>
                                첫번째 게시글
                            </h3>
                        </fieldset>
                    </div>
                </div>
            </div>

            <!-- 댓글 -->
            <!-- <section class="main accent2" style="padding: 3%; margin: 0 14% 0 14%;"> -->
                <div style="width: 80%; margin: 0 auto; padding-left: 5%;">
                	<header class="major" style="text-align: left;">
                    <h3>Comment</h3>
                </header>
                <form method="post" action="#" class="combined" style="width: auto;">
                    <textarea name="content" id="content" placeholder="비속어를 사용하지 말아주세요." class="invert" rows="5"
                        style="border-radius: 0; resize: none; font-size: 12px !important; float: left; width: 90% !important;"></textarea>
                    <input id="register" type="button" class="primary" value="add" style="font-size: 12px !important;"
                        onclick="comment()">
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

</html>