<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트롤링</title>
  <!-- favicon -->
  <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/x-icon">
</head>
<style>                     
.img{
    width: 600px;
}
.center{
    margin: 10% auto;
}
.tcenter{
    text-align: center;
}
.button{
    background-color:black;
    border-color: black;
    color: white;
    width: 200px;
    height: 40px;
    border-radius: 5px;
}

</style>
<body style="margin: 20%;">
	<div class="center tcenter">
		<form action="/index.jsp">
			<div  class="img center">
				<div>
					<img src="../BigDataProj/src/main/webapp/assets/images/sadness.jpg" alt="" class="img"/>
				</div>
				<br>
					<h1 class="tcenter">페이지를 찾을 수 없어요 😔</h1>
					
				<div class="center">
					<input class="tcenter button" type="submit" value="트롤링으로 돌아가기">
				</div>
			</div>
		</form> 
    </div>
</body>
</html>