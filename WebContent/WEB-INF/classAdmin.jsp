<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</script>
	<style>
		
	</style>
	<body>
		<!--顶部效果-->
		<%@ include file="/WEB-INF/header.jsp" %>
		
		<!--主体部分-->
		<br />
		<br />
		<div class="container">
			<span class="glyphicon glyphicon-font"  style="font-size: 30px;">
				<div style="float: right;">&nbsp;&nbsp;&nbsp;：班级信息</div>
			</span>
			<div style="background: white; height: 13px;"></div>
			<table id="classtable1" class="table table-bordered" style="width: 90%; margin: 0 auto; font-size: 17px;">
				<thead>
					<tr>
						<td>班级</td>
						<td>${requestScope.cbib.className }</td>
						<td>班级人数</td>
						<td>${requestScope.cbib.allNum }</td>
					</tr>
					<tr>
						<td>平均GPA</td>
						<td>${requestScope.cbib.gpa }</td>
						<td>考试通过率</td>
						<td>${requestScope.cbib.notPassRate }</td>
					</tr>
					<tr>
						<td>竞赛人次</td>
						<td>${requestScope.cbib.comTimes }</td>
						<td>项目人次</td>
						<td>${requestScope.cbib.proTimes }</td>
					</tr>
				</thead>
			</table>
			
			<div style="background-color: #e4e4e4; height: 2px; margin-left: -10px; margin-right: -10px; margin-top: 30px; "></div>
				<div class="col-md-6" style="padding: 0; margin-top: 0px; margin-bottom: 10px;">
					<span class="glyphicon glyphicon-bold" style="font-size: 30px; margin-top: 20px;">
						<div style="float: right;">&nbsp;&nbsp;&nbsp;：班级成绩&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary" onclick="Emport('class_scores');">下载成绩单</button>
						</div>
					</span>
				</div>
			</span>
			<br />
			<br />
			<br />
			<table id="class_scores" class="table table-bordered" style="width: 90%; margin: 0 auto;">
				<thead>
					<tr>
						<th>学号</th>
						<th>姓名</th>
						<th>绩点</th>
						<th>已修学分</th>
						<th>通过率</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.infos}" var="es">
						<tr>
							<td>
								<a href="${pageContext.request.contextPath}/user/student.action?visitor_1=${es.id}" style="text-decoration: none;">${es.id }</a>
							</td>
							<td>${es.name }</td>
							<td>${es.gpa }</td>
							<td>${es.allcre }</td>
							<td>${es.passrate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
				
		<!--底部效果-->
		<%@ include file="/WEB-INF/footer.jsp" %>
		
	</body>
</html>