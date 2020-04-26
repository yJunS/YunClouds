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
			name : "用户名",
			isSort:true,
		}, {
			colkey : "username",
			name : "账号",
			isSort:true,
		}, {
			colkey : "roleName",
			name : "所属角色"
		}, {
			colkey : "state",
			name : "账号状态",
			width : '90px',
            renderData:function(value,rowData,data,rowIndex){
               if(data.state==1){
               	 return "正常";
			   } else{
               	 return "已锁定";
			   }
            },
			isSort:true
		}],
		jsonUrl : rootPath + '/person/findFreePerson.shtml',
		checkbox : true,
		serNumber : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#selectId").click("click", function() {
        selectId();
	});
	$("#editAccount").click("click", function() {
		editAccount();
	});
	$("#delAccount").click("click", function() {
		delAccount();
	});
	$("#permissions").click("click", function() {
		permissions();
	});
});
function selectId() {
	var cbox = grid.getSelectedCheckbox();
	if(cbox == ""){
		layer.msg("请选择一个用户");
		return;
	}
    layer.confirm('是否选中此用户？', function(index) {
        var url = rootPath + '/person/fixPerson.shtml';
        var s = CommnUtil.ajax(url, {
            ids : cbox.join(",")
        }, "json");
        if (s == "success") {
            layer.confirm('更新成功!是否关闭窗口?', function(index) {
                parent.grid.loadData();
                parent.layer.close(parent.pageii);
                return false;
            });
        } else {
            layer.msg('分配失败');
        }
    });
}
function addAccount() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/user/addUI.shtml'
	});
}
function delAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/user/deleteEntity.shtml';
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