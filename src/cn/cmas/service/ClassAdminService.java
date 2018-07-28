package cn.cmas.service;

import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.cmas.dao.ClassesInfosDao;
import cn.cmas.domain.formbean.ClassAdmin;
import cn.cmas.utils.HibernateUtils;

public class ClassAdminService {
	ClassesInfosDao cid = new ClassesInfosDao();
	public ClassAdmin findClassAdmin(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		ClassAdmin ca = null;
		try {
			ca = cid.findClassAdmin(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tx.commit();
		return ca;
	}
	public void insert(String id, String pwd) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			cid.insert(id, pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tx.commit();
	}
	public void update(String id, String pwd) {
		try {
			cid.update(id, pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}