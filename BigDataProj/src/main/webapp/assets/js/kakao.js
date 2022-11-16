const KAKAO_KEY = "18ad9f6a5a77d4c04b498b4bc77f17da";

Kakao.init(KAKAO_KEY);

kakaoLogin = () => {
    Kakao.Auth.login({
		scope:'account_email, age_range',
        success: function (response) {
	
			console.log(response);
			
            Kakao.API.request({
                url: "/v2/user/me",
                success: (res) => {
                	
                	console.log(res);
                	
                	const { id,kakao_account: { age_range, email } } = res;
				
					const kakaoLoginForm = document.getElementById("kakaoJoinForm");

					const inputs = kakaoLoginForm.getElementsByTagName("input");
                    
					console.log(age_range);
					console.log(email);
					console.log(id);
					
					inputs[0].value = age_range;
					inputs[1].value = email;
					inputs[2].value = id;
					
					kakaoLoginForm.submit();
					
                },
                fail: function (error) {
                	console.log("ERROR");
                    console.log(error);
                },
            });
        },
        fail: function (error) {
        	console.log("ERROR");
            console.log(error);
        },
    });
};


