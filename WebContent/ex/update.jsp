<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.goodie.ListBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UPDATE</title>
</head>
<body>
<%	
	List<ListBean> list = (ArrayList<ListBean>)request.getSession().getAttribute("list");
	String key = request.getParameter("key");
	request.setCharacterEncoding("UTF-8");
	
	String currentKey = "";
	int currentItem=0;
	for(int i=0; i<list.size(); i++ ){
		if(key.equals(list.get(i).getTitle())){
			currentKey = list.get(i).getTitle();
			currentItem = i;
			System.out.println(i);
			System.out.println(list.get(i).getTitle());
		}
	}
	ListBean lb = list.get(currentItem);
	
	String contents = request.getParameter("contents");
	contents = contents == null ? "" : contents;
	if (!contents.equals("")){
		lb.setContents(contents);
		lb.setTitle(key);
	}
	
//	System.out.println(currentKey);
	
%>
	<form>
		<input type="text" name="key" value="<%=lb.getTitle()%>"><br>
		<textarea rows="10" name="contents" cols="70"><%=lb.getContents()%></textarea>
		<input type="submit" value="수정">
	</form>
	<a href="list.jsp">목록</a>

</body>
</html>