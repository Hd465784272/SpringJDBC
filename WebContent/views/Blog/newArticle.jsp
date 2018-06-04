<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>UMEDITOR 完整demo</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/SpringJDBC/views/css/wcss.css" />
<link href="../../UEditor/themes/default/css/umeditor.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="../../UEditor/third-party/jquery.min.js"></script>
<script type="text/javascript"
	src="../../UEditor/third-party/template.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../../UEditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../../UEditor/umeditor.min.js"></script>
<script type="text/javascript" src="../../UEditor/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
h1 {
	font-family: "微软雅黑";
	font-weight: normal;
}

.btn {
	display: inline-block;
	*display: inline;
	padding: 4px 12px;
	margin-bottom: 0;
	*margin-left: .3em;
	font-size: 14px;
	line-height: 20px;
	color: #333333;
	text-align: center;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
	vertical-align: middle;
	cursor: pointer;
	background-color: #f5f5f5;
	*background-color: #e6e6e6;
	background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff),
		to(#e6e6e6));
	background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
	background-repeat: repeat-x;
	border: 1px solid #cccccc;
	*border: 0;
	border-color: #e6e6e6 #e6e6e6 #bfbfbf;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	border-bottom-color: #b3b3b3;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',
		endColorstr='#ffe6e6e6', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	*zoom: 1;
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
}

.btn:hover, .btn:focus, .btn:active, .btn.active, .btn.disabled, .btn[disabled]
	{
	color: #333333;
	background-color: #e6e6e6;
	*background-color: #d9d9d9;
}

.btn:active, .btn.active {
	background-color: #cccccc \9;
}

.btn:first-child {
	*margin-left: 0;
}

.btn:hover, .btn:focus {
	color: #333333;
	text-decoration: none;
	background-position: 0 -15px;
	-webkit-transition: background-position 0.1s linear;
	-moz-transition: background-position 0.1s linear;
	-o-transition: background-position 0.1s linear;
	transition: background-position 0.1s linear;
}

.btn:focus {
	outline: thin dotted #333;
	outline: 5px auto -webkit-focus-ring-color;
	outline-offset: -2px;
}

.btn.active, .btn:active {
	background-image: none;
	outline: 0;
	-webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
}

.btn.disabled, .btn[disabled] {
	cursor: default;
	background-image: none;
	opacity: 0.65;
	filter: alpha(opacity = 65);
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}
</style>
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
		<div class="leftbanner">
			<ul>
				<li>当前用户: ${username_session}</li>
				<br>
				<li><a href="views/Blog/login.jsp">登陆</a></li>
				<br>
				<li><a href="views/Blog/register.jsp">注册</a></li>
				<br>
				<li><a href="/SpringJDBC/userlogout">注销</a></li>
			</ul>
		</div>
		<div class="banner"
			style="background-image: url('/SpringJDBC/views/img/blog_bg.gif'); height: 500px; color: black;">
			<!-- <h1 id="title">UMEDITOR 完整demo</h1> -->
			<!--style给定宽度可以影响编辑器的最终宽度-->
			<form action="/SpringJDBC/addArticle">
				标题：<input type="text" name="title" style="width: 40%;" /> 
				文章类型：<select name="type">
					<option value="1">我的日志</option>
					<option value="2">私密日志</option>
					<option value="3">记事本</option>
					<option value="4">草稿箱</option>
				</select> <br>
				<script type="text/plain" id="myEditor"
					style="width:100%;height:360px;">
				</script>
				<br> <input type="submit" value="submitform">
			</form>
		</div>
	</div>

	<script type="text/javascript">
		//实例化编辑器
		var um = UM.getEditor('myEditor');
		um.addListener('blur', function() {
			$('#focush2').html('编辑器失去焦点了')
		});
		um.addListener('focus', function() {
			$('#focush2').html('')
		});

		function addArticle() {
			var title = document.getElementById("title").innerHTML;
			var content = document.getElementById("myEditor").innerHTML;
			alert(title + content);
		}
	</script>

</body>
</html>