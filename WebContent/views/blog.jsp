<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/SpringJDBC/views/css/page.css" type="text/css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="common/header.jsp"%>
<script language="javascript"
	src="/SpringJDBC/views/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/SpringJDBC/views/js/page.js"></script>
<div class="contentmain">
	<div class="leftbanner">
		<ul>
			<li>当前用户: ${username_session}</li>
			<br>
			<li><a href="/SpringJDBC/userlogout">注销</a></li>
		</ul>
	</div>
	<div class="banner"
		style="background-image: url('/SpringJDBC/views/img/blog_bg.gif');">
		<div>
			<div class="blog_row1left">
				<a href="/SpringJDBC/readarticlebycondition?type=1&initcount=1"
					class="blog_row1A">我的日志</a>
				<a href="/SpringJDBC/readarticlebycondition?type=2&initcount=1"
					class="blog_row1A">私密日志</a>
				<a href="/SpringJDBC/readarticlebycondition?type=3&initcount=1"
					class="blog_row1A">记事本</a> 
				<a href="/SpringJDBC/readarticlebycondition?type=4&initcount=1"
					class="blog_row1A">草稿箱</a> 
				<a href="/SpringJDBC/recycle?flag=1" 
					class="blog_row1A">回收站</a>
			</div>
			<div class="blog_row1right">
				<a href="#" class="blog_row1A">设置</a> <a href="#" class="blog_row1A">建议</a>
			</div>
		</div>
		<div style="margin-top: 30px;">
			<div class="blog_row1left">
				<button class="blog_row2B">
					<a href="views/Blog/newArticle.jsp">写日志</a>
				</button>
				<button class="blog_row2B">
					<a href="Blog/#.jsp">模板日志</a>
				</button>
				<button class="blog_row2B">
					<a href="Blog/#.jsp">批量处理</a>
				</button>
			</div>
			<div class="blog_row1right">
				<button class="blog_row2B">
					<a href="Blog/#.jsp">切换到摘要</a>
				</button>
				<button class="blog_row2B">
					<a href="Blog/#.jsp">发表时间</a>
				</button>
			</div>
		</div>
		<div style="clear: none; margin-top: 60px; margin-left: 3em;">
			<table style="background: white; width: 1200px;">
				<c:forEach items="${listarticle}" var="t">
					<tr>
						<td
							style="float: left; margin-left: 50px; margin-top: 20px; width: 500px;"><a
							href="#" style="color: black;"><c:out value="${t.title }"></c:out></a></td>
						<td
							style="float: left; margin-left: 50px; margin-top: 20px; width: 100px;"><c:out
								value="${t.username }"></c:out></td>
						<td
							style="float: left; margin-left: 50px; margin-top: 20px; width: 100px;"><c:out
								value="${t.type }"></c:out></td>
						<td
							style="float: left; margin-left: 50px; margin-top: 20px; width: 100px;"><c:set
								var="now" value="${t.date }" /> <fmt:formatDate type="date"
								value="${now}" /></td>
					</tr>
				</c:forEach>
			</table>
			<!-- 分页：每页显示多少条数据-->
			<input type="text" readonly="readonly" style="display: none;"
				id="listCount" class="listCount" value="${listCount}">
			<input type="text" readonly="readonly" style="display: none;"
				id="percount" class="percount" value="${percount}">
			<!-- 分页的条件 -->
			<input type="text" readonly="readonly" style="display: none;"
				id="type" class="type" value="${type}">
			<!-- 当前页码 -->
			<input type="text" readonly="readonly" style="display: none;"
				id="currentpage" class="currentpage" value="${currentpage}">
				
			<div>
				<ul class="page" maxshowpageitem="5" pagelistcount="10" id="page"></ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<script type="text/javascript">
	
	var listCount = ${listCount};		//countnum： 记录总条数
	var currentPage = ${currentpage};	//当前页码
	var type = ${type};				//文章的分类表示
	var GG = {
		"kk" : function(mm) {
			alert(type);
			alert(mm);
			
			window.location.href = 'readarticlebycondition?type='+type+'&initcount='+mm ;
			//window.location.href = 'readarticlebycondition?type=1&initcount='+mm ;
			//ajaxMethod();
			//alert(window.location.href);
			//alert(CC.changeURLArg(window.location.href,'initcount',mm));
			//alert(window.location.pathname);
			//alert($("#percount").attr("value"));
			//console.log("hellos");
			//window.location.href=urlChange.changeURLArg(window.location.href,'initcount',mm);
		}
	}
	/* "initPage":function(listCount,currentPage,fun){} */
	$("#page").initPage(listCount, currentPage, GG.kk);

</script>