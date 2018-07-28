package cn.cmas.service;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import cn.cmas.dao.StudentDao;
import cn.cmas.domain.database.StudentInfos;
import cn.cmas.domain.formbean.StudentCourseScoresBean;

public class StudentService {
	StudentDao sDao = new StudentDao();
	public ArrayList<StudentCourseScoresBean> getCourseScores(String id) {
		DecimalFormat df = new DecimalFormat("######0.00");
		ArrayList<StudentCourseScoresBean> list = null;
		try {
			list = sDao.getCourseScores(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for(int i = 0; i < list.size(); i++)
			list.get(i).setGpa(Double.valueOf(df.format(changeScoresToGPA(list.get(i).getGpa()) * list.get(i).getCoefficient())));
		return list;
	}
	public Double getAllCredits(String id) {
		Double allCredits = null;
		try {
			allCredits = sDao.getAllCredits(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allCredits;
	}
	public ArrayList<StudentCourseScoresBean> getSaoCourseScoresAnd(int blimit, int tlimit, String type, String term, String id){
		ArrayList<StudentCourseScoresBean> list = null;
		try {
			list = sDao.getSaoCourseScoresAnd(blimit, tlimit, type, term, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for(int i = 0; i < list.size(); i++)
			list.get(i).setGpa(changeScoresToGPA(list.get(i).getGpa()));
		return list;
	}
	public ArrayList<StudentCourseScoresBean> getSaoCourseScoresOr(int blimit, int tlimit, String type, String term, String id){
		ArrayList<StudentCourseScoresBean> list = null;
		try {
			list = sDao.getSaoCourseScoresOr(blimit, tlimit, type, term, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for(int i = 0; i < list.size(); i++)
			list.get(i).setGpa(changeScoresToGPA(list.get(i).getGpa()));
		return list;
	}
	private double changeScoresToGPA(double score) {
		if(score >= 90)
			return 4.0;
		if(score >= 85)
			return 3.7;
		if(score >= 82)
			return 3.3;
		if(score >= 78)
			return 3.0;
		if(score >= 75)
			return 2.7;
		if(score >= 72)
			return 2.3;
		if(score >= 68)
			return 2.0;
		if(score >= 66)
			return 1.7;
		if(score >= 64)
			return 1.5;
		if(score >= 60)
			return 1.0;
		return 0;
	}
	public ArrayList<StudentInfos> getStudents(){
		ArrayList<StudentInfos> students = null;
		try {
			students = sDao.getStudents();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}
	public void signOffAccount(String id){
		try {
			sDao.signOffAccount(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public Long getTerms(String id) {		
		Date current = new Date(System.currentTimeMillis());
		DateFormat df= new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		Date intoCollege = null;
		try {
			intoCollege = df.parse("20"+id.substring(0, 2)+"-09-01-00-00-00");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Long mills = current.getTime() - intoCollege.getTime();
		return mills/((1000 * 60 * 60 * 24))/182 + 1;
	}
}