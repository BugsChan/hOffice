package Service;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import org.apache.commons.dbutils.QueryRunner;
import Dao.JdbcUtils;

public class HomepageService {
	private ServletContext context;//传入的ServletContext
	private String description;//页面描述,实例化本类时从数据库中获取(后面的内部变量均如此)
	private String title;//页面标题(h1标签)
	private String pageTitle;//html里面title标签内的字符
	private List<String> imgURLs;//图片url
	private List<Integer> imgIds;//图片id(数据库中)
	private String keywords="";//页面关键字
	private String pageDes;//页面描述(meta标签中)
	private String link;//qq群的链接
	
	/**
	 * 实例化本类,填写上诉内容
	 * @param context
	 * @throws SQLException
	 */
	public HomepageService(ServletContext context) throws SQLException{
		this.context=context;
		imgURLs=new ArrayList<String>();
		imgIds=new ArrayList<Integer>();
		Connection con=null;
		Statement stam=null;
		ResultSet res=null;
		try{
			con=JdbcUtils.getConnection();
			String sql="select * from homepage";
			stam=con.createStatement();
			res=stam.executeQuery(sql);
			while(res.next()){
				String type=res.getString("type");
				if(type.equals("title")){
					title=res.getString("des");
				}else if(type.equals("des")){
					description=res.getString("des");
				}else if(type.equals("img")){
					imgURLs.add(res.getString("url"));
					imgIds.add(res.getInt("id"));
				}else if(type.equals("ptitle")){
					pageTitle=res.getString("des");
				}else if(type.equals("keyword")){
					keywords+=keywords.equals("")?res.getString("des"):"," +res.getString("des");
				}else if(type.equals("pagedes")){
					pageDes=res.getString("des");
				}else if(type.equals("link")){
					link=res.getString("url");
				}
			}
		}catch(Exception e){}finally{
			if(res!=null)res.close();
			if(stam!=null)stam.close();
			if(con!=null)con.close();
		}
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPageTitle() {
		return pageTitle;
	}
	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getPageDes() {
		return pageDes;
	}
	public void setPageDes(String pageDes) {
		this.pageDes = pageDes;
	}
	public void setImgURLs(List<String> imgURLs) {
		this.imgURLs = imgURLs;
	}
	public String getDescription() {
		return description;
	}
	public static void setDescription(String description) {
		try {
			update("des","des",description);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public String getTitle() {
		return title;
	}
	public static void setTitle(String title) {
		try {
			update("title","des",title);
		} catch (SQLException e) {
			new RuntimeException(e);
		}
	}
	public List<String> getImgURLs() {
		return imgURLs;
	}
	
	private static void insert(String type,String url ,String des) throws SQLException{
		String sql="insert into homepage values(null,?,?,?)";
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		qr.update(sql,type,url,des);
	}
	private static void update(String type,String setting,String value) throws SQLException{
		String sql="update homepage set ?=? where type=?";
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		qr.update(sql,setting,value,type);
	}
	private static void delete(int id) throws SQLException{
		String sql="delete from homepage where id=?";
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		qr.update(sql,id);
	}
	
	public static void setImgURL(String url) throws SQLException{
		insert("img",url,null);
	}
	
	public void clearImgs(){
		for(Integer i:imgIds){
			try {
				delete(i);
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		for(String imgUrl:imgURLs){
			String realPath=context.getRealPath(imgUrl);
			File f=new File(realPath);
			if(f.exists())f.delete();
		}
	}
}
