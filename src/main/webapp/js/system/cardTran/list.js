var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			width : "50px",
			hide : true
		}, {
			colkey : "cardNumber",
			name : "卡号"
		}, {
            colkey : "name",
            name : "所属人"
        }, {
            colkey : "merchantId",
            name : "商户号"
        }, {
        	colkey : "merchantName",
			name : "商户名称"
		}, {
			colkey : "terminalId",
			name : "终端号"
		}, {
			colkey : "tranType",
			name : "交易类型"
		}, {
			colkey : "tranDate",
			name : "交易日期",
            renderData : function(rowindex,data, rowdata, column) {
                return new Date(data).format("yyyy-MM-dd hh:mm:ss");
            }
		}, {
			colkey : "tranAmount",
			name : "交易金额"
		}, {
			colkey : "hostTranLs",
			name : "流水号"
		}],
		jsonUrl : rootPath + '/cardTran/findByPage.shtml',
		checkbox : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addRole").click("click", function() {
		addRole();
	});
	$("#editRole").click("click", function() {
		editRole();
	});
	$("#delFun").click("click", function() {
		delRole();
	});
	$("#permissions").click("click", function() {
		permissions();
	});
    $('#startTime').datetimepicker({
        format: 'yyyy-mm-dd hh:mm:ss',
        locale: moment.locale('zh-cn'),
        language: 'zh-CN',
        endDate:new Date(),
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left",
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('#endTime').datetimepicker({
        format: 'yyyy-mm-dd hh:mm:ss',
        locale: moment.locale('zh-cn'),
        language: 'zh-CN',
        endDate:new Date(),
        autoclose: true,
        pickerPosition: "bottom-left",
        todayBtn: true,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
});
function editRole() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "60%" ],
		content : rootPath + '/app/editUI.shtml?id=' + cbox
	});
}
function permissions() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("请选择一个对象！");
		return;
	}
	var url = rootPath + '/resources/permissions.shtml?roleId='+cbox;
	pageii = layer.open({
		title : "分配权限",
		type : 2,
		area : [ "700px", "60%" ],
		content : url
	});
}
function addRole() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "60%" ],
		content : rootPath + '/app/addUI.shtml'
	});
}
function delRole() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/app/deleteEntity.shtml';
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
