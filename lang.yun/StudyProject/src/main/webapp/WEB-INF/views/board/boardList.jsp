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
						<td><%=StringUtils.NVL(map.get("TITLE"), "") %></td>
						<td><%=StringUtils.NVL(map.get("RGST_ID"), "") %></td>
						<td><%=StringUtils.NVL(map.get("RGST_DT"), "") %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</form>
</body>
</html>