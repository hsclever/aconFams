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
%>
<script type="text/javascript">
function goWritePage(){
	location.href="/goBoardForm";
}

function goDetailPage(no){
	location.href="/goDetailPage?no="+no;
}

function getBoardList(nowPage){
	$('#nowPage').val(nowPage);
	$('#frm').attr('action', '/getBoardList').submit();
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
						<td><%=StringUtils.NVL(map.get("RGST_DT"), "") %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<div>
		<%for(int i=startPage; i<=endPage; i++){ %>
			<a href="javascript:getBoardList('<%=i%>');"><span <%if(i == nowPage){%>style="color: #00ff00;"<%} %>><%=i %></span></a>
		<%} %>
	</div>
	<div>
		<button type="button" onclick="javascript:goWritePage();">작성하기</button>
	</div>
</form>
</body>
</html>