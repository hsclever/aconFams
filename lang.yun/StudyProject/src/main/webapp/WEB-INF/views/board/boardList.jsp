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
%>
<script type="text/javascript">
function goWritePage(){
	location.href="/goBoardForm";
}

function goDetailPage(no){
	location.href="/goDetailPage?no="+no;
}
</script>
</head>
<body>
<form id="frm" method="post">
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
		<button type="button" onclick="javascript:goWritePage();">작성하기</button>
	</div>
</form>
</body>
</html>