package cn.cmas.web.asy;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.dao.MajorDao;
import cn.cmas.domain.formbean.ClassCourseScores;

public class QueryClassCourseScores extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String cclass;
	private String course;
	private MajorDao md = new MajorDao();
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		System.out.println(cclass + " " +course);
		ArrayList<ClassCourseScores> list = md.getClassCourseScores(cclass, course);
		
		String jsonString = JSON.toJSONString(list);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置http头，不使用浏览器缓冲
		response.setHeader("cache-control", "no-cache");
		//设置内容类型：xml异步交互是：“text/xml”;json异步交互此处是application/json
		response.setContentType("application/json;charset=utf-8"); 
		System.out.println(jsonString);
		response.getWriter().print(jsonString);
		
		return null;
	}
	public String getCclass() {
		return cclass;
	}
	public void setCclass(String cclass) {
		this.cclass = cclass;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
}