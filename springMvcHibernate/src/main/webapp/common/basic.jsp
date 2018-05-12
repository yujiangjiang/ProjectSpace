
<%
	String path = request.getContextPath();//上下文路径  
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="extJs/ext-all.js"></script>
<script type="text/javascript" src="extJs/ext-lang-zh_CN.js"></script>
<link href="extJs/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
</head>

</html>