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
			var itemHandler = function(item, e) {
				Ext.getCmp('bookForm').load(
						{
							params : {
								bookId : item.value
							},
							failure : function(form, action) {
								Ext.Msg.alert('加载失败',
										action.result ? action.result.msg
												: "服务器响应失败")
							},
							success:function(form, action){
								alert(action.result.data.userName);
							}
						});
			}

			Ext.create('Ext.form.Panel', {
				id : 'bookForm',
				title : '简单的输入校验',
				bodyPadding : 5,
				width : 350,
				//档表单提交时自动提交Ajax请求
				url : 'getBookListById.action',
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
				bbar : [ {
					xtype : 'tbfill'
				}, {
					text : '选择图书',
					xtype : 'splitbutton',
					width : 100,
					menu : [ {
						text : 'book1',
						value : 1,
						handler : itemHandler
					}, {
						text : 'book2',
						value : 2,
						handler : itemHandler
					} ]
				} ],
				renderTo : Ext.getBody()
			});
		});
	</script>
</body>
</html>