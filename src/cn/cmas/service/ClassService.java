package cn.cmas.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.cmas.dao.ClassDao;
import cn.cmas.domain.database.ClassStudentScores;
import cn.cmas.domain.formbean.ClassBaseInfoBean;
import cn.cmas.domain.formbean.CourseIdMapName;

public class ClassService {
	ClassDao cd = new ClassDao();
	public Double getClassGpa(String id) {
		Double gpa = null;
		try {
			gpa = cd.getClassGpa(id);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return gpa;
	}
	public ClassBaseInfoBean getClassBaseInfo(String id) {
		ClassBaseInfoBean cbib = new ClassBaseInfoBean();
		try {
			cbib.setAllNum(cd.getClassNum(id));
			cbib.setComTimes(cd.comTimes(id));
			String notPassRate = String.valueOf(1 - cd.getClassNotPassRate(id));
			cbib.setNotPassRate(notPassRate.length() > 4?notPassRate.substring(0, 4):notPassRate);
			cbib.setProTimes(cd.proTimes(id));
			String classGpa = String.valueOf(cd.getClassGpa(id));
			cbib.setGpa(classGpa.length() > 4?classGpa.substring(0, 4):classGpa);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cbib;
	}
	public ArrayList<ClassStudentScores> getEveryOneScoresInClass(String id){
		ArrayList<ClassStudentScores> list = null;
		try {
			list = cd.getEveryOneScoresInClass(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for(int i = 0; i < list.size(); i++){
			String passrate = list.get(i).getPassrate();
			if(passrate.length() >= 4)
				list.get(i).setPassrate(passrate.substring(0,4));
		}
		return list;
	}
	public ArrayList<CourseIdMapName> getClassCourses(String id){
		ArrayList<CourseIdMapName> list = null;
		try {
			list = cd.getClassCourses(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
