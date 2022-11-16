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
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<!-- packedBubble 차트 -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<!-- packedBubble 차트 -->

<!-- drillChart -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.highcharts.com/modules/data.js"></script>
	<script src="https://code.highcharts.com/modules/drilldown.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>

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

  <!-- style.css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

<!-- 임시 스타일 박도현 확정나면 css파일로 옮겨적을것-->
<style>
#myBubbleChart{
	display:none;
}
#load {
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    position: fixed;
    display: block;
    opacity: 0.8;
    background: white;
    z-index: 99;
    text-align: center;
}

#load > img {
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 100;
}

.wrapper {
  width: 300px;
  height: 50px;
  text-align: center;
  margin: 0 auto;
}
#switch {
  position: absolute;
  /* hidden */
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

.switch_label {
  position: relative;
  cursor: pointer;
  display: inline-block;
  width: 60px;
  height: 33px;
  background: #fff;
  border: 2px solid #daa;
  border-radius: 20px;
  transition: 0.2s;
}
.switch_label:hover {
  background: #efefef;
}
.onf_btn {
  position: absolute;
  top: 4px;
  left: 3px;
  display: inline-block;
  width: 20px;
  height: 20px;
  border-radius: 20px;
  background: #daa;
  transition: 0.2s;
}

/* checking style */
#switch:checked+.switch_label {
  background: #c44;
  border: 2px solid #c44;
}

#switch:checked+.switch_label:hover {
  background: #e55;
}

/* move */
#switch:checked+.switch_label .onf_btn {
  left: 34px;
  background: #fff;
  box-shadow: 1px 2px 3px #00000020;
}

.chart_Choose_Text{
	color:white;
	display:inline;
}
</style>
<!-- 임시 스타일 박도현 -->

</head>

<body>
  <header>
  </header>
  
  <!-- #################################################################################################################### -->
  <!-- 네비게이션 시작-->
  <nav class="navbar navbar-expand-md navbar-dark bg-dark px-2 border-bottom fixed-top" aria-label="Third navbar example">
  		<c:choose>
      		<c:when test="${ empty userInfo }">
        		 <jsp:include page="/fixed/index_nav.jsp"></jsp:include>
      		</c:when>
      		<c:otherwise>
		         <jsp:include page="/fixed/nav_login.jsp"></jsp:include>
      		</c:otherwise>
      	</c:choose>
  </nav>
  <!-- 네비게이션 끝 -->
  <!-- #################################################################################################################### -->
  
  <!-- 섹션 요소 -->
  <section class="container-fluid bg-dark p-5">

<!--     <header class="py-5 text-white"> -->
    <header class="row justify-content-center w-60" style="float: none; margin:100 auto;">
      <!-- <h1 class="text-center">세대별 키워드 데이터 분석 툴<br></h1>
      <h1 class="text-center"><strong>Daunter</strong></h1> -->
      

    	<img class="col-lg-6 pt-5" src = "/assets/images/main.png" alt="못본걸로 하자">

      
      
      
