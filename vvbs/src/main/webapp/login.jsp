<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="utf-8"%>  
<%  
String path = request.getContextPath();//上下文路径  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html lang="en">
 <head>
  <base href="<%=basePath%>">
   
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>star</title>

  <script type="text/javascript" src="extJs/ext-all.js"></script>
  <script type="text/javascript" src="extJs/ext-lang-zh_CN.js"></script>
  <link href="extJs/resources/css/ext-all.css" rel="stylesheet" type="text/css"/>

 </head>
 <body>
    
    <script type="text/javascript">
        Ext.onReady(function(){
            Ext.create('Ext.form.Panel',{
            	title:'简单表单',
            	bodyPadding:5,
            	width:350,
            	url:'loginAction!login.action',
            	method:'POST',
            	layout:'anchor',
            	defaults:{
            		anchor:'100%'
            	},
            	defaultType:'textfield',
            	fieldDefaults:{
            		labelAlign:'left',
            		labelWidth:100
            	},
            	items:[
            	    {
            	    	fieldLabel:'用户名',
            	    	name:'name',
            	    	allowBlank:false//输入校验，不允许为空
            	    },
            	    {
            	    	fieldLabel:'密码',
            	    	name:'password',
            	    	allowBlank:false
            	    }
            	],
            	//为表单设置按钮
            	buttons:[
            	    {
            	        text:'重置',
            	        handler:function(){
            	        	this.up('form').getForm().reset();
            	        }
            	    },
            	    {
            	    	text:'提交',
            	    	formBind:true,//只有当整个表单校验通过时，按钮才可用
            	    	disabled:true,//默认不可用
            	    	handler:function(){
            	    		var form=this.up('form').getForm();//获取表单，实际上返回的事Ext.form.Basic对象
            	    		if(form.isValid()){
            	    			//以Ajax方式提交表单
            	    			form.submit({
            	    				//提交成功，第一个参数是Ext.form.Basic对象
            	    				//第二个参数是Ext.action.Action对象
            	    				success:function(form, action){
            	    					//Ext.Msg.alert('登陆成功',action.result.msg);
            	    					Ext.Msg.alert('登陆成功',"success");
            	    				},
            	    				//提交失败
            	    				failure:function(form, action){
            	    					Ext.Msg.alert('登录失败', "error");
            	    				}
            	    			});
            	    		}
            	    	}
            	    }
            	],
            	renderTo:Ext.getBody()
            });
            
        });
    </script>
    
 </body>
</html>