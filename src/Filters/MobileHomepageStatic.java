package Filters;

import java.io.File;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MobileHomepageStatic implements Filter{
	private FilterConfig config;
	public void destroy() {}
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		File file=new File(config.getServletContext().getRealPath("mobile_homepage.html"));
		if(!file.exists()){
			staticResponse sr=new staticResponse(response, file);
			file.createNewFile();
			chain.doFilter(request, sr);
			sr.getWriter().close();
		}
		response.sendRedirect(request.getContextPath()+"/mobile_homepage.html");
	}
	public void init(FilterConfig arg0) throws ServletException {
		config=arg0;
	}
}
