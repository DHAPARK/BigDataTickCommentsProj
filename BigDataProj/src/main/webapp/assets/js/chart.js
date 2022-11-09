/**
 * 
 */
const ctx = document.getElementById('myHardChart').getContext('2d');
const myHardChart = document.getElementById("myHardChart") ;
const myBubbleChart = document.getElementById("myBubbleChart") ;
var myChart ;

/**
 * DB가 부하가 좀 많이걸리네 .. 차트를 띄우기전 로딩이미지 처리를 해줘야겠다
 * 
 */
var loadImg = document.getElementById("load") ;



/*
 * chartHardBtns = 10대 20대 30대 40대 50대 버튼
*/
let bubbleAxiosUrls = [
			"/chart/get10SC/get10SCBubble.ch",
			"/chart/get20SC/get20SCBubble.ch",
			"/chart/get30SC/get30SCBubble.ch",
			"/chart/get40SC/get40SCBubble.ch",
			"/chart/get50SC/get50SCBubble.ch",
		];

function drawHardChart(){	
	//막대차트
	myChart = new Chart(ctx, {
	        type: 'bar',
	        data: {
	            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple','Orange','Gray','Pink','Silver','Gold' ],
	            datasets: [{
	                label: '# of Votes',
	                data: [12, 19, 3, 5, 2, 3, 4, 7, 6, 10],
	                backgroundColor: [
	                    'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)',
	                    'rgba(153, 102, 255, 0.2)',
	                    'rgba(255, 159, 64, 0.2)',
	                    'rgba(220, 220, 220, 0.2)',
	                    'rgba(255, 51, 153, 0.2)',
	                    'rgba(192, 192, 192, 0.2)',
	                    'rgba(255, 215, 0, 0.2)'
	                ],
	                borderColor: [
	                    'rgba(255, 99, 132, 1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(255, 206, 86, 1)',
	                    'rgba(75, 192, 192, 1)',
	                    'rgba(153, 102, 255, 1)',
	                    'rgba(255, 159, 64, 1)',
	                    'rgba(220, 220, 220, 0.2)',
	                    'rgba(255, 51, 153, 0.2)',
	                    'rgba(192, 192, 192, 0.2)',
	                    'rgba(255, 215, 0, 0.2)'
	                ],
	                borderWidth: 1
	            }]
	        },
	        options: {
	            scales: {
	                y: {
	                    beginAtZero: true
	                }
	            }
	        }
	    })
 }
//막대차트





/**
 * 차트 로딩화면때문에..
 */
 
loadImg.style.display ='none';

function eventoccured(){
    
    loadImg.style.display ='block';

    setTimeout(()=>{

        loadImg.style.display ='none';

    },4000);

}
/**
 * 차트 로딩화면때문에..
 */






//버블차트
/**
 * rangedData : 병렬처리된 axios메서드에서 가져온 각 연령별 key(단어) :value(출현빈도)쌍의 json데이터를 
 * 10칸짜리 index 배열로 정리하여받은 파라미터
 * 내부는 rangedData[ 0 ] = 10대 json 데이터
 *		rangedData[ 1 ] = 10대 json 데이터중 key값들 배열
 * 과 같이 구성되어있다
 */
