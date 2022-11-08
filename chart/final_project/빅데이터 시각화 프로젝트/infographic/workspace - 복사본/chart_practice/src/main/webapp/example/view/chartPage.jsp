<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>
    <input type="button" value="10ë" onclick="see10Age()"/>
    <input type="button" value="50ë" onclick="see50Age()"/>

    <div style="width:400px; height:400px;">
        <canvas id="myChart" width="100%" height="100%"></canvas>
    </div>

</body>

<script>

const ctx = document.getElementById('myChart').getContext('2d');

const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
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

function see10Age(){
    axios({
        url:'year10',
        method:'get'
    })
    .then((res)=>{
        console.log(res.data);
        var valArr = [] ;
        Object.keys(res.data).forEach(item => {
            myChart.data.labels[ valArr.length ] = item ;
            valArr.push(res.data[item]);
        });;
        for( var i = 0 ; i < 6 ; i++ ) {
            myChart.data.datasets[ 0 ].data[i] = valArr[ i ] ;
        }
        myChart.update();
    })
};

function see50Age(){
    axios({
        url:'year50',
        method:'get'
    })
    .then((res)=>{
        console.log(res.data);
        var valArr = [] ;
        Object.keys(res.data).forEach(item => {
            myChart.data.labels[ valArr.length ] = item ;
            valArr.push(res.data[item]);
        });;
        for( var i = 0 ; i < 6 ; i++ ) {
            myChart.data.datasets[ 0 ].data[i] = valArr[ i ] ;
        }
        myChart.update();
    })
};

</script>
</html>