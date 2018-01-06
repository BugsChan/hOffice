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
	public void requestInitialized(ServletRequestEvent sre) {
		String url=((HttpServletRequest)sre.getServletRequest()).getRequestURI();
		System.out.println(url);
		url=url.substring(url.lastIndexOf("/")+1);
		if(url.equals("")||url.endsWith("index.html")){
			homepagePc=add(homepagePc,"pcHome");
		}else if(url.endsWith("mobile_homepage.html")){
			homepageMobile=add(homepageMobile,"mbHome");
		}else if(url.endsWith("hWord.html")){
			hWord=add(hWord,"hWord");
		}else if(url.endsWith("hExcel.html")){
			hExcel=add(hExcel,"hExcel");
		}else if(url.endsWith("hPPT.html")){
			hPPT=add(hPPT,"hPPT");
		}else if(url.indexOf("UserSupport")>=0){
			login=add(login,"login");
		}
	}
	private int add(int i,String type){
		
		
//		//test
//		System.out.println(type);
//		
		if(i<100){
			i++;
		}else{
			i=TongjiService.append100(type);
		}
		return i;
	}
	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {}
}
