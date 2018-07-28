package cn.cmas.service;

import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.cmas.dao.CAndPDao;
import cn.cmas.domain.database.CAndPInfos;
import cn.cmas.utils.HibernateUtils;

public class CAndPService {
	private CAndPDao cpd = new CAndPDao();
	public void insert(CAndPInfos cp) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction tx = session.beginTransaction();
		CAndPInfos cpi = null;
		try {
			cpi = cpd.getCpi(cp);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		if(cpi == null) {
			try {
				cpd.insert(cp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		tx.commit();
	}
}
