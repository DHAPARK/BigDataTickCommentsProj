<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	canvas {
	    border : black 1px solid;
	    border-radius: 5px;
	}
</style>
</head>

<body>
	<!-- 캔버스 그리기 -->	
	<canvas id="canvas" width="600px" height="600px"></canvas><br>
	<!-- 파일첨부버튼 -->
    <input id="loadButton" type="file" accept="image/*">
	<!-- 제출버튼 -->
	<!-- 필터버튼 -->
	<button id="invertFilter">invertFilter</button>
	<button id="brightnessFilter">brightnessFilter</button>
	<button id="grayscaleFilter">grayscaleFilter</button>
	<button id="sepiaFilter">sepiaFilter</button>
	
	
</body>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/assets/js/filter.js"></script>
</html>