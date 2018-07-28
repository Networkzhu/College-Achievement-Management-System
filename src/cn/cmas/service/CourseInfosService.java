package cn.cmas.service;

import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.cmas.dao.CourseInfosDao;
import cn.cmas.domain.database.CourseInfos;
import cn.cmas.utils.HibernateUtils;

public class CourseInfosService {
	CourseInfosDao cid = new CourseInfosDao();
	public CourseInfos findCourseById(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		CourseInfos ci = null;
		try {
			ci = cid.findCourseById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tx.commit();
		return ci;
	}
	public void add(CourseInfos ci) { 
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			cid.add(ci);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tx.commit();
	}
	public void delete(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			cid.delete(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tx.commit();
	}

}