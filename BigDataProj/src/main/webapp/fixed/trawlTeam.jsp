<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트롤링</title>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
 
  <!-- favicon -->
  <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/x-icon">
<style>
body{
background-color: hsla(0,0%,0%,1);
}

#snow {
  left: 50%;
  position: absolute;
  top: 50%;
  transform: translate( -50%, -50%);
  /* font-size:3em; */
  color:white;
}

.tcenter{
    text-align: center;
}
.button{
    background-color:white;
    border-color: white;
    color: black;
    width: 200px;
    height: 40px;
    border-radius: 5px;
}
</style>
</head>
<body>

  <canvas id='canv'></canvas>
  <div id="snow">
    <div style="text-align: center;">
      <header class="text-center py-5">
        <h2 class="fw-bolder">트롤 크루 🌝</h2>
        <h5>트롤링을 이끌고 있는 트링이들을 소개합니다.</h5>
        <img src="${pageContext.request.contextPath}/assets/images/TTeam.png" width="100%;">
      </header>
      
      <form action="/index.jsp">
		  <input class="tcenter button" type="submit" value="트롤링으로 돌아가기">
	  </form>
    </div>
  </div>


<script type="text/javascript">
var c = document.getElementById('canv'), 
    $ = c.getContext("2d");
var w = c.width = window.innerWidth, 
    h = c.height = window.innerHeight;

Snowy();
function Snowy() {
  var snow, arr = [];
  var num = 100, tsc = 1, sp = 1;  //num:눈송이 개수 , tsc:눈송이 가로 변화율, sp:내리는 속도
  var sc = 0.8, t = 10, mv = 20, min = 1;  //sc:눈송이 크기
    for (var i = 0; i < num; ++i) {
      snow = new Flake();
      snow.y = Math.random() * (h + 50);
      snow.x = Math.random() * w;
      snow.t = Math.random() * (Math.PI * 2);
      snow.sz = (100 / (10 + (Math.random() * 100))) * sc;
      snow.sp = (Math.pow(snow.sz * .8, 2) * .15) * sp;
      snow.sp = snow.sp < min ? min : snow.sp;
      arr.push(snow);
    }
  snowing();
  function snowing(){
    window.requestAnimationFrame(snowing);
      $.clearRect(0, 0, w, h);
      $.fillStyle = 'hsla(242, 95%, 3%, 1)';
      $.fillRect(0, 0, w, h);
      $.fill();
        for (var i = 0; i < arr.length; ++i) {
          f = arr[i];
          f.t += .05;
          f.t = f.t >= Math.PI * 2 ? 0 : f.t;
          f.y += f.sp;
          f.x += Math.sin(f.t * tsc) * (f.sz * .3);
          if (f.y > h + 50) f.y = -10 - Math.random() * mv;
          if (f.x > w + mv) f.x = - mv;
          if (f.x < - mv) f.x = w + mv;
          f.draw();}
 }
 function Flake() {
   this.draw = function() {
      this.g = $.createRadialGradient(this.x, this.y, 0, this.x, this.y, this.sz+8);
      this.g.addColorStop(0, 'hsla(255,255%,255%,1)');
      this.g.addColorStop(1, 'hsla(255,255%,255%,0)');
      $.moveTo(this.x, this.y);
      $.fillStyle = this.g;
      $.beginPath();
      $.arc(this.x, this.y, this.sz, 0, Math.PI * 2, true);
      $.fill();}
  }
}
/*________________________________________*/
window.addEventListener('resize', function(){
  c.width = w = window.innerWidth;
  c.height = h = window.innerHeight;
}, false);

</script>
</body>
</html>