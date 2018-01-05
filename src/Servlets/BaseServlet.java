package Servlets;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res){
		res.setHeader("Access-Control-Allow-Origin", "*");
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e2) {
			throw new RuntimeException(e2);
		}
		res.setCharacterEncoding("utf-8");
		String methodStr=req.getParameter("method");
		if(methodStr==null){
			try {
				res.getWriter().write("{\"isOk\":false,\"errorMsg\":\"您未指定方法名!\"}");
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}else{
			Method method=null;
			try {
				method=this.getClass().getMethod(methodStr, HttpServletRequest.class,HttpServletResponse.class);
			} catch (Exception e) {
				try {
					res.getWriter().write("{\"isOk\":false,\"errorMsg\":\"您所指定的方法名不存在!\"");
				} catch (IOException e1) {
					throw new RuntimeException(e1);
				}
			}
			try {
				String res_str=(String)method.invoke(this, req, res);
				res.getWriter().write(res_str);
			} catch (Exception e){}
		}
	}
}
