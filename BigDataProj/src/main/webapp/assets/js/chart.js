/**
 * 
 */
const ctx = document.getElementById('myChart').getContext('2d');

const myChart = new Chart(ctx, {
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

function see10AgeBubble(){
    axios({
        url:'/chart/get10SC/get10SCBubble.ch',
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

function see20AgeBubble(){
    axios({
        url:'/chart/get20SC/get20SCBubble.ch',
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

function see30AgeBubble(){
    axios({
        url:'/chart/get30SC/get30SCBubble.ch',
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

function see40AgeBubble(){
    axios({
        url:'/chart/get40SC/get40SCBubble.ch',
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


function see50AgeBubble(){
    axios({
        url:'/chart/get50SC/get50SCBubble.ch',
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