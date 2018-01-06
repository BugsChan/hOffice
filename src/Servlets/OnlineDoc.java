package Servlets;

import java.io.IOException;

import javax.management.RuntimeErrorException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.Doc;
import Service.DocService;
import Service.UserService;
public class OnlineDoc extends BaseServlet{
	public String onlineDocument(HttpServletRequest req,HttpServletResponse res){
		//在线文件阅览,获取uuid
		String uuid=req.getParameter("uuid");
		if(uuid==null){
			try {
				res.sendError(404);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		String path=DocService.getPath(uuid);
		if(path==null){
			try {
				res.sendError(404);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		req.setAttribute("path", path);
		
		/**
		 * 转发
		 */
		RequestDispatcher rd=null;
		if(path.endsWith("doc.html")){
			rd=req.getRequestDispatcher("/onlineDocs/hWord_online.jsp");
		}else if(path.endsWith("xls.html")){
			rd=req.getRequestDispatcher("/onlineDocs/hExcel_online.jsp");
		}else{
			rd=req.getRequestDispatcher("/onlineDocs/hPPT_online.jsp");
		}
		try {
			rd.forward(req, res);
		} catch (ServletException e) {
			throw new RuntimeException(e);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return null;
	}
	/**
	 * 该方法用于删除用户文件
	 * @param req
	 * @param res
	 * @return
	 */
	public String delete(HttpServletRequest req,HttpServletResponse res){
		String userid=req.getParameter("userid");
		String password=req.getParameter("password");
		String uuid=req.getParameter("uuid");
		if(!UserService.testPassword(req, res)){
			return "{\"isOk\":false,\"errorMsg\":\"Sorry,你尚未登录,请重新登录后再删除\"}";
		}
		if(uuid==null){
			return "{\"isOk\":false,\"errorMsg\":\"请勿进行黑客攻击行为,这将承担法律责任!!\"}";
		}
		if(DocService.removeByUUID(uuid,userid,req.getServletContext())){
			return "{\"isOk\":true}";
		}else{
			return "{\"isOk\":false,\"errorMsg\":\"您要删除的文件不存在或您尚未登录!\"}";
		}
	}
	/**
	 * 该方法用于获取用户文件目录
	 * @param req
	 * @param res
	 * @return
	 */
	public String lib(HttpServletRequest req,HttpServletResponse res){
		if(!UserService.testPassword(req, res))return "{\"isOk\":false,\"errorMsg\":\"Sorry,你尚未登录,请重新登录后再申请目录!\"}";
		String userid=req.getParameter("userid");
		DocService docs=new DocService(Integer.valueOf(userid));
		String returning="{\"isOk\":true,\"docs\":[";
		for(int i=0;i<docs.length();i++){
			Doc doc=docs.get(i);
			returning+="{\"name\":\""+doc.getName().replaceAll("\"", "\\\\\\\"")
					+"\",\"uuid\":\""+doc.getRealUUID()+"\"},";
		}
		if(returning.endsWith(",")){
			returning=returning.substring(0,returning.length()-1);
		}
		return returning+"]}";
	}
}
