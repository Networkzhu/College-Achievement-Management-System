package cn.cmas.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import cn.cmas.domain.database.StudentInfos;
import cn.cmas.utils.C3P0Utils;
import cn.cmas.utils.HibernateUtils;

public class StudentInfosDao {
	private QueryRunner queryRunner;
	public StudentInfosDao() {
		queryRunner = new QueryRunner(C3P0Utils.getDataSource());
	}
	public void insert(StudentInfos studentInfo) throws SQLException{
		String sql = "insert into studentinfos values(?,?,?,?,?,?,?)";
		queryRunner.update(sql, studentInfo.getId(), studentInfo.getPwd(), 
				studentInfo.getName(), studentInfo.getMajor(), studentInfo.getCclass(), 
				studentInfo.getGpa(), studentInfo.getLevel());
	}
	public StudentInfos findStudentById(String id) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		String sql = "select * from studentinfos where id = ?";
		SQLQuery sQuery = session.createSQLQuery(sql);
		sQuery.setParameter(0, id);
		sQuery.addEntity(StudentInfos.class);
		StudentInfos user = (StudentInfos)sQuery.uniqueResult();
		return user;
	}
	public void register(String id, String pwd) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		StudentInfos user = session.get(StudentInfos.class, id);
		user.setPwd(pwd);
		session.update(user);
	}
	public void deleteStudent(String id) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		StudentInfos user = session.get(StudentInfos.class, id);
		session.delete(user);
	}
	public void updatePwd(String id, String pwd) throws SQLException{
		String sql = "update studentinfos set pwd = ? where id = ?";
		queryRunner.update(sql, pwd, id);
	}
}
