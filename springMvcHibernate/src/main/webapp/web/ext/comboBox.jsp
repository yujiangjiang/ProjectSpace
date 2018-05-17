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
			var categoryStore = Ext.create('Ext.data.Store', {
				fields : [ 'name', 'id' ],
				proxy : {
					type : 'ajax',
					url : 'getBooks.action',
					reader : {
						type : 'json',
						root : 'data'//直接读取服务器响应数据
					}
				},
				autoLoad : true
			});

			var bookStore = Ext.create('Ext.data.Store', {
				fields : [ 'name', 'id' ],
				proxy : {
					type : 'ajax',
					url : 'getBooksByCategory.action',
					reader : {
						type : 'json',
						root : 'data'
					}
				}
			});

			Ext.create('Ext.form.Panel', {
				title : '选择图书',
				bodyPadding : 5,
				width : 350,
				layout : 'anchor',
				renderTo : Ext.getBody(),
				defaults : {
					anchor : '100%'
				},
				items : [ {
					id : 'catgory_combo',
					xtype : 'combobox',
					fieldLabel : '选择种类',
					width : 300,
					store : categoryStore,
					displayField : 'name',
					valueField : 'id',
					queryMode : 'local',
					listeners : {
						select : function(combo, ecords) {
							Ext.getCmp('book_combo').reset();
							bookStore.load({
								params : {
									categoryId : combo.value
								}
							});
						}
					}
				}, {
					id : 'book_combo',
					xtype : 'combobox',
					fieldLabel : '选择图书',
					width : 300,
					store : bookStore,
					displayField : 'name',
					valueField : 'id',
					queryMode : 'local'
				} ]
			});

			Ext.define('Book', {
				extend : 'Ext.data.Model',
				fields : [ {
					name : 'name',
					type : 'string'
				}, {
					name : 'author',
					type : 'string'
				}, {
					name : 'price',
					type : 'float'
				}, {
					name : 'publishDate',
					type : 'date'
				} ]
			});

			var bookStore2 = Ext.create('Ext.data.Store', {
				model : 'Book',
				data : [ {
					"id" : 1,
					name : 'java',
					author : '李刚',
					price : 29.0,
					publishDate : '2018-09-09'
				}, {
					"id" : 2,
					name : 'C++',
					author : '李刚',
					price : 29.0,
					publishDate : '2018-09-11'
				}, {
					"id" : 3,
					name : 'Python',
					author : '李刚',
					price : 29.0,
					publishDate : '2018-09-10'
				} ]
			});
			Ext.create('Ext.grid.Panel', {
				title : '查看推书',
				width : 550,
				renderTo : Ext.getBody(),
				columns : [ {
                    text : '序号',
                    dataIndex : 'id',
                    flex : 1
                },{
					text : '书名',
					dataIndex : 'name',
					flex : 1
				},//第一列
				{
					text : '作者',
					dataIndex : 'author',
					flex : 1
				},//第二列
				{
					text : '价格',
					dataIndex : 'price',
					flex : 1
				},//第一列
				{
					text : '出版时间',
					dataIndex : 'publishDate',
					xtype : 'datecolumn',
					format : 'Y年m月d日',
					flex : 1
				} //第一列
				],
				store:bookStore2
			});
		});
	</script>
</body>
</html>