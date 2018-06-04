<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>
<div class="leftbanner">
	<ul>
		<li><a href="/SpringJDBC/readall">readall</a></li>
		<li><a href="/SpringJDBC/readtest2">readtest2</a></li>
		<li><a href="/SpringJDBC/crud/new.jsp">new</a></li>
		<li><a href="/SpringJDBC/crud/stubyname.jsp">stubyname</a></li>
		<li><a href="/SpringJDBC/crud/upstuagebyid.jsp">upstuagebyid</a></li>
		<li><a href="/SpringJDBC/crud/delstubyname.jsp">delstubyname</a></li>
	</ul>
</div>
<div class="banner"
	style="background-image: url('views/img/blog_bg.gif');">
	<div>
		<table width="500" align="center" border="1">
			<tr>
				<th colspan="3">Student Table</th>
			</tr>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>age</th>
			</tr>
			<tr>
				<th>${stlist.id}</th>
				<th>${stlist.name}</th>
				<th>${stlist.age}</th>
			</tr>
		</table>
	</div>
</div>
</body>
</html>