function drawBubbleChart( rangedData ){
		
		Highcharts.chart(myBubbleChart, {
			  chart: {
			    type: 'packedbubble',
			    height: '100%'
			
			  },
			  title: {
			    text: ''
			  },
			  tooltip: {
			    useHTML: true,
			    pointFormat: '<b>{point.name}:</b> {point.y} images'
			  },
			  plotOptions: {
			    packedbubble: {
			 
			      layoutAlgorithm: {
			                gravitationalConstant: 0.05,
			                splitSeries: true,
			                seriesInteraction: true,
			                dragBetweenSeries: false,
			                parentNodeLimit: true
			            },
			      dataLabels: {
			        enabled: true,
			        format: '{point.name}',
			        style: {
			          color: 'rgba(35,25,66)',
			          textOutline: 'false',
			          fontWeight: 'normal'
			        }
			      },
			      minPointSize: 1
			    }
			  },
			  series: [{
				
			    name: '10대',
			    color: 'rgba(35,25,66,0.5)',
			    data: [
					{
				      name: rangedData[ 1 ][ 0 ] ,
				      value: rangedData[ 0 ][`${rangedData[ 1 ][ 0 ]}`]
				      }, {
				      name: rangedData[ 1 ][ 1 ] ,
				      value: rangedData[ 0 ][`${rangedData[ 1 ][ 1 ]}`]
				      }, {
				      name: rangedData[ 1 ][ 2 ] ,
				      value: rangedData[ 0 ][`${rangedData[ 1 ][ 2 ]}`]
				      }, {
				      name: rangedData[ 1 ][ 3 ] ,
				      value: rangedData[ 0 ][`${rangedData[ 1 ][ 3 ]}`]
				      }, {
				      name: rangedData[ 1 ][ 4 ] ,
				      value: rangedData[ 0 ][`${rangedData[ 1 ][ 4 ]}`]
				      }, {
				      name: rangedData[ 1 ][ 5 ] ,
				      value: rangedData[ 0 ][`${rangedData[ 1 ][ 5 ]}`]
				      },
				      {
				      name: rangedData[ 1 ][ 6 ] ,
				      value: rangedData[ 0 ][`${rangedData[ 1 ][ 6 ]}`]
				      },
				      {
				      name: rangedData[ 1 ][ 7 ] ,
				      value: rangedData[ 0 ][`${rangedData[ 1 ][ 7 ]}`]
				      },
				      {
				      name: rangedData[ 1 ][ 8 ] ,
				      value: rangedData[ 0 ][`${rangedData[ 1 ][ 8 ]}`]
				      },
				      {
				      name: rangedData[ 1 ][ 9 ] ,
				      value: rangedData[ 0 ][`${rangedData[ 1 ][ 9 ]}`]
				      }
				      ]},{
					
			      name:'20대',
			      color:'rgba(62, 105, 196,.5)',
			      data: [
					  {
				      name: rangedData[ 3 ][ 0 ] ,
				      value: rangedData[ 2 ][`${rangedData[ 3 ][ 0 ]}`]
				      }, {
				      name: rangedData[ 3 ][ 1 ] ,
				      value: rangedData[ 2 ][`${rangedData[ 3 ][ 1 ]}`]
				      }, {
				      name: rangedData[ 3 ][ 2 ] ,
				      value: rangedData[ 2 ][`${rangedData[ 3 ][ 2 ]}`]
				      }, {
				      name: rangedData[ 3 ][ 3 ] ,
				      value: rangedData[ 2 ][`${rangedData[ 3 ][ 3 ]}`]
				      }, {
				      name: rangedData[ 3 ][ 4 ] ,
				      value: rangedData[ 2 ][`${rangedData[ 3 ][ 4 ]}`]
				      }, {
				      name: rangedData[ 3 ][ 5 ] ,
				      value: rangedData[ 2 ][`${rangedData[ 3 ][ 5 ]}`]
				      },
				      {
				      name: rangedData[ 3 ][ 6 ] ,
				      value: rangedData[ 2 ][`${rangedData[ 3 ][ 6 ]}`]
				      },
				      {
				      name: rangedData[ 3 ][ 7 ] ,
				      value: rangedData[ 2 ][`${rangedData[ 3 ][ 7 ]}`]
				      },
				      {
				      name: rangedData[ 3 ][ 8 ] ,
				      value: rangedData[ 2 ][`${rangedData[ 3 ][ 8 ]}`]
				      },
				      {
				      name: rangedData[ 3 ][ 9 ] ,
				      value: rangedData[ 2 ][`${rangedData[ 3 ][ 9 ]}`]
				      }
				    ]},{
					
			      name:'30대',
			      color:'rgba(255, 16, 83,.5)',
			  	  data: [
					{
				      name: rangedData[ 5 ][ 0 ] ,
				      value: rangedData[ 4 ][`${rangedData[ 5 ][ 0 ]}`]
				      }, {
				      name: rangedData[ 5 ][ 1 ] ,
				      value: rangedData[ 4 ][`${rangedData[ 5 ][ 1 ]}`]
				      }, {
				      name: rangedData[ 5 ][ 2 ] ,
				      value: rangedData[ 4 ][`${rangedData[ 5 ][ 2 ]}`]
				      }, {
				      name: rangedData[ 5 ][ 3 ] ,
				      value: rangedData[ 4 ][`${rangedData[ 5 ][ 3 ]}`]
				      }, {
				      name: rangedData[ 5 ][ 4 ] ,
				      value: rangedData[ 4 ][`${rangedData[ 5 ][ 4 ]}`]
				      }, {
				      name: rangedData[ 5 ][ 5 ] ,
				      value: rangedData[ 4 ][`${rangedData[ 5 ][ 5 ]}`]
				      },
				      {
				      name: rangedData[ 5 ][ 6 ] ,
				      value: rangedData[ 4 ][`${rangedData[ 5 ][ 6 ]}`]
				      },
				      {
				      name: rangedData[ 5 ][ 7 ] ,
				      value: rangedData[ 4 ][`${rangedData[ 5 ][ 7 ]}`]
				      },
				      {
				      name: rangedData[ 5 ][ 8 ] ,
				      value: rangedData[ 4 ][`${rangedData[ 5 ][ 8 ]}`]
				      },
				      {
				      name: rangedData[ 5 ][ 9 ] ,
				      value: rangedData[ 4 ][`${rangedData[ 5 ][ 9 ]}`]
				      }
				  	]},{
			      name:'40대',
			      color:'rgba(4, 231, 98,.5)',
			      data: [
					{
				      name: rangedData[ 7 ][ 0 ] ,
				      value: rangedData[ 6 ][`${rangedData[ 7 ][ 0 ]}`]
				      }, {
				      name: rangedData[ 7 ][ 1 ] ,
				      value: rangedData[ 6 ][`${rangedData[ 7 ][ 1 ]}`]
				      }, {
				      name: rangedData[ 7 ][ 2 ] ,
				      value: rangedData[ 6 ][`${rangedData[ 7 ][ 2 ]}`]
				      }, {
				      name: rangedData[ 7 ][ 3 ] ,
				      value: rangedData[ 6 ][`${rangedData[ 7 ][ 3 ]}`]
				      }, {
				      name: rangedData[ 7 ][ 4 ] ,
				      value: rangedData[ 6 ][`${rangedData[ 7 ][ 4 ]}`]
				      }, {
				      name: rangedData[ 7 ][ 5 ] ,
				      value: rangedData[ 6 ][`${rangedData[ 7 ][ 5 ]}`]
				      },
				      {
				      name: rangedData[ 7 ][ 6 ] ,
				      value: rangedData[ 6 ][`${rangedData[ 7 ][ 6 ]}`]
				      },
				      {
				      name: rangedData[ 7 ][ 7 ] ,
				      value: rangedData[ 6 ][`${rangedData[ 7 ][ 7 ]}`]
				      },
				      {
				      name: rangedData[ 7 ][ 8 ] ,
				      value: rangedData[ 6 ][`${rangedData[ 7 ][ 8 ]}`]
				      },
				      {
				      name: rangedData[ 7 ][ 9 ] ,
				      value: rangedData[ 6 ][`${rangedData[ 7 ][ 9 ]}`]
				      }
					]},{
					name:'50대',
			      	color:'rgba(4, 231, 98,.5)',
			      	data: [
						{
				      name: rangedData[ 9 ][ 0 ] ,
				      value: rangedData[ 8 ][`${rangedData[ 9 ][ 0 ]}`]
				      }, {
				      name: rangedData[ 9 ][ 1 ] ,
				      value: rangedData[ 8 ][`${rangedData[ 9 ][ 1 ]}`]
				      }, {
				      name: rangedData[ 9 ][ 2 ] ,
				      value: rangedData[ 8 ][`${rangedData[ 9 ][ 2 ]}`]
				      }, {
				      name: rangedData[ 9 ][ 3 ] ,
				      value: rangedData[ 8 ][`${rangedData[ 9 ][ 3 ]}`]
				      }, {
				      name: rangedData[ 9 ][ 4 ] ,
				      value: rangedData[ 8 ][`${rangedData[ 9 ][ 4 ]}`]
				      }, {
				      name: rangedData[ 9 ][ 5 ] ,
				      value: rangedData[ 8 ][`${rangedData[ 9 ][ 5 ]}`]
				      },
				      {
				      name: rangedData[ 9 ][ 6 ] ,
				      value: rangedData[ 8 ][`${rangedData[ 9 ][ 6 ]}`]
				      },
				      {
				      name: rangedData[ 9 ][ 7 ] ,
				      value: rangedData[ 8 ][`${rangedData[ 9 ][ 7 ]}`]
				      },
				      {
				      name: rangedData[ 9 ][ 8 ] ,
				      value: rangedData[ 8 ][`${rangedData[ 9 ][ 8 ]}`]
				      },
				      {
				      name: rangedData[ 9 ][ 9 ] ,
				      value: rangedData[ 8 ][`${rangedData[ 9 ][ 9 ]}`]
				      }
					]}
				],
			  
			  responsive: {
			    rules: [{
			      condition: {
			        maxWidth: 1000
			      },
			      chartOptions: {
			        legend: {
			          align: 'center',
			          verticalAlign: 'bottom',
			          layout: 'horizontal'
			        }
			      }
			    }]
			  }
		});

	
}

