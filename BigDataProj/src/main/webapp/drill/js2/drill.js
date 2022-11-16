
			function getvalue(){
	 		// let soyoung = $('#soyoung').val()  
	 		// $('')안에  #:id로 value접속  .:class
	 		
	 		let cmc = $('#cmc').val();
	 		alert(cmc)
	 		let y = new Array();
	// 		function generationClick() {
			
			let obj = "";
			let xhr = new XMLHttpRequest();
			xhr.open("GET","/drilldown_chart/drill.ch?cmc="+cmc, true);
			//xhr.open("GET","/test.dd", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
					obj = JSON.parse(xhr.responseText);
					for (let i = 0; i < obj.search_word3.length; i++) {
						// name[i] = obj.search_word3[i].cmc;
						y[i] = obj.search_word3[i].cnt;
						 // $('#hi').html(y[0])
							
					if(y[0]==0 && y[1]==0 && y[2]==0 && y[3]==0 && y[4]==0){
						alert("검색한 댓글이 없어요!")
						break;
						// location.href  ="/drilldown_chart/drilldown.jsp" ;
					}else{
						Highcharts.chart('container', {
						  chart: {
						    type: 'column'
						  },
						  title: {
						    align: 'left',
						    text: 'Search_word : ' + cmc + " (Total_words : " + (y[0]+y[1]+y[2]+y[3]+y[4]) + ")"
						  },
						  subtitle: {
						    align: 'left',
						    text: ''
						  },
						  accessibility: {
						    announceNewData: {
						      enabled: true
						    }
						  },
						  xAxis: {
						    type: 'category'
						  },
						  yAxis: {
						    title: {
						      text: '<span style="color:orange; font-size:20px">Comments</span>'
						    }

						  },
						  legend: {
							
						  },
						  plotOptions: {
						    series: {
						      borderWidth: 0,
						      dataLabels: {
						        enabled: true,
						        format: '{point.name}'
						      }
						    }
						  },

						  tooltip: {
						    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
						    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b>명<br/>'
						  },

						  series: [
						    {
						      name: "댓글 수",
						      colorByPoint: true,
						      data: [
						        {
						          name: "10대",
						          y: y[0],
						          drilldown: "10대"
						        },
						        {
						          name: "20대",
						          y: y[1],
						          drilldown: "20대"
						        },
						        {
						          name: "30대",
						          y: y[2],
						          drilldown: "30대"
						        },
						        {
						          name: "40대",
						          y: y[3],
						          drilldown: "40대"
						        },
						        {
						          name: "50대",
						          y: y[4],
						          drilldown: "50대"
						        }
						      ]
						    }
						  ],
						  // 날짜별로 댓글 분석하면 좋지않을까?
						  
						  drilldown: {
						    breadcrumbs: {
						      position: {
						        align: 'right'
						      }
						    },
						    series: [
						      {
						        name: "10대",
						        id: "10대",
						        data: [
						          [
						            "6월",
						            10
						          ],
						          [
						            "7월",
						            20
						          ],
						          [
						            "8월",
						            30
						          ]
						        ]
						      },
						      {
						        name: "20대",
						        id: "20대",
						        data: [
						         [
						            "6월",
						            10
						          ],
						          [
						            "7월",
						            20
						          ],
						          [
						            "8월",
						            30
						          ]
						        ]
						      },
						      {
						        name: "30대",
						        id: "30대",
						        data: [
						          [
						            "6월",
						            10
						          ],
						          [
						            "7월",
						            20
						          ],
						          [
						            "8월",
						            30
						          ]
						        ]
						      },
						      {
						        name: "40대",
						        id: "40대",
						        data: [
						          [
						            "6월",
						            10
						          ],
						          [
						            "7월",
						            20
						          ],
						          [
						            "8월",
						            30
						          ]
						        ]
						      },
						      {
						        name: "50대",
						        id: "50대",
						        data: [
						          [
						            "6월",
						            10
						          ],
						          [
						            "7월",
						            20
						          ],
						          [
						            "8월",
						            30
						          ]
						        ]
						      }
						    ]
						  }
						});
					}}}}
					}
	
						
 		