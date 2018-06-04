<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/wcss.css" />
<!-- <script type="text/javascript" src="js/index.js"></script> -->
<title>SpringJDBC Demo</title>
</head>
<body>
	<div class="contenttitle">
		<div class="title">
			<ul>
				<li class="li_infeed"><a href="/SpringJDBC/readall" >Crud</a></li>
				<li class="li_infeed"><a href="views/drawing.jsp">Connect
						Us</a></li>
				<li class="li_infeed"><a href="views/blog.jsp">Blog</a></li>
				<li class="li_infeed"><a href="#">Team</a></li>
				<li class="li_infeed"><a href="views/service.jsp">Service</a></li>
				<li class="li_infeed"><a href="views/about.jsp">About</a></li>
				<li class="li_infeed"><a href="/SpringJDBC">Home</a></li>

			</ul>
		</div>
	</div>
	<div class="contentmain">
		<div class="banner"
			style="background-image: url('../img/blog_bg.gif');">
			<div>
				<h1 style="font-size: 1.1em; font-family: cursive; color: black;">Select
					Stu by Name</h1>
				<form action="/SpringJDBC/readbyname" method="post">
					Name:<input name="name" type="text"> <input type="submit"
						value="Select">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
