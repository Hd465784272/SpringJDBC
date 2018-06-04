<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="leftbanner">
		<ul>
			<li><a href="/SpringJDBC/readall">Read</a></li>
		<!-- 	<br>
			<li><a href="/SpringJDBC/readtest2">readtest2</a></li> -->
			<br>
			<li><a href="/SpringJDBC/crud/new.jsp">Create</a></li>
			<br>
			<li><a href="/SpringJDBC/crud/stubyname.jsp">Select</a></li>
			<br>
			<li><a href="/SpringJDBC/crud/upstuagebyid.jsp">Update</a></li>
			<br>
			<li><a href="/SpringJDBC/crud/delstubyname.jsp">Delete</a></li>
			<br>
		</ul>
	</div>
	<div class="banner"
		style="background-image: url('views/img/blog_bg.gif');">
		 <div>
			<table>
				<tr>
					<th colspan="3" class="table_td" style="text-align: center;">Student Table</th>
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
</body>
</html>