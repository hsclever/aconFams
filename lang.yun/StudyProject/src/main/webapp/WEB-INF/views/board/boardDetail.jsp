<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
<%@ include file="/WEB-INF/views/include/common.jsp" %>
<%HashMap<String, Object> boardMap = (HashMap<String, Object>)request.getAttribute("boardMap"); %>
<script type="text/javascript">
$(function(){
	$('#btn_reply').on('click', function(){
		<%if(boardMap.get("RGST_ID").toString().equals(session.getAttribute("loginId"))){%>
			alert('�ڽ��� ����� �ۿ��� �亯�� �� �� �����ϴ�.'); return;
		<%}else{%>
		
		<%}%>
	});
});

// �Խù� ���
function goWritePage(){
	location.href="/goBoardForm";
}

// �Խù� ����
function goModifyPage(no){
	<%if(boardMap.get("RGST_ID").toString().equals(session.getAttribute("loginId"))){%>
		location.href = '/goBoardForm?no='+no;
	<%}else{%>
		alert('�ۼ��ڸ� ���� �����մϴ�.');
	<%}%>
}

//�������
function goList(){
	location.href= '/getBoardList';
}

//��� ���
function doRegReply(){
	
}
</script>
</head>
<body>
<form id="frm" method="post">
	<div>
		<table>
			<tr>
				<th>����</th>
				<td><input type="text" id="bTitle" name="bTitle" value="<%=boardMap.get("TITLE") %>" disabled/></td>
				<th>�ۼ���</th>
				<td><input type="text" id="rgstId" name="rgstId" value="<%=boardMap.get("RGST_ID") %>" disabled/></td>
			</tr>
			<tr>
				<th>����</th>
				<td colspan="3">
					<textarea id="bContents" name="bContents" disabled><%=boardMap.get("CONTENTS") %></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<button type="button" onclick="javascript:goList();">�������</button>
		<button type="button" onclick="javascript:goModifyPage('<%=boardMap.get("NO") %>');">����</button>
		<button type="button" onclick="javascript:goWritePage();"">���� ���</button>
	</div>
	
	<div>
		<textarea id="reply_comment"></textarea>
		<button type="button" id="btn_reply">��� ���</button>
	</div>
</form>
</body>
</html>