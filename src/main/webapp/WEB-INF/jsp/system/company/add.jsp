<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/company/add.js">
	
</script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
	text-align: right;
}

.col-sm-9 {
	width: 85%;
	float: left;
	text-align: left;
}

label[class^="btn btn-default"] {
	margin-top: -4px;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/company/addEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<div class="col-sm-3">
					<label class="control-label">公司名称</label>
				</div>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						placeholder="请输入公司名称" name="companyFormMap.name" id="name">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">所属园区</label>
				<div class="col-sm-9">
					<select id="partId" name="companyFormMap.partId"
							class="form-control m-b">
					</select>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">联系人用户名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
                   		placeholder="请输入联系人用户名" name="companyFormMap.username" id="username"/>
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">联系人姓名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						placeholder="请输入联系人姓名" name="companyFormMap.contactName" id="contactName">
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">身份证号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入身份证号码"
						   name="companyFormMap.identityNum" id="identityNum">
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">联系人密码</label>
				<div class="col-sm-9" style="color: red;">
					默认密码为:123456
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group" id="selRole" data-url="/type/selType.shtml"></div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">联系人手机号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入手机号"
						name="companyFormMap.mobile" id="mobile">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">联系人邮箱</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入邮箱"
						   name="companyFormMap.email" id="email">
				</div>
			</div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer> </section>
	</form>
	<script type="text/javascript">
	onloadurl();
    byPart("${company.partId}");
	</script>
	<script type="text/javascript"
		src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>