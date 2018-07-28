package cn.cmas.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.cmas.utils.C3P0Utils;
import cn.cmas.domain.database.StudentInfos;
import cn.cmas.domain.formbean.StudentCourseScoresBean;

public class StudentDao {
	private QueryRunner queryRunner;
	public StudentDao() {
		queryRunner = new QueryRunner(C3P0Utils.getDataSource());
	}
	public ArrayList<StudentCourseScoresBean> getCourseScores(String id) throws SQLException{
		String sql = "select name as name, type as type, score as score, coefficient as coefficient, score as gpa, "
				+ "credit as credit from courses, scores where courses.id = scores.cou_id and stu_id = ?";
		ArrayList<StudentCourseScoresBean> query = (ArrayList<StudentCourseScoresBean>) 
				queryRunner.query(sql, new BeanListHandler<StudentCourseScoresBean>(StudentCourseScoresBean.class), id);
		return query;
	}
	
	public double getAllCredits(String id) throws SQLException{
		String sql = "select SUM(courses.credit) as allcre from courses, scores where courses.id = scores.cou_id and stu_id = ? and scores.score >= 60";
		Double credits = (Double) queryRunner.query(sql, new ScalarHandler("allcre"), id);
		return credits != null?credits:0;
	}
	
	public ArrayList<StudentCourseScoresBean> getSaoCourseScoresAnd(int blimit, int tlimit, String type, String term, String id) throws SQLException{
		String sql = "select name as name, type as type, score as score, coefficient as coefficient, score as gpa, credit as credit"
				+ " from courses, scores where courses.id = scores.cou_id and scores.stu_id = ? and ((scores.score between ? and ?) and courses.type like ? and term like ?)";
		ArrayList<StudentCourseScoresBean> list = (ArrayList<StudentCourseScoresBean>) queryRunner.query
				(sql, new BeanListHandler<StudentCourseScoresBean>(StudentCourseScoresBean.class), id, blimit, tlimit, type, term);
		return list;
	}
	public ArrayList<StudentCourseScoresBean> getSaoCourseScoresOr(int blimit, int tlimit, String type, String term, String id) throws SQLException{
		String sql = "select name as name, type as type, score as score, coefficient as coefficient, score as gpa, credit as credit"
				+ " from courses, scores "
				+ "where courses.id = scores.cou_id and scores.stu_id = ? and ((scores.score between ? and ?) or courses.type like ? or term like ?)";
		ArrayList<StudentCourseScoresBean> list = (ArrayList<StudentCourseScoresBean>) queryRunner.query
				(sql, new BeanListHandler<StudentCourseScoresBean>(StudentCourseScoresBean.class), id, blimit, tlimit, type, term);
		return list;
	}
	public ArrayList<StudentInfos> getStudents() throws SQLException{
		String sql = "select * from studentinfos";
		ArrayList<StudentInfos> students = (ArrayList<StudentInfos>) queryRunner.query(sql, new BeanListHandler<StudentInfos>(StudentInfos.class));
		return students;
	}
	public Double getStudentPassRate(String id) throws SQLException{
		String sql = "select getStudentPassRate(?) as rate";
		Double rate = (Double) queryRunner.query(sql, new ScalarHandler("rate"), id);
		return rate;
	}
	public void signOffAccount(String id) throws SQLException{
		String sql1 = "delete from candp where stuid = ?";
		String sql2 = "delete from scores where stu_id = ?";
		String sql3 = "delete from studentinfos where id = ?";
		queryRunner.update(sql1, id);
		queryRunner.update(sql2, id);
		queryRunner.update(sql3, id);
	}
}