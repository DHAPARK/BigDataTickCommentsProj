<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>이미지 필터(beta)</title>
<style>
	canvas {
	    border : black 1px solid;
	    border-radius: 5px;
	}
</style>
</head>

<body>
	<fieldset>
		<legend>이미지</legend>
		<canvas id="canvas" width="300" height="300"></canvas><br>
	</fieldset>
	
	<fieldset>
		<legend>파일을 고르시오.</legend>
			<input id="loadButton" type="file" accept="image/*">
	</fieldset>
	
    <fieldset>
        <legend>필터</legend>
		<button id="invertFilter">invertFilter</button>
		<button id="brightnessFilter">brightnessFilter</button>
		<button id="grayscaleFilter">grayscaleFilter</button>
		<button id="sepiaFilter">sepiaFilter</button>
		<button id="thresholdFilter">thresholdFilter</button>
		<button id="blurFilter">blurFilter</button>
	</fieldset>
	
	<fieldset>
		<legend>"C:\upload" 혹은 지정하신 경로에 다운로드 됩니다.</legend>
		<button id="download">다운로드</button> 
	</fieldset>


	
	
</body>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/assets/js/filter.js"></script>
<script type="text/javascript">
	
uploadCanvasToServer = function() {
  	const canvas = document.getElementById('canvas');
	const imgBase64 = canvas.toDataURL('image/jpeg', 'image/octet-stream');
	const decodImg = atob(imgBase64.split(',')[1]);
	
	let array = [];
	for (let i = 0; i < decodImg .length; i++) {
	  array.push(decodImg .charCodeAt(i));
	}

	const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
	const fileName = 'canvas_img_' + new Date().getMilliseconds() + '.jpg';
	let formData = new FormData();
	formData.append('file', file, fileName);

	$.ajax({
	  type: 'post',
	  url: '/board/IMGUpload.bo',
	  cache: false,
	  data: formData,
	  processData: false,
	  contentType: false,
	  success: function (data) {
	     	alert("이미지가 다운로드되었습니다.");
	  }
	})
};
	
document.getElementById("download").onclick = uploadCanvasToServer;
</script>

</html>