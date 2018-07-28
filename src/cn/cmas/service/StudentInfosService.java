package cn.cmas.service;

import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.cmas.dao.StudentInfosDao;
import cn.cmas.domain.database.StudentInfos;
import cn.cmas.utils.HibernateUtils;

public class StudentInfosService {
	StudentInfosDao studentInfosDao = new StudentInfosDao();
	public void insert(StudentInfos studentInfo) throws SQLException{
		try {
			studentInfosDao.insert(studentInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public StudentInfos findStudentById(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		StudentInfos findStudentById = null;
		try {
			findStudentById = studentInfosDao.findStudentById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tx.commit();
		return findStudentById;
	}
	public void register(String id, String pwd){
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			studentInfosDao.register(id, pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tx.commit();
	}
	public void deleteStudent(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			studentInfosDao.deleteStudent(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tx.commit();
	}
	public void updatePwd(String id, String pwd) {
		try {
			studentInfosDao.updatePwd(id, pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}