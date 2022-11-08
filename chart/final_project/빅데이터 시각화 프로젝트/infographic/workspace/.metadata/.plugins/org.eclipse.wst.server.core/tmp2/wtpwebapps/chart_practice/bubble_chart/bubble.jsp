<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
</head>
<body>
	
<c:set var="cnt" value="${requestScope.cnt }" />	
	${cnt}
	
	
	<figure class="highcharts-figure">
		<div id="container"></div>
	</figure>


	<script>
	

		let value = new Array();
		let size = new Array();
		
		 window.onload = function() {
			let obj = "";
			let xhr = new XMLHttpRequest();
			xhr.open("GET", "/bubble_chart/bubble_test.ch ", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
					obj = JSON.parse(xhr.responseText);
					// alert(obj)
					for (let i = 0; i < obj.search_word2.length; i++) {
						value[i] = obj.search_word2[i].comments;
						// alert(value[i])
						
// 		 	let obj2 = "";
// 			let xhr2 = new XMLHttpRequest();
// 			xhr2.open("GET", "data3.json", true);
// 			xhr2.send();
// 			xhr2.onreadystatechange = function() {
// 				if (xhr2.readyState == XMLHttpRequest.DONE && xhr2.status == 200) {
// 					obj2 = JSON.parse(xhr2.responseText);
// 					for (let i = 0; i < obj2.search_word.length; i++) {
// 						size[i] = obj2.search_word[i].size;    

						
		// <chart부분>				
		var chart = Highcharts.chart('container', {
		  chart: {
		    type: 'packedbubble',
		    height: '50%'
		  },
		  title: {
		    text: 'Comments by age'
		  },
		  tooltip: {
		    useHTML: true,
		    pointFormat: '<b>{point.name}:</b> {point.value}명'
		  },
		  plotOptions: {
		    packedbubble: {
		      minSize: '10%',
		      maxSize: '50%',
		      zMin: 0,
		      zMax: 1000,
		      layoutAlgorithm: {
		        gravitationalConstant: 0.05,
		        splitSeries: true,
		        seriesInteraction: false,
		        dragBetweenSeries: true,
		        parentNodeLimit: true
		      },
		      dataLabels: {
		        enabled: true,
		        format: '{point.name}',
		        filter: {
		          property: 'y',
		          operator: '>',
		          value: 150
		        },
		        style: {
		          color: 'black',
		          textOutline: 'none',
		          fontWeight: 'normal'
		        }
		      }
		    }
		  },
		  series: [ {
		    name: '10대',
		    data: [ {
		      name: value[0],
		      value: ${cnt}
		    },
		    {
		        name: value[1],
		        value: size[1]
		      },
		    {
		        name: value[2],
		        value: size[2]
		      },
		    {
		        name: value[3],
		        value: size[3]
		      },
		      {
		          name: value[4],
		          value: size[4]
		        }
		    ]
		  
		  }, {
			  name: '20대',
			    data: [ {
			      name: value[0],
			      value: size[0]
			    },
			    {
			        name: value[1],
			        value: size[1]
			      },
			    {
			        name: value[2],
			        value: size[2]
			      },
			    {
			        name: value[3],
			        value: size[3]
			      },
			      {
			          name: value[4],
			          value: size[4]
			        }
			    ]
		  
		  
		  }]
		  
		});
					}}}}

</script>






</body>
</html>