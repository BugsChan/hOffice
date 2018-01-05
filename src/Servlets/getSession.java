package Servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class getSession extends HttpServlet{
	
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException{
		//该方法仅用于获取session
		HttpSession session=req.getSession();
		//根据用户提交的数据设置session的时间为30s或120s
		res.setHeader("Access-Control-Allow-Origin", "*");
		int second=0;
		try{
			second=Integer.valueOf(req.getParameter("sessionTime"));
		}catch(Exception e){
			return;
		}
		second=second>60?120:10;
		session.setMaxInactiveInterval(second);
		System.out.println(res.encodeURL("index.html?test=3&test2=5"));
		res.getWriter().write("{\"isOk\":true,\"jsessionid\":\""+session.getId()+"\"}");
	}
}
