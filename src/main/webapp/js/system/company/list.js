var pageii = null;
var grid = null;
$(function() {
	
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ /*{
			colkey : "id",
			name : "id",
		},*/ {
			colkey : "name",
			name : "公司名称",
			isSort:true,
		}, {
			colkey : "typeName",
			name : "公司类型",
			isSort:true,
		}, {
            colkey : "partName",
            name : "所属园区",
            isSort:true,
        },{
			colkey : "selectPerson",
			name : "查看公司人员",
			renderData:function(value,rowData,data,rowIndex){
				return "<a href='javascript:;' onclick='goHome(\""+data.id+"\");'>查看</a>";
			}
		},{
			colkey : "selectDept",
			name : "查看公司部门",
			renderData:function(value,rowData,data,rowIndex){
				return "<a href='javascript:;' onclick='goHomeDept(\""+data.id+"\");'>查看</a>";
			}
		}],
		jsonUrl : rootPath + '/company/findByPage.shtml',
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
		editAccount();
	});
	$("#delFun").click("click", function() {
		delAccount();
	});
	$("#permissions").click("click", function() {
		permissions();
	});
});
function editAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1) {
		layer.msg("只能选中一个");
		return;
	}
	if(cbox == ""){
		layer.msg("请选择一个公司");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/company/editUI.shtml?id=' + cbox
	});
}
function addFun() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/company/addUI.shtml'
	});
}
function delAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/company/deleteEntity.shtml';
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
function permissions() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	var url = rootPath + '/resources/permissions.shtml?userId='+cbox;
	pageii = layer.open({
		title : "分配权限",
		type : 2,
		area : [ "700px", "80%" ],
		content : url
	});
}

function goHome(id){
	goPath("系统基础管理,公司管理,公司成员,/person/list.shtml?id=37&companyId="+id+"");
	/*$("#form-group1").hide();
	$("#paging").hide();
	$("#form-group2").css("display","block");
	$(function() {

		grid = lyGrid({
			pagId : 'paging2',
			l_column : [ {
				colkey : "id",
				name : "id",
			}, {
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
				colkey : "companyName",
				name : "公司名称",
				isSort:true,
			}],
			jsonUrl : rootPath + '/person/findByPage.shtml?companyId='+id,
			checkbox : true,
			serNumber : true
		});
		$("#search1").click("click", function() {// 绑定查询按扭
			var searchParams = $("#searchForm").serializeJson();// 初始化传参数
			grid.setOptions({
				data : searchParams
			});
		});
		$("#addFun").click("click", function() {
			addAccount();
		});
		$("#editFun").click("click", function() {
			editAccount();
		});
		$("#delFun").click("click", function() {
			delAccount();
		});
		$("#permissions").click("click", function() {
			permissions();
		});
	});*/
}

function goHomeDept(id) {
	goPath("系统基础管理,公司管理,公司部门,/dept/list.shtml?id=37&companyId=" + id + "");
}