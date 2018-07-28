package cn.cmas.web.controller;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.domain.database.StudentInfos;
import cn.cmas.domain.formbean.ClassAdmin;
import cn.cmas.domain.formbean.User;
import cn.cmas.service.ClassAdminService;
import cn.cmas.service.StudentInfosService;

public class ChangePwd extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String oldpwd;
	private String newpwd;
	public String execute() throws Exception {
		StudentInfosService sis = new StudentInfosService();
		ClassAdminService cas = new ClassAdminService();
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		System.out.println(oldpwd + " " + newpwd);
		//获得当前session中的用户
		User currentUser = (User) session.get("user");
		String id = currentUser.getId();
		System.out.println(currentUser);
		if(currentUser.getLevel() == 1) {
			StudentInfos student = sis.findStudentById(id);
			if(!student.getPwd().equals(oldpwd)) {
				context.put("error", "旧密码错误！");
				return "error";
			}
			sis.updatePwd(id, newpwd);
			return "sucess";
		}else{
			ClassAdmin admin = cas.findClassAdmin(id);
			if(!admin.getPwd().equals(oldpwd)) {
				context.put("error", "旧密码错误！");
				return "error";
			}
			cas.update(id, newpwd);
			return "sucess";
		}
	}
	public String getOldpwd() {
		return oldpwd;
	}
	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
}