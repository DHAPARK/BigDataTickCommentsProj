<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/venn.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

</head>

<body>

<figure class="highcharts-figure">
  <div id="container"></div>
  <p class="highcharts-description">
            
  </p>
</figure>

<div id="container"></div>
	<script>
	Highcharts.chart('container', {
		  accessibility: {
		    point: {
		      descriptionFormatter: function (point) {
		        var intersection = point.sets.join(', '),
		          name = point.name,
		          ix = point.index + 1,
		          val = point.value;
		        return ix + '. Intersection: ' + intersection + '. ' +
		          (point.sets.length > 1 ? name + '. ' : '') + 'Value ' + val + '.';
		      }
		    }
		  },
		  tooltip: {
			    useHTML: true,
			    pointFormat: '<b>{point.sets}:</b> {point.value}명'
		  },
		  series: [{
		    type: 'venn',
		    name: '댓글',
		    data: [{
		      sets: ['10대'],
		      value: 101
		    }, {
		      sets: ['20대'],
		      value: 105
		    }, {
		      sets: ['30대'],
		      value: 106
		    }, {
		      sets: ['10대', '20대'],
		      value: 50,
		      name: '오냐 '
		    }, {
		      sets: ['20대', '30대'],
		      value: 60,
		      name: '그렇구나'
		    }, {
		      sets: ['30대', '10대'],
		      value: 30,
		      name: '안뇽'
		    }, {
		      sets: ['10대', '20대', '30대'],
		      value: 20,
		      name: '그나마'
		    }]
		  }],
		  title: {
		    text: '새대별 인기많은 댓글!'
		  }
		});
	</script>

</body>
</html>