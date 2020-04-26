//单独验证某一个input  class="checkpass"
jQuery.validator.addMethod("checkacc", function(value, element) {
	return this.optional(element)
			|| ((value.length <= 30) && (value.length >= 6) && checknum(value));
}, "用户名由6至30位英文或数字组合构成");
$(function() {
	$("form").validate({
		submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交
			ly.ajaxSubmit(form, {// 验证新增是否成功
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data == "success") {
						layer.confirm('添加成功!是否关闭窗口?', function(index) {
							parent.grid.loadData();
							parent.layer.close(parent.pageii);
							return false;
						});
						$("#form")[0].reset();
					} else {
                        if(data=="partError"){
                            layer.alert("请选择所属园区");
						}else if(data == "error"){
                            layer.alert("不能选择多个企业类型");
						}else if (data == "selectError"){
                            layer.alert("请选择企业类型");
						}else{
							layer.msg('更新失败！', 3);
						}
					}
				}
			});
		},
		rules : {
			"companyFormMap.name" : {
				required : true,
				remote : { // 异步验证是否存在
					type : "POST",
					url : 'isExist.shtml',
					data : {
						name : function() {
							return $("#name").val();
						}
					}
				}
			},
			"companyFormMap.partId" : {
                min:1
			},
            "companyFormMap.username" : {
                required : true,
                remote : { // 异步验证是否存在
                    type : "POST",
                    url : 'isUsernameExist.shtml',
                    data : {
                        name : function() {
                            return $("#username").val();
                        }
                    }
                }
            },
            "companyFormMap.contactName" : {
                required : true
            },
            "companyFormMap.identityNum" : {
                required : true,
            	isIdCardNo : true
            },
			"selectGroups" : {
				required : true
			},
			"companyFormMap.mobile" : {
				isMobile : true,
                remote : { // 异步验证是否存在
                    type : "POST",
                    url : 'isMobileExist.shtml',
                    data : {
                        name : function() {
                            return $("#mobile").val();
                        }
                    }
                }
			},
			"companyFormMap.email" : {
				email:true
			}
		},
		messages : {
			"companyFormMap.name" : {
				required : "请输入公司名称",
				remote : "该公司名称已经存在"
			},
			"companyFormMap.partId" : {
				min : "请选择所属园区"
			},
			"companyFormMap.username" : {
				required : "请输入用户名",
                remote : "该用户名已存在"
			},
            "companyFormMap.contactName" : {
                required : "请输入联系人姓名"
            },
            "companyFormMap.identityNum" : {
                required : "请输入身份证号码",
                isIdCardNo : "请输入正确的身份证号码"
            },
            "selectGroups" : {
                required : "请选择企业类型"
            },
            "companyFormMap.mobile" : {
                isMobile : "请输入正确的手机号",
                remote : "该手机号已存在"
            },
			"companyFormMap.email" : {
				email:"请输入正确的email"
			}
		},
		errorPlacement : function(error, element) {// 自定义提示错误位置
			$(".l_err").css('display', 'block');
			// element.css('border','3px solid #FFCCCC');
			$(".l_err").html(error.html());
		},
		success : function(label) {// 验证通过后
			$(".l_err").css('display', 'none');
		}
	});
});
function byPart(state){
    var data = [1, 0];
    if (data != null) {
        var h = "<option value='-1'>请选择</option>";;
		h+="<option value='" + state +"' >正常</option>";
		h+="<option value='" + state +"' >停用</option>";
        $("#state").html(h);
    } else {
        bootbox.alert("获取园区信息错误，请联系管理员！");
    }
}
function checknum(value) {
    var Regx = /^[A-Za-z0-9]*$/;
    if (Regx.test(value)) {
        return true;
    }
    else {
        return false;
    }
}