<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
<%@ include file="/WEB-INF/views/include/common.jsp" %>
<script type="text/javascript">
// �Խù� ���
function doWrite(){
	$('#frm').attr('action', '/doWrite').submit();
}

// �Խù� ����
function doModify(no){
	Common.ajax('/doModify'
			,function(rs){
		
			}
			,function(e){
				
			}
	);
}
</script>
</head>
<body>
<form id="frm" method="post">
	<div>
		<table>
			<tr>
				<th>����</th>
				<td><input type="text" id="bTitle" name="bTitle" value="" />${TITLE}</td>
				<th>��й�ȣ</th>
				<td><input type="password" id="bPw" name="bPw" value="" /></td>
			</tr>
			<tr>
				<th>����</th>
				<td colspan="3">
					<textarea id="bContents" name="bContents">${CONTENTS}</textarea>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<button type="button" onclick="javascript:doList();">�������</button>
		<button type="button" onclick="javascript:goModifyPage('${NO}'});">����</button>
		<button type="button" onclick="javascript:goDetailPage();">���� ���</button>
	</div>
</form>
</body>
</html>