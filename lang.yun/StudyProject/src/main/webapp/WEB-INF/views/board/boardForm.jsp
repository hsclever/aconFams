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
// 게시물 등록
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
					alert('로그인이 필요합니다.');
					location.href = '/main';
				}
				if(rs > 0){
					alert('정상적으로 등록되었습니다.');
					location.href = '/getBoardList';
				}
			}
			, function(e){
				console.log(e);
			}
	);
}

// 게시물 수정
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
					alert('정상적으로 수정되었습니다.');
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
				<th>제목</th>
				<td><input type="text" id="bTitle" name="bTitle" value="<%=title %>"/></td>
				<th>작성자</th>
				<td><input type="password" id="bPw" name="bPw" value="<%=rgstId %>"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea id="bContents" name="bContents"><%=contents %></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<button type="button" onclick="javascript:goList();">목록으로</button>
		<%if(boardMap == null){ %> <!-- 게시물 정보가 있다면 상세페이지, 없다면 등록 페이지 -->
			<button type="button" onclick="javascript:doWrite();">등록</button>
		<%}else{ %>
			<button type="button" onclick="javascript:doModify('<%=boardMap.get("NO") %>');">수정</button>
		<%} %>
	</div>
</form>
</body>
</html>