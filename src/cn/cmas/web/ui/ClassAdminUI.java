package cn.cmas.web.ui;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.domain.database.ClassStudentScores;
import cn.cmas.domain.formbean.ClassBaseInfoBean;
import cn.cmas.domain.formbean.User;
import cn.cmas.service.ClassService;

public class ClassAdminUI extends ActionSupport {
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);  
		ClassService cs = new ClassService();
		//获得当前session中的用户
		String classId = null;
		User currentUser = (User) session.get("user");
		if(currentUser != null && currentUser.getLevel() == 2) {
			classId = currentUser.getName();
		}else if(currentUser != null && currentUser.getLevel() > 2) {
			classId= request.getParameter("visitor_2");
			if(classId == null)
				return "illegal";
		}else
			return "illegal";

		//封装基本信息
		ClassBaseInfoBean cbib = cs.getClassBaseInfo(classId);
		cbib.setClassName(classId);
		context.put("cbib", cbib);
		
		//封装每个学生的成绩
		ArrayList<ClassStudentScores> list = cs.getEveryOneScoresInClass(classId);
		context.put("infos", list);
		return "toClassAdmin";
	}
}