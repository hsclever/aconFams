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
//�ۼ� �Է������� �̵�
function goWritePage(){
	location.href="/board/goBoardForm";
}

//�� ���������� �̵�
function goDetailPage(no){
	location.href="/board/goDetailPage?no="+no;
}

//����Ʈ�� �̵�
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
					<th>No.</th><th>����</th><th>�ۼ���</th><th>�ۼ���</th>
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
				<a href="javascript:getBoardList('1');">[����]</a>
		<%	}else{ %>
				<a href="javascript:getBoardList('<%=nowPage-pageBlock %>');">[����]</a>
		<%	}
		}%>
		<%for(int i=startPage; i<=endPage; i++){ %>
			<a href="javascript:getBoardList('<%=i%>');"><span <%if(i == nowPage){%>style="color: #00ff00;"<%} %>><%=i %></span></a>
		<%} %>
		<%if(nowPage != totalPage){
			if(nowPage + pageBlock > totalPage){ %>
			<a href="javascript:getBoardList('<%=totalPage %>');">[����]</a>
			<%}else{ %>
				<a href="javascript:getBoardList('<%=nowPage + pageBlock %>');">[����]</a>
		<%	}
		}%>
		
	</div>
	<div>
		<button type="button" onclick="javascript:goWritePage();">�ۼ��ϱ�</button>
	</div>
</form>
</body>
</html>