package cn.cmas.web.asy;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadCoursesInfo extends ActionSupport {
	private static final long serialVersionUID = 1L;

	public String uploadCoursesInfo() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();

		return "sucess";
	}
}