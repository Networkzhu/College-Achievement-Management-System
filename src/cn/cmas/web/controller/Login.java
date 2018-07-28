package cn.cmas.web.controller;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.domain.database.StudentInfos;
import cn.cmas.domain.formbean.ClassAdmin;
import cn.cmas.domain.formbean.User;
import cn.cmas.service.ClassAdminService;
import cn.cmas.service.StudentInfosService;

/**
 * @ClassName: Login 
 * @Description: TODO(学生登录、班级管理员登录) 
 * @author 詹金浩 
 * @date 2018年5月22日 下午6:13:48
 */
public class Login extends ActionSupport {
	StudentInfosService sis = new StudentInfosService();
	ClassAdminService cas = new ClassAdminService();
	private static final long serialVersionUID = 1L;
	private String id;
	private String pwd;
	private String type;
	public String login() throws Exception {
		if(type.equals("student")) {
			return studentLogin();
		}else {
			return classAdminLogin();
		}
	}
	
	private String classAdminLogin() {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = ActionContext.getContext().getSession();
		ClassAdmin admin = cas.findClassAdmin(id);
		if(admin == null) {
			context.put("loginErr", "班级不存在");
			return "loginErr";
		}
		if(admin.getPwd() == null) {
			context.put("loginErr", "班级未注册");
			return "loginErr";
		}
		if(!admin.getPwd().equals(pwd)) {
			context.put("loginErr", "帐号或密码错误");
			return "loginErr";
		}
		User login = new User(id, admin.getCclass(), 2);
		session.put("user", login);
		return "toClassAdminUI";
	}
	private String studentLogin() {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = ActionContext.getContext().getSession();
		StudentInfos user = sis.findStudentById(id);
		if(user == null) {
			context.put("loginErr", "学号不存在");
			return "loginErr";
		}
		if(user.getPwd() == null) {
			context.put("loginErr", "学号未注册");
			return "loginErr";
		}
		if(!user.getPwd().equals(pwd)) {
			System.out.println(pwd + "   " + user.getPwd());
			context.put("loginErr", "学号或密码错误");
			return "loginErr";
		}
		User login = new User(user.getId(), user.getName(), user.getLevel());
		session.put("user", login);
		return "toStudentUI";
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}