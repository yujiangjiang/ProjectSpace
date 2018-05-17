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
				//pageSize :2,
				proxy : {
					type : 'ajax',
					url : 'getAllBooks.action',
					//url : 'getBooksByPage.action',
					reader : {
						type : 'json',
						//分业加的
						//totalProperty : 'total',
						root : 'data'//直接读取服务器响应的数据
					},
				},
				autoLoad : true
			});

			var editWin;
			var editFn = function(grid, rowIndex, colIndex) {
				var rec = grid.getStore().getAt(rowIndex);
				if (editWin) {
					editWin.setTitle('编辑<' + rec.get('name') + '>');
					var formFields = editWin.items.get(0).items;
					formFields.get(0).setValue(rec.get('id'));
					formFields.get(1).setValue(rec.get('name'));
					formFields.get(2).setValue(rec.get('author'));
					formFields.get(3).setValue(rec.get('price'));
				} else {
					editWin = Ext.create('Ext.window.Window', {
						title : '编辑《' + rec.get('name') + '>',
						items : [ {
							url : 'updateBook.action',
							xtype : 'from',
							width : '100%',
							bodyPadding : 10,
							items : [ {
								xtype : 'textfield',
								name : 'id',
								readOnly : true,
								value : rec.get('id'),
								fieldLabel : 'ID'
							}, {
								xtype : 'textfield',
								name : 'name',
								value : rec.get('name'),
								fieldLabel : '书名'
							}, {
								xtype : 'textfield',
								name : 'author',
								value : rec.get('author'),
								fieldLabel : '作者'
							}, {
								xtype : 'textfield',
								name : 'price',
								value : rec.get('price'),
								fieldLabel : '价格'
							} ]
						} ],
						listeners : {
							beforedestroy : function(cmp) {
								this.hide();
								return false;
							}
						},
						bbar : [ {
							xtype : 'tbfill',
						}, {
							text : '确定',
							handler : function() {
								var form = editWin.items.get(0).getForm();
								if (form.isValid()) {
									form.submit({
										success : function(form, action) {
											bookStore.reload();
											editWin.hide();
											alert(action.result.tip);
										}
									});
								}
							}
						}, {
							text : '取消',
							handler : function() {
								editWin.hide();
							}
						}, {
							xtype : 'tbfill',
						} ]
					});
				}
				editWin.setVisible(true);
			};
			//
			var deleteFn = function(grid, rowIndex, colIndex) {
				if (confirm("确认删除", "真的要删除？")) {
					var rec = grid.getStore().getAt(rowIndex);
					Ext.Ajax.request({
						url : 'deleteBook.action',
						method : 'POST',
						params : {
							id : rec.get('id')
						},
						success : function(response) {
							bookStore.reload();
							//alert(Ext.JSON.decode(response.responseText).tip);
						}
					});
				}
			};

			var grid = Ext.create('Ext.grid.Panel', {
				title : '查看服务器端的图书',
				width : 550,
				renderTo : Ext.getBody(),
				columns : [ {
					text : '图书ID',
					dataIndex : 'id',
					flex : 1
				}, {
					text : '书名',
					dataIndex : 'name',
					flex : 1,
					editor : {
						xtype : 'textfield',
						allowPattern : false
					}
				}, {
					text : '作者',
					dataIndex : 'author',
					flex : 1,
					editor : {
						xtype : 'textfield',
						allowPattern : false
					}
				}, {
					text : '价格',
					dataIndex : 'price',
					flex : 1,
					editor : {
						xtype : 'numberfield',
						allowPattern : false
					}
				}, {
					text : '操作',
					xtype : 'actioncolumn',
					width : 50,
					items : [ {
						icon : 'edit.gif',
						tooltip : '编辑',
						handler : editFn
					}, {
						icon : 'extJs/examples/ux/css/images/top2.gif',
						tooltip : '删除',
						handler : deleteFn
					} ]
				} ],
				store:bookStore
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