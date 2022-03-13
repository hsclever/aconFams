<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
<%@ include file="/WEB-INF/views/include/common.jsp" %>
 
<script type="text/javascript">
function goSubmit(){
	$('#frm').attr('action', '/join').submit();
}
</script>
</head>
<body>
<form id="frm" method="post">
	<div>
		<div id="login">
			<p>아이디 : <input type="text" id="userId" /></p>
			<p>비밀번호: <input type="text" id="userPw" /></p>
			<button type="button" onclick="javascript:goSubmit();">회원가입</button>
		</div>
	</div>
</form>
</body>
</html>