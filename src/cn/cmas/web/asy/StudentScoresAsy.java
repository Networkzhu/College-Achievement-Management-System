package cn.cmas.web.asy;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.domain.formbean.StudentCourseScoresBean;
import cn.cmas.domain.formbean.User;
import cn.cmas.service.StudentService;

public class StudentScoresAsy extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String term;
	private String type;
	private String pass;
	private String rel;
	private StudentService ss = new StudentService();
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		//获得当前session中的用户
		User currentUser = (User) session.get("user");
		String qid = null;
		if(currentUser.getLevel() != 1) {
			qid = ((User) session.get("visitor_1")).getId();
		}else
			qid = currentUser.getId();
		//确定查询范围
		int qblimit = -1;
		int qtlimit = 101;
		if(pass.equals("yes")) {
			qblimit = 59;
			qtlimit = 101;
		}
		if(pass.equals("no")) {
			qblimit = -1;
			qtlimit = 60;
		}
		String qtype = type;
		String qterm = term;
		ArrayList<StudentCourseScoresBean> scores = null;
		if(rel.equals("and"))
			scores = ss.getSaoCourseScoresAnd(qblimit, qtlimit, qtype, qterm, qid);
		else
			scores = ss.getSaoCourseScoresOr(qblimit, qtlimit, qtype, qterm, qid);
		HttpServletResponse response = ServletActionContext.getResponse();
		for(int i = 0; i < scores.size(); i++)
			scores.get(i).setType(changeTypeToCharacter(scores.get(i).getType()));
		//设置http头，不使用浏览器缓冲
		response.setHeader("cache-control", "no-cache");
		//设置内容类型：xml异步交互是：“text/xml”;json异步交互此处是application/json
		response.setContentType("application/json;charset=utf-8"); 
		PrintWriter out = response.getWriter();
		String result = JSON.toJSONString(scores);
		out.print(result);
		return null;
	}
	private String changeTypeToCharacter(String i){
		if(i.equals("1"))
			return "必修";
		if(i.equals("2"))
			return "专选";
		if(i.equals("3"))
			return "公选";
		return null;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getRel() {
		return rel;
	}
	public void setRel(String rel) {
		this.rel = rel;
	}
}