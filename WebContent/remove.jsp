<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="kr.gudi.Explain" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String key = request.getParameter("key");
	key = key == null ? "" : key;
	if (key.equals("")){
		%>
		들어온 값이 없습니다. <br>
		<%
	} else {
		String contents = "";
		Explain explain = new Explain(key, contents);
		%>
		<br><%=explain.getValue(key) %><br><br>
		<%
		%>
		<br>들어온 파라미터 값= <%=key %><br><br>
		<%
	}
%>
</body>
</html>