package cn.cmas.web.controller;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.constant.UserLevel;
import cn.cmas.domain.database.StudentInfos;
import cn.cmas.domain.formbean.ClassAdmin;
import cn.cmas.domain.formbean.User;
import cn.cmas.service.ClassAdminService;
import cn.cmas.service.StudentInfosService;

public class Register extends ActionSupport {
	private static final String[] classes = {"cs140341A", "cs140341B", "cs140341C", "is140342A", "is140342B",
						"cs150341A", "cs150341B", "cs150341C", "is150342A", "is150342B",
						"cs160341A", "cs160341B", "cs160341C", "is160342A", "is160342B",
						"cs170341A", "cs170341B", "cs170341C", "is170342A", "is170342B"};
	StudentInfosService sis = new StudentInfosService();
	private static final long serialVersionUID = 1L;
	private String id;
	private String type;
	private String pwd;
	public String register() throws Exception {
		if(type.equals("student")) {
			return studentRegister();
		}else
			return classAdminRegister();
	}

	private String classAdminRegister() {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = ActionContext.getContext().getSession();
		ClassAdminService cas = new ClassAdminService();
		Boolean flag = false;
		for(String e:classes) {
			if(e.equals(id)){
				flag = true;
				break;	
			}
		}
		if(!flag) {
			context.put("registerErr", "班级不存在");
			return "registerErr";
		}
		ClassAdmin admin = cas.findClassAdmin(id);
		if(admin.getPwd() != null) {
			context.put("registerErr", "班级已有管理员");
			return "registerErr";
		}
		cas.insert(id, pwd);
		User user = new User(id, admin.getCclass(), 2);
		session.put("user", user);
		return "toClassAdmin";
	}


	private String studentRegister() {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = ActionContext.getContext().getSession();
		StudentInfos user = sis.findStudentById(id);
		if(user == null)
		{
			context.put("registerErr", "学号不存在！");
			return "registerErr";
		}else if(user.getPwd() != null) {
			context.put("registerErr", "学号已注册过！");
			return "registerErr";
		}
		User registeruser = new User(user.getId(), user.getName(), UserLevel.ONE);
		System.out.println(registeruser);
		sis.register(id, pwd);
		session.put("user", registeruser);
		return "toStudent";
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}