package Servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Dao.FileSave;
import Service.Doc;
import Service.DocService;
import Service.UserService;

public class saveSupport extends BaseServlet{
	public String webnametest(HttpServletRequest req,HttpServletResponse res){
		//测试是否有同名文件存在
		int userid=-1;
		try{
			userid=Integer.valueOf(req.getParameter("userid"));
			if(!UserService.testPassword(req, res)){
				throw new Exception();
			}
		}catch(Exception e){
			return "{\"errorMsg\":\"Sorry,您尚未登录,无法保存!\"}";
		}
		DocService userDocs=new DocService(userid);
		String title=req.getParameter("title");
		if(title==null){
			return "{\"errorMsg\":\"请不要随意更改hOffice源文件或进行网络攻击!\"}";
		}else if(!userDocs.hasSame(title)){
			return "{\"isOk\":true}";
		}else{
			return "{\"isOk\":false,\"sameName\":true}";
		}
	}
	
	
	public String webSave(HttpServletRequest req,HttpServletResponse res){
		int userid=-1;
		try{
			userid=Integer.valueOf(req.getParameter("userid"));
			if(!UserService.testPassword(req, res)){
				throw new Exception();
			}
		}catch(Exception e){
			return "{\"errorMsg\":\"Sorry,您尚未登录,无法保存!\"}";
		}
		String name=req.getParameter("title");
		if(name==null||!name.endsWith(".html")){
			return "{\"errorMsg\":\"请不要随意更改hOffice源文件或进行网络攻击!\"}";
		}else if(name.indexOf("/")>=0||name.indexOf("\\")>=0){
			return "{\"errorMsg\":\"文件名中不能存在'/'或'\\'号\"}";
		}
		DocService userDocs=new DocService(userid);
		Doc doc=null;
		for(int i=0;i<userDocs.length();i++){
			if(userDocs.get(i).getName().equals(name)){
				doc=userDocs.get(i);
				try {
					if(FileSave.save(req.getInputStream(), doc.getPath(), getServletContext(),1024*1024*6)){
						return "{\"isOk\":true}";
					}else{
						return "{\"isOk\":false,\"errorMsg\":\"您的文件不符合规范(文件大于6M),请保存在本地或者去掉不必要的照片,谢谢!\"}";
					}
				} catch (IOException e) {
					return "{\"isOk\":false,\"errorMsg\":\"嗯...出了一点问题,请再试试看!\"}";
				}
			}
		}
		if(doc==null)doc=new Doc(name,userid);
		try {
			if(doc.save(req.getInputStream(), getServletContext())){
				return "{\"isOk\":true}";
			}else{
				return "{\"isOk\":false,\"errorMsg\":\"您的文件不符合规范(文件名超过20字或文件大于6M),请保存在本地或者去掉不必要的照片,谢谢!\"}";
			}
		} catch (IOException e) {
			return "{\"isOk\":false,\"errorMsg\":\"嗯...出了一点问题,请再试试看!\"}";
		}
	}
	
	public String localSaveUpload(HttpServletRequest req,HttpServletResponse res){
		HttpSession session=req.getSession(false);
		if(session==null){
			return "{\"isOk\":false,\"errorMsg\":\"嗯...出了一点问题,请再试试看!\"}";
		}else{
			try {
				String title=req.getParameter("title");
				if(title==null)throw new IOException();
				FileSave.save(req.getInputStream(), "WEB-INF/Files/ScratchFile/"+session.getId()+".scr", getServletContext(), 1024*1024*6);
				session.setAttribute("title", title);
			} catch (IOException e) {
				return "{\"isOk\":false,\"errorMsg\":\"嗯...出了一点问题,请再试试看!\"}";
			}
			return "{\"isOk\":true}";
		}
	}
	
	public String localSaveDownload(HttpServletRequest req,HttpServletResponse res) throws FileNotFoundException, IOException{
		HttpSession session=req.getSession(false);
		if(session==null){
			return "{\"isOk\":false,\"errorMsg\":\"嗯...出了一点问题,请再试试看!\"}";
		}else{
			try{
				res.setContentType("text/html;");
				String title=(String)session.getAttribute("title");
				res.setHeader("Content-Disposition", "attachment;Filename="+title);
				File file=new File(getServletContext().getRealPath("WEB-INF/Files/ScratchFile/"+session.getId()+".scr"));
				boolean result=FileSave.save(new FileInputStream(file), res.getOutputStream(), 1024*1024*6);
				if(file.exists())file.delete();
				if(result){
					return "{\"isOk\":true}";
				}else{
					return "{\"isOk\":false,\"errorMsg\":\"您的文件不符合规范(文件名超过20字,含有不允许的字符或文件大于6M),请去掉不必要的照片,谢谢!\"}";
				}
			}catch(Exception e){
				return "{\"isOk\":false,\"errorMsg\":\"嗯,IO异常...出了一点问题,请再试试看!\"}";
			}
		}
	}
	
//	@Test
//	public void test() throws UnsupportedEncodingException{
//		byte[] b1="éå­ä¸º".getBytes("ISO-8859-1");//éå­ä¸º
//		byte[] b2="陈子为".getBytes("utf-8");
//		System.out.println(new String(b2,"ISO-8859-1"));
//		for(int i=0;i<b1.length;i++){
//			System.out.print(b1[i]+",");
//		}
//		System.out.println();
//		for(int i=0;i<b2.length;i++){
//			System.out.print(b2[i]+",");
//		}
//		System.out.println();
//		
//		byte[] b3={
//				-27,-112,95//éå­ä¸º
//		};
//		System.out.println(new String(b3,"Utf-8"));
//	}
	
}
