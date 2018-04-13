<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="kr.goodie.ListBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		List<ListBean> list = (ArrayList<ListBean>)request.getSession().getAttribute("list");
		String title = request.getParameter("title");
		System.out.println("title debugging = "+title);
		
		if(title == null){
		}else{
			String currentItem = null;
			int i = 0;
			
			try{
				for(ListBean lb: list){
					
					if(lb.getTitle().trim().equals(title)){
						currentItem = String.valueOf(i);
						System.out.println("삭제할 인덱스= "+currentItem);
						request.getSession().setAttribute("list", list);
					}
					i++;
				}
				if(currentItem != null){
					list.remove(Integer.parseInt(currentItem));
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	%>
	<p>삭제 완료 하였습니다.</p><br>
	<a href="list.jsp">목록</a>
	
</body>
</html>