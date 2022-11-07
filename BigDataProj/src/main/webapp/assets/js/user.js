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
				emailCheckOk = false;
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
	if(user_name.val()==""){
		$("#nameCheck").css("color","red");
		$("#nameCheck").html("이름을 입력하세요.");
	}else if(user_name.val()!=""){
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
					nameCheckOk = false;
				}	
			}
		}
	}
}

 function join(e){
 // 이메일 입력
	if(user_email.val() == ""){
		$(user_email).val('');
		$("#emailCheck").css("color","red");
		$("#emailCheck").html("이메일을 입력하세요.");
		$(user_email).focus();
		return false;
	}
// 이메일중복 확인
	if(!emailCheckOk){
		$("#emailCheck").html("이메일을 확인하세요.");
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
 
 // 이름 입력
  	if(user_name.val() == ""){
		$("#nameCheck").css("color","red");
		$("#nameCheck").html("이름을 입력하세요");
		$(user_name).focus();
		return false;
	}
	
// 이름중복 확인
	if(!nameCheckOk){
		$("#nameCheck").html("중복된 이름 입니다.");
		$(user_name).focus();
		return false;
	}
//  생년월일
  	if(birth_year.val() == ""){
		$("#birthCheck").css("color","red");
		$("#birthCheck").html("생년월일을 입력하세요");
		$(birth_year).focus();
		return false;
	}else if((birth_year.val() != "")){
		$("#birthCheck").html("");
	}
	

 // submit
 	if(nameCheckOk){
		if(emailCheckOk){
			$("#joinForm").submit();
		}else{
			alert("가입실패")
		}
	}
}

// 로그인

	let loginId = $("input[name=loginId]")
	let loginPw = $("input[name=loginPw]")
	
	let loginIdCheck = false;
	let loginPwCheck = false;
	
	
function checkLoginId(){
		// 아이디 확인
	if(loginId.val()==""){
		$("#checkLoginId").css("color","red");
		$("#checkLoginId").html("이메일이나 이름을 입력하세요.");
	}else if(loginId.val()!=""){
		let obj = "";
		let xhr = new XMLHttpRequest();
		xhr.open("GET","/user/UserLoginIdOk.us?loginId="+loginId.val(),true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == xhr.DONE && xhr.status == 200){
				obj = xhr.responseText;
				if(obj == 0){
					$("#checkLoginId").css("color","red");
					$("#checkLoginId").html("입력하신 이메일이나 이름이 없습니다.");
					loginIdCheck = false;
				}else if(obj != 0){
					$("#checkLoginId").html("");
					loginIdCheck = true;
				}
			}
		}
	}
}

function checkLoginPw(){

// 	비밀번호 입력
 	if(loginPw.val() == ""){
		$("#checkLoginPw").css("color","red");
		$("#checkLoginPw").html("비밀번호를 입력하세요.");
	}
// 비밀번호는 6자이상
 	if(loginPw.val().length < 6 ){
		$("#checkLoginPw").css("color","red");
		$("#checkLoginPw").html("비밀번호는 6자리 이상 입력해주세요.");
	}else if(loginPw.val().length > 5 ){
		$("#checkLoginPw").html("");
	}
}
	
function login(e){
//	
// 아이디 입력

	if(loginId.val() == ""){
		$(loginId).val('');
		$("#checkLoginId").css("color","red");
		$("#checkLoginId").html("이름이나 이메일을 입력하세요.");
		$(loginId).focus();
		return false;
	}else if(loginId.val() != ""){
		$("#checkLoginId").html("");
	}

	
// 아이디 확인
/*
	if(!loginIdCheck){
		$("#checkLoginId").html("입력하신 이메일이나 이름이 없습니다.");
		$(loginId).focus();
		return false;
	}
*/
// 	비밀번호 입력

 	if(loginPw.val() == ""){
		$("#checkLoginPw").css("color","red");
		$("#checkLoginPw").html("비밀번호를 입력하세요.");
		$(loginPw).focus();
		return false;
	}

// 비밀번호는 6자이상
/*
 	if(loginPw.val().length < 6 ){
		$("#checkLoginPw").css("color","red");
		$("#checkLoginPw").html("비밀번호는 6자리 이상 입력해주세요.");
		$(loginPw).focus();
		return false;
	}else if(loginPw.val().length > 6 ){
		$("#checkLoginPw").html("");
	}
*/

// 	아이디확인
if(loginId.val()!=""){
		let obj = "";
		let xhr = new XMLHttpRequest();
		xhr.open("GET","/user/UserLoginIdOk.us?loginId="+loginId.val(),true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == xhr.DONE && xhr.status == 200){
				obj = xhr.responseText;
				if(obj == 0){
					$("#checkLoginPw").css("color","red");
					$("#checkLoginPw").html("아이디나 비밀번호를 잘못입력했습니다.");
					return false;
				}else if(loginPw.val()!=""){
					let obj2 = "";
					let xhr2 = new XMLHttpRequest();
					xhr2.open("GET","/user/UserLoginPwOk.us?loginPw="+loginPw.val()+"&loginId="+loginId.val(),true);
					xhr2.send();
					xhr2.onreadystatechange = function(){
					if(xhr2.readyState == xhr2.DONE && xhr2.status == 200){
						obj2 = xhr2.responseText;
							if(obj2 == 0){
								$("#checkLoginPw").css("color","red");
								$("#checkLoginPw").html("아이디나 비밀번호를 잘못입력했습니다.");
								return false;
							}else if(obj2 != 0){
								$("#loginForm").submit();
							}
						}
					}
				}
			}
		}
	}
//	비밀번호 확인



// 로그인하기
//	if(loginPwCheck){
//		$("#loginForm").submit();
//	}else{
//		alert("로그인실패")
//	}
}