<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="views/css/wcss.css" />
<!-- <script type="text/javascript" src="js/index.js"></script> -->
<title>SpringJDBC Demo</title>
</head>
<body>
	<div class="contenttitle">
		<div class="title">
			<ul>
				<li class="li_infeed"><a href="/SpringJDBC/readall">Crud</a></li>
				<li class="li_infeed"><a href="views/drawing.jsp">Connect Us</a></li>
				<li class="li_infeed"><a href="views/blog.jsp">Blog</a></li>
				<li class="li_infeed"><a href="#">Team</a></li>
				<li class="li_infeed"><a href="views/service.jsp">Service</a></li>
				<li class="li_infeed"><a href="views/about.jsp">About</a></li>
				<li class="li_infeed"><a href="/SpringJDBC">Home</a></li>
				
			</ul>	
		</div>
	</div>
	<div class="contentmain">
		<div class="leftbanner">
			<ul>
				<li><a href="/SpringJDBC/readall">Read</a></li>
				<!-- <br>
				<li><a href="/SpringJDBC/readtest2">readtest2</a></li> -->
				<br>
				<li><a href="/SpringJDBC/views/crud/new.jsp">Create</a></li>
				<br>
				<li><a href="/SpringJDBC/views/crud/stubyname.jsp">Select</a></li>
				<br>
				<li><a href="/SpringJDBC/views/crud/upstuagebyid.jsp">Update</a></li>
				<br>
				<li><a href="/SpringJDBC/views/crud/delstubyname.jsp">Delete</a></li>
				<br>
			</ul>
		</div>
		<div class="banner"
			style="background-image: url('views/img/blog_bg.gif');height:400px;">
			<div>
				<table align="left" border="0px;" style="width:100%;">
					<tr>
						<th colspan="3">Student Table</th>
					</tr>
					<tr>
						<th>id</th>
						<th>name</th>
						<th>age</th>
					</tr>
					<c:forEach items="${stlist}" var="t">
						<tr>
							<th><c:out value="${t.id }"></c:out></th>
							<th><c:out value="${t.name }"></c:out></th>
							<th><c:out value="${t.age }"></c:out></th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>