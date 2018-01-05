package Servlets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.DocService;
import Service.User;
import Service.UserService;

public class UserSupport extends BaseServlet{
	public String denlu(HttpServletRequest req,HttpServletResponse res){
		String id=req.getParameter("userid");
		//查验证码
		HttpSession session=req.getSession(false);
		try{
			if(session==null){
				throw new Exception();
			}else{
				String suredId=req.getParameter("testid");
				if(!suredId.equals(session.getAttribute("suredId"))){
					throw new Exception();
				}
			}
		}catch(Exception e){
			return "{\"isOk\":false,\"errorMsg\":\"您的验证码输入错误,请点击更新验证码后重新输入!\"}";
		}
		
		
		UserService user;
		try{
			if(!id.equals("")){
				//We have userid
				user=new UserService(id);
			}else{
				//We have nothing
				throw new Exception();
			}
			//get password
			String password=req.getParameter("password");
			//judge if the password is ok;
			if(!password.equals(user.getUser().getPassword())){
				//Error password
				return "{\"isOk\":false,\"errorMsg\":\"对不起,您的密码输入错误,请检查后重新输入!\"}";
			}
		}catch(Exception e){
			//Error with the userid
			return "{\"isOk\":false,\"errorMsg\":\"对不起,您输入的账号不存在!\"}";
		}
		//All is ok, return the userMsg of the user;
		return "{\"isOk\":true,\"userid\":\""
			+user.getUser().getId()+"\",\"userName\":\""
			+user.getUser().getUsername().replaceAll("\"", "\\\\\\\"")
			+"\",\"password\":\""+user.getUser().getPassword().replaceAll("\"", "\\\\\\\"")
			+"\",\"email\":\""
			+user.getUser().getEmail()+"\"}";
	}
	
	public String zhuce(HttpServletRequest req,HttpServletResponse res){
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		//查验证码
		HttpSession session=req.getSession(false);
		try{
			if(session==null){
				throw new Exception();
			}else{
				String suredId=req.getParameter("testid");
				if(!suredId.equals((String)session.getAttribute("suredId"))){
					throw new Exception();
				}
			}
		}catch(Exception e){
			return "{\"isOk\":false,\"errorMsg\":\"您的验证码输入错误,请点击更新验证码后重新输入!\"}";
		}
		if(password.equals("")||username.equals("")){
			return "{\"isOk\":false,\"errorMsg\":\"您没有输入密码或没有输入验证码!!\"}";
		}
		
		User user=new User();
		user.setPassword(password);
		user.setUsername(username);
		String email=req.getParameter("email");
		if(!email.equals(""))user.setEmail(email);
		UserService serv=new UserService(user);
		if(serv.upload()){
			return "{\"isOk\":true,\"userid\":"+user.getId()+"}";
		}else{
			return "{\"isOk\":false,\"errorMsg\":\"Sorry,出现了一点问题,再试试看?\"}";
		}
	}
	
	
	public String setting(HttpServletRequest req,HttpServletResponse res){
		if(!UserService.testPassword(req, res))return "{\"isOk\":false,\"errorMsg\":\"登录错误,请重新登录!\"}";
		String id=req.getParameter("userid");
		String password=req.getParameter("newPassword");
		if(password.equals("")||password.length()<3)return "{\"isOk\":false,\"errorMsg\":\"密码小于三位,不允许修改!\"}";
		String username=req.getParameter("username");
		String email=req.getParameter("email");
		email=email.equals("")?null:email;
		String phoneNumber=req.getParameter("phoneNumber");
		phoneNumber=phoneNumber.equals("")?null:phoneNumber;
		if(UserService.changeUser(id, username, password, email, phoneNumber)){
			return "{\"isOk\":true}";
		}else{
			return "{\"isOk\":false,\"errorMsg\":\"对不起,更改失败了...请再试一次!\"}";
		}
	}
	
//	@Test
//	public void test(){
//		UserService user=new UserService("3", 0);
//		System.out.println(user.getUser().getId());
//	}

}













