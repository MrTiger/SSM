<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<%
	pageContext.setAttribute("ctx", request.getContextPath());
%>
</head>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js" ></script>
<link  href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<script  src="${ctx}/js/jquery-1.12.4.min.js"></script>
<body>
  <a href="${ctx}/getAllUsers">用户列表</a>
  
  <form action="${ctx}/upload" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="file">文件</label>
    <input type="file" name="file" id="file"><hr/>
    <button type="submit" class="btn btn-default">提交</button>
  </div>
  </form>
</body>
</html>