//회원가입
	let user_email = $("input[name=user_email]")
	let user_pw = $("input[name=user_pw]")
	let user_name = $("input[name=user_name]")
	let birth_year = $("input[name=birth_year]")
	
	let emailCheck = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/;
	let emailCheckOk = false;
	
	let nameCheckOk = false;
//이메일 형식/중복 확인
function checkEmail(){
	if(user_email.val()==""){
		$("#emailCheck").css("color","red");
		$("#emailCheck").html("이메일을 입력하세요.");
	}else if(!emailCheck.test(user_email.val())){
		$("#emailCheck").css("color","red");
		$("#emailCheck").html("이메일 형식이 아닙니다.");
	}else if(emailCheck.test(user_email.val())){
		//이메일 중복 확인하는 ajax 
		let obj = "";
		let xhr = new XMLHttpRequest();
		xhr.open("GET","/user/UserJoinEmailOk.us?user_email="+user_email.val(),true);
		xhr.send();
		xhr.onreadystatechange = function(){
		if(xhr.readyState == xhr.DONE && xhr.status == 200){
			obj = xhr.responseText;
			if(obj == 0){
				$("#emailCheck").css("color","blue");
				$("#emailCheck").html("가입 가능한 아이디입니다.");
				emailCheckOk = true;
			}else if(obj != 0){
				$("#emailCheck").css("color","red");
				$("#emailCheck").html("중복된 이메일 입니다.");
				}	
			}	
		}
	}
}
//  비밀번호 입력확인
function checkPw(){
	if(user_email.val()==""){
		$("#pwCheck").css("color","red");
		$("#pwCheck").html("비밀번호를 입력하세요.");
	}else if(user_pw.val().length < 6 ){
		$("#pwCheck").css("color","red");
		$("#pwCheck").html("비밀번호는 6자리 이상 입력해주세요.");
	}else{
		$("#pwCheck").css("color","blue");
		$("#pwCheck").html("가입 가능한 비밀번호입니다.");
	}
}
//이름 중복확인
function checkName(){
	let obj = "";
		let xhr = new XMLHttpRequest();
		xhr.open("GET","/user/UserJoinNameOk.us?user_name="+user_name.val(),true);
		xhr.send();
		xhr.onreadystatechange = function(){
		if(xhr.readyState == xhr.DONE && xhr.status == 200){
			obj = xhr.responseText;
			if(obj == 0){
				$("#nameCheck").css("color","blue");
				$("#nameCheck").html("가입 가능한 이름입니다.");
				nameCheckOk = true;
			}else if(obj != 0){
				$("#nameCheck").css("color","red");
				$("#nameCheck").html("중복된 이름 입니다.");
				}	
			}
		}
}
 function join(e){
 // 이메일 입력
	if(user_email.val() == ""){
		$("#emailCheck").css("color","red");
		$("#emailCheck").html("이메일을 입력하세요.");
		$(user_email).focus();
		return false;
	}
// 이메일중복 확인
	if(!emailCheckOk){
		$("#emailCheck").html("이메일을 입력하세요.");
		$(user_email).focus();
		return false;
	}
 
 // 비밀번호 입력
 	if(user_pw.val() == ""){
		$("#pwCheck").css("color","red");
		$("#pwCheck").html("비밀번호를 입력하세요.");
		$(user_pw).focus();
		return false;
	}
	
 // 비밀번호는 6자이상
 	if(user_pw.val().length < 6 ){
		$("#pwCheck").css("color","red");
		$("#pwCheck").html("비밀번호는 6자리 이상 입력해주세요.");
		$(user_pw).focus();
		return false;
	}
 
 // 이름
  	if(user_name.val() == ""){
		$("#nameCheck").css("color","red");
		$("#nameCheck").html("이름을 입력하세요");
		$(user_name).focus();
		return false;
	}
//  생년월일
  	if(birth_year.val() == ""){
		$("#birthCheck").css("color","red");
		$("#birthCheck").html("생년월일을 입력하세요");
		$(birth_year).focus();
		return false;
	}
	

 // submit
 if(nameCheckOk){
	if(emailCheckOk){
		$("#joinForm").submit();
	}
}
	
 
 }

 
// 로그인

	let loginId = $("input[name=loginId]")
	let loginPw = $("input[name=loginPw]")
	
	let loginIdCheck = false;
	let loginPwCheck = false;
	
	
//function login(e){
//	// 아이디 확인
//	alert("아이디확인")
//	let obj = "";
//		let xhr = new XMLHttpRequest();
//		xhr.open("GET","/user/UserLoginIdOk.us?loginId="+loginId.val(),true);
//		xhr.send();
//		xhr.onreadystatechange = function(){
//		if(xhr.readyState == xhr.DONE && xhr.status == 200){
//			obj = xhr.responseText;
//			if(obj == 0){
//				alert("아이디확인중")
//				$("#nameCheck").css("color","red");
//				$("#nameCheck").html("아이디가 일치하지 않습니다.");
//				$(loginId).focus();
//				return false;
//			}else{
//				loginIdCheck = true;
//				
//			}
//		}
//	}
//	alert("아이디확인끝")
//	// 비밀번호 확인
//		let obj2 = "";
//		let xhr2 = new XMLHttpRequest();
//		xhr2.open("GET","/user/UserLoginPwOk.us?loginPw="+loginPw.val(),true);
//		xhr2.send();
//		xhr2.onreadystatechange = function(){
//		if(xhr2.readyState == xhr2.DONE && xhr2.status == 200){
//			obj2 = xhr2.responseText;
//			if(obj2 == 0){
//				$("#nameCheck").css("color","red");
//				$("#nameCheck").html("아이디가 일치하지 않습니다.");
//				$(loginPw).focus();
//				return false;
//			}else{
//				loginPwCheck = true;
//			}
//		}
//	}
//	if(loginIdCheck){
//		if(loginPwCheck){
//			$("#loginForm").submit();
//		}
//	}
//}