//버블차트





//하드차트
function see10AgeHard(){
	//차트로딩화면
    eventoccured();

    axios({
        url:'/chart/get10SC/get10SCHard.ch',
        method:'get'
    })
    .then((res)=>{
	
        console.log(res.data);

        var valArr = [] ;

        Object.keys(res.data).forEach(item => {

            myChart.data.labels[ valArr.length ] = item ;

            valArr.push(res.data[item]);

        });;

        for( var i = 0 ; i < 10 ; i++ ) {

            myChart.data.datasets[ 0 ].data[i] = valArr[ i ] ;

        }
        myChart.update();

    })
};

function see20AgeHard(){
	//차트로딩화면
    eventoccured();

    axios({
        url:'/chart/get20SC/get20SCHard.ch',
        method:'get'
    })
    .then((res)=>{
        console.log(res.data);

        var valArr = [] ;

        Object.keys(res.data).forEach(item => {

            myChart.data.labels[ valArr.length ] = item ;

            valArr.push(res.data[item]);

        });;

        for( var i = 0 ; i < 10 ; i++ ) {

            myChart.data.datasets[ 0 ].data[i] = valArr[ i ] ;

        }

        myChart.update();

    })


};

function see30AgeHard(){
	//차트로딩화면
    eventoccured();

    axios({
        url:'/chart/get30SC/get30SCHard.ch',
        method:'get'
    })
    .then((res)=>{
        console.log(res.data);

        var valArr = [] ;

        Object.keys(res.data).forEach(item => {

            myChart.data.labels[ valArr.length ] = item ;

            valArr.push(res.data[item]);

        });;

        for( var i = 0 ; i < 10 ; i++ ) {

            myChart.data.datasets[ 0 ].data[i] = valArr[ i ] ;

        }
        
        myChart.update();

    })


};

