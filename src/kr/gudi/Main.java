package kr.gudi;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Main extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet! : main");
		getParam(req);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost!");
		req.setCharacterEncoding("UTF-8");
		getParam(req);
	}
	
	public void getParam(HttpServletRequest req) throws ServletException, IOException{
		Enumeration<String> names = req.getParameterNames();
		while(names.hasMoreElements()) {
			String paramName = (String) names.nextElement();
			System.out.println(paramName + " : " + req.getParameter(paramName));
		}
	}
}