<!--       <h1 class="text-center">세대별 트렌드를 긁어오는</h1> -->
<!--       <h1 class="text-center">트렌디한 keyword 분석 툴, <strong>트롤링</strong></h1> -->
    </header> 
    <!-- 공백용 임시 시작-->
    <!-- <div class="py-5 d-none d-lg-block"></div> -->
    <!-- 공백용 임시 끝 -->
    
    <!-- 검색창 (이건 그냥 더미)-->
    <article class="container">
      <div class="row justify-content-center w-70" id="searchInput">
        <div class="col-lg-6 ">
          <div class="input-group mb-5">
          
           <input type="text" class="form-control" id="cmc" placeholder="검색어를 입력하세요"  aria-label="Recipient's username" aria-describedby="button-addon2">
			<button class="btn btn-dark border" type="button" id="button" onclick="getvalue()">검색</button>
			 <script src="/drill/js2/drill.js"></script>
          
          </div>
        </div>
      </div>
    </article>
    <!-- 검색창 끝 -->
    
    <!-- 버튼 그룹 -->
    
    
		<!--  막대차트  -->
		<article class="text-center mb-3 col chart_hard">
			<div class="btn-group d-lg-block d-none">
				<button type="button" class="btn btn-outline-light"
					onclick="see10AgeHard()">10대</button>
				<button type="button" class="btn btn-outline-light"
					onclick="see20AgeHard()">20대</button>
				<button type="button" class="btn btn-outline-light"
					onclick="see30AgeHard()">30대</button>
				<button type="button" class="btn btn-outline-light"
					onclick="see40AgeHard()">40대</button>
				<button type="button" class="btn btn-outline-light"
					onclick="see50AgeHard()">50대</button>
			</div>
		</article>

		<!-- class="col d-none d-lg-block" -->
		<article class="text-center pb-3 chart_hard">
			<div class="btn d-block d-lg-none">
				<button type="button" class="btn btn-outline-light"
					onclick="see10AgeHard()">10</button>
				<button type="button" class="btn btn-outline-light"
					onclick="see20AgeHard()">20</button>
				<button type="button" class="btn btn-outline-light"
					onclick="see30AgeHard()">30</button>
				<button type="button" class="btn btn-outline-light"
					onclick="see40AgeHard()">40</button>
				<button type="button" class="btn btn-outline-light"
					onclick="see50AgeHard()">50</button>
			</div>
		</article>
		<!--  막대차트  -->


		<!--  버블 / 하드 스위치 박도현  -->
		<div class="wrapper">
			<p class="chart_Choose_Text">키워드별</p>
			<input type="checkbox" id="switch"> <label for="switch"
				class="switch_label" onclick="changeChartStatus()"> <span
				class="onf_btn"></span>
			</label>
			<p class="chart_Choose_Text">세대별</p>
		</div>
		<!--  버블 / 하드 스위치 박도현  -->







		<article class="container-fluid bg-danger">
			<div class="row" style="background-color: white;">
				<!-- 차트 들어갈 자리 -->
				<div id="chartArea"
					style="width: 600px; height: 600px; margin: 0 auto;">
					<div id="myBubbleChart" style="width: 100%; height: 100%"></div>
					<canvas id="myHardChart" width="100%" height="100%"></canvas>
				</div>
				<!-- 차트 들어갈 자리 -->
				
				<figure class="highcharts-figure">
					<div id="container"></div>
					<div id=drillChart></div>
				</figure>
				
			</div>
		</article>

	</section>


	<!-- 차트 로딩화면 -->
	<div id="load">
		<img
			src="${pageContext.request.contextPath}/assets/images/chartLoading.gif"
			alt="loading">
	</div>
	<!-- 차트 로딩화면 -->


	<!-- 좌우 사이즈 줄이고 싶으면 이거 변경 -->
	<!-- 이영님이 회색해달라해서....급하게 레이아웃 급조 -->
	<div style="background-color: #E8E8E8;">
		<div class="container-sm">
			<!-- 섹션2 -->
			<section class="py-5">
				<header class="text-center py-5">
					<h2 class="fw-bolder">주요 서비스 🧐</h2>
					<h5>블랙키위의 강력한 서비스들과 함께하면 검색 엔진 마케팅이 쉬워집니다.</h5>
				</header>

				<article>
					<div class="row justify-content-center ">

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<div class="card-body">
									<h5 class="card-title">키워드 분석</h5>
									<p class="card-text">
										타겟 키워드가 언제 많이 검색되고, <br>어떤 성향과 특징을 가졌는지 알아보세요.
									</p>
									<a href="#" class="">바로가기</a>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<div class="card-body">
									<h5 class="card-title">키워드 추천</h5>
									<p class="card-text">
										키워드를 찾는데 지치셨나요? <br>맞춤 키워드 리스트를 추천받아보세요.
									</p>
									<a href="#" class="">바로가기</a>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<div class="card-body">
									<h5 class="card-title">영향력 순위</h5>
									<p class="card-text">
										자사 및 경쟁 블로그, 웹사이트의 <br>객관적인 영향력을 확인해보세요.
									</p>
									<a href="#" class="">바로가기</a>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<div class="card-body">
									<h5 class="card-title">트렌드</h5>
									<p class="card-text">
										매일 빠르게 변화하는 트렌드를 추적하고, <br>키워드 아이디어를 획득해보세요.
									</p>
									<a href="#" class="">바로가기</a>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<div class="card-body">
									<h5 class="card-title">키워드 확장</h5>
									<p class="card-text">
										시드 키워드 확장을 통해 마케팅에 사용할 <br>최적의 키워드를 발굴해보세요.
									</p>
									<a href="#" class="">바로가기</a>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<div class="card-body">
									<h5 class="card-title">대량 키워드 분석</h5>
									<p class="card-text">
										대량의 키워드 리스트를 한 번에 분석하고, <br>마케팅 인사이트를 획득해보세요.
									</p>
									<a href="#" class="">바로가기</a>
								</div>
							</div>
						</div>
					</div>
					<div class="py-5"></div>
					<div class="py-5"></div>
				</article>
			</section>
		</div>
	</div>

	<div class="container-sm">
		<!-- 섹션3 -->
		<section class="py-5" id="section3">
			<header class="text-center py-5">
				<h2 class="fw-bolder">트렌드 🔥</h2>
				<h5>매일 빠르게 변화하는 트렌드를 추적하고, 키워드 아이디어를 획득해보세요.</h5>
			</header>

			<article>
				<div class="col">
					<!-- rankDiv 시작 -->
					<div id="rankDiv">
						<div class="row row-cols-md-1 row-cols-lg-1 row-cols-xl-2"
							style="margin-bottom: 10%;">
							<div class="col d-none d-lg-block overflow-hidden"
								id="cloudChart">
								<!-- cloudChart 시작 40 단어 -->
								<div class="style__WordCloudContainer-sc-bte0qo-1 iLjNHh">
									<div class="style__WordCloud-sc-mn1dbw-0 cpmKYd">
										<svg height="360" width="756"
											style="display: block; margin: 0 auto">
											<g transform="translate(378, 180)">
											
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(135, 151, 104)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(69, -70)" font-size="36px">안녕</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(135, 151, 104)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-2, -10)" font-size="27px">ㅎㅎ</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(77, 45, 77)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(165, -8)" font-size="27px">❤</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(121, 59, 115)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(101, 40)" font-size="24px">좋은날</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(135, 151, 104)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-95, 56)" font-size="24px">우리</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(0, 0, 0)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-169, 72)" font-size="23px">🥰🥰🥰</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(53, 95, 99)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-123, 12)" font-size="21px">화이팅</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(139, 107, 99)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-31, 18)" font-size="21px">노래좋아</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(65, 86, 159)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(48, 66)" font-size="20px">~</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(65, 86, 159)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(73, -44)" font-size="19px">자자</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(121, 59, 115)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(57, -11)" font-size="18px">이거</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(37, 124, 38)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-135, -74)" font-size="18px">App</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(121, 59, 115)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(47, 90)" font-size="18px">개발자</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(37, 124, 38)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-57, -9)" font-size="18px">메타</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(95, 158, 9)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-142, -14)" font-size="18px">oj심슨</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(77, 45, 77)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-166, 95)" font-size="17px">배유진</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(98, 114, 127)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-162, -37)" font-size="17px">위믹스 코인</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(139, 107, 99)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(216, 16)" font-size="16px">🤍🤍🤍</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(37, 124, 38)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-39, -64)" font-size="16px">빼빼로데이</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(65, 86, 159)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-73, 82)" font-size="15px">아</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(77, 45, 77)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(29, 111)" font-size="15px">친구</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(78, 43, 77)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(148, 73)" font-size="15px">노래방</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(120, 104, 65)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-138, 115)" font-size="14px">오랜만에</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(95, 7, 13)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(187, -46)" font-size="14px">그 남자 좋은간호사</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(139, 107, 99)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(55, -109)" font-size="14px">연말정산 미리보기</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(121, 59, 115)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(48, 10)" font-size="14px">신해철</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(121, 59, 115)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-169, 34)" font-size="14px">한우데이</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(135, 151, 104)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-28, 134)" font-size="14px">쟈니 키타가와</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(107, 26, 124)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(162, -73)" font-size="14px">제주도 쑥빵</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(7, 22, 52)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-36, -87)" font-size="14px">환승연애 결말</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(77, 45, 77)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(2, 38)" font-size="14px">목소리</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(37, 124, 38)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-238, 47)" font-size="14px">메타 주가</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(95, 158, 9)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-89, -106)" font-size="14px"></text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(65, 86, 159)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(160, 53)" font-size="13px">아빠</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(95, 7, 13)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(218, 47)" font-size="13px">연말정산</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(53, 95, 99)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(220, 74)" font-size="13px">엄마</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(37, 124, 38)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-73, -33)" font-size="13px">많이</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(19, 127, 150)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-214, 13)" font-size="13px">숲의 목소리</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(98, 114, 127)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-220, -79)" font-size="13px">이노래</text>
											<text class="cloudChartTXT" cursor="pointer"
												fill="rgb(78, 43, 77)" font-family="Noto Sans"
												font-style="normal" font-weight="400" text-anchor="middle"
												transform="translate(-99, 133)" font-size="13px">마크툽</text>
										
											</g>
										</svg>
									</div>
								</div>
								<!-- cloudChart 끝 -->
							</div>
							<div class="col" id="rankingDiv">
								<!-- rankingDiv 시작 -->
								<div class="style__List-sc-bte0qo-2 dlzZdX">
									<div class="style__ListItem-sc-bte0qo-3 jHMAQF">
										<div class="style__ItemLeftContainer-sc-bte0qo-4 jnpAn">
											<span class="style__Rank-sc-bte0qo-5 iWxOhy">🥇</span><span
												title="이재용" class="style__Keyword-sc-bte0qo-6 bFxVkK"><span
												class="style__ExternalLink-sc-b6zz5-0 giyaCH aron"><a
													href="/service/keyword-analysis?keyword=이재용"
													target="_blank">마크툽</a></span></span>
										</div>
										<div class="style__Traffic-sc-bte0qo-8 UkVPi count">+15만</div>
									</div>
									<div class="style__ListItem-sc-bte0qo-3 jHMAQF">
										<div class="style__ItemLeftContainer-sc-bte0qo-4 jnpAn">
											<span class="style__Rank-sc-bte0qo-5 iWxOhy">🥈</span><span
												title="몸값" class="style__Keyword-sc-bte0qo-6 bFxVkK"><span
												class="style__ExternalLink-sc-b6zz5-0 giyaCH aron"><a
													href="/service/keyword-analysis?keyword=몸값" target="_blank">이라온</a></span></span>
										</div>
										<div class="style__Traffic-sc-bte0qo-8 UkVPi count">+7.5만</div>
									</div>
									<div class="style__ListItem-sc-bte0qo-3 jHMAQF">
										<div class="style__ItemLeftContainer-sc-bte0qo-4 jnpAn">
											<span class="style__Rank-sc-bte0qo-5 iWxOhy">🥉</span><span
												title="처음학교로" class="style__Keyword-sc-bte0qo-6 bFxVkK"><span
												class="style__ExternalLink-sc-b6zz5-0 giyaCH aron"><a
													href="/service/keyword-analysis?keyword=처음학교로"
													target="_blank">숲의 목소리</a></span></span>
										</div>
										<div class="style__Traffic-sc-bte0qo-8 UkVPi count">+7만</div>
									</div>
									<div class="style__ListItem-sc-bte0qo-3 jHMAQF">
										<div class="style__ItemLeftContainer-sc-bte0qo-4 jnpAn">
											<span class="style__Rank-sc-bte0qo-5 bUJbre">4</span><span
												title="향림원" class="style__Keyword-sc-bte0qo-6 bFxVkK"><span
												class="style__ExternalLink-sc-b6zz5-0 giyaCH aron"><a
													href="/service/keyword-analysis?keyword=향림원"
													target="_blank">찰나가 영원이 될때</a></span></span>
										</div>
										<div class="style__Traffic-sc-bte0qo-8 UkVPi count">+5.4만</div>
									</div>
									<div class="style__ListItem-sc-bte0qo-3 jHMAQF">
										<div class="style__ItemLeftContainer-sc-bte0qo-4 jnpAn">
											<span class="style__Rank-sc-bte0qo-5 bUJbre">5</span><span
												title="위믹스" class="style__Keyword-sc-bte0qo-6 bFxVkK"><span
												class="style__ExternalLink-sc-b6zz5-0 giyaCH aron"><a
													href="/service/keyword-analysis?keyword=위믹스"
													target="_blank">오늘도 빛나는 너에게</a></span></span>
										</div>
										<div class="style__Traffic-sc-bte0qo-8 UkVPi count">+5.3만</div>
									</div>
									<div class="style__ListItem-sc-bte0qo-3 jHMAQF">
										<div class="style__ItemLeftContainer-sc-bte0qo-4 jnpAn">
											<span class="style__Rank-sc-bte0qo-5 bUJbre">6</span><span
												title="임주환" class="style__Keyword-sc-bte0qo-6 bFxVkK"><span
												class="style__ExternalLink-sc-b6zz5-0 giyaCH aron"><a
													href="/service/keyword-analysis?keyword=임주환"
													target="_blank">양진모</a></span></span>
										</div>
										<div class="style__Traffic-sc-bte0qo-8 UkVPi count">+4.8만</div>
									</div>
									<div class="style__ListItem-sc-bte0qo-3 jHMAQF">
										<div class="style__ItemLeftContainer-sc-bte0qo-4 jnpAn">
											<span class="style__Rank-sc-bte0qo-5 bUJbre">7</span><span
												title="노사연" class="style__Keyword-sc-bte0qo-6 bFxVkK"><span
												class="style__ExternalLink-sc-b6zz5-0 giyaCH aron"><a
													href="/service/keyword-analysis?keyword=노사연"
													target="_blank">너를 그린 우주</a></span></span>
										</div>
										<div class="style__Traffic-sc-bte0qo-8 UkVPi count">+3.5만</div>
									</div>
									<div class="style__ListItem-sc-bte0qo-3 jHMAQF">
										<div class="style__ItemLeftContainer-sc-bte0qo-4 jnpAn">
											<span class="style__Rank-sc-bte0qo-5 bUJbre">8</span><span
												title="영화 리멤버" class="style__Keyword-sc-bte0qo-6 bFxVkK"><span
												class="style__ExternalLink-sc-b6zz5-0 giyaCH aron"><a
													href="/service/keyword-analysis?keyword=영화 리멤버"
													target="_blank">별을 담은 시</a></span></span>
										</div>
										<div class="style__Traffic-sc-bte0qo-8 UkVPi count">+3.3만</div>
									</div>
									<div class="style__ListItem-sc-bte0qo-3 jHMAQF">
										<div class="style__ItemLeftContainer-sc-bte0qo-4 jnpAn">
											<span class="style__Rank-sc-bte0qo-5 bUJbre">9</span><span
												title="영화 리멤버 평점" class="style__Keyword-sc-bte0qo-6 bFxVkK"><span
												class="style__ExternalLink-sc-b6zz5-0 giyaCH aron"><a
													href="/service/keyword-analysis?keyword=영화 리멤버 평점"
													target="_blank">숲의 목소리</a></span></span>
										</div>
										<div class="style__Traffic-sc-bte0qo-8 UkVPi count">+3.2만</div>
									</div>
									<div class="style__ListItem-sc-bte0qo-3 jHMAQF">
										<div class="style__ItemLeftContainer-sc-bte0qo-4 jnpAn">
											<span class="style__Rank-sc-bte0qo-5 bUJbre">10</span><span
												title="이재용 회장" class="style__Keyword-sc-bte0qo-6 bFxVkK"><span
												class="style__ExternalLink-sc-b6zz5-0 giyaCH aron"><a
													href="/service/keyword-analysis?keyword=이재용 회장"
													target="_blank">MAKTUB</a></span></span>
										</div>
										<div class="style__Traffic-sc-bte0qo-8 UkVPi count">+2.6만</div>
									</div>
								</div>
								<!-- rankingDiv 끝 -->
							</div>
						</div>
					</div>
					<!-- rankDiv 끝 -->

				</div>
			</article>

		</section>

		<!-- 섹션4 -->
		<section>
			<header class="text-center py-5">
				<h2 class="fw-bolder">영향력 순위 🏆</h2>
				<h5>세대별 가장 영향력 있는 키워드가 궁금하신가요?</h5>
			</header>
		</section>

		<!-- 섹션5 -->
		<section class="container text-center py-5 ">
			<header class="pb-5">
				<div>
					<img class="col-md-3"
						src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pjxzdmcgdmlld0JveD0iMCAwIDIwMCAyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PHN0eWxlPi5he2ZpbGw6IzI2MjYyNjt9PC9zdHlsZT48L2RlZnM+PHRpdGxlLz48cGF0aCBjbGFzcz0iYSIgZD0iTTg0LjIxNiw0NS42MzdhNi4zNjcsNi4zNjcsMCwxLDAtMS4zNzMsNi45MjVBNi4zNjcsNi4zNjcsMCwwLDAsODQuMjE2LDQ1LjYzN1pNODIuNCw1Mi4wODVhNS43LDUuNywwLDAsMS05LjY3NC00LjAxOCw1Ljg2NSw1Ljg2NSwwLDAsMSw1Ljc2Mi01Ljc0OEE1LjcyLDUuNzIsMCwwLDEsODIuNCw1Mi4wODVaIi8+PHBhdGggY2xhc3M9ImEiIGQ9Ik03Ni43MDUsNDkuMDNjLjM5Mi0uMTMuNTM2LS43NTUuMzIzLTEuNHMtLjctMS4wNTUtMS4wOTUtLjkyNS0uNTM2Ljc1NS0uMzIzLDEuNFM3Ni4zMTMsNDkuMTYsNzYuNzA1LDQ5LjAzWiIvPjxwYXRoIGNsYXNzPSJhIiBkPSJNNzkuOTkzLDQ4LjEyN2MuNDA4LS4wNjMuNjU2LS42NTUuNTUzLTEuMzIzcy0uNTE2LTEuMTU3LS45MjQtMS4wOTUtLjY1Ni42NTQtLjU1MywxLjMyMlM3OS41ODUsNDguMTksNzkuOTkzLDQ4LjEyN1oiLz48cGF0aCBjbGFzcz0iYSIgZD0iTTkzLjU0Niw2NC41NjFhMjMuMzIxLDIzLjMyMSwwLDEsMC0zMy4xMDguODcybC02LjExNCw4LjFxLS41MjMtLjIxOC0xLjA4MS0uNGEuNzUzLjc1MywwLDAsMC0uOC4yMTJjLTEuOSwyLjEwOS05LjUzOSwxMC43OS0xMS42ODksMTQuNDI0LTEuMzg3LDIuMzQ1LTEuNDYzLDMuOS0uMjQzLDUuNTQ4YTkuMyw5LjMsMCwwLDAsNS4xMTksMy4xN2M0LjEzLjU5Miw0LjYyNi0xLjc2MSwxNC43MDUtMTcuNjE4QS42NTkuNjU5LDAsMCwwLDYwLjMsNzguMWExNS4wMTcsMTUuMDE3LDAsMCwwLTMuNzQtMy40MDdjLS44MTQtLjUxMS0uNDMyLTEuMjY4LjM2OC0uOTA1QTEzLjc5MywxMy43OTMsMCwwLDEsNjAuMzA1LDc1LjZhLjMzNi4zMzYsMCwwLDAsLjQ1Ny0uMDk1bDQuNDktNi41MjZhMjMuMTM1LDIzLjEzNSwwLDAsMCw2LjEsMi4zMzljLjIsMi41LjgsNi44MDksMS4wMTYsNy44MzMuMi45NS4zODEsMi40NTksMS45NzYsMi4yNjMsNy4xODctLjg4MiwxOS41NTgtMy40MjYsMjAuMjY3LTMuNjUyczEuOTQ4LS41ODQsMS43MTYtMi4xMzlBNTguNjcxLDU4LjY3MSwwLDAsMCw5My41NDYsNjQuNTYxWm0tMjIuNCwxLjU2OGExOC4zNjQsMTguMzY0LDAsMSwxLDE5Ljk2Ni02LjM1Miw5LjI1LDkuMjUsMCwwLDAtNy45NTktNC40MTEsMTYuMDEsMTYuMDEsMCwwLDAtNy41NjIsMS44NzhDNzMuMjg5LDU4LjY3NCw3MS4yNzUsNjEuNzYzLDcxLjE0NSw2Ni4xMjlabTE0LjQsMy45NzhjLjkzNSwxLjgzNywxLjAyOCwxLjkxOC45OCwyLjAxOGwtMS43NzgsMy41MDljLTMuNTI2LTIuNDc0LTMuNS0yLjQtMy41LTIuNUw4MS4yLDcxLjQ0QTIyLjkxNywyMi45MTcsMCwwLDAsODUuNTQ3LDcwLjEwN1ptLTQuNS0zLjcyTDgwLjYsNTkuODY1bDIuNyw1LjhBMTguMTY1LDE4LjE2NSwwLDAsMSw4MS4wNSw2Ni4zODdaTTg0LDY1LjM3MSw4MC44OTEsNTkuMjZsMS43OTItMy4zNDlhOC42LDguNiwwLDAsMSw3Ljk5NSw0LjQwOUExOC40MzQsMTguNDM0LDAsMCwxLDg0LDY1LjM3MVptLTMuNjkyLTYuNTFMNzcuMzEyLDU3LjJhMTguOTEzLDE4LjkxMywwLDAsMSw0LjYyMS0xLjEyMVptLTMuNzUtMS40NDIsMy41MjYsMi4wNTguMjEsNy4wODZhMTguOTEsMTguOTEsMCwwLDEtOC40MjItLjMxOEM3MS45MTIsNjIuNjE3LDczLjM0Myw1OS4xMzQsNzYuNTU2LDU3LjQxOVptMTcuODgsMTkuNzQ5Yy0uNDQ3LjEzMS0xNi42ODEsMy4zMTktMjAuMTQ1LDMuNDgxLS44NzguMDQxLTEuMTA4LS45NDItMS4yLTEuNDIzLS4yMjItMS4xOTEtLjcyNC00LjgzMi0uOS03LjcsMC0uMjE5LDMuMTI5LjkxLDguMjQ3LjA1LjA0NiwxLjU4MS0uMDQyLDEuOTM0LjQxNSwyLjI1NWwzLjU3NCwyLjUwN2EuNjM5LjYzOSwwLDAsMCwuODktLjE1N2MuMDQtLjA1OC4zLS41NTcsMS44ODktMy43MTVhLjg3Mi44NzIsMCwwLDAsMC0uNzgybC0uOTYtMS44ODZhMjMuNzU4LDIzLjc1OCwwLDAsMCw2LjgyOS00LjdBNTQuNTI4LDU0LjUyOCwwLDAsMSw5NS42Niw3NS40Qzk1LjgxNyw3Ni40MzUsOTUuNDcsNzYuODY3LDk0LjQzNiw3Ny4xNjhaIi8+PHBhdGggY2xhc3M9ImEiIGQ9Ik0xMzcuNjgzLDcxLjQzNWwtMi40NTYsMi45ODFhOS4xMTksOS4xMTksMCwwLDAtMTEuNTIxLS4yODIsOS40LDkuNCwwLDEsMCwxMy42MTYsMi43bDMuNjY0LTUuMzY4YS4xNS4xNSwwLDAsMC0uMTMxLS4yMzVDMTM3LjgsNzEuMzQ0LDEzNy43NjUsNzEuMzM1LDEzNy42ODMsNzEuNDM1Wk0xMzIuNjI3LDg5LjRhOC40LDguNCwwLDAsMS0xMC45NzgtNC40MDdjLTMuMzY3LTcuODM1LDYuMTItMTUuMzYyLDEyLjk1Ny05LjgyMmwtNC45NzEsNi4wMzhjLS40OS00Ljc5LS40MDktNC40ODQtLjU4MS00LjUtMy44MzEtLjM4Ny0zLjk3LS40NS0zLjkwOS0uMTc5QzEyNy44MDYsODguMzksMTI3LjYxMyw4Ny43LDEyNy44LDg3LjY4YzIuMTgyLS4yMzUsMi4yMjUtLjE1MSwyLjI5My0uMjUzbDYuNjI1LTkuNzA4QTguMzgxLDguMzgxLDAsMCwxLDEzMi42MjcsODkuNFoiLz48cGF0aCBjbGFzcz0iYSIgZD0iTTEwOS44LDgwLjc3MWMtLjg2Ni0uMTQ1LTEuMDctLjExLTQuNDkxLjQ4NS0uNzI1LjEyNi0yNC43MzIsNC4yMzItMzcuNTkxLDYuNjEyYTUsNSwwLDAsMC00LjA0Nyw1LjcxMWMuNDY5LDQuMjM4LDIuOSw1LjM5MSw0LjMsNS43LDEuMjYuMjg1LDIuMTcyLjA1NCw0LjQ3OC0uMzg4LjczNC0uMTQyLDM3LjU0Ni02LjkxOCwzNy42LTYuOTI4QzExNS4zNjksOTEuMDQ3LDExNS43NDgsODEuNzQxLDEwOS44LDgwLjc3MVpNNzIuMjY1LDk3Ljk5MWMtMi44MzkuNTI3LTMuMi41OTQtNC4xLjM5Mi0yLjU4MS0uNTY1LTMuMzgtMi45NzktMy42LTQuOTA1YTQuMDY3LDQuMDY3LDAsMCwxLDMuMjg4LTQuNzcxYzIwLjY1Mi0zLjQ3MSw0MC4wMzctNy4yMzcsNDEuMTg3LTcuMjM3YTQuMjg5LDQuMjg5LDAsMCwxLDQuMDU4LDMuMTQ4Yy45MzYsMy40ODQtMS4wMTYsNi4yLTMuMiw2LjYwOUMxMDkuOTI3LDkxLjMyNyw4NC41LDk1LjcyMSw3Mi4yNjUsOTcuOTkxWiIvPjxwYXRoIGNsYXNzPSJhIiBkPSJNMTIwLjQ1NywxMTMuMzdjMS4wOCwxLjgxMywxLjkxMSwzLjI2MSwyLjkxNCw1LjA4Mi0xLjIyOS4yNzEtMi4yNS41LTMuMi43M2EuMjUuMjUsMCwwLDAtLjA4Ny40NTNjLjEyLjA4MS0uMTI0LjA5NCwzLjYxMS0uNTg2LDMuOCw2Ljk0MSwzLjYsNy4xODYsNCw2Ljk2NmEuMjUzLjI1MywwLDAsMCwuMTA2LS4zMTNjLS42Ni0xLjUzMi0xLjktNC4yMTItMy4yNzItNi44LDAsMCwxMy40NTMtMi40NTYsMTcuMzQzLTMuMTE3LDEuMjM4LDIuMTc0LDIuMDQ3LDMuNzQzLDMuMDYzLDUuOC02LjQ5MSwxLjIwNS0xMi4zNjUsMi41MjQtMTYuNTMsMy41ODNhLjI1LjI1LDAsMCwwLC4xLjQ4OWMxLjk3NS0uNDExLDE1LjUzMy0zLjA2MywxNi44LTMuMzEzLDIuNDYzLDUuMSwyLjI3Miw1LjM2NiwyLjU5MSw1LjM0NGEuMjUuMjUsMCwwLDAsLjI0NS0uMzM2Yy0uNjYyLTEuNzg1LTEuMzY5LTMuNTE2LTIuMS01LjE1LDcuNDEtMS40NSwxNC40MDYtMi42MTgsMjAuOC0zLjQ3MywyLjU2NiwzLjUxMSwyLjkxNyw0LjM2NiwzLjc3LDUuNDc5LTQuODYuOC0yMC4zMjEsMy40MjctMzIuMjIxLDYuMzQ5YS4yNS4yNSwwLDAsMCwuMTE2LjQ4NGMyLjM2MS0uMzQ4LDMyLjg3Ni02LjMzOSwzMi43NzYtNi4zMDZhLjI1Mi4yNTIsMCwwLDAsLjEyMS0uMzQxYy0xLjYzLTMuNzEzLTEwLjA2Ni0xNC45MjktMTguMjMzLTIxLjYzM2EuMzkyLjM5MiwwLDAsMC0uMjg2LS4wODljLTM3LjUyMywyLjYxNC0xMTQuMzY0LDIyLjMyLTExNC42NjIsMjIuODgxYS4yNTQuMjU0LDAsMCwwLC4yODIuMzY2YzMuNDI2LS44LDYuODIzLTEuNzIsMTAuMjM3LTIuNTcxLjExNy4yMjEuNjU1LDEuMjQxLDIuNzkxLDUuM0M0Mi4yNywxMzEuMjI4LDM5Ljk5MywxMzEuODY0LDM5LjUsMTMyYy0uNjczLTIuMDE0LTEuMjQ5LTMuOC0xLjc2Mi01LjQ1NGEuMjUuMjUsMCwwLDAtLjQ3OC4xNDJjMS43ODIsNy4zNjQsNS42NywxOC44NTUsMTAsMjYuNjgzYS4yMzEuMjMxLDAsMCwwLC4zMi4wODdjLjQtLjIwNi4yLjEyNC0yLjc3MS03LjA0LDQuMDgxLS45NDYsMTMuMjkyLTMuMjA4LDEzLjI5Mi0zLjIwOC43NTcsMS44NzIsMi40MjQsNi4yMywyLjQyNCw2LjIzLTMuOTc4LDEuMTA4LTcuNTcxLDIuMTE4LTExLjE0OSwzLjItLjMxLjEtLjE3LjYwNi4xNC41MjcsMS42MzUtLjQsNDQuNDM2LTExLjY0LDQ2LjczMi0xMi4yN2EuMzE0LjMxNCwwLDAsMC0uMTU0LS42MDljLS42LjEzNS0xLjE5NC4yNzQtMS43OTIuNDE0LS44NDEtMi42LS45Ni0yLjg2MS0yLjI2MS02LjI2NC42MjktLjE2OC42NjgtLjE1NC43NDQtLjNhLjMuMywwLDAsMC0uMzI3LS40MzJsLS42NDUuMTZjLS45MjgtMi4yODktMS45My00LjUwNy0zLjA2LTYuNzcyLDEzLjM3NS0zLjQxMiwxMi43NTEtMy4xLDEyLjg5LTMuMzE5YS4zMDYuMzA2LDAsMCwwLS4zMy0uNDU3cy04LjIyNCwxLjkxMS0xMi45MTUsMy4wNjhjLTEuMDM4LTIuMDQ0LTIuMDc5LTMuOTQ0LTMuMDE5LTUuNTEyLDcuMzkzLTEuNzQ5LDEwLjc3Ni0yLjUsMTcuNjktNCwyLjY3OSw0LjU5MywyLjUxMyw0Ljk2NywyLjkxMyw0Ljc0MmEuMjU0LjI1NCwwLDAsMCwuMTA3LS4zMTMsNDMuOTc4LDQzLjk3OCwwLDAsMC0yLjI5MS00LjU4NEMxMDkuOTUsMTE1LjQxNywxMjAuNDU3LDExMy4zNywxMjAuNDU3LDExMy4zN1pNNjguMywxMjUuMDQ5Yy40MzUuNzUxLDEuNzU4LDMuMDYxLDMuMTMsNS42NzUtNi40MzksMS43MjYtMTUuODkyLDQuNC0xNS44OTIsNC40LTEuNDM0LTMuMTUtMi41ODYtNS4zNTQtMi45NjItNi4wNjFDNTQuNzI0LDEyOC40NzUsNjQuOTQ3LDEyNS44ODksNjguMywxMjUuMDQ5Wm0zLjk0Myw1LjQ2MWMtMS40MzgtMi43MTktMi44MDktNS4wMDktMy4yLTUuNjQ4LDcuMDEtMS43NjMsMTUuNTg0LTMuOCwxNS41ODQtMy44LjI4Ni41MSwxLjY1OSwyLjk3NSwyLjk1MSw1LjUzNEM4Mi41LDEyNy44NTIsNzcuMiwxMjkuMjA1LDcyLjI0MiwxMzAuNTFabS0zLjY1Mi02LjM5Yy0xLjE2My0xLjg3MS0xLjc3My0yLjg2My0zLjExLTQuODMsMS4yOTMtLjMwOCw4LjMzNy0xLjk3NSwxNS45NTMtMy42NzguNDguODEsMS4wMDYsMS42NDYsMi43NjksNC43Qzc5LjQ5MywxMjEuNDIyLDc1LjAwOSwxMjIuNSw2OC41OSwxMjQuMTJabTMuMjcyLDcuNDMzYy44MiwxLjU1NSwyLjA1Niw0LjA3OSwzLjEyOCw2LjQ3OC0yNS43OTUsNi41MTEuMjkxLS4wOC0xNi40NzIsNC4yLS44MjMtMi4xNC0xLjczMy00LjMzMS0yLjY0LTYuMzU3QzU2LjgzNywxMzUuNjExLDcxLjIxOCwxMzEuNzI1LDcxLjg2MiwxMzEuNTUzWm0zLjg3Myw2LjI5MWMtLjk3Mi0yLjMwNS0yLjE0Ni00Ljc2My0zLjA2LTYuNTA5LDYuMzUxLTEuNzEsMTAuMzgtMi43NzIsMTUuMjYyLTQuMDI0Ljk4MywxLjk3OSwxLjksMy45LDMuMTI4LDYuNzQzQzg4LjM1MSwxMzQuNyw3OS4wMDYsMTM3LjAzMSw3NS43MzUsMTM3Ljg0NFptOS4xOTItMTcuNzA5Yy0yLjY1Mi00LjMzOC0yLjA2My0zLjI2My0yLjk1OC00LjY0Myw0LjQyNS0uOTg4LDE2LjM3My0zLjUyOCwxNy44NzEtMy44MzIuOTEzLDEuNDE5LDEuODg2LDIuOTE3LDIuODE0LDQuNTEyQzk3LDExNy4zODEsODkuOTIyLDExOC45NjMsODQuOTI3LDEyMC4xMzVabS0xOS45ODItLjcxOGMuNTE5Ljg2NywxLjA0OSwxLjcxMywyLjkyMiw0Ljg4OS02LjA4LDEuNTgtMTMuNTE0LDMuNTQ4LTE1LjYyNCw0LjEzNS0xLjA3My0xLjk4Ny0xLjU3OS0yLjkyNS0yLjk4Ny01LjIyN0M1NS43NjMsMTIxLjYsNjMuMjMzLDExOS44MjQsNjQuOTQ1LDExOS40MTdabS05Ljg3MSwxNi42N2MuODQ5LDEuOSwxLjU3NiwzLjU4MiwyLjcsNi4zMzIsMCwwLTkuMDM0LDIuMzg2LTEzLjE1OCwzLjUzMS0uOTMtMi4zNDctMS43LTQuMzM1LTIuNDYtNi4zNzNabTYuOTgyLDYuMTQ1LjAyOSwwYy4wMTIsMCwuMDMyLS4wMDguMDU2LS4wMTRsLS4wMDgtLjAyNy4wMDguMDI3YS4xNjIuMTYyLDAsMCwwLC4wNzQtLjA0OGwuMDU2LS4wMTRhLjU1OS41NTksMCwwLDAsLjI2Ny0uMDQxbDEyLjgwNS0zLjI5MmMuODcxLDEuOTUxLDEuNzQzLDQuMTg3LDIuNDY5LDYuMDM3LTcuMTQ5LDEuOTIyLTE1LjE2NSwzLjk5NC0xNi43ODcsNC40NDQtLjY0OS0yLjAyMS0xLjI5NC0zLjg1OS0yLjItNi4yNzFDNjIuNDgzLDE0Mi4xLDYxLjkyLDE0Mi4yMzIsNjIuMDU2LDE0Mi4yMzJabTE2LjI1NCwyLjQ5Yy0uOS0yLjc1NS0xLjMtMy43MzktMi4yNDgtNi4wODgsMCwwLDEyLjgtMy4zMzQsMTUuMjUtNCwxLjY1Nyw0LjAyMiwyLjE4Nyw1LjQxNCwyLjQ0Myw2LjA4N0M5My44NzYsMTQxLjAzOSw5NC40NDUsMTQwLjM5LDc4LjMxLDE0NC43MjJabTY0LjQyNy0yOS4wODZjNi45NDctMS4xNjEsMTMuMTU0LTIuMDMyLDE5LjUwOC0yLjczNiwxLjUyMSwxLjc4MiwyLjc4OCwzLjM3NSw0LjE5NCw1LjI3NS02LjMzMy43OTItMTIuOTM1LDEuODMxLTIwLjczNywzLjI2NUMxNDQuNzIyLDExOS4zMTMsMTQzLjc3NiwxMTcuNDYsMTQyLjczNywxMTUuNjM2Wm0tLjQxNC0uNzE0Yy0xLjA1MS0xLjgtMS45NzQtMy4yMzUtMy4xMzgtNC44NzQsNy4yMzItMS4xODIsMTIuMjcxLTEuODY1LDE3LjkzOS0yLjYzNCwxLjY2NCwxLjYyOCwzLjE3MSwzLjIzMSw0LjcyLDUuMDIyQzE1NS44NDcsMTEzLDE0OS40NTYsMTEzLjgxNCwxNDIuMzIzLDExNC45MjJabS0yNC40MzQtNi43MTdjNS44MzUtMS4wNDEsMTEuMjE4LTEuOTIsMTYuOTg1LTIuNzQ1LDEuMjg1LDEuNjM3LDEuOTMxLDIuNDcxLDMuMDQ5LDQuMDY0LTUuOS45MzktMTAuNjI4LDEuNzE5LTE3LjEwNSwyLjk2N0MxMTkuNzg2LDExMC44NzQsMTE4LjksMTA5LjU3NSwxMTcuODg5LDEwOC4yMDVabTIwLjQ4OSwxLjk3NmMxLjA1LDEuNTQ0LDIuMTEsMy4yMjQsMy4wNzYsNC44NzgtNi41NzIsMS4wMzYtMTEuMjgzLDEuOTEzLTE3LjI1OCwzLjIxMi0uOTc3LTEuODItMS45MS0zLjQzNi0yLjkyMS01LjA1OEMxMjQuNjI1LDExMi41NzEsMTMyLjIyMSwxMTEuMiwxMzguMzc4LDExMC4xODFabS40LS43ODljLS4yMjYuMDM1LS4yNDMtLjU3OS0zLjMtNC4wMTYsNi41NjEtLjkxOCwxMi4yMjMtMS41MzQsMTcuMy0xLjg3OCwxLjI3NSwxLjA0NCwyLjU0NCwyLjE3NiwzLjg3LDMuNDUzQzE1Mi4zODgsMTA3LjM1OCwxNDEuMDU2LDEwOS4wMzksMTM4Ljc3NywxMDkuMzkyWm0tMTguNzU2LDMuMjUzYy05Ljc4NSwxLjkxLTE2LjYzNSwzLjM3Mi0xNi42MzUsMy4zNzJhNDYuNiw0Ni42LDAsMCwwLTIuOTktNC40NzJjNS44MTYtMS4xODIsMTEuMzU1LTIuMjQyLDE2LjkyMS0zLjIzOEMxMTguMzU4LDEwOS45NDksMTE5LjAwNiwxMTAuOTU5LDEyMC4wMjEsMTEyLjY0NVptLTc4LjA0LDI2LjQ2MWMtLjczOC0yLTEuNDY4LTQuMDg1LTIuMzIzLTYuNjI4bDEyLjE4OS0zLjIyNWMuMjg1LjU3MiwxLjYxMSwzLjI1MSwyLjksNi4xQzQ4LjQ1LDEzNy4yLDU2LjY0OCwxMzQuNzQ3LDQxLjk4MSwxMzkuMTA2WiIvPjxwYXRoIGNsYXNzPSJhIiBkPSJNMTk0Ljk2OSwxNDMuMDM2Yy0xLjAxOS01LjY2MS04LjY5NC0xNS42MTItMTIuMjE2LTIwLjMzNS00Ljk2Mi02LjY1NS0xNC4yMDYtMTguNTY1LTIwLjQ0OC0yMy40OTVhMTIuNzMzLDEyLjczMywwLDAsMC01Ljk2OC0yLjgwOGMzLjEzLTEuNTg0LDIuODg1LTQuOSwyLjgxOS04LjQ2MmE1MS45NjQsNTEuOTY0LDAsMCwwLDE4Ljc5MS0yLjRjMS43NzMtLjYyOSwzLjQyOS0xLjM3Miw0LjIxMy0zLjUzOCwxLjAzNi0yLjkyMSwyLjUzNy0xOS4xODIsMi44OTItMjQuMTZsOC43LTEuNjI3YS4zMzcuMzM3LDAsMCwwLC4xMjktLjYwOGMtLjE2NC0uMTE0LjUyNS0uMi04Ljc4NiwxLjUzOWExNTMuNzc2LDE1My43NzYsMCwwLDAsLjQyNC0xNi4zNjdjLjMyLTMuMDktNS4zNzItNC42NDItOC4wMTgtNS4xOTMsMS40MzctNC44MTksMi40NDUtOC42LDMuNDA3LTExLjczNGEyLjYyMywyLjYyMywwLDAsMCwuMTEyLTEuMDdjLS40ODgtNC4xLTEuMzE4LTUuMzk1LTEuMTc0LTUuODY3LjAzNS0uMTExLjc2Ni0yLjg3NS45MTktMy4zNTguMTM1LS40MjguMjMyLS43MzgtLjA2NS0xYTIuMTExLDIuMTExLDAsMCwwLS43NDMtLjMwNy42NjguNjY4LDAsMCwwLS45MTMuNDYxbC0uMDQuMDkyYy0uMDEyLjAyOS0uOTgxLDMuMjYzLTEuMTIsMy45YTIwLjQsMjAuNCwwLDAsMC00LjI1Myw0LjA3OWMtLjIuMzMyLTMuODkzLDEyLjQ4NC00LjMxMywxMy44NzUtMS42LS4wNTUtMi45NDQtLjA1My00LjU5MS4wMDgtLjk1OS0yLjk5NC0xLjkzLTUuOTU0LTMuMi05LjE4N2ExLjE0OCwxLjE0OCwwLDAsMC0uMjg3LTEuNTc5LDEuMTcyLDEuMTcyLDAsMCwwLS41NjItMS40QTEuMjMxLDEuMjMxLDAsMCwwLDE2MCwyMC45OGExNi41ODgsMTYuNTg4LDAsMCwwLTEuMzM5LTUuNGMtLjc4Ni0yLjM2LTcuNzE5LS4zNTctNy4xMTcsMi4wNjVhMjQuOTM3LDI0LjkzNywwLDAsMCwxLjkyMiw1LjE1MiwxLjE0NiwxLjE0NiwwLDAsMCwuMjIzLDEuNjUsMS4xNjUsMS4xNjUsMCwwLDAsLjM5MSwxLjQ1NywxLjIzNywxLjIzNywwLDAsMCwuOTIzLDEuNjFzMS41NjgsNS4zMDcsMi4zOCw3Ljg2OWE0MC45NzUsNDAuOTc1LDAsMCwwLTQuODM4LDEuMDc2Yy0xLjYxNi03LjEtMy41MTktMTQuMTMzLTUuNjU5LTIwLjkwNi0xLjA4Mi0zLjQyOC0yLjcwOS04LjYxMS0xMi45MTQtOC4wNTZhNjg1LjgyOSw2ODUuODI5LDAsMCwwLTExMy40MjUsMTZDMTAuMjg5LDI1Ljg3MSw4LjUxNiwzMS42MjcsOC45MTgsNDAuNzcxYTM4MC42MTcsMzgwLjYxNywwLDAsMCw1LjYxNiw0OC4zTDUuMDc2LDkwLjg0MmEuMjc4LjI3OCwwLDAsMCwuMS41NDZsOS40NTgtMS43NTljMi41MjQsMTMuNzIsNS4zNTgsMjQuMTg4LDcuOTgxLDI5LjQ4NCwxLjIsMi40MjUsMi41OTQsMy41LDQuNzQ4LDMuNjQ1LS44Ljg2Ny0xLjk2NCwzLjA2Ni0uNzY5LDguMDIzLDIuMDg2LDguNjU2LDguMjM3LDI1LjIwNiwxMi43MzksMzUuNTc2LDUuOTg1LDEzLjc4OSw4LjQ0OCwxNy42LDI1LjA0LDEzLjkyOCwxLjgzOS0uNDA4LDMzLjg0NC03LjI4Nyw0OC4xLTEwLjRhMjAuOTIsMjAuOTIsMCwwLDAsOC41NzQsNC4xLDc3Ljk0MSw3Ny45NDEsMCwwLDAsMy4wOTUsMTguMzg1LjI1LjI1LDAsMCwwLC40NzktLjE0Yy0uNjg1LTMuNDc0LTEuMjE2LTUuMzkzLTIuODQxLTE4LjU1MWEuMzE0LjMxNCwwLDAsMC0uMjUzLS4yNywyMS4zODgsMjEuMzg4LDAsMCwxLTguNjUzLTQuMjY3Yy05LjU3Mi03LjcxNi01LjA4MS0xNS44MzgtMTUuMjMyLTMwLjI0NS0xLjcxMy0yLjQzMS0zLjE5My00LjUyOS0yLjg1LTUuNzUyYTEuMzEyLDEuMzEyLDAsMCwxLC44MjUtLjgzOSw1LjExMiw1LjExMiwwLDAsMSwzLjI3Ni4yOTNjMy4xLDEuMSw1LjI5MiwzLjM4MSw3LjA1Niw1LjIxNiwxLDEuMDM4LDIuOTI0LDMuMjI5LDMuNzgzLDIuMTE1LjkxLTEuMTc5LS4yNjUtNi4xNy00LjEwOC0xMS0xLjY4My0yLjExLTIuNDEzLTMuNjc0LTIuMTcxLTQuNjUuNTQ4LTIuMiw1LjU5NC0xLjM4Niw5LjMsMi4xOTMsNS4yMDcsNC45NjUsNC45LDEzLjk0OCw3LjU5NCwxMi4xNjksMS41NzItLjk3OC0xLjA2My04LjczMS0zLjg2Ni0xMS42ODEtMS43LTEuNzYzLTMuNTU4LTQuMzU2LTEuMzY1LTUuNDM1LDIuNTE0LTEuMjI4LDYsLjU1Myw4LjMyNywyLjg2YTM4LjA2OCwzOC4wNjgsMCwwLDEsNy43MTYsMTIuMjQxLjMuMywwLDAsMCwuNTU0LS4yLDM0LjU3MywzNC41NzMsMCwwLDAtNC41NjctOC44MWM4LjQ0Mi0uNDYyLDE0LjQ3NCw4LjgzNiwxNy4zMTksMTcuNzY3YS4zMTYuMzE2LDAsMCwwLC42MTMtLjA1MmM0LjMwNi0yOS44NCwxMy4wMTEtMTAuODkxLDguMjkxLDkuNjU2YTM3LjE2NywzNy4xNjcsMCwwLDEtNS44MTEsMTMuNzY0YzAsLjI3OS0uMDIzLS4wMSw0LjM3Myw1Ljg0MywxMi45MzQsMTcuMTEyLDExLjU1MiwxNy44OTIsMTIuMjQ3LDE3LjU0NGEuMjc4LjI3OCwwLDAsMCwuMTQ0LS4zNjNjLTMuMjQxLTYuNzgzLTExLjE2MS0xNy4yMzktMTUuOS0yMy4wMzVhMzEsMzEsMCwwLDAsNC03LjczN2MyMi4zMzQtNS4xMDYsMzUuMjktOC4zOTIsMzguNTEzLTkuNzY4QzE5NC4yOCwxNDkuNzk1LDE5NS42NzgsMTQ2Ljk2MywxOTQuOTY5LDE0My4wMzZaTTE4MS4zNDEsODEuN2MtLjY2OCwxLjgxNi0yLjA2NywyLjQyNS0zLjY5MywyLjk4NGE1MC4zNiw1MC4zNiwwLDAsMS0xOC41MTQsMi4xMywyNTQuODYyLDI1NC44NjIsMCwwLDAtNC40NDYtNDBjMTAuNjYxLDEuOTMzLDI2Ljk4Mi0uMDE0LDMwLjI4LTQuNjY1QzE4NS4yLDU0LjU1LDE4Mi4yMzIsNzkuMjE5LDE4MS4zNDEsODEuN1pNMTY4LjYwOCw0Ni41ODZjNC4zODUtMTQuMDc2LDcuNTY1LTIzLjkxNCw3LjU2NS0yMy45MTRhMS45NDQsMS45NDQsMCwwLDAsMiwuNjI0Yy0uNSwxLjYwNS0yLjI2NSw3LjYxMi03LjE4NywyMy4wNjNDMTcwLjA3OSw0Ni40NjQsMTY5LjUxOCw0Ni41MTgsMTY4LjYwOCw0Ni41ODZabTE2LjI0My01Ljg4MWMtLjM2MiwzLjA5Mi04LjcsNC44MTktMTAuNTEsNS4xNTcsMS4wMi0zLjIxMSwyLjAyMS02LjQ1NywyLjk3OC05LjY1NkMxNzguOTE3LDM2LjU0MiwxODUuMTY0LDM4LjAzMywxODQuODUxLDQwLjcwNVpNMTczLjYsNDUuOTkxYy0uNjMuMS0xLjI3LjItMS45MDUuMjgsMi40NTgtNy41NzEsNS4xODctMTYuMTQyLDYuOTU3LTIyLjc2NWExLjUzMSwxLjUzMSwwLDAsMCwxLjc1Ni4yMzJDMTc4LjA3LDMxLjY0OSwxNzYuMDc4LDM4LjM0LDE3My42LDQ1Ljk5MVpNMTc4LjEsMTcuMTc1YTEuOTgxLDEuOTgxLDAsMCwwLDEuMzEuMzMzLDM0LjgzNSwzNC44MzUsMCwwLDEsMS4xMTEsNS41MDgsMS4zMTcsMS4zMTcsMCwwLDEtLjkyMi4zMWMtLjgtLjA2MS0uNzk0LS43NDgtMS4xMS0uNjM5YTEuODg3LDEuODg3LDAsMCwxLTIuMTU1LS43NmMtLjE1NC0uMy0uNi4wNDItMS40MTItLjI3NmExLjcsMS43LDAsMCwxLS44LS41ODVBMjEuODc2LDIxLjg3NiwwLDAsMSwxNzguMSwxNy4xNzVabS00LjE4Niw0LjUxYTIuMTU0LDIuMTU0LDAsMCwwLDEuODEzLjY4MmMtMi40NTcsNi43NjctNS40MzYsMTYuMTY2LTcuNSwyMy42NjNsLS44MzgtMi43NjlTMTY3LjcyOSw0Mi4xNCwxNzMuOTE4LDIxLjY4NVpNMTY5LjEzMiwzNS4zYy0uNzM2LDIuNDc5LTEuMzE5LDQuNDktMi4wMTUsNy4wNTQtLjgyNi0yLjczMi0xLjU1OS01LjEtMi4xNzktNy4wNDVDMTY2LjYzOSwzNS4yNDgsMTY3Ljg2NywzNS4yNiwxNjkuMTMyLDM1LjNabS0xLjI4LDExLjM3MmMtLjUuMDI4LTEuMDEzLjAzMS0xLjQ5My4wNDhsLTYuNS0xOS45MjRhNS4yMjksNS4yMjksMCwwLDAsMS4zLS44NzlDMTYyLjI5MSwyOS4xNzMsMTY3LjU2NCw0NS44LDE2Ny44NTIsNDYuNjcyWk0xNTIuMTA3LDE3LjQ4NWMtLjI4OS0xLjEzOSwyLjQ2OC0yLjU2NSw0LjU0OC0yLjQ0NiwyLjY0NC4xNzksMS40MzgsMi4wNTgtMS4xODMsMi44MzRDMTU0LjI5NSwxOC4yMTQsMTUyLjQxNCwxOC4zMjcsMTUyLjEwNywxNy40ODVabS4zMjQsMS4wNTZjMS42ODUuNzIyLDUuMDM5LS4yNDcsNi4wMS0xLjgzM2EzMi45MjcsMzIuOTI3LDAsMCwxLDEuMDQxLDQuNDU3LDMuOTgzLDMuOTgzLDAsMCwxLTIuMywxLjQwOCw2LjMsNi4zLDAsMCwxLTMuMDkzLjExQTI4LjYxNCwyOC42MTQsMCwwLDEsMTUyLjQzMSwxOC41NDFabTEuNCw1LjIzOGEuNTI5LjUyOSwwLDAsMS0uMDI1LS41NjQsNi4yMjgsNi4yMjgsMCwwLDAsMy41MjMtLjA1NCw0LjY4LDQuNjgsMCwwLDAsMi41Ni0xLjY1OEMxNjEuOTQxLDIyLjkyMiwxNTUuMDEyLDI1LjU1NywxNTMuODMzLDIzLjc3OVptLjMwNSwxLjE2MmEuNTc3LjU3NywwLDAsMSwuMDIyLS4yM2MxLjY4NS42LDUuMTItLjMwNiw2LjI3OC0xLjc3MywxLjAwOS43LS4yODcsMS42MjMtMS4zOTMsMi4xMjlhNy4zNjMsNy4zNjMsMCwwLDEtMy42OTEuNjU0QzE1NC42LDI1LjY1NSwxNTQuMiwyNS40LDE1NC4xMzgsMjQuOTQxWm0uNDg2LDEuNzIyYS41MTYuNTE2LDAsMCwxLS4wODktLjUxOWMxLjcyMy42LDUuMzQ2LS4zMjIsNi40NzUtMS44Ljk3OC45LTEuNDI1LDIuMTM5LTIuNzgxLDIuNTI2QzE1Ni42NjYsMjcuMywxNTUuMDgyLDI3LjIwOCwxNTQuNjI0LDI2LjY2M1ptLjk0MS45NjRhNi45MDksNi45MDksMCwwLDAsMS45NTgtLjA2OGw2LjEsMTkuMjIyYy0uNiwwLTEuMjE3LS4wMDgtMS44NDMtLjAyNkMxNTkuODA2LDQwLjU4OCwxNTcuMTA3LDMyLjM0MSwxNTUuNTY1LDI3LjYyN1ptMi4wMTUsOC40YzEuNDgzLDQuNjQ5LDIuNTA2LDcuNiwzLjU4NywxMC43MTFhNDguNzIzLDQ4LjcyMywwLDAsMS02LjYyNC0uNjljLS41NDctMi44NzMtMS4xNzEtNS44NzctMS44NTQtOC45M0EzOS44LDM5LjgsMCwwLDEsMTU3LjU4LDM2LjAyNFpNNzcuNjcsMTUuNWExLjQsMS40LDAsMSwxLTEuNCwxLjRBMS40LDEuNCwwLDAsMSw3Ny42NywxNS41Wk0xNi4yMTUsMzIuNGM0MS42MzktOS40LDg1LjQyNi0xNS43LDEyMy4zMjktMTcuNzY5LDYuNDYsMTguNCwxMi4xNjksNTkuOTUyLDEyLjM2Miw3Ni41MzItMzkuODM1LDguMzg2LTg0LjA4NCwxNS43NzYtMTIzLjE0OCwyMi4zQTQxMi4yLDQxMi4yLDAsMCwxLDE2LjIxNSwzMi40Wk0xODcuMjIxLDE0Ni44Yy01LjIzOCwxLjU4My0xNi4zMjksNC4yNTQtMzIuOTc1LDcuOSwyLjM4MS0xMC44MTksMS4yMjItMjAuODExLTEuMjkzLTI0LjI1OWEyLjkzOCwyLjkzOCwwLDAsMC0yLjA1LTEuMzc1Yy0zLjk2Ni0uNDA3LTUuOCwxMS4wOTItNi4yODcsMTQuNzdDMTQxLjU2MiwxMzQuOTA5LDEzNS4zMywxMjYsMTI2LjcsMTI3YTMwLjg0NSwzMC44NDUsMCwwLDAtMi43LTMuMTg0QzExOC45NTIsMTE4LjgsMTEzLjgsMTIwLDExMy4zNzIsMTIyLjVjLS4zLDEuNzUsMS40NTgsMy44ODMsMi41MzMsNSwyLjQ1NCwyLjU4MSw1LjAyLDkuOTM5LDQuMDQ1LDEwLjUyMS0xLjQ5Ljg5MS0xLjgtNy4zODEtNi42OTEtMTIuMDg1LTIuODczLTIuOC03LTQuMy05LjIxMS0zLjM1LTIuOCwxLjItLjk1NSw0LjQzOC45NDYsNi44MzUsNC4yNDQsNS4zNzksNC43MzgsMTAuMjc0LDMuODEsOS44NC0xLjM1Ni0uNjE4LTQuNjEzLTUuNzA3LTkuNjMxLTcuNDc1YTUuNTQ4LDUuNTQ4LDAsMCwwLTMuOS0uMjY0Yy00LjAzMiwxLjcxLDEuOSw3LjM4Nyw0LjM4NywxMi4wMiw0Ljg4NCw5LjEyNCw0LjYsMTUuNDQ1LDguMDQ1LDIwLjk2OS0xOC4xNDYsMy43MzQtMzEuNTY3LDYuNDMtNDYuMzIzLDkuMTQzLTcuMjMsMS4zLTEyLjk0MiwyLjMyNS0xNS45MjctMi41NjNDNDAuNSwxNjIuNTM2LDMwLjE3MSwxMzYuOCwyOC4xNjUsMTMwLjMzYy0uOTc1LTMuMTM3LTEuMjM4LTcuMDE4LDEuOTI1LTcuOTY0LDM0LjMzNy0xMC4yODgsODguODQ5LTE5LjI4MSwxMTIuMTI2LTIzLjEyMSwxMi42MTMtMi4wOCwxMS4zNTctMS45OTMsMTIuNDc2LTEuOTkzYTExLjQyNSwxMS40MjUsMCwwLDEsNy4wMjQsMi42OTNjNS44MzUsNC43MjcsMTUuMTM1LDE2LjcsMjAuMTYsMjMuNDEsOC42MzgsMTEuNTgzLDExLjI1OCwxNS45MDgsMTEuMjEyLDE4LjUwOUMxOTMuMDM5LDE0NC42OTMsMTg5LjkyNCwxNDUuOTc5LDE4Ny4yMjEsMTQ2LjhaIi8+PC9zdmc+"
						class="style__HomeJoinImage-sc-1ypokg9-33 clAUBK">
				</div>
			</header>

			<article class="pb-3">
				<h2 class="fw-bolder mb-3">지금 트롤링에 가입하세요.</h2>
				<h5>10초 회원가입 후 99,392명이 사용 중인 트롤링의 다양한 서비스들을 경험해보세요.</h5>
			</article>

			<article>

				<!-- 흰색 버튼 -->
				<c:choose>
					<c:when test="${ empty userInfo }">
						<!-- 검은 버튼 -->
						<button class="btn btn-dark" data-bs-toggle="modal"
							data-bs-target="#joinModal">무료 가입하기</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-outline-dark" type="button"
							onclick="location.href='${pageContext.request.contextPath}/board/BoardList.bo?ageRange=${ userInfo.age_range }'">게시판으로
							이동</button>
					</c:otherwise>
				</c:choose>
			</article>

		</section>

		<!-- 섹션6 -->
		<!-- <section>
      <header class="text-center py-5">
        <h2 class="fw-bolder">TEST</h2>
        <h5>TEST</h5>
      </header>
      
      <article class="text-center mb-3"> -->
		<!-- 글쓰기 모달창 연결 버튼 -->
		<!-- <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#writeModal">글쓰기</button>
      </article>
    </section> -->

		<!-- 섹션7 -->
		<!-- <section>
      <header class="text-center py-5">
        <h2></h2>
        <h5></h5>
      </header>
      
      <article>

      </article>
    </section> -->

	</div>

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

	<!-- 글쓰기 모달창 시작 -->
	<!-- <div class="modal fade" id="writeModal" tabindex="-1" aria-labelledby="writeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="writeModalLabel">
            글쓰기
          </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body"> 
          <form>
            <div class="mb-3">
              <label for="writeTitle" class="col-form-label">제목</label>
              <input type="text" class="form-control" id="writeTitle">
            </div>
            <div class="mb-3">
              <label for="writeContent" class="col-form-label">내용</label>
              <textarea class="form-control" id="writeContent" rows="3"></textarea>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary">글쓰기</button>
        </div>
      </div>
    </div>
  </div> -->
	<!-- 글쓰기 모달창 끝 -->

	<!-- 폰트 깜박임 방지 시작 -->
	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#no-fouc").delay(250).animate({
				"opacity" : "1"
			}, 250);
		});
	</script>
	<!-- 폰트 깜박임 방지 끝 -->

	<!-- 가입하기 유효성검사-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/user.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/chart.js"></script>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>


