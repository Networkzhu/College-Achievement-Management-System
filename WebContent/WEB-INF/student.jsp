<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Insert_Title_Here</title>
		<link rel="stylesheet" href="public/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="public/css/style.css">
		<script src="public/js/jquery-3.2.1.min.js"></script>
		<script src="public/bootstrap/js/bootstrap.min.js"></script>
		<script src="public/js/holder.min.js"></script>
		<link href="public/bootstrap/css/bootstrap-select.min.css" rel="stylesheet" />
		<script src="public/bootstrap/js/bootstrap-select.js"></script>
		<script src="public/js/myjs.js"></script>
		<script src="public/js/xlsx.core.min.js"></script>
		<script src="public/js/Blob.js"></script>
		<script src="public/js/FileSaver.min.js"></script>
		<script src="public/js/tableexport.js"></script>
		
		<link rel="stylesheet" href="../public/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../public/css/style.css">
		<script src="../public/js/jquery-3.2.1.min.js"></script>
		<script src="../public/bootstrap/js/bootstrap.min.js"></script>
		<script src="../public/js/holder.min.js"></script>
		<link href="../public/bootstrap/css/bootstrap-select.min.css" rel="stylesheet" />
		<script src="../public/bootstrap/js/bootstrap-select.js"></script>
		<script src="../public/js/myjs.js"></script>
		<script src="../public/js/xlsx.core.min.js"></script>
		<script src="../public/js/Blob.js"></script>
		<script src="../public/js/FileSaver.min.js"></script>
		<script src="../public/js/tableexport.js"></script>
	</head>
	<script type="text/javascript">
	
		function EmportScores(tableid){
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
		function queryScores(){
			var term = document.getElementById("term").value;
			if(term == "请选择")
				term = "%";
			else
				term = "%"+term+"%";
			var type = document.getElementById("type").value;
			if(type == "必修")
				type = "%1%";
			else if(type == "专选")
				type = "%2%";
			else if(type == "公选")
				type = "%3%";
			else
				type = "%";
			var pass = document.getElementById("pass").value;
			if(pass == "是")
				pass = "yes";
			else if(pass == "否")
				pass = "no";
			else
				pass = "*";
			var rel = document.getElementById("rel").value;
			if(rel == "与（and）")
				rel = "and";
			else
				rel = "or";
			$.ajax({
				url:"${pageContext.request.contextPath}/asy/studentScores",
				async:true,
				type:"POST",
				data:{"term":term, "type":type, "pass":pass, "rel":rel},
				success:function(data){
					var mb = document.getElementById("mybody");
					mb.innerHTML = "";
					for(var i = 0; i < data.length; i++)
						mb.innerHTML = mb.innerHTML+"<tr><td>"+data[i].name+"</td><td>"+data[i].type+"</td><td>"+data[i].score+"</td><td>"+parseFloat(data[i].coefficient).toFixed(1)+"</td><td>"+parseFloat(parseFloat(data[i].coefficient) * data[i].gpa).toFixed(2)+"</td><td>"+parseFloat(data[i].credit).toFixed(1)+"</td></tr>";
				},
				error:function(){
					alert("请求失败");
				},
				dataType:"json"
			});
		}
	</script>
	<body>
		<!--顶部效果-->
		<%@ include file="/WEB-INF/header.jsp" %>
		<br />
		<br />
		<div class="container">
			<span class="glyphicon glyphicon-font"  style="font-size: 30px;">
				<div style="float: right;">&nbsp;&nbsp;&nbsp;：个人信息</div>
			</span>
			<div style="background: white; height: 13px;"></div>
			<table class="table table-bordered" style="width: 90%; margin: 0 auto; font-size: 17px;">
				<thead>
					<tr>
						<td>姓名：</td>
						<td>${requestScope.sbib.name }</td>
						<td>学号：</td>
						<td>${requestScope.sbib.id }</td>
					</tr>
					<tr>
						<td>专业：</td>
						<td>
							<c:if test="${requestScope.sbib.major eq \"cs\"}">
								计算机科学与技术
							</c:if>
							<c:if test="${requestScope.sbib.major eq \"is\"}">
								信息安全
							</c:if>
						</td>
						<td>绩点：</td>
						<td>${requestScope.sbib.gpa }</td>
					</tr>
				</thead>
			</table>
			
			<div style="background-color: #e4e4e4; height: 2px; margin-left: -10px; margin-right: -10px; margin-top: 30px; "></div>
				<div class="col-md-6" style="padding: 0; margin-top: 0px; margin-bottom: 10px;">
					<span class="glyphicon glyphicon-bold"  style="font-size: 30px; margin-top: 20px;">
						<div style="float: right;">&nbsp;&nbsp;&nbsp;：各科成绩</div>
					</span>
				</div>
			<br />
			<div class="container" style="width: 90%;">
				<div class="col-md-11">
					<div class="col-md-3">
						<span class="selectspan1">学期：</span>
						<span class="selectspan2"><select class="selectpicker" data-width="60%" data-size="5" id="term">
							<option>请选择</option>
							<c:forEach var="i" begin="1" end="${requestScope.terms}" step="1">   
							<option>${i}</option> 
							</c:forEach>
						</select></span>
					</div>
					<div class="col-md-3">
						<span class="selectspan1">类别：</span>
						<span class="selectspan2"><select class="selectpicker" style="margin-top: 0px; padding-top: 0px;" data-width="60%" data-size="5" id="type">
						　　　<option>请选择</option>
							<option>必修</option>
						　　　<option>专选</option>
						　　　<option>公选</option>
						</select></span>
					</div>
					<div class="col-md-3">
						<span class="selectspan1">通过：</span>
						<span class="selectspan2"><select class="selectpicker" data-width="60%" data-size="5" id="pass">
						　　　<option>请选择</option>
							<option>是</option>
						　　　<option>否</option>
						</select></span>
					</div>
					<div class="col-md-3">
						<span class="selectspan1">关系：</span>
						<span class="selectspan2"><select class="selectpicker" data-width="60%" data-size="5" id="rel">
							 <option>与（and）</option>
						　　　<option>或（or）</option>
						</select></span>
					</div>
				</div>
				<div class="col-md-1">
					<button class="btn btn-primary" onclick="queryScores();" type="submit" style="margin-right: 0px;">查询</button>
				</div>
			</div>
			<br />
			<table class="table table-bordered" style="width: 90%; margin: 0 auto;" id="scores">
				<thead>
					<tr>
						<th>课程名称</th>
						<th>课程类别</th>
						<th>成绩</th>
						<th>重要系数</th>
						<th>单科绩点</th>
						<th>学分</th>
					</tr>
				</thead>
				<tbody id = "mybody">
					<c:forEach items="${requestScope.scores}" var="es">
						<tr>
							<td>${es.name}</td>
							<td>
								<c:if test="${es.type eq \"1\"}">
									必修
								</c:if>
								<c:if test="${es.type eq \"2\"}">
									专选
								</c:if>
								<c:if test="${es.type eq \"3\"}">
									公选
								</c:if>
							</td>
							<td>${es.score}</td>
							<td>${es.coefficient}</td>
							<td><fmt:formatNumber type="number" value="${es.gpa}" pattern="0.00" maxFractionDigits="2"/></td>
							<td>${es.credit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="container" style="width: 90%; margin-top: 30px;text-align: center;font-size: 20px;">
				<div class="col-md-3">
					应修学分：170
				</div>
				<div class="col-md-3">
					已修学分：${requestScope.allCredits }
				</div>
				<div class="col-md-3">
					需再修学分：${requestScope.resCredits }
				</div>
				<div class="col-md-3">
					<button class="btn btn-default" onclick="EmportScores('scores');" type="submit" style="margin-right: 0px;">下载成绩单</button>
				</div>
			</div>
		</div>

	<!--底部效果-->
	<%@ include file="/WEB-INF/footer.jsp" %>
	</body>
</html>