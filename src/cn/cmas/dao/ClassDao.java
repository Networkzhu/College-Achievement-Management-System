package cn.cmas.dao;

import java.sql.CallableStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.mysql.jdbc.Connection;

import cn.cmas.domain.database.ClassStudentScores;
import cn.cmas.domain.formbean.CourseIdMapName;
import cn.cmas.domain.formbean.MajorBaseInfo;
import cn.cmas.domain.formbean.MajorClassInfo;
import cn.cmas.utils.C3P0Utils;

public class ClassDao {
	private QueryRunner queryRunner;
	public ClassDao() {
		queryRunner = new QueryRunner(C3P0Utils.getDataSource());
	}
	private static final String DRIVER_CLASS = "com.mysql.jdbc.Driver"; 
	private static final String URL = "jdbc:mysql:///College-Achievement-Management-System"; 
	private static final String USERNAME = "root"; 
	private static final String PASSWORD = "root"; 
	public Double getClassGpa(String id) throws SQLException, ClassNotFoundException{
		Class.forName(DRIVER_CLASS); 
		Connection connection = (Connection) DriverManager.getConnection(URL, USERNAME,PASSWORD);
		String sql = "{CALL getClassGpa(?,?)}";
		CallableStatement cstm = connection.prepareCall(sql);
		cstm.setString(1, id);
		cstm.registerOutParameter(2, Types.DOUBLE);
		cstm.execute();
		return cstm.getDouble(2);
	}
	public Integer getClassNum(String id) throws SQLException{
		String sql = "select COUNT(*) as num from studentinfos where cclass = ?";
		Integer num = Integer.valueOf(String.valueOf(queryRunner.query(sql, new ScalarHandler("num"), id)));
		return num;
	}
	public Double getClassNotPassRate(String id) throws SQLException{
		String sql = "select getClassNotPassRate(?) as rate";
		Double rate = (Double) queryRunner.query(sql, new ScalarHandler("rate"), id);
		return rate;
	}
	public Integer comTimes(String id) throws SQLException{
		String sql = "select count(*) as num from competitions, studentinfos where competitions.stuid = studentinfos.id and studentinfos.cclass=?;";
		Integer num = Integer.valueOf(String.valueOf(queryRunner.query(sql, new ScalarHandler("num"), id)));
		return num;
	}
	public Integer proTimes(String id) throws SQLException{
		String sql = "select count(*) as num from projects, studentinfos where projects.stuid = studentinfos.id and studentinfos.cclass=?;";
		Integer num = Integer.valueOf(String.valueOf(queryRunner.query(sql, new ScalarHandler("num"), id)));
		return num;
	}
	public ArrayList<ClassStudentScores> getEveryOneScoresInClass(String id) throws SQLException{
		String sql = "select * from classstudentscores where cclass = ? and pwd is not NULL";
		ArrayList<ClassStudentScores> list = (ArrayList<ClassStudentScores>) queryRunner.query(sql, new BeanListHandler<ClassStudentScores>(ClassStudentScores.class), id);
		return list;
	}
	public ArrayList<CourseIdMapName> getClassCourses(String id) throws SQLException{
		String sql = "select DISTINCT courses.id, courses.`name` from studentinfos, scores, courses where studentinfos.id = scores.stu_id and scores.cou_id = courses.id and studentinfos.cclass = ?";
		ArrayList<CourseIdMapName> list = (ArrayList<CourseIdMapName>) queryRunner.query(sql, new BeanListHandler<CourseIdMapName>(CourseIdMapName.class), id);
		return list;
	}
}