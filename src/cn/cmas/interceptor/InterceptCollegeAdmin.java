package cn.cmas.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import cn.cmas.domain.formbean.User;

public class InterceptCollegeAdmin extends MethodFilterInterceptor {
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> map=invocation.getInvocationContext().getParameters();
		String[] names =(String[]) map.get("id");
		String[] pwds = (String[])map.get("pwd");
		if(names == null || pwds == null) {
			return "existNull";
		}
		if(names[0].equals("jhzhan_16") && pwds[0].equals("jhzhan_16")) {
			Map<String, Object> session = invocation.getInvocationContext().getSession();
			User user = new User("jhzhan_16", "管理员", 3);
			session.put("user", user);
			return "toCollegeAdmin";
		}
		String result = invocation.invoke();
		return result;
	}
}
