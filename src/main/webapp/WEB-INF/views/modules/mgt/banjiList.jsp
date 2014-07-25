<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>班级管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/mgt/banji/">班级列表</a></li>
		<shiro:hasPermission name="mgt:banji:edit"><li><a href="${ctx}/mgt/banji/form">班级添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="banji" action="${ctx}/mgt/banji/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>名称 ：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-small"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr>
			        <th>班级编号</th>
			        <th>名称</th>
			        <th>年级</th>
			        <th>年份</th>
			        <th>类型</th>
			        <th>所在学校</th>
            <th>备注</th>
			<shiro:hasPermission name="mgt:banji:edit"><th>操作</th></shiro:hasPermission>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="banji">
			<tr>
		          <td>${banji.no}</td>
		          <td><a href="${ctx}/mgt/banji/form?id=${banji.id}">${banji.name}</a></td>
		          <td>${banji.grade}</td>
		          <td>${banji.year}</td>
		          <td>${banji.type}</td>
		          <td>${banji.schoolId}</td>
	            <td>${banji.remarks}</td>
				<shiro:hasPermission name="mgt:banji:edit"><td>
    				<a href="${ctx}/mgt/banji/form?id=${banji.id}">修改</a>
					<a href="${ctx}/mgt/banji/delete?id=${banji.id}" onclick="return confirmx('确认要删除该Banji吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>