</body>
<script>
	var count = document.getElementsByClassName("count");
	var keyCnt = [];
	setInterval(()=>{
		axios({
			url:'/chart/Top10Cnt.ch',
			method: 'get'
		})
		.then((res)=>{
			keyCnt = res.data.split(",") ;
			
			for ( var i = 0 ; i < 10 ; i++ ) {
				count[ i ].innerHTML = keyCnt[ i ] ;
			}
		})
	},10000);
	
</script>
<script>
	var rank = document.getElementsByClassName("aron");
	var strArr = [];
	setInterval(()=>{
		axios({
			url:'/chart/Top10.ch',
			method: 'get'
		})
		.then((res)=>{
			strArr = res.data.split(",") ;
			
			for ( var i = 0 ; i < 10 ; i++ ) {
				rank[ i ].innerHTML = strArr[ i ] ;
			}
		})
	},10000);
	
</script>
<script>
	var cloud = document.getElementsByClassName("cloudChartTXT");
	var result = [];
	setInterval(()=>{
		axios({
	        url:'/chart/Top40.ch',
	        method:'get'
	    })
	    .then((res)=>{
	    	
	    	result = res.data.split(",") ;
	    	
	    	for ( var i = 0 ; i < 40 ; i++ ) {
	    		
	    	 cloud[ i ].innerHTML = result[ i ];
	    		
	    	}
	    				
	    })
		
	},10000);
</script>
<script>
	$(document).ready(function(){ 
		/* 탭 클릭 */
		$('.anchor_tab li a').on('click',function(){
		   var sectionId = $(this).attr('data-anchor');
		   // 스크롤 이동
		   scroll_to_anchor_tab(sectionId);
		});
	});
	 // 탭 이동 - 부드러운 스크롤
	function scroll_to_anchor_tab(sectionId, speed) {
	        if( !speed ) var speed = 'slow';
	        var a_tag = $("#" + sectionId);
	        if(a_tag.length > 0){
	            $('html, body').animate({
	                scrollTop: a_tag.offset().top - $('').height() -  $('').height() // 상단에 특정 위치를 제외하고 스크롤할때 해당 이름 작성
	            }, speed);
	        }
	    }
</script>
</html>