<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>School管理</title>
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
		<li class="active"><a href="${ctx}/mgt/school/">School列表</a></li>
		<shiro:hasPermission name="mgt:school:edit"><li><a href="${ctx}/mgt/school/form">School添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="school" action="${ctx}/mgt/school/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>名称 ：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-small"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr>
			        <th>学校编号</th>
			        <th>名称</th>
			        <th>类型</th>
			        <th>地址</th>
            <th>备注</th>
			<shiro:hasPermission name="mgt:school:edit"><th>操作</th></shiro:hasPermission>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="school">
			<tr>
		          <td>${school.no}</td>
		          <td><a href="${ctx}/mgt/school/form?id=${school.id}">${school.name}</a></td>
		          <td>${school.type}</td>
		          <td>${school.address}</td>
	            <td>${school.remarks}</td>
				<shiro:hasPermission name="mgt:school:edit"><td>
    				<a href="${ctx}/mgt/school/form?id=${school.id}">修改</a>
					<a href="${ctx}/mgt/school/delete?id=${school.id}" onclick="return confirmx('确认要删除该School吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>

