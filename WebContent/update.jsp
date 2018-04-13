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
	request.setCharacterEncoding("UTF-8");
	String key = request.getParameter("key");
	String contents = request.getParameter("contents");
	key = key == null ? "" : key;
	contents = contents == null ? "" : contents;
	
	if (!contents.equals("")){
		Explain explain = new Explain(key, contents);	
		explain.setKey(key);
		explain.setContents(contents);
		request.setAttribute("explain", explain);
%>
			<form action="update.jsp" method="POST">
			<input type="text" name="key" value="<%=key %>" readonly><br>
			<textarea name="contents" rows="15" cols="30"><%=explain.getContents()%>
			</textarea><br>
			<input type="submit" value="수정">
			<a href="list2.jsp">목록</a>
		</form>
<%
	}else if (key.equals("")){
%>
		들어온 값이 없습니다. <br>
<%
	} else {
		Explain explain = new Explain(key, contents);
%>
		<form action="update.jsp" method="POST">
			<input type="text" name="key" value="<%=key %>" readonly><br>
			<textarea name="contents" rows="15" cols="30"><%=explain.getValue(key)%>
			</textarea><br>
			<input type="submit" value="수정">
			<a href="list2.jsp">목록</a>
		</form>

		<br>들어온 파라미터 값= <%=key %><br><br>
<%
	}
	
%>
</body>
</html>