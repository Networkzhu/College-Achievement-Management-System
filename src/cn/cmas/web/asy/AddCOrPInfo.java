package cn.cmas.web.asy;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.domain.database.CAndPInfos;
import cn.cmas.service.CAndPService;

public class AddCOrPInfo extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String type;
	private String id;
	private String name;
	private String level;
	private String leader;
	private String time;
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		System.out.println(type + " " + id + " " + name + " " + level + " " + leader + " " + time);
		//数据库中status 为0表示project status为1表示competition
		CAndPInfos cpi = new CAndPInfos(name, time, level, leader, id, type);
		new CAndPService().insert(cpi);
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置http头，不使用浏览器缓冲
		response.setHeader("cache-control", "no-cache");
		//设置内容类型：xml异步交互是：“text/xml”;json异步交互此处是application/json
		response.setContentType("application/json;charset=utf-8"); 
		PrintWriter out = response.getWriter();
		out.write("");
		return null;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}