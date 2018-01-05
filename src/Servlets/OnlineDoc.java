package Servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import Service.Doc;
import Service.DocService;
import Service.UserService;
public class OnlineDoc extends BaseServlet{
	public String onlineDocument(HttpServletRequest req,HttpServletResponse res){
		//在线文件阅览,获取uuid
		String uuid=req.getParameter("uuid");
		String path=DocService.getPath(uuid);
		if(path==null){
			try {
				res.sendError(404);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		InputStream input=null;
		try {
			//获取用户文件
			File file=new File(req.getServletContext().getRealPath(path));
			
			//获取用户文件
			
			input=FileUtils.openInputStream(file);
			IOUtils.copy(input, res.getOutputStream());
		} catch (IOException e) {
			try {
				res.sendError(404);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
		}finally{
			IOUtils.closeQuietly(input);
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
