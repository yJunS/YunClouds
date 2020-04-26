//单独验证某一个input  class="checkpass"
jQuery.validator.addMethod("checkacc", function(value, element) {
	return this.optional(element)
			|| ((value.length <= 30) && (value.length >= 3));
}, "账号由3至30位字符组合构成");
$(function() {

	$("form").validate({
		submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交
			ly.ajaxSubmit(form, {// 验证新增是否成功
				type : "post",
				dataType : "json",//ajaxSubmi带有文件上传的。不需要设置json
				success : function(data) {
					if (data == "success") {
						layer.confirm('更新成功!是否关闭窗口?', function(index) {
							parent.grid.loadData();
							parent.layer.close(parent.pageii);
							return false;
						});
					} else {
                        if(data == "error"){
                            layer.alert("不能选择多个角色");
                        }else if(data == "selectError"){
                            layer.alert("请选择角色");
                        }else{
							layer.msg('更新失败！', 3);
						}
					}
				}
			});
		},
        rules : {
            "userFormMap.username" : {
                required : true,
                remote : { // 异步验证是否存在
                    type : "POST",
                    url : 'isUserExist.shtml',
                    data : {
                        name : function() {
                            return $("#username").val();
                        },
						id : function () {
							return $("#id").val();
                        }
                    }
                }
            },
            "userFormMap.name" : {
                required : true
            },
            "userFormMap.identityNum" : {
                required : true,
                isIdCardNo : true,
                remote : { // 异步验证是否存在
                    type : "POST",
                    url : 'isidentityNumExist.shtml',
                    data : {
                        name : function() {
                            return $("#identityNum").val();
                        },
                        id : function () {
                            return $("#id").val();
                        }
                    }
                }
            },
            "userFormMap.mobile" : {
                isMobile : true,
                remote : { // 异步验证是否存在
                    type : "POST",
                    url : 'isMobileExist.shtml',
                    data : {
                        name : function() {
                            return $("#mobile").val();
                        },
                        id : function () {
                            return $("#id").val();
                        }
                    }
                }
            },
            "userFormMap.email" : {
                email:true
            }
        },
        messages : {
            "userFormMap.username" : {
                required : "请输入用户名",
                remote : "该用户名已经存在"
            },
            "userFormMap.name" : {
                required : "请输入姓名"
            },
            "userFormMap.identityNum" : {
                required : "请输入身份证号码",
                isIdCardNo : "请输入正确的身份证号码",
                remote : "该身份证号已经存在"
            },
            "userFormMap.mobile" : {
                isMobile : "请输入正确的手机号",
                remote : "该手机号已存在"
            },
            "userFormMap.email" : {
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
