<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
<%@ include file="/WEB-INF/views/include/common.jsp" %>
<script type="text/javascript">
// 게시물 등록
function doWrite(){
	$('#frm').attr('action', '/doWrite').submit();
}

// 게시물 수정
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
				<th>제목</th>
				<td><input type="text" id="bTitle" name="bTitle" value="" />${TITLE}</td>
				<th>비밀번호</th>
				<td><input type="password" id="bPw" name="bPw" value="" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea id="bContents" name="bContents">${CONTENTS}</textarea>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<button type="button" onclick="javascript:doList();">목록으로</button>
		<button type="button" onclick="javascript:goModifyPage('${NO}'});">수정</button>
		<button type="button" onclick="javascript:goDetailPage();">새글 등록</button>
	</div>
</form>
</body>
</html>