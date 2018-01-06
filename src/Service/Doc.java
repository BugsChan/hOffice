package Service;

import java.io.File;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import Dao.FileSave;
import Dao.JdbcUtils;

public class Doc {
	private String path;
	private String name;
	private int userid;
	private Date date;
	public Doc(){}
	public Doc(String name,int userid){
		this.userid=userid;
		this.name=name;
		path=getPath(name);
		this.date=new Date();
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public boolean save(InputStream input,ServletContext context){
		if(name.length()>40)return false;
		if(FileSave.save(input, path, context,1024*1024*6)){
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
			String sql="insert into docs values(?,?,?)";
			try {
				qr.update(sql,userid,path,new java.sql.Date(date.getTime()));
				return true;
			} catch (SQLException e) {
				String realPath=context.getRealPath(path);
				File file=new File(realPath);
				if(file.exists())file.delete();
				return false;
			}
		}
		return false;
	}
	
	public boolean delete(ServletContext context){
		return removeDoc(this.path,context);
	}
	public boolean reflushTime(){
		return reflushTime(path);
	}
	
	public String getRealUUID(){
		String uuid=path.substring(path.lastIndexOf("/")+1);
		uuid=uuid.substring(0,uuid.indexOf("_"));
		return uuid;
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		String name=path.substring(path.lastIndexOf("/")+1);
		name=name.substring(name.indexOf("_")+1);
		this.path = path;
		this.name=name;
	}
	public String getName() {
		return name;
	}
	private static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	/**
	 * 自动生成文件路径
	 * @param name
	 * @return
	 */
	private static String getPath(String name){
		String parentPath="WEB-INF/Files/";
		String uuid=getUUID();
		name=uuid+"_"+name;
		return parentPath+uuid.substring(0,2)+"/"+uuid.substring(2,4)+"/"+name;
	}
	
	protected static boolean removeDoc(String url,ServletContext context){
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="delete from docs where src=?";
		try{
			qr.update(sql,url);
			String realPath=context.getRealPath(url);
			File file=new File(realPath);
			if(file.exists())file.delete();
			return true;
		}catch(Exception e){
			return false;
		}
	}
	private static boolean reflushTime(String url){
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="update docs set date=? where url=?";
		try {
			qr.update(sql,new java.sql.Date(new java.util.Date().getTime()),url);
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
}
