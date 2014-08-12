<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>Message管理</title>
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
		<li class="active"><a href="${ctx}/mgt/message/">Message列表</a></li>
		<shiro:hasPermission name="mgt:message:edit"><li><a href="${ctx}/mgt/message/form">Message添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="message" action="${ctx}/mgt/message/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>所属班级：</label><tags:treeselect id="banjis" name="sendTo.banjiIds" value="" labelName="banjiNames" labelValue=""
				title="班级" url="/mgt/banji/treeData" cssClass="input-small" allowClear="true" checked="true" notAllowSelectParent="true" />
		<label>记录日期：</label><input id="createDate" name="createDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
				value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr>
			        <th>消息内容</th>
			        <th>消息接收者</th>
			        <th>消息状态</th>
			        <th>消息发送者</th>
			        <th>发送时间</th>
			        
            <th>备注</th>
			<shiro:hasPermission name="mgt:message:edit"><th>操作</th></shiro:hasPermission>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="message">
			<tr>
		          <td>${message.content}</td>
		          <td>${message.sendTo.name}</td>
		          <td>${fns:getDictLabel(message.status, 'mgt_message_status', '无')}</td>
		          <td>${message.createBy.name}</td>
		          <td>${message.createDate}</td>
	            <td>${message.remarks}</td>
				<shiro:hasPermission name="mgt:message:edit"><td>
    				<a href="${ctx}/mgt/message/form?id=${message.id}">修改</a>
					<a href="${ctx}/mgt/message/delete?id=${message.id}" onclick="return confirmx('确认要删除该Message吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>

