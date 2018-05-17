<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/basic.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="extJs/examples/ux/CheckColumn.js"></script>
<link href="extJs/examples/ux/css/CheckHeader.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<script>
		Ext.onReady(function() {
			//Ext.tip.QuickTipManager().init();//初始化工具提示

			var userStore = Ext.create('Ext.data.Store', {
				data : [ {
					name : "孙悟空",
					isMarried : false,
					birthDate : '2018-12-12',
					height : 1.65
				}, {
					name : "猪八戒",
					isMarried : false,
					birthDate : '2018-12-12',
					height : 1.65
				}, {
					name : "玉帝",
					isMarried : true,
					birthDate : '2018-12-12',
					height : 1.65
				}, {
					name : "孙",
					isMarried : false,
					birthDate : '2018-12-12',
					height : 1.65
				} ],
				fields : [ 'name', 'isMarried', {
					name : 'birthDate',
					type : 'date',
					format : 'Y-m-d'
				}, 'height' ]
			});

			Ext.create('Ext.grid.Panel', {
				title : '查看用户',
				//width : 650,
				bodyPadding:10,
				height : 600,
				renderTo : Ext.getBody(),
				columns : [ {
					text : '序号',
					xtype : 'rownumberer',
					width : 30,
					height : 50
				}, {
					text : '人名',
					dataIndex : 'name',
				}, {
					text : '是否已婚',
					xtype : 'booleancolumn',
					trueText : '已婚',
					falseText : '未婚',
					dataIndex : 'isMarried'
				}, {
					text : '婚否',
					xtype : 'checkcolumn',
					dataIndex : 'isMarried',
					width : 55,
					cls : 'x-grid-checked'
				}, {
					text : '出生时间',
					xtype : 'datecolumn',
					dataIndex : 'birthDate',
					format : 'Y年m月d日',
				}, {
					text : '身高',
					xtype : 'numbercolumn',
					dataIndex : 'height',
					format : '0.00米'
				}, {
					text : '描述',
					xtype : 'templatecolumn',
					tpl : '人名：{name},身高：{height}',
					flex : 1
				}, {
					text : '操作',
					xtype : 'actioncolumn',
					width : 50,
					items : [ {
						icon : 'extJs/examples/ux/css/images/top2.gif',
						tooltip : '编辑',
						handler : function(grid, rowIndex, colIndex) {
							var rec = grid.getStore().getAt(rowIndex);
							alert("编辑【" + rec.get('name') + "】用户");
						}
					}, {
						icon : 'extJs/examples/ux/css/images/left2.gif',
						tooltip : '删除',
						handler : function(grid, rowIndex, colIndex) {
							var rec = grid.getStore().getAt(rowIndex);
							alert("编辑【" + rec.get('name') + "】用户");
						}
					} ]
				} ],
				store : userStore
			});
			
			
			
		});
	</script>
</body>
</html>