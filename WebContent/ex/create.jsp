<%@page import="kr.goodie.ListBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>create</title>
</head>
<body>
	<%
		List<ListBean> list = (ArrayList<ListBean>)request.getSession().getAttribute("list");
		String title = request.getParameter("title");
		if(title == null){
	%>
	<h1>글 작성 화면</h1>
	<form>
		<input type="text" name= "title" placeholder="제목을 작성하세요">
		<input type="text" name= "contents" placeholder="내용을 작성하세요">
		<input type="submit" value="저장">
	</form>
	<%  }else {
			if(list == null){
				list = new ArrayList<ListBean>();
			}
			String contents = request.getParameter("contents");
			list.add(new ListBean(title, contents));
			request.getSession().setAttribute("list", list);
	%>
		<h1>글 작성이 완료</h1>
		<a href="list.jsp">목록</a>
	<%
		}
	%>
</body>
</html>