function see40AgeHard(){
    //차트로딩화면
    eventoccured();

    axios({
        url:'/chart/get40SC/get40SCHard.ch',
        method:'get'
    })
    .then((res)=>{
        console.log(res.data);

        var valArr = [] ;

        Object.keys(res.data).forEach(item => {

            myChart.data.labels[ valArr.length ] = item ;

            valArr.push(res.data[item]);

        });;

        for( var i = 0 ; i < 10 ; i++ ) {

            myChart.data.datasets[ 0 ].data[i] = valArr[ i ] ;

        }
        
        myChart.update();

    })


};


function see50AgeHard(){
    axios({
        url:'/chart/get50SC/get50SCHard.ch',
        method:'get'
    })
    .then((res)=>{
        console.log(res.data);

        var valArr = [] ;

        Object.keys(res.data).forEach(item => {

            myChart.data.labels[ valArr.length ] = item ;

            valArr.push(res.data[item]);

        });;

        for( var i = 0 ; i < 10 ; i++ ) {

            myChart.data.datasets[ 0 ].data[i] = valArr[ i ] ;

        }

        //차트로딩화면
        eventoccured();

        myChart.update();

    })


};
//하드차트



//초기 차트상태  =  막대 ( 0 )

drawHardChart();

var flag = 0 ;

var chartHardBtns = document.getElementsByClassName("chart_hard");

function changeChartStatus(){
	
	var dataList = [] ;
	
	if ( flag == 0 ) {
		
		myHardChart.style.display = 'none' ;
		
		myBubbleChart.style.display = 'block' ;
		
		Array.from(chartHardBtns).forEach( item =>{
			
			item.style.display = 'none';
		
		});
		
		/*
		될런지...
		*/
		axios.all(bubbleAxiosUrls.map( endpoint => axios.get(endpoint) )).then(axios.spread((...res) => {
			
			eventoccured();
			
			Array.from( res ).forEach( data => {
				
				/*
				 * data가 json 형식이라 key와 value를 여기서 나눠주고 뿌리는게 효율적일듯 한데..아니면 그냥 
				 * dataList 배열에 (짝수 인덱스는 json object , 홀수인덱스는 Key값 배열)을 넣자
				*/
				//console.log( data ) ;
				dataList.push( data.data ) ;
				
				dataList.push( Object.keys( data.data ) ) ;
				
			} )
			
			//차트로딩화면
	        

			
			drawBubbleChart( dataList ) ;
			
			flag = 1 ;

			
		}))
		.catch( err =>{
			
			console.log(`bubble axios에서 error발생 ${err}`);
			
		})
		
		/*
		될런지...
		*/
		
	} else if ( flag == 1 ) {
		
		//차트로딩화면
        eventoccured();

		
		myBubbleChart.style.display = 'none' ;
		
		myHardChart.style.display = 'block' ;
		
		Array.from(chartHardBtns).forEach( item =>{
			
			item.style.display = 'block';
		
		});
		
		
		flag = 0 ;
		
	}
	
}

