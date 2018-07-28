package cn.cmas.service;

import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.cmas.dao.ScoresInfosDao;
import cn.cmas.domain.database.ScoresInfos;
import cn.cmas.utils.HibernateUtils;

public class ScoresInfosService {
	ScoresInfosDao cid = new ScoresInfosDao();
	public void add(ScoresInfos si) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			cid.add(si);
		} catch (SQLException e) {
			e.printStackTrace();
			tx.rollback();
		}
		tx.commit();
	}
	public ScoresInfos findCourseById(String stu_id, String cou_id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		ScoresInfos ci = null;
		try {
			ci = cid.findScoresById(stu_id, cou_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tx.commit();
		return ci;
	}
	public void delete(int id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			cid.deleteById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tx.commit();
	}
}
