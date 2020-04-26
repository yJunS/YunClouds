//单独验证某一个input  class="checkpass"
jQuery.validator.addMethod("checkacc", function(value, element) {
	return this.optional(element)
			|| ((value.length <= 30) && (value.length >= 3));
}, "用户名由3至30位字符组合构成");
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
                            layer.alert("不能选择多个公司类型");
						}else{
							layer.msg('更新失败！', 3);
						};
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
                        },
                        id : function () {
                            return $("#id").val();
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
                        },
                        id : function () {
                            return $("#id").val();
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
                        },
                        id : function () {
                            return $("#id").val();
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

