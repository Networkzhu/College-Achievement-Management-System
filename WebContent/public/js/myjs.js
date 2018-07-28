function checkUserName(){
	var value = document.getElementById("username").value;
	if(value.length <= 10 && value.length > 0)
		return true;
	document.getElementById("usernameError").innerHTML="姓名最多10个字符且不为空！";
	return false;
}

function checkId(){
	var value = document.getElementById("id").value;
	match1 = /[1][567][0][3][4][12][123][0-9][0-9]/;
	match2 = /[ic][s][1][567][0][3][4][12][ABC]/;
	if(match1.test(value) || match2.test(value) || value == "jhzhan_16")
		return true;
	document.getElementById("idError").innerHTML = "学号格式错误bbbb！";
	return false;
}

function checkPwd(){
	var value = document.getElementById("pwd").value;
	if(value.length >= 6)
		return true;
	document.getElementById("pwdError").innerHTML = "密码最低6位！";
	return false;
}

function hideError(obj){
	document.getElementById(obj).innerHTML = "";
}
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