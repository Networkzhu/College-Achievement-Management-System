package cn.cmas.web.ui;

import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.domain.database.StudentInfos;
import cn.cmas.domain.formbean.CourseIdMapName;
import cn.cmas.domain.formbean.MajorBaseInfo;
import cn.cmas.domain.formbean.MajorClassInfo;
import cn.cmas.domain.formbean.User;
import cn.cmas.service.ClassService;
import cn.cmas.service.MajorService;
import cn.cmas.service.StudentService;

public class CollegeAdminUI extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private StudentService ss = new StudentService();
	private MajorService ms = new MajorService();
	private ClassService mycs = new ClassService();
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		//获得当前session中的用户
		User currentUser = (User) session.get("user");
		if(currentUser == null || currentUser.getLevel() < 3)
			return "illegal";
		//获得学号名单
		ArrayList<StudentInfos> students = ss.getStudents();
		context.put("students", students);
		
		//获得计算机专业基本信息
		MajorBaseInfo cs = ms.getMajorBaseInfo("cs");
		context.put("cs", cs);
		
		//获得信息安全专业基本信息
		MajorBaseInfo is = ms.getMajorBaseInfo("is");
		context.put("is", is);
		
		//存储计算机专业班级信息
		ArrayList<MajorClassInfo> css = ms.getMajorClassInfo("cs");
		context.put("css", css);

		//存储信息安全专业班级信息
		ArrayList<MajorClassInfo> iss = ms.getMajorClassInfo("is");
		context.put("iss", iss);
		
		//存储cs第一个选中的班级的科目
		ArrayList<CourseIdMapName> csCourse = null;
		if(css.size()>0)
			csCourse = mycs.getClassCourses(css.get(0).getId());
		context.put("csSelectCourse", csCourse);
		
		//存储is第一个选中的班级的科目
		ArrayList<CourseIdMapName> isCourse = null;
		if(iss.size()>0)
			isCourse = mycs.getClassCourses(iss.get(0).getId());
		context.put("isSelectCourse", isCourse);
		
		//存储年份
		context.put("byear", ms.getYears());
		context.put("tyear", ms.getYears()+3);
		System.out.println(ms.getYears());
		return "toCollegeAdmin";
	}
}