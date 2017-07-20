<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js" ></script>
<link  href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<script  src="${ctx}/js/jquery-1.12.4.min.js"></script>
</head>
<body>
	<%-- <table>
 	 <tr><td>姓名</td>
 	 <td>年龄</td></tr>
 	<c:forEach var="item" items="${list}"  >
 		<tr>
 			<td>${item.userName}</td>
 			<td>${item.age}</td>
 		</tr>
 		</c:forEach> --%>
 	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>用户列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>#</th>
							<th>userName</th>
							<th>age</th>
							<th>email</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
			<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>		
	</div>
<script  type="text/javascript">

		var totalRecord,currentPager;	
		$(function(){
			toPage(1);
		});
		
			function to_page(pn){
				$.ajax({
					url:"${ctx}/users",
					data:"pn="+pn,
					type:"GET",
					success:function(result){
						build_emps_table(result);
						build_page_info(result);
						build_page_nav(result);
					}
				})
			}		
		
		
			function build_emps_table(result){
				//清空table表格
				$("#emps_table tbody").empty();
				var emps = result.extend.pageInfo.list;
				$.each(emps,function(index,item){
					var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
					var id = $("<td></td>").append(item.id);
					var username = $("<td></td>").append(item.username);
					var email = $("<td></td>").append(item.email);
					
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
									.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
					//为编辑按钮添加一个自定义的属性，来表示当前员工id
					editBtn.attr("edit-id",item.empId);
					var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
									.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
					//为删除按钮添加一个自定义的属性来表示当前删除的员工id
					delBtn.attr("del-id",item.id);
					var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
					//var delBtn = 
					//append方法执行完成以后还是返回原来的元素
					$("<tr></tr>").append(checkBoxTd)
						.append(id)
						.append(username)
						.append(age)
						.append(email)
						.appendTo("#emps_table tbody");
				   });
			    }
    
			//解析显示分页信息
			function build_page_info(result){
				$("#page_info_area").empty();
				$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
						result.extend.pageInfo.pages+"页,总"+
						result.extend.pageInfo.total+"条记录");
				totalRecord = result.extend.pageInfo.total;
				currentPage = result.extend.pageInfo.pageNum;
			}
			//解析显示分页条，点击分页要能去下一页....
			function build_page_nav(result){
				//page_nav_area
				$("#page_nav_area").empty();
				var ul = $("<ul></ul>").addClass("pagination");
				
				//构建元素
				var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
				var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
				if(result.extend.pageInfo.hasPreviousPage == false){
					firstPageLi.addClass("disabled");
					prePageLi.addClass("disabled");
				}else{
					//为元素添加点击翻页的事件
					firstPageLi.click(function(){
						to_page(1);
					});
					prePageLi.click(function(){
						to_page(result.extend.pageInfo.pageNum -1);
					});
				}
			}
    
</script>
</body>
</html>