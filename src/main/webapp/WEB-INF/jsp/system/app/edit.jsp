<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/app/edit.js"></script>
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
		action="${ctx}/app/editEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${app.id}"
			name="appFormMap.id" id="id">
		<section class="panel panel-default">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">第三方服务名</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkRole"
							placeholder="请输入第三方服务名" name="appFormMap.appName" id="roleName" value="${app.appName}"/>
					</div>
				</div>

				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">第三方服务链接</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" placeholder="请输入第三方服务链接"
							name="appFormMap.appServer" id="appServer" value="${app.appServer }">
					</div>
				</div>

				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">校验码</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" placeholder="请输入校验码"
							name="appFormMap.yzKey" id="yzKey" value="${app.yzKey }">
					</div>
				</div>

				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">状态</label>
					<div class="col-sm-9">
						<div class="btn-group m-r">
							<button data-toggle="dropdown"
								class="btn btn-sm btn-default dropdown-toggle">
								<span class="dropdown-label"><c:if test="${app.state eq 0}">可用</c:if><c:if test="${role.state eq 1}">不可用</c:if></span> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-select">
								<li class=""><a href="#"><input type="radio"
										name="appFormMap.state" value="0"<c:if test="${app.state eq 0}"> checked="checked"</c:if>>可用</a></li>
								<li class="active"><a href="#"><input type="radio"
										name="appFormMap.state" value="1" <c:if test="${app.state eq 1}"> checked="checked"</c:if>>不可用</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
			</div>
			<footer class="panel-footer text-right bg-light lter">
			<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer> 
	</section>
	</form>
	<script type='text/javascript'>
		/* $(function(){
			$("from input[name='enable'][value='${role.enable}']").attr("checked","checked");
			alert("input[name='enable'][value='${role.enable}']");
		}); */
	</script>
</body>
</html>