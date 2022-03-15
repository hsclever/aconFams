<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<%@ include file="/WEB-INF/views/include/common.jsp" %>

<script type="text/javascript">
$(function(){
	//아이디 입력값 변경시
	$('#userId').on('change', function(){
		//중복체크 후 입력값이 변경되면 다시 체크
		if($('#btn_chkId').prop('disabled')){
			$('#btn_chkId').prop('disabled', false);
		}
	});
	
	//회원 가입
	$('#btn_join').on('click', function(){
		//아이디 중복체크 확인
		if(!$('#btn_chkId').prop('disabled')){
			alert('아이디 중복체크를 해주세요.'); return;
		}
		
		//비밀번호 확인
		if($('#userPw').val() != $('#userPw_confirm').val()){
			alert('비밀번호가 맞지 않습니다.'); return;
		}
		
		var params = {
				userId : $('#userId').val()
				,userPw : $('#userPw').val()
				,userPw_confirm : $('#userPw_confirm').val()
		}
		//가입
		Common.ajax('/doJoin'
				, params
				, function(data){
					if(data.RESULT == 'SUCCESS'){
						alert('가입에 성공했습니다.\n로그인 페이지로 이동합니다.');
						location.href = '/main';
					}else{
						alert(data.RESULT_MSG); return;
					}
				}
		);
	});
});

//아이디 중복 체크
function idCheck(){
	if(Common.isNull($('#userId'))){
		alert('아이디를 입력해주세요.');
	}else{
		var params = {
				userId : $('#userId').val()
		}
		Common.ajax('/idCheck'
				,params,
				function(data){
					if(data){
						alert('사용중인 아이디입니다.\n다른 아이디를 사용해주세요.');
						$('#userId').focus();
					}else{
						alert('사용 가능한 아이디입니다.');
						$('#btn_chkId').prop('disabled', true);
					}
				}
		);
	}
}
</script>
</head>
<body>
<form id="frm" method="post">
	<div>
		<div>
			<ul>
				<li>아이디: <input type="text" id="userId" placeholder="아이디를 입력해주세요." /><button type="button" id="btn_chkId" onclick="javascript:idCheck();">중복확인</button></li>
				<li>비밀번호: <input type="password" id="userPw" placeholder="비밀번호를 입력해주세요." /></li>
				<li>비밀번호확인: <input type="password" id="userPw_confirm" placeholder="비밀번호를 확인해주세요." /></li>
			</ul>
		</div>
		<div>
			<button type="button" id="btn_join">회원 가입</button>
		</div>
	</div>
</form>
</body>
</html>