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
				title : '使用Ext.form.field.Text',
				width : 300,
				bodyPadding : 5,
				renderTo : Ext.getBody(),
				items : [ {
					xtype : 'textfield',
					name : 'name',
					fieldLabel : '用户名',
					emptyText : '请输入用户名',
					allowBlank : false
				}, {
					xtype : 'textfield',
					name : 'password',
					inputType : 'password',
					fieldLabel : '密码',
					emptyText : '请输入密码',
					vtype : 'alphanum'
				}, {
					xtype : 'textfield',
					name : 'color',
					inputType : 'color',
					fieldLabel : '最爱的颜色',
					allowBlank : false
				}, {
					xtype : 'numberfield',
					anchor : '100%',
					name : 'minPrice',
					fieldLabel : '最低价格',
					value : 40,
					maxValue : 50,
					minValue : 10
				}, {
					xtype : 'numberfield',
					anchor : '100%',
					name : 'maxPrice',
					fieldLabel : '最大价格',
					value : '80',
					maxValue : '100',
					minValue : 50
				}, {
					xtype : 'datefield',
					anchor : '100%',
					name : 'fromDate',
					fieldLabel : '开始日期',
					minValue : '2012/08/01',
					maxValue : new Date(),
					disabledDays : [ 1, 3 ],
					format : 'm-d-Y',
					altFormats : 'Y,m,d|Y/m/d'
				}, {
					xtype : 'datefield',
					anchor : '100%',
					name : 'toDate',
					fieldLabel : '结束日期',
					minValue : new Date(),
					disabledDates : [ '09-16', '09-20' ],
					format : 'm-d-Y'
				} ],
				buttons : [ {
					text : '减少最小值',
					handler : function() {
						this.up('form').down('[name=minPrice]').spinDown();
					}
				}, {
					text : '增大最大值',
					handler : function() {
						this.up('form').down('[name=maxPrice]').spinDown();
					}
				}

				]
			});

			Ext.define('Ext.ux.ArraySpinner', {
				extend : 'Ext.form.field.Spinner',
				alias : 'widget.arrayspinner',
				onSpinUp : function() {
					var me = this;
					if (!me.readOnly) {
						var val = Ext.Array.indexOf(me.array, me.getValue());
						val = val >= 0 ? val : 0;
						if (val > 0) {
							val--;
						}
						me.setValue(me.array[val]);
					}
				},
				onSpinDown : function() {
					var me = this;
					if (!me.readOnly) {
						var val = Ext.Array.indexOf(me.array, me.getValue());

						if (val < me.array.length - 1) {
							val++;
						}
						me.setValue(me.array[val]);
					}
				}
			});

			var store = Ext.create('Ext.data.Store', {
				fields : [ 'id', 'name' ],
				data : [ {
					'id' : 1,
					'name' : "ass"
				}, {
					'id' : 2,
					'name' : "asddds"
				}, {
					'id' : 3,
					'name' : "asfsssss"
				} ]
			});
			Ext.create('Ext.form.FormPanel', {
				title : 'Ext.form.field.Spinner',
				bodyPadding : 5,
				width : 350,
				renderTo : Ext.getBody(),
				items : [ {
					xtype : 'arrayspinner',
					fieldLabel : '选择图书',
					array : [ '疯狂java', '轻量级', 'C++' ]
				}, {
					xtype : 'textareafield',
					fieldLabel : 'textArea',
					name : 'messaage',
					anchor : '100%',
					grow : true,
					growMin : 60,
					growMax : 200
				},{
					xtype:'combobox',
					name:'fuhekaung',
					fieldLabel:'复选框',
					width:200,
					store:store,
					displayField:'name',
					valueField:'id',
					queryMode:'local'
				} ]
			});
		});
	</script>
</body>
</html>