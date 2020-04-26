var pageii = null;
var grid = null;
$(function() {
	var companyId = $("#companyId").val();
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ /*{
			colkey : "id",
			name : "id",
		}, */{
			colkey : "username",
			name : "用户名",
			isSort:true,
		}, {
			colkey : "name",
			name : "姓名",
			isSort:true,
		}, {
			colkey : "email",
			name : "邮箱",
			isSort:true,
		}, {
			colkey : "telephone",
			name : "电话号",
			isSort:true,
		},{
			colkey : "deptName",
			name : "部门名称",
			isSort:true,
		},{
			colkey : "isLeader",
			name : "职位",
			isSort:true,
		},{
			colkey : "companyName",
			name : "公司名称",
			isSort:true,
		}],
		jsonUrl : rootPath + '/person/findByPage.shtml?companyId='+companyId,
		checkbox : true,
		serNumber : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addFun").click("click", function() {
		addFun();
	});
	$("#editFun").click("click", function() {
		editFun();
	});
	$("#delFun").click("click", function() {
		delAccount();
	});
	$("#permissions").click("click", function() {
        fixperson();
	});
});
function editFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/person/editUI.shtml?id=' + cbox
	});
}
function addFun() {
    var companyId = $("#companyId").val();
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/person/addUI.shtml?companyId='+companyId
	});
}
function delAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/person/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
function fixperson() {
	var url = rootPath + '/person/toFreePersonUI.shtml';
	pageii = layer.open({
		title : "分配角色",
		type : 2,
		area : [ "70%", "80%" ],
		content : url
	});
}
