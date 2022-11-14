<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
</head>
<body>
	<input type="text" class="form-control" id="cmc" placeholder="검색어를 입력하세요"  aria-label="Recipient's username" aria-describedby="button-addon2">
	<button class="btn btn-dark border" type="button" id="button" onclick="getvalue()">검색</button>
	 <script src="js2/drill.js"></script> 
 	 
		
		<figure class="highcharts-figure">
			<div id="container"></div>
		</figure>
		
		
		
		
</body>
</html>











