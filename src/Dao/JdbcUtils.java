package Dao;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;
/**
 * 该类用于包装数据连接池
 * 	-注意配好c3p0数据连接池的文件c3p0-config.xml
 * @author asus
 *
 */
public class JdbcUtils {
	//实例化连接池对象,并将其作为该类的一个私有变量保存
	private static ComboPooledDataSource dataSource=new ComboPooledDataSource();
	/**
	 * 该方法用于从外部获取连接池对象
	 * @return ComboPooledDataSource
	 */
	public static ComboPooledDataSource getDataSource(){
		return dataSource;
	}
	
	/**
	 * 该方法用于从外部获取一个连接池实例
	 * @return Connection 
	 */
	public static Connection getConnection(){
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
