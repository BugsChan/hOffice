package Service;

import java.sql.SQLException;
import java.util.Date;

import org.apache.commons.dbutils.QueryRunner;

import Dao.JdbcUtils;

public class TongjiService {
	public static int append100(String type){
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
		String sql="insert into tongji values(?,?,?)";
		int i=0;
		try {
			i=qr.update(sql,type,100,new java.sql.Date(new Date().getTime()));
		} catch (SQLException e) {
			return i++;
		}
		return i==1?0:i++;
	}
}
