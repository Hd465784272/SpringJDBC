<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/SpringJDBC/views/css/wcss.css" />
<title>SpringJDBC Demo</title>
<script type="text/javascript">
	function checkUsername(){
		/* 检查用户名格式是否正确 */
		var username = document.getElementById('username');
		var tip_username = document.getElementById("tip_username");
		if(username.value.length<4){
			/* 不正确时*/
			username.style.background="#F66";
			tip_username.style.color="red";
		}else{
			/* 正确时 */
			username.style.background=null;
			tip_username.style.color="black";
		}
	}
	
	function checkPwd() {
		/* 检查密码格式是否正确 */
		var pwd = document.getElementById('pwd');
		var tip_pwd = document.getElementById("tip_pwd");
		if(pwd.value.length<6){
			/* 格式不正确时 */
			pwd.style.background="#F66";
			tip_pwd.style.color="red";
		}else{
			/* 格式正确时 */
			pwd.style.background=null;
			tip_pwd.style.color="black";
		}
	}
	
	function checkPassword() {
		var pwd = document.getElementById('pwd').value;
		var pwd2 = document.getElementById('pwd2');
		var tip_thepwd = document.getElementById('tip_thepwd');
		var tip_rptpwd = document.getElementById('tip_rptpwd');
		if (pwd != pwd2.value) {
			/* 两次密码不一致时 */
			pwd2.style.background="#F66";
			tip_thepwd.style.display=null;
			tip_thepwd.style.color="red";
			tip_rptpwd.style.display="none";
			//	document.getElementById('pw2').focus();//文本框获取焦点
			//document.getElementById('pwd2').select();//选中文本框内容
		}else{
			/* 两次密码一致时 */
			pwd2.style.background=null;
			tip_thepwd.style.display="none";
			tip_thepwd.style.color=null;
			tip_rptpwd.style.display=null;
		}
	}
	
	function checkQuestion(){
		var question = document.getElementById('question');
		var tip_question = document.getElementById('tip_question');
		if(question.value.length < 1){
			question.style.background="#F66";
			tip_question.style.color="red";
		}else{
			question.style.background=null;
			tip_question.style.color="black";
		}
	}
	function checkAnswer(){
		var answer = document.getElementById('answer');
		var tip_answer = document.getElementById('tip_answer');
		if(answer.value.length < 1){
			answer.style.background="#F66";
			tip_answer.style.color="red";
		}else{
			answer.style.background=null;
			tip_answer.style.color="black";
		}
	}
	
	function checkForm(){
		var username = document.getElementById('username'); 
		var tip_username = document.getElementById("tip_username");
		var pwd = document.getElementById('pwd');
		var pwd2 = document.getElementById('pwd2');
		var tip_thepwd = document.getElementById('tip_thepwd');
		var tip_rptpwd = document.getElementById('tip_rptpwd');
		var question = document.getElementById('question');
		var tip_question = document.getElementById('tip_question');
		var answer = document.getElementById('answer');
		var tip_answer = document.getElementById('tip_answer');
		if(username.value.length < 4){
			username.style.background="#F66";
			tip_username.style.color="red";
			return false
		}
		if(pwd.value.length<6){
			/* 格式不正确时 */
			pwd.style.background="#F66";
			tip_pwd.style.color="red";
			return false;
		}
		if (pwd.value !== pwd2.value) {
			/* 两次密码不一致时 */
			pwd2.style.background="#F66";
			tip_thepwd.style.display=null;
			tip_thepwd.style.color="red";
			tip_rptpwd.style.display="none";
			//	document.getElementById('pw2').focus();//文本框获取焦点
			//document.getElementById('pwd2').select();//选中文本框内容
			return false;
		}
		if(question.value == ""){
			question.style.background="#F66";
			tip_question.style.color="red";
			return false;
		}
		if(answer.value == ""){
			answer.style.background="#F66";
			tip_answer.style.color="red";
			return false;
		}
		
		
	}
</script>
</head>
<body>
	<div class="contenttitle">
		<div class="title">
			<ul>
				<li class="li_infeed"><a href="/SpringJDBC/readall">Crud</a></li>
				<li class="li_infeed"><a href="/SpringJDBC/views/drawing.jsp">Connect
						Us</a></li>
				<li class="li_infeed"><a href="/SpringJDBC/views/blog.jsp">Blog</a></li>
				<li class="li_infeed"><a href="#">Team</a></li>
				<li class="li_infeed"><a href="/SpringJDBC/views/service.jsp">Service</a></li>
				<li class="li_infeed"><a href="/SpringJDBC/views/about.jsp">About</a></li>
				<li class="li_infeed"><a href="/SpringJDBC">Home</a></li>

			</ul>
		</div>
	</div>
	<div class="contentmain">
		<div class="banner"
			style="background-image: url('/SpringJDBC/views/img/blog_bg.gif'); height: 500px;padding: 0;">
			<div style="background: #396;height: 50px;">
					<span style="float: right;">
						<a href="/SpringJDBC/views/Blog/login.jsp" style="color:#369;font-family: cursive;font-size: 20px;font-weight: bold;">已有账号？现在登陆</a>
					</span>
					<h3 style=";color: black;margin: 0;padding: 0; font-family: cursive;font-size: 24px;" >马上注册</h3>
			</div>
			<div style="margin: 0 auto; width: 760px;">
				<form action="/SpringJDBC/adduser" onsubmit="return checkForm();" method="post" >
					<table >
						<tr>
							<td id="message_username" style="color: red;" colspan="2">${message_username}</td>
							<%-- <td id="message_pwd" style="color: red;">${message_pwd}</td> --%>
						</tr>
						<tr>
							<td style="width: 120px;">用户名</td>
							<td><input type="text" value="" name="username" id="username"
								maxlength="15" onblur="checkUsername()" /></td>
							<td id="tip_username" >*用户名由4到15个字符组成</td>
						</tr>
						<tr>
							<td>密码</td>
							<td><input type="password" name="pwd" id="pwd"
								onblur="checkPwd()"></td>
							<td id="tip_pwd">*请填写密码, 最小长度为 6 个字符</td>
						</tr>
						<tr>
							<td>确认密码</td>
							<td><input type="password" name="pwd2" id="pwd2"
								onblur="checkPassword();"></td>
							<td id="tip_rptpwd">*请重复密码</td>
							<td id="tip_thepwd" style="display: none;">*两次密码不一致</td>
						</tr>
						<tr>
							<td>昵称</td>
							<td><input type="text" name="nickname"></td>
						</tr>
						<tr>
							<td>安全验证</td>
							<td><input type="text" name="question" id="question" onblur="checkQuestion()"></td>
							<td id="tip_question" >*必填：用于找回密码</td>
						</tr>
						<tr>
							<td>答案</td>
							<td><input type="text" name="answer" id="answer" onblur="checkAnswer()"></td>
							<td id="tip_answer" >*必填：用于找回密码</td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="提交"></td>
						</tr>
					</table>
				</form>
			</div>

		</div>
	</div>
</body>
</html>