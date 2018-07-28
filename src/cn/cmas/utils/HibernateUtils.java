package cn.cmas.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	//保证每个Web应用都只有一个SessionFactory对象
	private static SessionFactory sessionFactory;
	static {
		Configuration configuration = new Configuration().configure();
		sessionFactory = configuration.buildSessionFactory();
	}
	//获得全新的Session对象
	//必须在  hibernate.cfg.xml 中  配置   指定Session与当前线程绑定
	public static Session openSession() {
		Session session = sessionFactory.openSession();
		return session;
	}
	
	//获得与线程绑定的Session对象
	public static Session getCurrentSession() {
		Session session = sessionFactory.getCurrentSession();
		return session;
	}
}
