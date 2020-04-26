<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/user/edit.js"></script>

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
		action="${ctx}/user/editEntity.shtml">
		<input type="hidden" class="form-control checkacc"
			value="${user.id}" name="userFormMap.id" id="id">
		<input type="hidden" class="form-control checkacc"
			   value="${user.personId}" name="userFormMap.personId" id="personId">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">用户名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入用户名" value="${user.username}"
						name="userFormMap.username" id="username" readonly="readonly">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">姓名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						   placeholder="请输入姓名" value="${user.name}"
						   name="userFormMap.name" id="name">
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">身份证号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入身份证号码" value="${user.identityNum}"
						   name="userFormMap.identityNum" id="identityNum">
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">邮箱</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						placeholder="请输入邮箱" value="${user.email}"
						name="userFormMap.email" id="email">
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">角色名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						   placeholder="请输入角色名" value="${user.roleName}"
						   name="userFormMap.roleName" id="roleName" readonly="readonly">
				</div>
			</div>
			<%--<div class="line line-dashed line-lg pull-in"></div>
			<div id="selGroup"
				data-url="/role/selRole.shtml?roleFormMap.userId=${user.id}"></div>--%>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">是否锁定</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
						<button data-toggle="dropdown"
							class="btn btn-sm btn-default dropdown-toggle">
							<span class="dropdown-label"><c:if
									test="${user.isLock eq 1}">是</c:if>
								<c:if test="${user.isLock eq 0}">否</c:if></span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu dropdown-select">
							<li class="active"><a href="#"><input type="radio"
									name="userFormMap.isLock" value="1"
									<c:if test="${user.isLock eq 1}"> checked="checked"</c:if>>是</a></li>
							<li class=""><a href="#"><input type="radio"
									name="userFormMap.isLock" value="0"
									<c:if test="${user.isLock eq 0}"> checked="checked"</c:if>>否</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">传真号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						   placeholder="请输入传真号" value="${user.fax}"
						   name="userFormMap.fax" id="fax">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">手机号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						   placeholder="请输入手机号" value="${user.mobile}"
						   name="userFormMap.mobile" id="mobile">
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">一卡通卡号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						   placeholder="请输入一卡通卡号" value="${user.cardNumber}"
						   name="userFormMap.cardNumber" id="cardNumber">
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">一卡通密码</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						   placeholder="请输入一卡通密码" value="${user.cardPassword}"
						   name="userFormMap.cardPassword" id="cardPassword">
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