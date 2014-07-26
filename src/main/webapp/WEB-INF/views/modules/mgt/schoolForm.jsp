<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>school管理</title>
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
		<li><a href="${ctx}/mgt/school/">学校列表</a></li>
		<li class="active"><a href="${ctx}/mgt/school/form?id=${school.id}">学校<shiro:hasPermission name="mgt:school:edit">${not empty school.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="mgt:school:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="school" action="${ctx}/mgt/school/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<tags:message content="${message}"/>
		<!-- 
		<div class="control-group">
			<label class="control-label">名称:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="required"/>
			</div>
		</div>
		 -->
		    <div class="control-group">
				<label class="control-label">学校编号:</label>
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
				<label class="control-label">类型:</label>
				<div class="controls">
					<form:input path="type" htmlEscape="false" maxlength="200" class="required"/>
				</div>
		   </div>
		    <div class="control-group">
				<label class="control-label">地址:</label>
				<div class="controls">
					<form:input path="address" htmlEscape="false" maxlength="200" class="required"/>
				</div>
		   </div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="mgt:school:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>


