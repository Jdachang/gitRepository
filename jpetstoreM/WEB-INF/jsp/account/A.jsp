
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("TA Session"+request.getSession().getId());
out.println("TA Session"+request.getSession().getId());
%>
</body>
</html>