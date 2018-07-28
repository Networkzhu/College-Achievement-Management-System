package cn.cmas.web.ui;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: RegisterUI 
 * @Description: TODO(转发至注册页面) 
 * @author 詹金浩 
 * @date 2018年5月19日 下午10:12:56
 */
public class RegisterUI extends ActionSupport {
	private static final long serialVersionUID = 1L;

	public String registerUI() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();

		return "toRegisterUI";
	}
}