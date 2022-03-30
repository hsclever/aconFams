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
</script>
</head>
<body>
<form id="frm" method="post">
	<div>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" id="bTitle" name="bTitle" value="${TITLE}" /></td>
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
		<button type="button" onclick="javascript:doModify('${NO}'});">수정</button>
		<button type="button" onclick="javascript:doWrite();">등록</button>
	</div>
</form>
</body>
</html>