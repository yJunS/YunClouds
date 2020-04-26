<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/company/edit.js"></script>

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
		action="${ctx}/company/editEntity.shtml">
		<input type="hidden" class="form-control checkacc"
			value="${company.id}" name="companyFormMap.id" id="id">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">公司名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						placeholder="请输入公司名称" value="${company.name}"
						name="companyFormMap.name" id="name" readonly="readonly" />
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
						   placeholder="请输入联系人用户名" name="companyFormMap.username" value="${company.username}" id="username" readonly="readonly" />
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">公司联系人</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						   placeholder="请输入公司联系人" value="${company.contactName}"
						   name="companyFormMap.contactName" id="contactName" />
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">身份证号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" value="${company.identityNum}" placeholder="请输入身份证号" name="companyFormMap.identityNum" id="identityNum" />
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div id="selGroup"
				data-url="/type/selType.shtml?typeFormMap.companyId=${company.id}"></div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">联系人手机号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入手机号"
						value="${company.mobile}" name="companyFormMap.mobile" id="mobile" />
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">联系人邮箱</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入邮箱"
						   value="${company.email}" name="companyFormMap.email" id="email" />
				</div>
			</div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<button type="submit" class="btn btn-success btn-s-xs">保存</button>
		</footer> </section>
	</form>
	<script type="text/javascript">
		onloadurl();
        function byPart(id){
            var url = rootPath + '/part/partList.shtml';
            var data = CommnUtil.ajax(url, null,"json");
            if (data != null) {
                var h = "<option value='0'>请选择</option>";;
                for ( var i = 0; i < data.length; i++) {
                    if(parseInt(id,10)==parseInt(data[i].id,10)){
                        h+="<option value='" + data[i].id + "' selected='selected'>"
                            + data[i].partName + "</option>";
                    }else{
                        h+="<option value='" + data[i].id + "'>"+ data[i].partName + "</option>";
                    }
                }
                $("#partId").html(h);
            } else {
                bootbox.alert("获取园区信息错误，请联系管理员！");
            }
        }
    	byPart("${company.partId}");
	</script>
</body>
</html>