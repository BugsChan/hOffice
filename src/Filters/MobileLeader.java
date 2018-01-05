package Filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MobileLeader implements Filter{
	private String[] mobileAgents={
			"Android","iPhone","SymbianOS","Windows Phone","iPad","iPod"
	};
	@Override
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		String userAgent=((HttpServletRequest)req).getHeader("User-Agent");
		for(int i=0;i<mobileAgents.length;i++){
			if(userAgent.indexOf(mobileAgents[i])>=0){
				HttpServletResponse response=(HttpServletResponse)res;
				response.sendRedirect(((HttpServletRequest)req).getContextPath()+"/mobile_homepage.html");
			}
		}
		chain.doFilter(req, res);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {}
	
}
