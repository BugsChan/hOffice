package Service;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import Dao.JdbcUtils;

/**
 * 通过构造方法(传入参数为用户账号),可以获取用户文件集合,并通过get方法获取用户文件
 * @author 陈子为 局座
 *
 */
public class DocService {
	private int id;
	private List<Doc> docs;
	public DocService(){}
	public DocService(int id){
		this.id=id;
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="select src,date from docs where userId=?";
		try {
			docs=qr.query(sql, new DocHandler(),id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public Doc get(int i){
		return docs.get(i);
	}
	
	public int length(){
		return docs.size();
	}
	/**
	 * 删除一个用户所有的文件
	 * @param context
	 * @return
	 */
	public boolean removeAll(ServletContext context){
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="delete from docx where userId=?";
		try{
			qr.update(sql,id);
			for(int i=0;i<docs.size();i++){
				File file=new File(context.getRealPath(docs.get(i).getPath()));
				if(file.exists())file.delete();
			}
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	/**
	 * 删除一个用户某个日期之前写入的文件
	 * @param date
	 * @return
	 * @throws ParseException 
	 */
	public boolean removeByDate(String date,ServletContext context){
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="delete from docs where date < ?";
		try {
			qr.update(sql);
			for(int i=0;i<docs.size();i++){
				Date puttingDate=docs.get(i).getDate();
				Date testDate=null;
				try{
					testDate=new SimpleDateFormat("yyyy-MM-dd").parse(date);
				}catch(ParseException e){}
				if(puttingDate.before(testDate)){
					File file=new File(context.getRealPath(docs.get(i).getPath()));
					if(file.exists())file.delete();
				}
			}
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
	
	/**
	 * 测试是否有重名
	 * @param title
	 * @return
	 */
	public boolean hasSame(String title){
		for(int i=0;i<docs.size();i++){
			if(title.equals(docs.get(i).getName()))return true;
		}
		return false;
	}
	
	public static String getPath(String uuid){
		if(uuid.length()!=32)return null;
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="select src from docs where src like ?";
		String path=null;
		try {
			path=(String)qr.query(sql, new ScalarHandler(),"%/"+uuid+"%");
		} catch (SQLException e) {
			return null;
		}
		return path;
	}
	
	public static boolean removeByUUID(String uuid,String userid,ServletContext context){
		if(uuid.length()!=32)return false;
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="select userId,src from docs where src like ?";
		Map<String, Object> msg;
		try {
			msg = qr.query(sql, new MapHandler(),"%/"+uuid+"%");
			sql="delete from docs where src = ?";
			if(!userid.endsWith(String.valueOf((Integer)msg.get("userId"))))return false;
		} catch (SQLException e1) {
			return false;
		}
		try{
			String path=(String)msg.get("src");
			qr.update(sql,path);
			File file=new File(context.getRealPath(path));
			if(file.exists())file.delete();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
}

class DocHandler implements ResultSetHandler<List<Doc>>{
	public List<Doc> handle(ResultSet rs) throws SQLException {
		List<Doc> docs=new ArrayList<Doc>();
		while(rs.next()){
			String url=rs.getString("src");
			Doc doc=new Doc();
			doc.setPath(url);
			Date date=(java.util.Date)rs.getDate("date");
			doc.setDate(date);
			docs.add(doc);
		}
		return docs;
	}
}

