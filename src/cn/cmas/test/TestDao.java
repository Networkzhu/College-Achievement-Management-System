package cn.cmas.test;

import java.sql.SQLException;
import java.util.ArrayList;

import cn.cmas.dao.ClassDao;
import cn.cmas.dao.MajorDao;
import cn.cmas.dao.StudentDao;
import cn.cmas.domain.database.ClassStudentScores;
import cn.cmas.domain.formbean.ClassCourseScores;
import cn.cmas.domain.formbean.CourseIdMapName;
import cn.cmas.domain.formbean.MajorClassInfo;
import cn.cmas.service.ClassAdminService;
import cn.cmas.service.ClassService;
import cn.cmas.service.MajorService;
import cn.cmas.service.StudentInfosService;

public class TestDao {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		MajorDao md = new MajorDao();
		ArrayList<ClassCourseScores> list = md.getClassCourseScores("160341B", "2017002");
		for(ClassCourseScores e:list)
			System.out.println(e);
	}
}