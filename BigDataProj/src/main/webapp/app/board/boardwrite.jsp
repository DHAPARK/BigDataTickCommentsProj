<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!-- <html lang="en"> 폰트깜빡임 없애기 위해서 아래로 대체 -->
<html lang="ko" id="no-fouc"></html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daunter</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

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
    <link rel="stylesheet" href="./css/style.css">
  
</head>

<body>
    <!-- 네비게이션 시작-->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark px-2 border-bottom fixed-top" aria-label="Third navbar example">
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
                <!-- <a class="nav-link active" href="#">로그인</a> -->
                <!-- 로그인 버튼 모달연결-->
                <a class="nav-link active" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
            </li>
            <li class="nav-item">
                <!-- <a class="nav-link active" href="#">가입하기</a> -->
                <!-- 가입하기 버튼 모달 연결 -->
                <a class="nav-link active" href="#" data-bs-toggle="modal" data-bs-target="#joinModal">가입하기</a>
            </li>
            </ul>
        </div>
        </div>
    </nav>
    <!-- 네비게이션 끝 -->
    <!-- 글 작성 섹션 -->

    <section class="container-sm mb-5" style="max-width: 700px; margin-top: 100px;">
        <div>
            <article class="d-flex justify-content-between">
                <select class="form-select form-select-sm mb-3" aria-label=".form-select-lg example" style="width: 200px;">
                    <option selected>시연용 연령대 셀렉터</option>
                    <option value="1">10대</option>
                    <option value="2">20대</option>
                    <option value="3">30대</option>
                    <option value="4">40대</option>
                    <option value="5">50대</option>
                </select>
                	<div>
                    	<button type="button" class="btn btn-outline-dark btn-sm mb-3">취소</button>
	                    <button type="button" class="btn btn-dark btn-sm mb-3">등록</button>
                	</div>
            </article>

            <article>
                <!-- 제목을 입력해주세요. -->
                <input type="text" class="form-control form-control-sm mb-3" placeholder="제목을 입력해주세요.">
            </article>
            
            <article>
                <div id="summernote"></div>
            </article>
        </div>
    </section>  
    <!-- 글 작성 섹션 끝 -->
    <!-- footer 시작 -->
  <footer class="container-fluid bg-dark p-5" style="margin-top: auto;">
    <div class="row-vw d-lg-flex text-white bg-dark">
    
      <div class="col-lg-2 pb-4 mx-auto" >
        <h6 class="pb-2"><strong>Service</strong></h6>
        <ul class="flex-column list-unstyled">
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">키워드 추천</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">영향력 순위</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">키워드 분석</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">트렌드</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">키워드 확장</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">대량 키워드 분석</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">간편 키워드 조회</a></li>
        </ul>
      </div>

      <div class="col-lg-2 pb-4 mx-auto">
        <h6 class="pb-2"><strong>Legal</strong></h6>
        <ul class="flex-column list-unstyled">
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">이용약관</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">개인정보처리방침</a></li>
        </ul>
      </div>

      <div class="col-lg-2 pb-4 mx-auto">
        <h6 class="pb-2"><strong>Support</strong></h6>
        <ul class="flex-column list-unstyled">
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">제휴 문의</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">070-1111-1111</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">customer@support.com</a></li>
        </ul>
      </div>

      <div class="col-lg-2 pb-4 text-truncate" style="margin-left: auto;">
        <h6 class="pb-2"><strong>Resource</strong></h6>
        <ul class="flex-column list-unstyled">
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">블랙키위 소개</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">멤버십 소개</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">크레딧</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">업데이트 소식</a></li>
          <li class="mb-1"><a href="#" class="nav-link p-0 text-white">도움말/메뉴얼</a></li>
        </ul>
      </div>

    </div>
    
    <div class="d-flex flex-column flex-sm-row justify-content-between py-4 border-top bg-dark" >
      <p class="text-white">&copy; 2022 Company, Inc. All rights reserved.</p>
    </div>
  </footer>
  <!--footer 끝 -->































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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>