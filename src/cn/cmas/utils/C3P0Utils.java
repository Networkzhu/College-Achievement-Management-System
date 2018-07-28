package cn.cmas.utils;

import java.sql.SQLException;

import javax.sql.DataSource;
import java.sql.Connection;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * @ClassName: C3P0Utils
 * @Description: TODO(提供C3P0连接池的常用功能) 
 * @author 詹金浩 
 * @date 2018年3月8日 下午1:10:34
 */
public class C3P0Utils {
	
	//定义一个连接池对象
	private static DataSource dataSource;
	
	//使用ThreadLocal提供Connection的副本保证并发访问数据库时的安全
	private static ThreadLocal<Connection> threadLocal;
	
	//使用静态代码块在每次服务器开启的时候默认连接C3P0中的数据库
	//在每次开启服务时创建一个线程局部对象，保证每个线程有一个数据库连接的副本
	static {
		dataSource = new ComboPooledDataSource();
		threadLocal = new ThreadLocal<>();
	}
	/**
	 * @Title: getDataSource 
	 * @Description: TODO(返回一个连接池对象) 
	 * @return DataSource
	 */
	public static DataSource getDataSource() {
		return dataSource;
	}
	
	/**
	 * @Title: getConnection 
	 * @Description: TODO(获得一个数据库的连接) 
	 * @return Connection
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		Connection con = threadLocal.get();
		if (con == null) {
			con = dataSource.getConnection();
			threadLocal.set(con);
		}
		return con;
	}
}