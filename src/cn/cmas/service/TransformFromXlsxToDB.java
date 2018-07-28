package cn.cmas.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.cmas.constant.UploadXlsxFilePath;
import cn.cmas.constant.UserLevel;
import cn.cmas.domain.database.CourseInfos;
import cn.cmas.domain.database.ScoresInfos;
import cn.cmas.domain.database.StudentInfos;

public class TransformFromXlsxToDB {
	public static String studentInfos(String name) throws IOException{
		String path = UploadXlsxFilePath.UP_LOAD_XlSX_PATH + File.separator + name;
		File studentInfos = new File(path);
		StudentInfosService sis = new StudentInfosService();
		FileInputStream IStudentInfos = new FileInputStream(studentInfos);
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(IStudentInfos);
		XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
		int rowNum = xssfSheet.getPhysicalNumberOfRows();
		XSSFRow xssfRow = null;
		StudentInfos infoFromXlsx = new StudentInfos();
		StudentInfosService service = new StudentInfosService();
		System.out.println(rowNum);
		for(int i = 1; i < rowNum; i++) {
			xssfRow = xssfSheet.getRow(i);
			StudentInfos stu = sis.findStudentById(xssfRow.getCell(0).getStringCellValue());
			if(stu != null) {
				sis.deleteStudent(stu.getId());
				infoFromXlsx.setPwd(stu.getPwd());
			}
			infoFromXlsx.setId(xssfRow.getCell(0).getStringCellValue());
			infoFromXlsx.setName(xssfRow.getCell(1).getStringCellValue());
			infoFromXlsx.setMajor(xssfRow.getCell(2).getStringCellValue());
			infoFromXlsx.setCclass(xssfRow.getCell(3).getStringCellValue());
			infoFromXlsx.setGpa(xssfRow.getCell(4).getNumericCellValue());
			infoFromXlsx.setLevel(UserLevel.ONE);
			try {
				service.insert(infoFromXlsx);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return "sucess";
	}
	public static String courseInfos(String name) throws IOException{
		String path = UploadXlsxFilePath.UP_LOAD_XlSX_PATH + File.separator + name;
		File courseInfos = new File(path);
		CourseInfosService sis = new CourseInfosService();
		FileInputStream icourseInfos = new FileInputStream(courseInfos);
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(icourseInfos);
		XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
		int rowNum = xssfSheet.getPhysicalNumberOfRows();
		XSSFRow xssfRow = null;
		CourseInfos infoFromXlsx = new CourseInfos();
		for(int i = 1; i < rowNum; i++) {
			xssfRow = xssfSheet.getRow(i);
			CourseInfos cou = sis.findCourseById(String.valueOf(xssfRow.getCell(0).getStringCellValue()));
			if(cou != null)
				sis.delete(cou.getId());
			infoFromXlsx.setId(String.valueOf(xssfRow.getCell(0).getStringCellValue()));
			infoFromXlsx.setName(xssfRow.getCell(1).getStringCellValue());
			infoFromXlsx.setType(xssfRow.getCell(2).getStringCellValue());
			infoFromXlsx.setCoefficient(xssfRow.getCell(3).getNumericCellValue());
			infoFromXlsx.setCredit(xssfRow.getCell(4).getNumericCellValue());
			infoFromXlsx.setYear(xssfRow.getCell(5).getNumericCellValue());
			sis.add(infoFromXlsx);
		}
		return "sucess";
	}
	public static String scoresInfos(String name) throws IOException{
		String path = UploadXlsxFilePath.UP_LOAD_XlSX_PATH + File.separator + name;
		File courseInfos = new File(path);
		ScoresInfosService sis = new ScoresInfosService();
		FileInputStream icourseInfos = new FileInputStream(courseInfos);
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(icourseInfos);
		XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
		int rowNum = xssfSheet.getPhysicalNumberOfRows();
		XSSFRow xssfRow = null;
		ScoresInfos infoFromXlsx = new ScoresInfos();
		for(int i = 1; i < rowNum; i++) {
			xssfRow = xssfSheet.getRow(i);
			String stu_id = String.valueOf((int)xssfRow.getCell(0).getNumericCellValue());
			String cou_id = String.valueOf((int)xssfRow.getCell(1).getNumericCellValue());
			if(sis.findCourseById(stu_id, cou_id) != null){
				sis.delete(sis.findCourseById(stu_id, cou_id).getId());
			}
			infoFromXlsx.setStu_id(String.valueOf((int)xssfRow.getCell(0).getNumericCellValue()));
			infoFromXlsx.setCou_id(String.valueOf((int)xssfRow.getCell(1).getNumericCellValue()));
			infoFromXlsx.setScore((int)xssfRow.getCell(2).getNumericCellValue());
			infoFromXlsx.setYear((int)xssfRow.getCell(3).getNumericCellValue());
			infoFromXlsx.setTerm((int)xssfRow.getCell(4).getNumericCellValue());
			sis.add(infoFromXlsx);
		}
		return "sucess";
	}
}