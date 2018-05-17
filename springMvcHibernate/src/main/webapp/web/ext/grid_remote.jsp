<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/basic.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="extJs/examples/ux/CheckColumn.js"></script>
<link href="extJs/examples/ux/css/CheckHeader.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<script>
		Ext.onReady(function() {
			//Ext.tip.QuickTipManager().init();//初始化工具提示

			Ext.define('Book', {
				extend : 'Ext.data.Model',
				fields : [ {
					name : 'id',
					type : 'int'
				}, {
					name : 'name',
					type : 'string'
				}, {
					name : 'author',
					type : 'string'
				}, {
					name : 'price',
					type : 'float'
				} ]
			});

			var bookStore = Ext.create('Ext.data.Store', {
				model : 'Book',
				//指定分业大小
				pageSize :2,
				proxy : {
					type : 'ajax',
					//url : 'getAllBooks.action',
					url : 'getBooksByPage.action',
					reader : {
						type : 'json',
						//分业加的
						totalProperty : 'total',
						root : 'data'//直接读取服务器响应的数据
					},
				},
				autoLoad : true
			});

			Ext.create('Ext.grid.Panel', {
				title : '服务器端的书籍',
				//width : 650,
				bodyPadding : 10,
				//height : 600,
				renderTo : Ext.get("grid"),
				columns : [ {
					text : '图书的ID',
					dataIndex : 'id',
					flex : 1,
					height : 50
				}, {
					text : '书名',
					dataIndex : 'name',
					flex : 1
				}, {
					text : '作者',
					dataIndex : 'author',
					flex : 1
				}, {
					text : '价格',
					dataIndex : 'price',
					flex : 1
				} ],
				store : bookStore,
				//
				bbar : {
					xtype : 'pagingtoolbar',
					store : bookStore,
					displayInfo : true
				},
				tbar : [ {
					text : '新增',
					iconCls : 'a_add',
					handler : ""
				}, "-", {
					text : '编辑',
					handler : ""
				}, "-", {
					text : '知识点',
					handler : ""
				}, "-", {
					text : '标签',
					handler : ""
				}, "-", {
					text : '删除',
					handler : ""
				}, "-", {
					text : "搜索",
					handler : ""
				} ],
			});

		});
	</script>

	<div id="container">
		<div style='width: 100%; height: 100px; background-color: red; border: 1px solid black'>
			<h4>浙江省杭州市下沙浙江理工大学</h4>
			</br>
			<h1 style="bold: true">浙江省杭州市下沙浙江理工大学</h1>
		</div>
		<div id="grid" style="border: 1px; background-color: #123234; padding: 5px;"></div>
	</div>
</body>
</html>