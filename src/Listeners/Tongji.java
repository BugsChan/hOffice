package Listeners;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;

import Service.TongjiService;

public class Tongji implements ServletRequestListener{
	private static int homepagePc=0;
	private static int homepageMobile=0;
	private static int hWord=0;
	private static int hExcel=0;
	private static int hPPT=0;
	private static int login=0;
	@Override
	public void requestDestroyed(ServletRequestEvent sre) {
		String url=((HttpServletRequest)sre.getServletRequest()).getRequestURI();
		url=url.substring(url.lastIndexOf("/")+1);
		if(url.equals("")||url.matches("index\\.[(jsp)(html)]")){
			homepagePc=add(homepagePc,"pcHome");
		}else if(url.matches("mobile_homepage\\.[(jsp)(html)]")){
			homepageMobile=add(homepageMobile,"mbHome");
		}else if(url.indexOf("hWord.html")>=0){
			hWord=add(hWord,"hWord");
		}else if(url.indexOf("hExcel.html")>=0){
			hExcel=add(hExcel,"hExcel");
		}else if(url.indexOf("hPPT.html")>=0){
			hPPT=add(hPPT,"hPPT");
		}else if(url.indexOf("UserSupport")>=0){
			login=add(login,"login");
		}
	}
	public void requestInitialized(ServletRequestEvent arg0) {}
	
	private int add(int i,String type){
		
		
		//test
		//System.out.println(type);
		
		if(i<100){
			i++;
		}else{
			i=TongjiService.append100(type);
		}
		return i;
	}
}
