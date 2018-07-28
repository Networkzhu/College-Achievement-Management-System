package cn.cmas.web.ui;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.domain.formbean.User;

/**
 * @ClassName: LoginUI 
 * @Description: TODO(转发至登录页面) 
 * @author 詹金浩 
 * @date 2018年5月19日 下午7:50:14
 */
public class LoginUI extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public String loginui() throws Exception {
		
		System.out.println("aaaaaa进来了！！");
		
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		Map<String, Object> session = context.getSession();
		if(session != null)
			session.clear();
		return "toLoginUI";
	}
}