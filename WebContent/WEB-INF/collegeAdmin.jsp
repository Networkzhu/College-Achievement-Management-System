<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Insert_Title_Here</title>
		<link rel="stylesheet" href="../public/bootstrap/css/bootstrap.min.css" />
		<script src="../public/js/jquery-3.2.1.min.js"></script>
		<script src="../public/bootstrap/js/bootstrap.min.js"></script>
		<script src="../public/js/holder.min.js"></script>
		<link href="../public/bootstrap/css/bootstrap-select.min.css" rel="stylesheet" />
		<script src="../public/bootstrap/js/bootstrap-select.js"></script>
		<script src="../public/js/myjs.js"></script>
		<link rel="stylesheet" type="text/css" href="../public/fileup/fileinput.min.css">
		<script src="../public/fileup/fileinput.min.js"></script>
		<script src="../public/fileup/zh.js"></script>
		<script src="../public/js/xlsx.core.min.js"></script>
		<script src="../public/js/Blob.js"></script>
		<script src="../public/js/FileSaver.min.js"></script>
		<script src="../public/js/tableexport.js"></script>
		<script src="../public/js/ajaxfileupload.js"></script>
		<link rel="stylesheet" type="text/css" href="../public/css/style.css">
	</head>
	<style>
		.file-drop-zone{
			height: 200px;
		}
		.col-md-4{
			text-align: right;
		}
		#cs-scores td, #is-scores td{
			width: 16.6%;
		}
	</style>
	<script type="text/javascript">
		function Emport(tableid){
			$('#'+tableid).tableExport({
				filename: "成绩单",
				bootstrap:'true', 
				formats: ['xlsx'],
				escape:'true',
				trimWhitespace: true
			});
			var Table=document.getElementById(tableid);
			var instance = TableExport(Table);
			instance.remove();
		}
		function select_file(fileid){
	        document.getElementById(fileid).click();
	    }
		function ajaxFileUpload(type){
			var myurl;
			var myid;
			if(type == "student"){
				myid = "studentInfo";
				myurl = "${pageContext.request.contextPath}/asyupload/student";
			}else if(type == "course"){
				myid = "courseInfo";
				myurl = "${pageContext.request.contextPath}/asyupload/course";
			}else if(type == "score"){
				myid = "scoreInfo";
				myurl = "${pageContext.request.contextPath}/asyupload/scores";
			}
	        $.ajaxFileUpload({
	                url:myurl,//用于文件上传的服务器端请求地址
	                secureuri:false,//一般设置为false
	                fileElementId:myid,//文件上传空间的id属性  <input type="file" id="file" name="file" />
	                dataType: 'json',//返回值类型 一般设置为json
	                success: function (data, status){
	                    alert(data.message);//从服务器返回的json中取出message中的数据,其中message为在struts2中action中定义的成员变量
	                },
	                error: function (data, status, e){
	                    alert(e);
	                }
	            }
	        )
	    }
		function changeSelects(){
			var change = document.getElementById("change").value;
			var cc = document.getElementById("cc");
			if(change == "竞赛"){
				cc.innerHTML = "奖项：";
				document.getElementById("level").innerHTML="<option>国一</option><option>国二</option><option>国三</option><option>市一</option><option>市二</option><option>市二</option><option>校一</option><option>校二</option><option>校二</option><option>院一</option><option>院二</option><option>院三</option>";
				$("#level").selectpicker('refresh');  
			}else{
				cc.innerHTML = "级别：";
				document.getElementById("level").innerHTML="<option>国家级</option><option>市级</option><option>校级</option><option>院级</option>";
				$("#level").selectpicker('refresh');
			}
		}
		function queryCourseScores(major){
			var cclass;
			var course;
			if(major == "cs"){
				cclass = document.getElementById("cs_class").value;
				course = document.getElementById("cs_course").value;
			}else{
				cclass = document.getElementById("is_class").value;
				course = document.getElementById("is_course").value;
			}
			course = course.split("-")[1];
			document.getElementById("class-course").innerHTML = cclass + " - " + course;
			$.ajax({
				url:"${pageContext.request.contextPath}/asy/queryClassCourseScores",
				async:true,
				type:"POST",
				data:{"cclass":cclass, "course":course},
				success:function(data){
					var aaaa =  document.getElementById("class-course-scores");
					aaaa.innerHTML = "";
					for(var i = 0; i < data.length; i++)
						aaaa.innerHTML = aaaa.innerHTML + "<tr><td>"+data[i].id+"</td><td>"+data[i].name+"</td><td>"+data[i].score+"</td><td>"+data[i].gpa+"</td></tr>";
					$('#myModal').modal(); 
				},
				error:function(){
				},
				dataType:"json"
			});
		}
		function queryScourses(major){
			var cclass;
			var course;
			if(major == "cs"){
				cclass = "cs_class";
				course = "cs_course";
			}else{
				cclass = "is_class";
				course = "is_course";
			}
			var cs_class = document.getElementById(cclass).value;
			$.ajax({
				url:"${pageContext.request.contextPath}/asy/queryClassCourse",
				async:true,
				type:"POST",
				data:{"cs_class":cs_class},
				success:function(data){
					var mb = document.getElementById(course);
					mb.innerHTML = "";
					for(var i = 0; i < data.length; i++)
						mb.innerHTML = mb.innerHTML + "<option>" + data[i].name + "-" + data[i].id + "</option>";
					$("#" + course).selectpicker('refresh');
				},
				error:function(){
				},
				dataType:"json"
			});
		}
		function addCOrPInfo(){
			var type = document.getElementById("change").value;
			var id = document.getElementById("id").value;
			var name = document.getElementById("name").value;
			var level = document.getElementById("level").value;
			var leader = document.getElementById("leader").value;
			var year = document.getElementById("time").value;
			if(type == "" || id == "" || name == "" || level == "" || leader == "" || year == ""){
				alert("数据格式错误");
				return;
			}
			if(type == "竞赛")
				type="1";
			else
				type="0";
			if(leader == "是")
				leader = "yes";
			else
				leader = "no";
			if(type == "1")
				alert("一条竞赛数据录入成功！");
			else if(type == "0")
				alert("一条项目数据录入成功！");
			$.ajax({
				url:"${pageContext.request.contextPath}/asy/addCOrPInfo",
				async:true,
				type:"POST",
				data:{"type":type, "id":id, "name":name, "level":level, "leader":leader, "time":year},
				success:function(data){
					alert(data);
				},
				error:function(){
				},
				dataType:"json"
			});
		}
	</script>
	<body>
		<!--顶部效果-->
		<%@ include file="/WEB-INF/header.jsp" %>
		<!--主体部分-->
		<br />
			<div class="container">
				<div class="container" style="margin: 0px;">
					<div class="col-md-10" style="margin-top: 7px;  font-size: 20px;">
						<ul id="myTab" class="nav nav-tabs">
							<li class="in active">
								<a href="#csSearchInfo" data-toggle="tab">计科成绩</a>
							</li><li>
								<a href="#isSearchInfo" data-toggle="tab">信安成绩</a>
							</li><li>
								<a href="#logInfo" data-toggle="tab" id="logininfos">信息录入</a>
							</li>
						</ul>
					</div>
				</div>
				<div id="myTabContent" class="tab-content" style="margin-top: 20px;">
					<div class="tab-pane fade in active" id="csSearchInfo">
						<div class="container">
							<span class="glyphicon glyphicon-font"  style="font-size: 30px;">
								<div style="float: right;">&nbsp;&nbsp;&nbsp;：专业信息</div>
							</span>
							<div style="background: white; height: 13px;"></div>
							<table class="table table-bordered" style="width: 90%; margin: 0 auto; font-size: 17px;" id="cs-major">
								<thead>
									<tr>
										<td>专业</td>
										<td>${requestScope.cs.major }</td>
										<td>GPA</td>
										<td>${requestScope.cs.gpa }</td>
									</tr>
									<tr>
										<td>挂科门次</td>
										<td>${requestScope.cs.notPassTimes }</td>
										<td>挂科率</td>
										<td>${requestScope.cs.notPassRate }</td>
									</tr>
									<tr>
										<td>竞赛人次</td>
										<td>${requestScope.cs.comTimes }</td>
										<td>项目人次</td>
										<td>${requestScope.cs.proTimes }</td>
									</tr>
								</thead>
							</table>
							<div style="background-color: #e4e4e4; height: 2px; margin-left: -10px; margin-right: -10px; margin-top: 30px; "></div>
							<div class="col-md-12" style="padding: 0; margin-top: 0px; margin-bottom: 10px;">
								<span class="glyphicon glyphicon-bold"  style="font-size: 30px; margin-top: 20px;">
									<div style="float: right;">&nbsp;&nbsp;&nbsp;：各班成绩&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="btn btn-primary" onclick="Emport('cs-scores');">下载成绩单</button>
									</div>
								</span>
							</div>
							<table id="cs-scores" class="table table-bordered" style="width: 90%; margin: 0 auto;" tableexport-key="classScore">
								<thead>
									<tr>
										<th>班级</th>
										<th>GPA</th>
										<th>挂科门次</th>
										<th>通过率</th>
										<th>竞赛人次</th>
										<th>项目人次</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.css}" var="es">
										<tr>
											<td>
												<a href="${pageContext.request.contextPath}/user/classAdmin.action?visitor_2=${es.id}" style="text-decoration: none;">${es.id }</a>
											</td>
											<td>${es.gpa }</td>
											<td>${es.notPassTimes }</td>
											<td>${es.passRate }</td>
											<td>${es.comTimes }</td>
											<td>${es.proTimes }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div style="background-color: #e4e4e4; height: 2px; margin-left: -10px; margin-right: -10px; margin-top: 30px; "></div>
							<div class="col-md-12" style="padding: 0; margin-top: 0px; margin-bottom: 10px;">
								<span class="glyphicon glyphicon-align-right"  style="font-size: 30px; margin-top: 20px;">
									<div style="float: right;">&nbsp;&nbsp;&nbsp;：科目成绩&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</span>
								<div class="container" style="width: 90%; margin-top:10px;">
										<div class="col-md-11">
											<div class="col-md-5">
												<span class="selectspan1">班级：</span>
												<span class="selectspan2" onmouseout="queryScourses('cs');"><select class="selectpicker" data-width="60%" data-size="5" id="cs_class">
												<c:forEach items="${requestScope.css}" var="es">
														<option>${es.id }</option>
												</c:forEach>
												</select></span>
											</div>
											<div class="col-md-5">
												<span class="selectspan1">科目：</span>
												<span class="selectspan2"><select class="selectpicker" style="margin-top: 0px; padding-top: 0px;" data-width="60%" data-size="5" id="cs_course">
												　　　<c:forEach items="${requestScope.csSelectCourse}" var="es">
														<option>${es.name}-${es.id}</option>
													</c:forEach>
												</select></span>
											</div>
										</div>
										<div class="col-md-1">
											<button class="btn btn-primary" onclick="queryCourseScores('cs');" type="submit" style="margin-right: 0px;">查询</button>
										</div>
									</div>
							</div>
						</div>
					</div>
						<div class="tab-pane fade" id="isSearchInfo">
						<div class="container">
							<span class="glyphicon glyphicon-font"  style="font-size: 30px;">
								<div style="float: right;">&nbsp;&nbsp;&nbsp;：专业信息</div>
							</span>
							<div style="background: white; height: 13px;"></div>
							<table class="table table-bordered" style="width: 90%; margin: 0 auto; font-size: 17px;" id="is-major">
								<thead>
									<tr>
										<td>专业</td>
										<td>${requestScope.is.major }</td>
										<td>GPA</td>
										<td>${requestScope.is.gpa }</td>
									</tr>
									<tr>
										<td>挂科门次</td>
										<td>${requestScope.is.notPassTimes }</td>
										<td>挂科率</td>
										<td>${requestScope.is.notPassRate }</td>
									</tr>
									<tr>
										<td>竞赛人次</td>
										<td>${requestScope.is.comTimes }</td>
										<td>项目人次</td>
										<td>${requestScope.is.proTimes }</td>
									</tr>
								</thead>
							</table>
							<div style="background-color: #e4e4e4; height: 2px; margin-left: -10px; margin-right: -10px; margin-top: 30px; "></div>
								<div class="col-md-12" style="padding: 0; margin-top: 0px; margin-bottom: 10px;">
									<span class="glyphicon glyphicon-bold"  style="font-size: 30px; margin-top: 20px;">
										<div style="float: right;">&nbsp;&nbsp;&nbsp;：各班成绩&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button class="btn btn-primary" onclick="Emport('is-scores');">下载成绩单</button>
										</div>
									</span>
								</div>
							<table id="is-scores" class="table table-bordered" style="width: 90%; margin: 0 auto;" tableexport-key="classScore">
								<thead>
									<tr>
										<th>班级</th>
										<th>GPA</th>
										<th>挂科门次</th>
										<th>通过率</th>
										<th>竞赛人次</th>
										<th>项目人次</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.iss}" var="es">
										<tr>
											<td>
												<a href="${pageContext.request.contextPath}/user/classAdmin.action?visitor_2=${es.id}" style="text-decoration: none;">${es.id }</a>
											</td>
											<td>${es.gpa }</td>
											<td>${es.notPassTimes }</td>
											<td>${es.passRate }</td>
											<td>${es.comTimes }</td>
											<td>${es.proTimes }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
														<div style="background-color: #e4e4e4; height: 2px; margin-left: -10px; margin-right: -10px; margin-top: 30px; "></div>
							<div class="col-md-12" style="padding: 0; margin-top: 0px; margin-bottom: 10px;">
								<span class="glyphicon glyphicon-align-right"  style="font-size: 30px; margin-top: 20px;">
									<div style="float: right;">&nbsp;&nbsp;&nbsp;：科目成绩&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</span>
								<div class="container" style="width: 90%; margin-top:10px;">
										<div class="col-md-11">
											<div class="col-md-5">
												<span class="selectspan1">班级：</span>
												<span class="selectspan2" onmouseout="queryScourses('is');"><select class="selectpicker" data-width="60%" data-size="5" id="is_class">
												<c:forEach items="${requestScope.iss}" var="es">
														<option>${es.id }</option>
												</c:forEach>
												</select></span>
											</div>
											<div class="col-md-5">
												<span class="selectspan1">科目：</span>
												<span class="selectspan2"><select class="selectpicker" style="margin-top: 0px; padding-top: 0px;" data-width="60%" data-size="5" id="is_course">
												　　　<c:forEach items="${requestScope.isSelectCourse}" var="es">
														<option>${es.name}-${es.id}</option>
													</c:forEach>
												</select></span>
											</div>
										</div>
										<div class="col-md-1">
											<button class="btn btn-primary" onclick="queryCourseScores('is');" type="submit" style="margin-right: 0px;">查询</button>
										</div>
									</div>
							</div>
						</div>
					</div>
					
					<div class="tab-pane fade" id="logInfo">
						<span class="glyphicon glyphicon-font"  style="font-size: 30px; margin-bottom:20px;">
							<div style="float: right;">&nbsp;&nbsp;&nbsp;：基本信息</div>
						</span>
						<div class="container" style = "margin-bottom:5px;">
							<div class="col-md-4">
								<div style="font-size:20px;text-align: center;margin-bottom:20px;">
									学生信息录入(xlsx文件)：
								</div>
							</div>
							<div class="col-md-8">
								<form action="#" method="post" onsubmit="return false;">
									<div class="col-md-8" id="studentInfo_p" style="padding-right:0px;">
										<div style="float:left;width:100%">
									      <input id="studentInfo" name="studentInfo" type="file"  style="display:none" 
									      	required="required" onchange="document.getElementById('studentInfo_name').value=this.value"/>
									      <input id="studentInfo_name" type="text" style="font-size:15px;letter-spacing:1px;" placeholder="小哥哥小姐姐们记得添加文件哦..." tabindex="1" class='form-control'/>
									  	</div>
									</div>
									<div class="col-md-2" style="padding-left:0px;">
									    <button class="btn btn-primary" onclick="select_file('studentInfo');">
									    	<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
									    	&nbsp;浏览
									    </button>
									</div>
									<div class="col-md-2">
										<button class="btn btn-primary" type="submit" onclick="ajaxFileUpload('student');" style="margin-right: 0px;">上传</button>
									</div>
								</form>
							</div>
						</div>
						<div class="container" style = "margin-bottom:5px;">
							<div class="col-md-4">
								<div style="font-size:20px;text-align: center;margin-bottom:20px;">
									课程信息录入(xlsx文件)：
								</div>
							</div>
							<div class="col-md-8">
								<form action="#" method="post" onsubmit="return false;">
									<div class="col-md-8" id="courseInfo_p" style="padding-right:0px;">
										<div style="float:left;width:100%">
									      <input id="courseInfo" name="courseInfo" type="file"  style="display:none" 
									      	required="required" onchange="document.getElementById('courseInfo_name').value=this.value"/>
									      <input id="courseInfo_name" type="text" style="font-size:15px;letter-spacing:1px;" placeholder="小哥哥小姐姐们记得添加文件哦..." tabindex="1" class='form-control'/>
									  	</div>
									</div>
									<div class="col-md-2" style="padding-left:0px;">
									    <button class="btn btn-primary" onclick="select_file('courseInfo');">
									    	<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
									    	&nbsp;浏览
									    </button>
									</div>
									<div class="col-md-2">
										<button class="btn btn-primary" type="submit" onclick="ajaxFileUpload('course');" style="margin-right: 0px;">上传</button>
									</div>
								</form>
							</div>
						</div>
						<div class="container" style = "margin-bottom:5px;">
							<div class="col-md-4">
								<div style="font-size:20px;text-align: center;margin-bottom:20px;">
									学生成绩录入(xlsx文件)：
								</div>
							</div>
							<div class="col-md-8">
								<form  action="#" method="post" onsubmit="return false;">
									<div class="col-md-8" id="scoreInfo_p" style="padding-right:0px;">
										<div style="float:left;width:100%">
									      <input id="scoreInfo" name="scoreInfo" type="file"  style="display:none" 
									      	required="required" onchange="document.getElementById('scoreInfo_name').value=this.value"/>
									      <input id="scoreInfo_name" type="text" style="font-size:15px;letter-spacing:1px;" placeholder="小哥哥小姐姐们记得添加文件哦..." tabindex="1" class='form-control'/>
									  	</div>
									</div>
									<div class="col-md-2" style="padding-left:0px;">
									    <button class="btn btn-primary" onclick="select_file('scoreInfo');">
									    	<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
									    	&nbsp;浏览
									    </button>
									</div>
									<div class="col-md-2">
										<button class="btn btn-primary" type="submit" onclick="ajaxFileUpload('score');" style="margin-right: 0px;">上传</button>
									</div>
								</form>
							</div>
						</div>
						<div style="background-color: #e4e4e4; height: 2px; margin-left: -10px; margin-right: -10px; margin-top: 20px; "></div>
						<span class="glyphicon glyphicon-bold"  style="font-size: 30px; margin-top: 30px;margin-bottom:30px;">
							<div style="float: right;">&nbsp;&nbsp;&nbsp;：附加信息</div>
						</span>
						<div class="container" style="margin-bottom:70px;">
							<div class="col-md-11">
								<div class="col-md-4">
									<span class="selectspan1" >类别：</span>
									<span class="selectspan2" onmouseout="changeSelects();"><select class="selectpicker" data-width="60%" data-size="5" id="change">
										<option>竞赛</option><option>项目</option>
									</select></span>
								</div>
								<div class="col-md-4">
									<span class="selectspan1">学号：</span>
									<span class="selectspan2"><select class="selectpicker" data-live-search="true" data-live-search-placeholder="搜索" data-width="60%" data-size="5" id="id">
										<c:forEach items="${requestScope.students}" var="s">
											<option>${s.id}</option>
										</c:forEach>
									</select></span>
								</div>
								<div class="col-md-4">
									<span class="selectspan1">名称：</span>
									<input type="text" class="form-control" style="display: inline; width:60%;" id="name"></input>
								</div>
							</div>
							<div class="col-md-11" style="margin-top:5px;">
								<div class="col-md-4">
									<span class="selectspan1">负责人：</span>
									<span class="selectspan2"><select class="selectpicker" data-width="60%" data-size="5" id="leader">
										 <option>是</option>
									　　　<option>不是</option>
									</select></span>
								</div>
								<div class="col-md-4">
									<span class="selectspan1" id="cc">奖项：</span>
									<span class="selectspan2"><select class="selectpicker" data-width="60%" data-size="5" id="level">
										<option>国一</option><option>国二</option><option>国三</option><option>市一</option>
										<option>市二</option><option>市二</option><option>校一</option><option>校二</option>
										<option>校二</option><option>院一</option><option>院二</option><option>院三</option>
									</select></span>
								</div>
								<div class="col-md-4">
									<span class="selectspan1">时间：</span>
									<span class="selectspan2"><select class="selectpicker" data-width="60%" data-size="5" id="time">
										<c:forEach var="i" begin="${requestScope.byear}" end="${requestScope.tyear}" step="1">   
											<option>${i}</option> 
										</c:forEach>　　　
									</select></span>
								</div>
							</div>
							<div class="col-md-1">
								<button class="btn btn-primary" onclick="addCOrPInfo();" type="submit">添加</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!--底部效果-->
		<%@ include file="/WEB-INF/footer.jsp" %>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span id = "class-course"></span>
					</h4>
				</div>
				<div class="modal-body">
					<table id="course-scores" class="table table-bordered" style="width: 90%; margin: 0 auto;" tableexport-key="classScore">
						<thead>
							<tr>
								<th>学号</th>
								<th>姓名</th>
								<th>成绩</th>
								<th>总GPA</th>
							</tr>
						</thead>
						<tbody id="class-course-scores">
							
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
		</div>
	</body>
</html>