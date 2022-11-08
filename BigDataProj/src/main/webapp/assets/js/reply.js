
function addReply() {
 	if($('#content').val() == ""){
		alert("댓글내용을 입력해주세요.")
		return false;
	}
	
	$('#replyForm').submit();
}


function updateReadonly(reply_no ,info_user_no,user_no) {
	alert("리플번호"+rp_user_no)
	alert("로그인 유저"+info_user_no)
	alert("작성한 유저"+user_no)
	
	if(wr_user_no = rp_user_no){
		alert("수정가능")
		$('#reply'+reply_no).attr('readonly',false);
		$('#modify').css("display","none");
		$('#modifyBtn').css("display","inline");
	// 	document.replyForm.action = "/board/updateReply.bo?replynum=" + replynum;
	// 	document.replyForm.submit();
	}else{
		alert("본인이 작성한 댓글만 수정할 수 있습니다.");
	}
}

function deleteReply(rp_user_no ,wr_user_no,reply_no) {
	alert("삭제하시곘습니까?")
	alert(rp_user_no)
	alert(wr_user_no)
	alert(reply_no)
	
	if(rp_user_no == wr_user_no){
		document.replyForm.action="/board/deleteReply.rp?reply_no="+reply_no;
		document.replyForm.submit();
	}else{
		alert("본인이 작성한 댓글만 삭제할 수 있습니다.");
	}
}





function getPost(mode,reply_no){
	let form = $('#replyForm')
		if(mode == 'update'){
			form.method = "post";
			form.action="/board/updateReply.rp?reply_no="+reply_no;
		}else if(mode= "delete"){
			form.method = "post";
			form.action="/board/deleteReply.rp?reply_no="+reply_no;
		}
		form.submit
}