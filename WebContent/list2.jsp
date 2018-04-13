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
	
	Explain explain = (Explain)request.getAttribute("explain");
	String contents = "";
	if (explain == null) {
		explain = new Explain(key, contents);
	}else{
		contents = explain.getContents();
	}
	
	if (key.equals("")){
%>
	들어온 값이 없습니다.<br>
<%		
	} else {
		
%>
		<br><%=explain.getValue(key) %><br><br>
		<br>들어온 파라미터 값= <%=key %><br><br>
<%
	}

	//자바영역
	List<String> list = new ArrayList<String>();
	list.add("HTML");
	list.add("JSP");
	list.add("Python");
	
	String html = "";
	int n = 1;
	for(String i : list) {
		html += "<span style='float: left;'>"+ n +") <a href='list2.jsp?key="+i+"'>"+i+"</a>&nbsp;&nbsp;</span>"
				+"<form action='update.jsp' method='POST' style='float: left; margin: 0px 5px;'>"
				+"<input type='hidden' name='key' value='"+i+"'>"
				+"<input type='submit' value='수정'>"
				+"</form>"
				+"<form action='delete.jsp' method='POST'>"
				+"<input type='hidden' name='key' value='"+i+"'>"
				+"<input type='submit' value='삭제'>"
				+"</form><br>";
		n++;
	}
	
%>
<%=html%>
</body>
</html>