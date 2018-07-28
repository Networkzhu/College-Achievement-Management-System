package cn.cmas.dao;

import java.sql.SQLException;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import cn.cmas.domain.database.ScoresInfos;
import cn.cmas.utils.HibernateUtils;

public class ScoresInfosDao {
	public void add(ScoresInfos sco) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		session.save(sco);
	}
	public ScoresInfos findScoresById(String stu_id, String cou_id) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		String sql = "select * from scores where stu_id = ? and cou_id = ?";
		SQLQuery sQuery = session.createSQLQuery(sql);
		sQuery.setParameter(0, stu_id);
		sQuery.setParameter(1, cou_id);
		sQuery.addEntity(ScoresInfos.class);
		ScoresInfos course = (ScoresInfos)sQuery.uniqueResult();
		return course;
	}
	public void deleteById(int id) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		ScoresInfos courseInfos = session.get(ScoresInfos.class, id);
		session.delete(courseInfos);
	}
}
