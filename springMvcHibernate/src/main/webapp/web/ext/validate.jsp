<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/basic.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<script>
		Ext.onReady(function() {
			Ext.create('Ext.form.Panel', {
				title : '简单的输入校验',
				bodyPadding : 5,
				width : 350,
				url : 'getUserInfo.action',
				layout : 'anchor',
				defaults : {
					anchor : '100%'
				},
				defaultType : 'textfield',
				fieldDefaults : {
					labelAlign : 'left',
					labelWidth : 100
				},
				items : [ {
					fieldLabel : '用户名',
					name : 'name',
					allowBlank : false,//不允许为空
					minLength : 4,
					maxLength : 8
				}, {
					fieldLabel : '密码',
					name : 'password',
					allowBlank : false,//不允许为空
					minLength : 4,
					maxLength : 6
				}, {
					fieldLabel : '电话号码',
					name : 'phone',
					allowBlank : false,
					regex : /^020\-\d{8}$/,
					regexText : '必须是020-xxxxxxxx格式！'
				} ],
				buttons : [ {
					text : '重设',
					handler : function() {
						this.up('form').getForm().reset();
					}
				}, {
					text : '提交',
					disabled : true,//默认按钮不可用
					formBind : true,//表单全部通过校验时可用
					handler : function() {
						var form = this.up('form').getForm();
						if (form.isValid()) {
							form.submit({
								success : function(form, action) {
								    alert(action.result.user.password)
								},
								failure : function(form, action) {
								    alert("error");
								}
							});
						}
					}
				} ],
				renderTo : Ext.getBody()
			});
		});
	</script>
</body>
</html>