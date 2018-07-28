package cn.cmas.web.asy;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.domain.formbean.CourseIdMapName;
import cn.cmas.service.ClassService;

public class QueryClassCourse extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String cs_class;
	ClassService cs = new ClassService();
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		System.out.println(cs_class);
		
		ArrayList<CourseIdMapName> courses = cs.getClassCourses(cs_class);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置http头，不使用浏览器缓冲
		response.setHeader("cache-control", "no-cache");
		//设置内容类型：xml异步交互是：“text/xml”;json异步交互此处是application/json
		response.setContentType("application/json;charset=utf-8"); 
		PrintWriter out = response.getWriter();
		String result = JSON.toJSONString(courses);
		System.out.println(result);
		out.print(result);
		return null;
	}
	public String getCs_class() {
		return cs_class;
	}
	public void setCs_class(String cs_class) {
		this.cs_class = cs_class;
	}
}