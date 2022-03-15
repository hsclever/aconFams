<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>회원번호 : ${DATA.mno}</div>
		<div>회원이름 : ${DATA.name}</div>
		<div>아 이 디 : ${DATA.id}</div>
		<div>회원메일 : ${DATA.mail}</div>
		<div>회원성별 : 
			<span>
				<c:if test="${DATA.gen == 'M'}">남 자</c:if>
				<c:if test="${DATA.gen eq 'F'}">여 자</c:if>
			</span>
		</div>
		<div>가 입 일 : ${DATA.sdate}</div>
	</div>
</body>
</html>