package Filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class WorkSpaceServer implements Filter{
	private String[] mobileAgents={
			"Android","iPhone","SymbianOS","Windows Phone","iPad","iPod"
	};
	public void destroy() {}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		String userAgent=((HttpServletRequest)arg0).getHeader("User-Agent");
		for(int i=0;i<mobileAgents.length;i++){
			if(userAgent.indexOf(mobileAgents[i])>=0){
				arg2.doFilter(arg0, arg1);
			}
		}
	}
	public void init(FilterConfig arg0) throws ServletException {}

}
