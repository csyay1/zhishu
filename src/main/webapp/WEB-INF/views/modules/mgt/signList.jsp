<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>Sign管理</title>
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
		<li class="active"><a href="${ctx}/mgt/sign/">Sign列表</a></li>
		<shiro:hasPermission name="mgt:sign:edit"><li><a href="${ctx}/mgt/sign/form">Sign添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sign" action="${ctx}/mgt/sign/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>所属班级：</label><tags:treeselect id="banjis" name="parents.banjiIds" value="${sign.parents.banjiIds}" labelName="banjiNames" labelValue="${sign.parents.banjiNames}"
				title="班级" url="/mgt/banji/treeData" cssClass="input-small" allowClear="true" checked="true" notAllowSelectParent="true" />
		<label>记录日期：</label><input id="createDate" name="createDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
				value="${sign.createDate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr>
			        <th>学生家长</th>
			        <th>学生姓名</th>
			        <th>学生学号</th>
			        <th>所在班级学校</th>
			        <th>记录类型</th>
			        <th>记录状态</th>
			        <th>记录人</th>
			        <th>记录时间</th>
            <th>备注</th>
			<shiro:hasPermission name="mgt:sign:edit"><th>操作</th></shiro:hasPermission>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="sign">
			<tr>
		          <td>${sign.parents.name}</td>
		          <td>${sign.parents.studentName}</td>
		          <td>${sign.parents.studentNo}</td>
		          <td>${sign.parents.banjiFullNames}</td>
		          <td>${fns:getDictLabel(sign.type, 'mgt_sign_type', '无')}</td>
		          <td>${fns:getDictLabel(sign.value, 'mgt_sign_value', '无')}</td>
		          <td>${sign.createBy.name}</td>
		          <td>${sign.createDate}</td>
	            <td>${sign.remarks}</td>
				<shiro:hasPermission name="mgt:sign:edit"><td>
    				<a href="${ctx}/mgt/sign/form?id=${sign.id}">修改</a>
					<a href="${ctx}/mgt/sign/delete?id=${sign.id}" onclick="return confirmx('确认要删除该Sign吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>

