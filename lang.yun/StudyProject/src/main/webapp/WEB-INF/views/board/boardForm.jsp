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
	String title = "";
	String rgstId = "";
	String contents = "";
	if(boardMap != null){
		title = boardMap.get("TITLE").toString();
		rgstId = boardMap.get("rgstId").toString();
		contents = boardMap.get("contents").toString();
	}
%>
<script type="text/javascript">
// �Խù� ���
function doWrite(){
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
	var params = {
			no : no
			, title : $('#bTitle').val()
			, contents : $('#bContents').val()
			, pw :  $('#bPw').val()
	}
	Common.ajax('/doModify'
			, params
			, function(rs){
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
				<th>����</th>
				<td><input type="text" id="bTitle" name="bTitle" value="<%=title %>"/></td>
				<th>�ۼ���</th>
				<td><input type="password" id="bPw" name="bPw" value="<%=rgstId %>"/></td>
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