<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
<%@ include file="/WEB-INF/views/include/common.jsp" %>
<%
	List<HashMap<String, Object>> boardList = (List<HashMap<String, Object>>)request.getAttribute("boardList");
	HashMap<String, Object> pagingMap =(HashMap<String, Object>)request.getAttribute("pagingMap");
	int startPage = Integer.parseInt(pagingMap.get("startPage").toString());
	int endPage = Integer.parseInt(pagingMap.get("endPage").toString());
	int nowPage = Integer.parseInt(pagingMap.get("nowPage").toString());
	int totalPage = Integer.parseInt(pagingMap.get("totalPage").toString());
	int pageBlock = Integer.parseInt(pagingMap.get("pageBlock").toString());
%>
<script type="text/javascript">
//작성 입력폼으로 이동
function goWritePage(){
	location.href="/board/goBoardForm";
}

//글 상세페이지로 이동
function goDetailPage(no){
	location.href="/board/goDetailPage?no="+no;
}

//리스트로 이동
function getBoardList(nowPage){
	$('#nowPage').val(nowPage);
	$('#frm').attr('action', '/board/getBoardList').submit();
}
</script>
</head>
<body>
<form id="frm" method="post">
<input type="hidden" id="nowPage" name="nowPage" />
	<div>
		<table>
			<thead>
				<tr>
					<th>No.</th><th>제목</th><th>작성자</th><th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(HashMap map : boardList){
				%>
					<tr>
						<td><%=StringUtils.NVL(map.get("NO"), "") %></td>
						<td><a href="javascript:goDetailPage('<%=map.get("NO")%>'); "><%=StringUtils.NVL(map.get("TITLE"), "") %></a></td>
						<td><%=StringUtils.NVL(map.get("RGST_ID"), "") %></td>
						<td><%=StringUtils.NVL(map.get("FM_RGST_DT"), "") %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<div>
		<%if(nowPage != 1){ 
			if(nowPage - pageBlock < 1){
		%>
				<a href="javascript:getBoardList('1');">[이전]</a>
		<%	}else{ %>
				<a href="javascript:getBoardList('<%=nowPage-pageBlock %>');">[이전]</a>
		<%	}
		}%>
		<%for(int i=startPage; i<=endPage; i++){ %>
			<a href="javascript:getBoardList('<%=i%>');"><span <%if(i == nowPage){%>style="color: #00ff00;"<%} %>><%=i %></span></a>
		<%} %>
		<%if(nowPage != totalPage){
			if(nowPage + pageBlock > totalPage){ %>
			<a href="javascript:getBoardList('<%=totalPage %>');">[다음]</a>
			<%}else{ %>
				<a href="javascript:getBoardList('<%=nowPage + pageBlock %>');">[다음]</a>
		<%	}
		}%>
		
	</div>
	<div>
		<button type="button" onclick="javascript:goWritePage();">작성하기</button>
	</div>
</form>
</body>
</html>