<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/login" method="post">
		用户名：<input id="name" type="text" name="name" /><br/>
		密$nbsp码:<input id="password" type="text" name="password" /><br/>
		<input type="submit" value="登录">
	</form>

</body>
</html>