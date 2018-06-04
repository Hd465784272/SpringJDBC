<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
<div class="contentmain">
	<div class="leftbanner">
		<ul>
			<li><a href="service.jsp">NDRC</a></li>
			<br>
			<li>GOME</li>
			<br>
			<li>GWYFZB</li>
			<br>
			<li>PEKING</li>
		</ul>
	</div>
	<div class="banner"
		style="background-image: url('views/img/blog_bg.gif');">
		<table border="1" style="width:450px;padding: 3em 0 0 7.3em ; border: none; ">
			<tr >
				<td style="text-align: left;  "colspan="2" >
					<select  name="selectAge" id="selectAge" style="width:300px;height:30px; border: none;padding:0 0 0 0 ">
						<option value="3">上海同济医药公司</option>
						<option value="4">上海同济医药公司</option>
						<option value="5">上海同济医药公司</option>
						<option value="5">上海同济医药公司</option>
						<option value="5">上海同济医药公司上海同济医药公司上海同济医药公司</option>
					</select>
					<!-- <input type="button" value="新增"/>   --> 
				</td>
			</tr>
			<tr>
				<td style="width:50px;">
					<select  name="selectAge" id="selectAge" style="width: 80px;height:25px; border:none; ">
						<option value="3">柴油</option>
						<option value="4">燃料油</option>
					</select>
				</td>
				<td style="text-align: left;">
					<select  name="selectAge" id="selectAge" style="width:215px;height:25px; border:none;">
						<option value="3">0#</option>
						<option value="4">-10#</option>
						<option value="4">-20#</option>
						<option value="4">型号空白</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>票据：</td>
				<td colspan="2" style="text-align: left;">
					<select  name="selectAge" id="selectAge" style="width: 215px;height:25px; border:none; ">
						<option value="3">普票</option>
						<option value="4">专票</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>单价：</td>
				<td colspan="2" style="text-align: left;"><input style="border:none;"/></td>
			</tr>
			<tr>
				<td>吨位：</td>
				<td colspan="2" style="text-align: left;"><input style="border:none;"/></td>
			</tr>
			<tr>
				<td>金额：</td>
				<td colspan="2" style="text-align: left;"><input style="border:none;"/></td>
			</tr>
		</table>
	</div>
	</div>
</body>
</html>