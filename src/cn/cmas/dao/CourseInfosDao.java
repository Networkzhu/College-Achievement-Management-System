package cn.cmas.dao;

import java.sql.SQLException;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import cn.cmas.domain.database.CourseInfos;
import cn.cmas.utils.HibernateUtils;

public class CourseInfosDao {
	public CourseInfos findCourseById(String id) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		String sql = "select * from courses where id = ?";
		SQLQuery sQuery = session.createSQLQuery(sql);
		sQuery.setParameter(0, id);
		sQuery.addEntity(CourseInfos.class);
		CourseInfos course = (CourseInfos)sQuery.uniqueResult();
		return course;
	}
	
	public void add(CourseInfos cou) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		session.save(cou);
	}
	public void delete(String id) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		CourseInfos courseInfos = session.get(CourseInfos.class, id);
		session.delete(courseInfos);
	}
}
