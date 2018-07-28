<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Insert_Title_Here</title>
		<link rel="stylesheet" href="public/bootstrap/css/bootstrap.min.css" />
		<script src="public/js/jquery-3.2.1.min.js"></script>
		<script src="public/bootstrap/js/bootstrap.min.js"></script>
		<script src="public/js/holder.min.js"></script>
		<link href="public/bootstrap/css/bootstrap-select.min.css" rel="stylesheet" />
		<script src="public/bootstrap/js/bootstrap-select.js"></script>
		<script src="public/js/myjs.js"></script>
		<link  rel="stylesheet" href="public/css/style.css" />
		
		<link rel="stylesheet" href="../public/bootstrap/css/bootstrap.min.css" />
		<script src="../public/js/jquery-3.2.1.min.js"></script>
		<script src="../public/bootstrap/js/bootstrap.min.js"></script>
		<script src="../public/js/holder.min.js"></script>
		<link  rel="stylesheet" href="../public/bootstrap/css/bootstrap-select.min.css"/>
		<script src="../public/bootstrap/js/bootstrap-select.js"></script>
		<script src="../public/js/myjs.js"></script>
		<link href="../public/css/style.css" rel="stylesheet" />
	</head>
	<style>
		.form-line-up{
		    background-color:#337AB7;
		}
		.login-title{
			padding-left: 30%;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#MyLogin").click(function(){
				if(checkId()&checkPwd()){
					var oldpwd = document.getElementById("oldpwd").value;
					var newpwd = document.getElementById("newpwd").value;
					var url = "${pageContext.request.contextPath}/user/changePwd";
			        var form = $("#loginForm").attr("action", url).attr("method", "post");
			        form.submit();
			        return true;
				}
				return false;
			});
		});
		function checkId(){
			var value = document.getElementById("oldpwd").value;
			if(value.length != 0)
				return true;
			document.getElementById("idError").innerHTML = "旧密码不能为空";
			return false;
		}
		function checkPwd(){
			var value = document.getElementById("newpwd").value;
			if(value.length > 5)
				return true;
			document.getElementById("pwdError").innerHTML = "新密码长度不低于6位！";
			return false;
		}
	</script>
	<!-- 后面的覆盖前面的且只覆盖相同属性的原则-->
	<style>
		.form-line-up{
		    background-color:#337AB7;
		}
		.login-title{
			padding-left: 30%;
		}
	</style>
	<body>
		<!--顶部效果-->
		<%@ include file="/WEB-INF/header.jsp" %>
		
		<!--登陆标识-->
		<div class="login-title">修改密码</div>
		
		<!--登录框-->
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<div class="form-line-up"></div>
				<div class="row">
					<div class="col-md-offset-1 col-md-10">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="panel-title" style="text-align: center;">
									<img style="height: 90px; border-radius: 50%;" src="holder.js/100x100" alt="">
								</div>
							</div>
							<div class="panel-body">
								<form name="denglu" id="loginForm">
									<div class="form-group">
										<div class="input-group input-group-lg">
											<span class="input-group-addon">
												旧密码
											</span>
											<input type="text" class='form-control' placeholder='旧密码...' id="oldpwd" name="oldpwd"
												onblur="checkId()" onfocus="hideError('idError')">
										</div>
										<div class="error" id="idError"></div>
									</div>
									<div class="form-group">
										<div class="input-group input-group-lg">
											<span class="input-group-addon">
												新密码
											</span>
											<input type="password" class='form-control' placeholder='密码...' id="newpwd" name="newpwd" 
												onblur="checkPwd()" onfocus="hideError('pwdError')" >
										</div>
										<div class="error" id="pwdError"></div>
										<div class="error" id="loginError">${requestScope.error }</div>
									</div>
									<div class="form-group ok" style="text-align: center;" id = "MyLogin">
										<input style="width: 100%;" id="sub" type="submit" value="修改密码" class='btn btn-primary btn-lg'>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--底部效果-->
		<%@ include file="/WEB-INF/footer.jsp" %>
	</body>
</html>