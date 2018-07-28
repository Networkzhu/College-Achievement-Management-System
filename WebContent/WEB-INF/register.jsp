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
		<script src="public/js/holder.min.js"></script>
		<link href="public/css/style.css" rel="stylesheet" />
		
		<link rel="stylesheet" href="../public/bootstrap/css/bootstrap.min.css" />
		<script src="../public/js/jquery-3.2.1.min.js"></script>
		<script src="../public/bootstrap/js/bootstrap.min.js"></script>
		<script src="../public/js/holder.min.js"></script>
		<link href="../public/bootstrap/css/bootstrap-select.min.css" rel="stylesheet" />
		<script src="../public/bootstrap/js/bootstrap-select.js"></script>
		<script src="../public/js/myjs.js"></script>
		<script src="../public/js/holder.min.js"></script>
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
		$("#MyRegister").click(function(){
			if(checkId()&checkPwd()){
				var type = document.getElementById("type").value;
				if(type == "班级学生"){
					type = "student";
				}else if(type == "班级管理员"){
					type = "classAdmin";
				}
				var id = document.getElementById("id").value;
				var pwd = document.getElementById("pwd").value;
				var url = "${pageContext.request.contextPath}/user/register";
		        var form = $("#registerForm").attr("action", url).attr("method", "post");
		        form.append($("<input></input>").attr("type", "hidden").attr("name", "type").attr("value", type));
		        form.submit();
		        return true;
			}else
				return false;
		});
	});
	function checkId(){
		var value = document.getElementById("id").value;
		match1 = /[1][567][0][3][4][12][123][0-9][0-9]/;
		match2 = /[ic][s][1][567][0][3][4][12][ABC]/;
		if(match1.test(value) || match2.test(value) || value == "jhzhan_16")
			return true;
		document.getElementById("idError").innerHTML = "学号格式错误！";
		return false;
	}
	window.onload = function(){
		if('${requestScope.registerErr}' == '')
			$('#myModal').modal(); 
	}
	</script>
	<body>
		<!--顶部效果-->
		<%@ include file="/WEB-INF/header.jsp" %>
		
		<!--登陆标识-->
		<div class="login-title">注册</div>
		
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
								<form name="register" id = "registerForm">
									<div class="form-group">
										<div class="input-group input-group-lg">
											<span class="input-group-addon">
												类别
											</span>
											<select class="form-control" class="selectpicker" id="type">
										　　　　<option selected>班级学生</option>
										　　　　<option>班级管理员</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group input-group-lg">
											<span class="input-group-addon">
												学号
											</span>
											<input type="text" class='form-control' placeholder='学号....' id="id" name='id'
												onblur="checkId()" onfocus="hideError('idError')">
										</div>
										<div class="error" id="idError"></div>
									</div>
									<div class="form-group">
										<div class="input-group input-group-lg">
											<span class="input-group-addon">
												密码
											</span>
											<input type="password" class='form-control' placeholder='密码...' id="pwd" name='pwd'
												onblur="checkPwd()" onfocus="hideError('pwdError')">
										</div>
										<div class="error" id="pwdError"></div>
										<div class="error" id="registerError">${requestScope.registerErr}</div>
									</div>
									<div class="form-group ok" style="text-align: center;" id="MyRegister">
										<input style="width: 100%;" id="sub" type="submit" value="注册" class='btn btn-primary btn-lg'>
									</div>
									<div class="form-group">
										<div style="float: right; margin-right: 20px;">
											<div style="font-size: 17px;">
												<button type="button" class="btn btn-default" data-toggle="modal" data-target=".bs-example-modal-sm" style="font-size: 16px;">注册说明</button>
												<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" id="myModal"
													aria-labelledby="myLargeModalLabel">
												 	<div class="modal-dialog" role="document">
												    	<div class="modal-content">
												    	  	<div class="modal-header">
												        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												        		<h4 class="modal-title" id="myModalLabel">注册说明</h4>
												      		</div>
												     		<div class="modal-body">
												     			<p style="text-indent:2em; letter-spacing: 1px; line-height: 1.5;font-size: 20px; color: red;">
												        			您一旦注册本网站意味着您所在班级管理员和学院管理员能看见您的全部成绩信息，<strong>如您介意，请勿注册！</strong>
												     			</p>
												     			<p style="text-indent:2em; letter-spacing: 1px; line-height: 1.5;font-size: 20px;">
													     			其他任何疑问请联系QQ：2214112886
												     			</p>
												      		</div>
												      		<div class="modal-footer">
												        		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
												      		</div>
												   		</div>
												  	</div>
												</div>
												&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/loginui">前往登录</a>
											</div>
										</div>
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