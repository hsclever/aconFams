<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
<%@ include file="/WEB-INF/views/include/common.jsp" %>
 
<script type="text/javascript">
/**
 * 페이지 이동 
 */
function goSubmit(url){
	$('#frm').attr('action', url).submit();
}

/**
 * 로그인
 */
function doLogin(){
	var params = {
			userId : $('#userId').val()
			, userPw : $('#userPw').val()
	}
	Common.ajax('doLogin'
			, params
			, function(rs){
				if(rs){
					alert('로그인에 성공했습니다.');
					//게시물 페이지 이동 로직 필요
				}else{
					alert('로그인에 실패했습니다. 로그인 정보를 다시 확인해 주세요.');
				}
			}
	);
}
</script>
</head>
<body>
<form id="frm" method="post">
	<div>
		<div id="login">
			<p>아이디 : <input type="text" id="userId" /></p>
			<p>비밀번호: <input type="password" id="userPw" /></p>
			<button type="button" onclick="javascript:doLogin();">로그인</button>
		</div>
		<a href="javascript:goSubmit('/join');">아직 회원이 아니세요? 회원가입 화면으로 이동합니다.</a>
	</div>
</form>
</body>
</html>