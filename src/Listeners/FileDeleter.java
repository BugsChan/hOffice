package Listeners;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class FileDeleter implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {}

	@Override
	public void sessionDestroyed(HttpSessionEvent sessionEvent) {
		String sessionid=sessionEvent.getSession().getId();
		ServletContext context=sessionEvent.getSession().getServletContext();
		File file=new File(context.getRealPath("WEB-INF/Files/ScratchFile/"+sessionid+".scr"));
		if(file.exists())file.delete();
	}
}
