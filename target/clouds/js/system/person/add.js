//单独验证某一个input  class="checkpass"
jQuery.validator.addMethod("checkacc", function(value, element) {
	return this.optional(element)
			|| ((value.length <= 30) && (value.length >= 6) && checknum(value));
}, "账号由6至30位英文或数字组合构成");
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
						layer.alert('添加失败！', 3);
					}
				}
			});
		},
		rules : {
			"personFormMap.username" : {
				required : true,
				remote : { // 异步验证是否存在
					type : "POST",
					url : 'isUserExist.shtml',
					data : {
						name : function() {
							return $("#username").val();
						}
					}
				}
			},
            "personFormMap.identityNum" : {
                required : true,
                isIdCardNo : true
            },
            "personFormMap.mobile" : {
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
            "personFormMap.email" : {
                email:true
            },
			"personFormMap.telephone" : {
                isTel : true
			}
		},
		messages : {
			"personFormMap.username" : {
				required : "请输入用户名",
				remote : "该用户名已经存在"
			},
            "personFormMap.identityNum" : {
                required : "请输入身份证号码",
                isIdCardNo : "请输入正确的身份证号码"
            },
            "personFormMap.mobile" : {
                isMobile : "请输入正确的手机号",
				remote : "该手机号已经存在"
            },
            "personFormMap.email" : {
                email:"请输入正确的email"
            },
			"personFormMap.telephone" : {
                isTel : "请输入正确的电话号码"
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
function checknum(value) {
    var Regx = /^[A-Za-z0-9]*$/;
    if (Regx.test(value)) {
        return true;
    }
    else {
        return false;
    }
}