package cn.cmas.web.ui;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.dao.StudentInfosDao;
import cn.cmas.domain.database.StudentInfos;
import cn.cmas.domain.formbean.StudentBaseInfoBean;
import cn.cmas.domain.formbean.StudentCourseScoresBean;
import cn.cmas.domain.formbean.User;
import cn.cmas.service.StudentInfosService;
import cn.cmas.service.StudentService;

public class StudentUI extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		StudentInfosService sis = new StudentInfosService();
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);  
		//获得当前session中的用户
		String userid = null;
		User currentUser = (User) session.get("user");
		if(currentUser == null)
			return "illegal";
		if(currentUser != null) {
			userid = request.getParameter("visitor_1");
			if(userid != null)
				session.put("visitor_1", new User(userid, null, currentUser.getLevel()));
			if(currentUser.getLevel() == 1) {
				userid = currentUser.getId();
			}else if (currentUser.getLevel() == 2) {
				if(userid == null || !sis.findStudentById(userid).getCclass().equals(currentUser.getName()))
					return "illegal";
			}else if (currentUser.getLevel() == 3) {
				if(userid == null)
					return "illegal";
			}
			else 
				return "illegal";
		}


		//获取基本信息到request域中
		StudentInfos si = sis.findStudentById(userid);
		StudentBaseInfoBean sbib = new StudentBaseInfoBean(si.getId(), si.getName(), si.getMajor(), si.getGpa());
		context.put("sbib", sbib);
		
		//成绩信息封装到request域中
		StudentService ss = new StudentService();
		ArrayList<StudentCourseScoresBean> scores = ss.getCourseScores(userid);
		context.put("scores", scores);
		
		//封装总学分信息
		Double allCredits = ss.getAllCredits(userid);
		context.put("allCredits", allCredits);
		context.put("resCredits", 170 - allCredits);
		
		//封装学期
		context.put("terms", ss.getTerms(userid));
		return "toStudent";
	}
}