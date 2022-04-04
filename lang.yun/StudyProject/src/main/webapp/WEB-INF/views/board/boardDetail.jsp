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
			alert('자신이 등록한 글에는 답변을 달 수 없습니다.'); return;
		<%}else{%>
		
		<%}%>
	});
});

// 게시물 등록
function goWritePage(){
	location.href="/goBoardForm";
}

// 게시물 수정
function goModifyPage(no){
	<%if(boardMap.get("RGST_ID").toString().equals(session.getAttribute("loginId"))){%>
		location.href = '/goBoardForm?no='+no;
	<%}else{%>
		alert('작성자만 수정 가능합니다.');
	<%}%>
}

//목록으로
function goList(){
	location.href= '/getBoardList';
}

//댓글 등록
function doRegReply(){
	
}
</script>
</head>
<body>
<form id="frm" method="post">
	<div>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" id="bTitle" name="bTitle" value="<%=boardMap.get("TITLE") %>" disabled/></td>
				<th>작성자</th>
				<td><input type="text" id="rgstId" name="rgstId" value="<%=boardMap.get("RGST_ID") %>" disabled/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea id="bContents" name="bContents" disabled><%=boardMap.get("CONTENTS") %></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<button type="button" onclick="javascript:goList();">목록으로</button>
		<button type="button" onclick="javascript:goModifyPage('<%=boardMap.get("NO") %>');">수정</button>
		<button type="button" onclick="javascript:goWritePage();"">새글 등록</button>
	</div>
	
	<div>
		<textarea id="reply_comment"></textarea>
		<button type="button" id="btn_reply">댓글 등록</button>
	</div>
</form>
</body>
</html>