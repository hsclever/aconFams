<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
<%@ include file="/WEB-INF/views/include/common.jsp" %>
<%
	

	HashMap<String, Object> boardMap = (HashMap<String, Object>)request.getAttribute("boardMap"); 
	String no = "";
	String title = "";
	String rgstId = "";
	String contents = "";
	if(boardMap != null){
		no = boardMap.get("NO").toString();
		title = boardMap.get("TITLE").toString();
		rgstId = boardMap.get("RGST_ID").toString();
		contents = boardMap.get("CONTENTS").toString();
	}
%>
<script type="text/javascript">
// �Խù� ���
function doWrite(){
	if(Common.isNull($('#bTitle'), 'i')){
		alert('������ �Է��ϼ���.'); return;
	}
	if(Common.isNull($('#bContents'), 'i')){
		alert('������ �Է��ϼ���.'); return;
	}
	if(Common.isNull($('#bPw'), 'i')){
		alert('��й�ȣ�� �Է��ϼ���.'); return;
	}
	
	var params = {
			title : $('#bTitle').val()
			, contents : $('#bContents').val()
			, pw :  $('#bPw').val()
	}
	Common.ajax('/doWrite'
			, params
			, function(rs){
				if(rs == -99){
					alert('�α����� �ʿ��մϴ�.');
					location.href = '/main';
				}
				if(rs > 0){
					alert('���������� ��ϵǾ����ϴ�.');
					location.href = '/getBoardList';
				}
			}
			, function(e){
				console.log(e);
			}
	);
}

// �Խù� ����
function doModify(no){
	if(Common.isNull($('#bTitle'), 'i')){
		alert('������ �Է��ϼ���.'); return;
	}
	if(Common.isNull($('#bContents'), 'i')){
		alert('������ �Է��ϼ���.'); return;
	}
	if(Common.isNull($('#bPw'), 'i')){
		alert('��й�ȣ�� �Է��ϼ���.'); return;
	}
	
	var params = {
			no : no
			, title : $('#bTitle').val()
			, contents : $('#bContents').val()
			, pw :  $('#bPw').val()
	}
	Common.ajax('/doModify'
			, params
			, function(rs){
				if(rs == -99){
					alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.'); return;
				}
				if(rs > 0){
					alert('���������� �����Ǿ����ϴ�.');
					location.href = '/getBoardList';
				}
			}
			, function(e){
				console.log(e);
			}
	);
}

function goList(){
	location.href = '/getBoardList';
}
</script>
</head>
<body>
<form id="frm" method="post">
	<div>
		<table>
			<tr>
				<th>�ۼ���</th>
				<td><input type="text" id="rgstId" name="rgstId" value="<%="".equals(no) ? session.getAttribute("loginId") : rgstId %>" readonly/></td>
				<th>��й�ȣ</th>
				<td><input type="password" id="bPw" name="bPw" value=""/></td>
			</tr>
			<tr>
				<th>����</th>
				<td colspan="3"><input type="text" id="bTitle" name="bTitle" value="<%=title %>"/></td>
			</tr>
			<tr>
				<th>����</th>
				<td colspan="3">
					<textarea id="bContents" name="bContents"><%=contents %></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<button type="button" onclick="javascript:goList();">�������</button>
		<%if(boardMap == null){ %> <!-- �Խù� ������ �ִٸ� ��������, ���ٸ� ��� ������ -->
			<button type="button" onclick="javascript:doWrite();">���</button>
		<%}else{ %>
			<button type="button" onclick="javascript:doModify('<%=boardMap.get("NO") %>');">����</button>
		<%} %>
	</div>
</form>
</body>
</html>