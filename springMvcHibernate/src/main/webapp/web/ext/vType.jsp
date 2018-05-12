<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/basic.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="common/js/validate.js"></script>
</head>
<body>
	<script>
		Ext.onReady(function() {
			Ext.create('Ext.form.Panel', {
				title : '使用VTypes执行输入校验',
				bodyPadding : 5,
				width : 350,
				method : 'POST',
				//height : 200,
				url : 'vType.action',
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
					name : 'userName',
					allowBlank : false,
					vtype : 'alpha'
				}, {
					fieldLabel : '密码',
					name : 'password',
					allowBlank : false,
					vtype : 'alpha'
				}, {
					fieldLabel : '邮箱',
					name : 'email',
					allowBlank : false,
					vtype : 'email'
				}, {
					fieldLabel : '加入时间',
					name : 'addTime',
					allowBlank : false,
					vtype : 'time'
				} ],
				buttons : [ {
					text : 'reset',
					handler : function() {
						this.up('form').getForm().reset();
					}
				}, {
					text : '提交',
					disabled : true,//按钮默认不可用
					formBind : true,
					handler : function() {
						this.up('form').getForm().submit();
					}
				//当表单的所有域都通过校验时按钮才可用
				} ],
				renderTo : Ext.getBody()
			});

		});
	</script>
</body>
</html>