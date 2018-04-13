<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.goodie.ListBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<a href= "create.jsp">작성</a>
	<br>
	<%
	// POST 방식에서 한글 깨짐!
	request.setCharacterEncoding("UTF-8");
	
	List<ListBean> list = (ArrayList<ListBean>) request.getSession().getAttribute("list");
	
	if(list == null){
		list = new ArrayList<ListBean>();
		list.add(new ListBean("HTML","HTML IS ..."));
		list.add(new ListBean("CSS","CSS IS ..."));
		list.add(new ListBean("JAVASCRIPT","JS ..."));
		System.out.println(list);
	}
	
	request.getSession().setAttribute("list", list);
	
	String html = "";
	int n = 1;
	for (ListBean lb : list){
		html += "<span style='float: left;'>"+ n +") <a href='list.jsp?key="+lb.getTitle()+"'>"+lb.getTitle()+"</a>&nbsp;&nbsp;</span>"
				+"<form action='update.jsp' method='POST' style='float: left; margin: 0px 5px;'>"
				+"<input type='hidden' name='key' value='"+lb.getTitle()+"'>"
				+"<input type='submit' value='수정'>"
				+"</form>"
				+"<form action='remove.jsp' method='POST'>"
				+"<input type='hidden' name='title' value='"+lb.getTitle()+"'>"
				+"<input type='submit' value='삭제'>"
				+"</form><br>";
		n++;
	}
	
	/*
	for(int i = 0; i < list.size(); i++){
		html += (i + 1) + ") <a href='list.jsp?key=" + list.get(i).getTitle() +"'>"+ list.get(i).getTitle() +"</a><br>";
	}
	*/
%>
<%= html %>
	<%
		String key = request.getParameter("key");
		//System.out.println(key);
		String contents = "";
		for(int i = 0; i < list.size(); i++){
			if(list.get(i).getTitle().equals(key)){
				System.out.println(list.get(i).getContents());
				contents = list.get(i).getContents();
			}
		}
	%>	
	<%=contents %>	
</body>
</html>