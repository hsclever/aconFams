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
 * ������ �̵� 
 */
function goSubmit(url){
	$('#frm').attr('action', url).submit();
}

/**
 * �α���
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
					alert('�α��ο� �����߽��ϴ�.');
					//�Խù� ������ �̵� ���� �ʿ�
				}else{
					alert('�α��ο� �����߽��ϴ�. �α��� ������ �ٽ� Ȯ���� �ּ���.');
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
			<p>���̵� : <input type="text" id="userId" /></p>
			<p>��й�ȣ: <input type="password" id="userPw" /></p>
			<button type="button" onclick="javascript:doLogin();">�α���</button>
		</div>
		<a href="javascript:goSubmit('/join');">���� ȸ���� �ƴϼ���? ȸ������ ȭ������ �̵��մϴ�.</a>
	</div>
</form>
</body>
</html>