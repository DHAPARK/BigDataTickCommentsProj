<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<figure class="highcharts-figure">
  <div id="container"></div>
  
</figure>

<script>
 Highcharts.chart('container', {
  chart: {
    type: 'packedbubble',
    height: '50%'
  },
  title: {
    text: 'Comments by age'
  },
  tooltip: {
    useHTML: true,
    pointFormat: '<b>{point.name}:</b> {point.value}m CO<sub>2</sub>'
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
    name: 'Africa',
    data: [{
      name: "United Republic of Tanzania",
      value: 9.1
    },
    {
      name: "Nigeria",
      value: 93.9
    },
    {
      name: "South Africa",
      value: 392.7
    }, {
      name: "Egypt",
      value: 225.1
    }, {
      name: "Algeria",
      value: 141.5
    }]
  }]
});
</script>


</body>
</html>