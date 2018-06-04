<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/SpringJDBC/views/css/wcss.css" />
<title>SpringJDBC Demo</title>
</head>
<body>
	<div class="contenttitle">
		<div class="title">
			<ul>
				<li class="li_infeed"><a href="/SpringJDBC/readall">Crud</a></li>
				<li class="li_infeed"><a href="/SpringJDBC/views/drawing.jsp">Connect
						Us</a></li>
				<li class="li_infeed"><a href="/SpringJDBC/readallarticle">Blog</a></li>
				<li class="li_infeed"><a href="#">Team</a></li>
				<li class="li_infeed"><a href="/SpringJDBC/views/service.jsp">Service</a></li>
				<li class="li_infeed"><a href="/SpringJDBC/views/about.jsp">About</a></li>
				<li class="li_infeed"><a href="/SpringJDBC/index.jsp">Home</a></li>

			</ul>
		</div>
	</div>
	<div class="contentmain">
		<div class="banner"
			style="background-image: url('/SpringJDBC/views/img/blog_bg.gif'); height: 500px; padding: 0;">
			<div style="background: #396;height: 50px;">
					<!-- <span style="float: right;">
						<a href="login.jsp" style="color:#369;font-family: cursive;font-size: 20px;font-weight: bold;">已有账号？现在登陆</a>
					</span> -->
					<h3 style=";color: black;margin: 0;padding: 0; font-family: cursive;font-size: 24px;" >现在登陆</h3>
			</div>
			<div style="margin: 0 auto; width: 760px;">
				<form action="/SpringJDBC/userlogin" method="post">
					<table>
						<tr>
							<td id="message" style="color: red;" colspan="2">${message}</td>
						</tr>
						<tr>
							<td style="width: 120px;">用户名</td>
							<td><input type="text" value="请输入用户名" name="username" tabindex="1"
								onfocus="this.value = this.value == this.defaultValue ? '' : this.value;"
								onblur="this.value = this.value == '' ? this.defaultValue : this.value;" />
	
							</td>
							<td><a href="/SpringJDBC/views/Blog/register.jsp" style="color: black;">马上注册</a></td>
						</tr>
						<tr>
							<td>密码</td>
							<td><input type="password" name="pwd" tabindex="2"></td>
							<td><a href="#" style="color: black;">忘记密码</a></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="提交" tabindex="3"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>