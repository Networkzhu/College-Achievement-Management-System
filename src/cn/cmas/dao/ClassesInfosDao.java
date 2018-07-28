package cn.cmas.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import cn.cmas.domain.formbean.ClassAdmin;
import cn.cmas.utils.C3P0Utils;
import cn.cmas.utils.HibernateUtils;

public class ClassesInfosDao {
	private QueryRunner queryRunner;
	public ClassesInfosDao() {
		queryRunner = new QueryRunner(C3P0Utils.getDataSource());
	}
	public ClassAdmin findClassAdmin(String id) throws SQLException {
		Session session = HibernateUtils.getCurrentSession();
		String sql = "select * from classadmins where id = ?";
		SQLQuery sQuery = session.createSQLQuery(sql);
		sQuery.addEntity(ClassAdmin.class);
		sQuery.setParameter(0, id);
		ClassAdmin ca = (ClassAdmin)sQuery.uniqueResult();
		return ca;
	}
	public void insert(String id, String pwd) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		ClassAdmin admin = session.get(ClassAdmin.class, id);
		admin.setPwd(pwd);
		session.update(admin);
	}
	public void update(String id, String pwd) throws SQLException{
		String sql = "update classadmins set pwd = ? where id = ?";
		queryRunner.update(sql, pwd, id);
	}
}