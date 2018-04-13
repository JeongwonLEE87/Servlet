package kr.goodie;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jmx.snmp.Enumerated;

public class Main extends HttpServlet {

	@Override //부모가 만들어 진것을 재구성 하려는 뜻      get방식은 그냥 쓰면됨                                ServletException  IOException  두종류 오류           
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet : 안녕하세요");
		getParam(req);
	}

	@Override  // 새로운 화면이 필요함 (새로운 html,jsp등 새로운 파일이 필요)
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost");
		req.setCharacterEncoding("UTF-8");
		getParam(req);
		
	}
	void getParam(HttpServletRequest req) {
		Enumeration<String> names = req.getParameterNames();
		while (names.hasMoreElements()) {
			String paramName = (String) names.nextElement();
			String value = req.getParameter(paramName);
			System.out.println(paramName + ":" + value);
		}
	}
		

}
