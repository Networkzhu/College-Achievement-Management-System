package cn.cmas.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.cmas.domain.formbean.ClassCourseScores;
import cn.cmas.domain.formbean.MajorClassInfo;
import cn.cmas.utils.C3P0Utils;

public class MajorDao {
	private QueryRunner queryRunner;
	public MajorDao() {
		queryRunner = new QueryRunner(C3P0Utils.getDataSource());
	}
	public Double gpaAvg(String major) throws SQLException{
		String sql = "SELECT AVG(gpa) as avg FROM studentinfos WHERE major = ?";
		Double avg = (Double) queryRunner.query(sql, new ScalarHandler("avg"), major);
		return avg;
	}
	public Integer getMajorNotPassNum(String major) throws SQLException{
		String sql = "SELECT count(*) as num FROM studentinfos, scores "
				+ "WHERE scores.stu_id = studentinfos.id and major = ? and score <60";
		Integer num = Integer.valueOf(String.valueOf(queryRunner.query(sql, new ScalarHandler("num"), major)));
		return num;
	}
	public Double getMajorNotPassRate(String major) throws SQLException{
		String sql = "SELECT getMajorNotPassRate(?) as rate";
		Double rate = (Double) queryRunner.query(sql, new ScalarHandler("rate"), major);
		return rate;
	}
	public Integer comTimes(String major) throws SQLException{
		String sql = "SELECT count(*) as times from studentinfos, competitions where competitions.stuid = studentinfos.id and major = ?";
		Integer times = Integer.valueOf(String.valueOf(queryRunner.query(sql, new ScalarHandler("times"), major)));
		return times;
	}
	public Integer proTimes(String major) throws SQLException{
		String sql = "SELECT count(*) as times from studentinfos, projects where projects.stuid = studentinfos.id and major = ?";
		Integer times = Integer.valueOf(String.valueOf(queryRunner.query(sql, new ScalarHandler("times"), major)));
		return times;
	}
	public ArrayList<MajorClassInfo> getMajorClassInfo(String major) throws SQLException{
		String sql = "select *, class as id, notpassrate as passrate from classscore where major = ? order by (gpa) desc";
		ArrayList<MajorClassInfo> query = (ArrayList<MajorClassInfo>) queryRunner.query(sql, new BeanListHandler<MajorClassInfo>(MajorClassInfo.class), major);
		return query;
	}
	public ArrayList<ClassCourseScores> getClassCourseScores(String classid, String course) throws SQLException{
		String sql = "select studentinfos.id, studentinfos.`name`, scores.score, studentinfos.gpa as gpa from studentinfos, courses, scores where studentinfos.id = scores.stu_id and courses.id = scores.cou_id and courses.id = ? and studentinfos.cclass = ? ORDER BY scores.score DESC;";
		ArrayList<ClassCourseScores> list = (ArrayList<ClassCourseScores>) queryRunner.query(sql, new BeanListHandler<ClassCourseScores>(ClassCourseScores.class), course, classid);
		return list;
	}
}
