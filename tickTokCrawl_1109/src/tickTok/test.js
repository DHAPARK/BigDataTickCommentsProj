


var timeset = setTimeout(()=>{

    console.log("오나") ;

},5000);

//clearTimeout( timeset ) ;

function eventoccured(){
    console.log("가냐");

    timeset;

};

clearTimeout( timeset ) ;

eventoccured();