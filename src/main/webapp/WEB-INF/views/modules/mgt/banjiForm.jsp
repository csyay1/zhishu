<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>班级管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/mgt/banji/">班级列表</a></li>
		<li class="active"><a href="${ctx}/mgt/banji/form?id=${banji.id}">班级<shiro:hasPermission name="mgt:banji:edit">${not empty banji.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="mgt:banji:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="banji" action="${ctx}/mgt/banji/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<tags:message content="${message}"/>

		    <div class="control-group">
				<label class="control-label">班级编号:</label>
				<div class="controls">
					<form:input path="no" htmlEscape="false" maxlength="200" class="required"/>
				</div>
		   </div>
		    <div class="control-group">
				<label class="control-label">名称:</label>
				<div class="controls">
					<form:input path="name" htmlEscape="false" maxlength="200" class="required"/>
				</div>
		   </div>
		    <div class="control-group">
				<label class="control-label">年级:</label>
				<div class="controls">
					<form:input path="grade" htmlEscape="false" maxlength="200" class="required"/>
				</div>
		   </div>
		    <div class="control-group">
				<label class="control-label">年份:</label>
				<div class="controls">
					<form:input path="year" htmlEscape="false" maxlength="200" class="required"/>
				</div>
		   </div>
		    <div class="control-group">
				<label class="control-label">类型:</label>
				<div class="controls">
					<form:input path="type" htmlEscape="false" maxlength="200" class="required"/>
				</div>
		   </div>
		    <div class="control-group">
				<label class="control-label">所在学校:</label>
				<div class="controls">
					<form:input path="schoolId" htmlEscape="false" maxlength="200" class="required"/>
				</div>
		   </div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="mgt:banji:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>


