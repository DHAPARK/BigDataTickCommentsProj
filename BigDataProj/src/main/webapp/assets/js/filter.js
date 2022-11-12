/**
 * 이미지 필터 넣기 기능
 */
 
console.log('filter init');

// canvas 객체 생성
var canvas = $('#canvas')[0];
//var canvas = $('#summernote')[0];
var ctx = canvas.getContext('2d');

function drawImageData(image) {
//    image.height *= canvas.offsetWidth / image.width;
//    image.width = canvas.offsetWidth;
//
//    if(image.height > canvas.offsetHeight){
//        image.width *= canvas.offsetHeight / image.height;
//        image.height = canvas.offsetHeight;
//    }
	canvas.width = image.width;
	canvas.height = image.height;
    ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
    //로그 확인
    console.log(ctx.getImageData(0,0, canvas.width, canvas.height));
}


$('#loadButton').on('change', function (e) {
    var file = e.target.files[0];
    var fileReader = new FileReader();

    fileReader.onload = function (e) {
        var image = new Image();
        image.src = e.target.result;
        image.onload = function () {
            drawImageData(image);
        }
    };

    fileReader.readAsDataURL(file);
});

function invertFilter(pixels) {
    var d = pixels.data;
    for(var i=0; i<pixels.data.length; i+=4 ){
        d[i] = 255 - d[i];     // R
        d[i+1] = 255 - d[i+1]; // G
        d[i+2] = 255 - d[i+2]; // B
        d[i+3] = 255;          // Alpha
    }
    return pixels;
}

$('#invertFilter').on('click', function () {
    // imageData를 가져온다.
    var pixels = ctx.getImageData(0,0, canvas.width, canvas.height);

    // image processing
    var filteredData = invertFilter(pixels);
    
    // Canvas에 다시 그린다.
    ctx.putImageData(filteredData, 0 , 0);
});

// Filters
function invertFilter(pixels) {
    var d = pixels.data;
    for(var i=0; i<pixels.data.length; i+=4 ){
        d[i] = 255 - d[i];     // R
        d[i+1] = 255 - d[i+1]; // G
        d[i+2] = 255 - d[i+2]; // B
        d[i+3] = 255;          // Alpha
    }
    return pixels;
}

function brightnessFilter(pixels, value) {
    var d = pixels.data;
    for(var i =0; i< d.length; i+=4){
        d[i] += value/3;
        d[i+1] += value/3;
        d[i+2] += value/3;
    }
    return pixels;
}

$('#brightnessFilter').on('click', function () {
    // imageData를 가져온다.
    var pixels = ctx.getImageData(0,0, canvas.width, canvas.height);

    // image processing
    var filteredData = brightnessFilter(pixels, 100);

    // Canvas에 다시 그린다.
    ctx.putImageData(filteredData, 0 , 0);
});

function grayscaleFilter(pixels) {
    var d = pixels.data;
    for(var i =0; i< d.length; i+=4){
        var r = d[i];
        var g = d[i+1];
        var b = d[i+2];

        var v = 0.2126*r + 0.7152*g + 0.0722*b;  // 보정값
        d[i] = d[i+1] = d[i+2] = v               // RBG 색을 같게 맞추자
    }
    return pixels;
}

$('#grayscaleFilter').on('click', function () {
    // imageData를 가져온다.
    var pixels = ctx.getImageData(0,0, canvas.width, canvas.height);

    // image processing
    var filteredData = grayscaleFilter(pixels);

    // Canvas에 다시 그린다.
    ctx.putImageData(filteredData, 0 , 0);
});

function sepiaFilter(pixels) {
    var d = pixels.data;
    for(var i =0; i< d.length; i+=4){
        var r = d[i];
        var g = d[i+1];
        var b = d[i+2];

        d[i] = r*0.3588 + g*0.7044 + b*0.1368;
        d[i+1] = r*0.2990 + g*0.5870 + b*0.1140;
        d[i+2] = r*0.2392 + g*0.4696 + b*0.0912;
    }
    return pixels;
}

$('#sepiaFilter').on('click', function () {
    // imageData를 가져온다.
    var pixels = ctx.getImageData(0,0, canvas.width, canvas.height);

    // image processing
    var filteredData = grayscaleFilter(pixels);

    // Canvas에 다시 그린다.
    ctx.putImageData(filteredData, 0 , 0);
});

function thresholdFilter(pixels, threshold) {
    var d = pixels.data;
    for(var i =0; i< d.length; i+=4){
        var r = d[i];
        var g = d[i+1];
        var b = d[i+2];

        var v = (0.2126*r + 0.7152*g + 0.0722*b >= threshold) ? 255 : 0;
        d[i] = d[i+1] = d[i+2] = v;
    }
    return pixels;
}

$('#thresholdFilter').on('click', function () {
    // imageData를 가져온다.
    var pixels = ctx.getImageData(0,0, canvas.width, canvas.height);

    // image processing
    var filteredData = thresholdFilter(pixels, 100);

    // Canvas에 다시 그린다.
    ctx.putImageData(filteredData, 0 , 0);
});

