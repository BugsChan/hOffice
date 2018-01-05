package Filters;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
/**
 * 主页静态化
 * @author 陈子为 局座
 */
public class HomepageStatic implements Filter{
	private FilterConfig config;
	public void destroy() {}
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		File file=new File(config.getServletContext().getRealPath("index.html"));
		if(!file.exists()){
			staticResponse sr=new staticResponse(res, file);
			file.createNewFile();
			chain.doFilter(request, sr);
			sr.getWriter().close();
		}
		res.sendRedirect(req.getContextPath()+"/index.html");
	}
	public void init(FilterConfig config) throws ServletException {
		this.config=config;
	}
}
class staticResponse extends HttpServletResponseWrapper{
	PrintWriter pw;
	public staticResponse(HttpServletResponse response,File file) {
		super(response);
		try {
			pw=new PrintWriter(file,"utf-8");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public PrintWriter getWriter(){
		return pw;
	}
}