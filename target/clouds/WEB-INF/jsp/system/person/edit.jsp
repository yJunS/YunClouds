<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/person/edit.js"></script>

<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
}

.col-sm-9 {
	width: 85%;
	float: left;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/person/editEntity.shtml">
		<input type="hidden" class="form-control checkacc"
			value="${person.id}" name="personFormMap.id" id="id">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">用户名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入用户名" value="${person.username}"
						name="personFormMap.username" id="username" readonly="readonly">
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">姓名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						placeholder="请输入姓名" value="${person.name}"
						name="personFormMap.name" id="name">
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">身份证</label>
				<div class="col-sm-9">
					<c:choose>
						<c:when test="${empty person.identityNum}">
							<input type="text" class="form-control" value="${person.identityNum}" placeholder="请输入身份证号" name="personFormMap.identityNum" id="identityNum" >
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control" value="${person.identityNum}" placeholder="请输入身份证号" name="personFormMap.identityNum" id="identityNum" readonly="readonly">
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div id="selGroup"
				data-url="/dept/selDept.shtml?deptFormMap.personId=${person.id}&deptFormMap.companyId=${person.companyId}"></div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">邮箱</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						   placeholder="请输入邮箱" name="personFormMap.email" value="${person.email}" id="email"/>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">电话号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入电话号"
						value="${person.telephone}" name="personFormMap.telephone" id="telephone">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">传真</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入传真号"
						   name="personFormMap.fax" value="${person.fax}" id="fax">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">手机号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入手机号"
						   name="personFormMap.mobile" value="${person.mobile}" id="mobile">
				</div>
			</div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<button type="submit" class="btn btn-success btn-s-xs">保存</button>
		</footer> </section>
	</form>
	<script type="text/javascript">
	onloadurl();
</script>
</body>
</html>