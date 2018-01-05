package Service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import Dao.JdbcUtils;

public class UserService {
	private User user;
	public UserService(User user){
		this.user=user;
	}
	public UserService(String matching){
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="select * from users where id=?";		
		try {
			user=qr.query(sql, new BeanHandler<User>(User.class), matching);
		} catch (SQLException e) {
			System.out.println("Error occord");
			throw new RuntimeException(e);
		}
	}
	public User getUser(){
		return user;
	}
	
	public static boolean testPassword(HttpServletRequest req,HttpServletResponse res){
		String userid=req.getParameter("userid");
		String password=req.getParameter("password");
		UserService user;
		user = new UserService(userid);
		if(!user.getUser().getPassword().equals(password)){
			return false;
		}
		return true;
	}
	
	public static boolean changeUser(String userid,String username,String password,String email,String phoneNumber){
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="update users set username=?,email=?,phoneNumber=?,password=? where id=?";
		try {
			if(qr.update(sql,username,email,phoneNumber,password,userid)==1)return true;
			return false;
		} catch (SQLException e) {
			return false;
		}
	}
	
	public boolean upload(){
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="select max(id) from users";
		try{
			int id=(Integer)qr.query(sql, new ScalarHandler());
			id++;
			sql="insert into users values(?,?,?,?,?,?,?)";
			qr.update(sql,id,user.getUsername(),user.getEmail(),user.getPhoneNumber(),user.getPassword(),user.getQQNumber(),user.getWeChatNumber());
			getUser().setId(id);
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
}
