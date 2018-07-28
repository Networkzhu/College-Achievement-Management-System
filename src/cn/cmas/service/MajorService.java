package cn.cmas.service;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import cn.cmas.dao.MajorDao;
import cn.cmas.domain.formbean.ClassCourseScores;
import cn.cmas.domain.formbean.MajorBaseInfo;
import cn.cmas.domain.formbean.MajorClassInfo;

public class MajorService {
	MajorDao md = new MajorDao();
	public MajorBaseInfo getMajorBaseInfo(String major) {
		MajorBaseInfo mbi = new MajorBaseInfo();
		if(major.equals("cs"))
			mbi.setMajor("计算机科学与技术");
		else
			mbi.setMajor("信息安全");
		try {
			String gpa = String.valueOf(md.gpaAvg(major));
			mbi.setGpa(gpa.length()<4?gpa:gpa.substring(0, 4));
			mbi.setComTimes(String.valueOf(md.comTimes(major)));
			mbi.setProTimes(String.valueOf(md.proTimes(major)));
			String rate = String.valueOf(md.getMajorNotPassRate(major));
			mbi.setNotPassRate(rate.length()<4?rate:rate.substring(0, 4));
			mbi.setNotPassTimes(String.valueOf(md.getMajorNotPassNum(major)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mbi;
	}
	public ArrayList<MajorClassInfo> getMajorClassInfo(String major){
		ArrayList<MajorClassInfo> list = null;
		try {
			list = md.getMajorClassInfo(major);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for(int i = 0; i < list.size(); i++){
			String notPassRate = list.get(i).getPassRate();
			String passRate = null;
			if(notPassRate == null)
				passRate = "1.00";
			else
				passRate = String.valueOf(1-Double.valueOf(notPassRate));
			passRate = passRate.length() < 4?passRate : passRate.substring(0, 4);
			
			list.get(i).setPassRate(passRate);
			
			String gpa = list.get(i).getGpa();
			gpa = gpa.length()<4?gpa:gpa.substring(0, 4);
			list.get(i).setGpa(gpa);
		}
		return list;
	}
	public ArrayList<ClassCourseScores> getClassCourseScores(String classid, String course){
		ArrayList<ClassCourseScores> list = null;
		try {
			list = md.getClassCourseScores(classid, course);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public Long getYears() {
		Date current = new Date(System.currentTimeMillis());
		DateFormat df= new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String str_current = df.format(current);
		return Long.valueOf(str_current.split("-")[0]) - 3;
	}
}
