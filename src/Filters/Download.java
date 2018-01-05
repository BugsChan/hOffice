package Filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class Download implements Filter{
	public void destroy() {}
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		((HttpServletResponse)res).setHeader("Content-Disposition", "attachment");
		chain.doFilter(req, res);
	}
	public void init(FilterConfig arg0) throws ServletException {}
}
