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

public class HomepageLeader implements Filter{
	FilterConfig config;
	public void destroy() {}
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		File f=new File(config.getServletContext().getRealPath("index.html"));
		if(f.exists()){
			chain.doFilter(req, res);
		}else{
			((HttpServletResponse)res).sendRedirect(((HttpServletRequest)req).getContextPath()+"/index.jsp");
		}
	}
	public void init(FilterConfig config) throws ServletException {
		this.config=config;
	}

}
