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

public class MobileHomepageLeader implements Filter{
	FilterConfig config;
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)arg0;
		HttpServletResponse res=(HttpServletResponse)arg1;
		File f=new File(config.getServletContext().getRealPath("mobile_homepage.html"));
		if(f.exists()){
			chain.doFilter(req, res);
		}else{
			res.sendRedirect(req.getContextPath()+"/mobile_homepage.jsp");
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config=config;
	}

}
