package cn.cmas.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.hibernate.Session;

import cn.cmas.domain.database.CAndPInfos;
import cn.cmas.domain.formbean.ClassAdmin;
import cn.cmas.utils.C3P0Utils;
import cn.cmas.utils.HibernateUtils;

public class CAndPDao {
	/*
	 * 视图定义
	 * create view projects as select id as 'id', name as 'name', year as 'year', levelorprize as 'level', is_leader as 'is_leader', stuid as 'stuid' from candp where `status` = '0';
	 */
	private QueryRunner queryRunner;
	public CAndPDao() {
		queryRunner = new QueryRunner(C3P0Utils.getDataSource());
	}
	public void insert(CAndPInfos cp) throws SQLException{
		Session session = HibernateUtils.getCurrentSession();
		session.save(cp);
	}
	public CAndPInfos getCpi(CAndPInfos cp) throws SQLException{
		String sql = "select * from candp where name = ? and year=? and levelorprize=? and stuid=? and status=?";
		return queryRunner.query(sql, new BeanHandler<CAndPInfos>(CAndPInfos.class), cp.getName(), cp.getYear(), cp.getLevelorprize(), cp.getStuid(), cp.getStatus());
	}
}