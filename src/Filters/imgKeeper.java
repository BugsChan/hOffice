package Filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class imgKeeper implements Filter{
	public void destroy() {}
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
		String addr=request.getHeader("referer");
		if(addr!=null&&addr.indexOf(request.getServerName())>=0){
			chain.doFilter(request, res);
		}
	}
	public void init(FilterConfig arg0) throws ServletException {}
}
