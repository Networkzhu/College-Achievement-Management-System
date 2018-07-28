package cn.cmas.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import cn.cmas.service.MajorService;
import cn.cmas.service.StudentService;

public class TestDate {
	public static void main(String[] args) {
		MajorService ms = new MajorService();
		System.out.println(ms.getYears());
	}
}
