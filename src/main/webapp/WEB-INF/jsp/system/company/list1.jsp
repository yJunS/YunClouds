<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/company/list.js"></script>
	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group" id="form-group1">
				<label class="control-label"> <span
					class="h4 font-thin v-middle">公司名称:</span></label> <input
					class="input-medium ui-autocomplete-input" id="name"
					name="companyFormMap.name">
				<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
			</div>
			<div class="form-group" id="form-group2" style="display:none;">
				<label class="control-label"> <span
						class="h4 font-thin v-middle">姓名:</span></label> <input
					class="input-medium ui-autocomplete-input" id="name1"
					name="personFormMap.name">
				<a href="javascript:void(0)" class="btn btn-default" id="search1">查询</a>
			</div>

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
