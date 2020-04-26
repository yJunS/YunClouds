<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="/common/common.jspf"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/system/person/freelist.js"></script>
</head>
<body>
	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<input type="hidden" id="companyId" value="${companyId}"/>
			<div class="form-group" id="form-group1">
				<label class="control-label"> <span
					class="h4 font-thin v-middle">姓名:</span></label> <input
					class="input-medium ui-autocomplete-input" id="name"
					name="personFormMap.name">
				<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
			</div>
            <button type="button" id="selectId" class="btn btn-primary marR10">选中</button>
			<%--<a href="javascript:grid.exportData('/user/export.shtml')" class="btn btn-info" id="search">导出excel</a>--%>
		</form>
	</div>
	<header class="panel-heading">
	<div class="doc-buttons">
		<c:forEach items="${res}" var="key">
			${key.description}
		</c:forEach>
	</div>
	</header>
	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>
	
	<div class="table-responsive">
		<div id="paging2" class="pagclass"></div>
	</div>
    <script type="text/javascript">
        onloadurl();
    </script>
    <script type="text/javascript"
            src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>