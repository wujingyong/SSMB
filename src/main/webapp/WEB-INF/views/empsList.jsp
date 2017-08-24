<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/SSM/static/js/jquery-3.1.1.js"></script>
<link href="/SSM/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="/SSM/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
				</button>
				<button class="btn btn-danger">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
				</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th><input type="checkbox" /></th>
						<th>#</th>
						<th>lastName</th>
						<th>email</th>
						<th>gender</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<td><input type="checkbox" /></td>
							<td>${emp.empId }</td>
							<td>${emp.empName }</td>
							<td>${emp.gender=="M" ? "男":"女" }</td>
							<td>${emp.email }</td>
							<td>${emp.department.deptName }</td>
							<td>
								<button class="btn btn-info btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
			 当前第${pageInfo.pageNum }页 共${pageInfo.pages }页 总共${pageInfo.total }条记录
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
				    <c:if test="${pageInfo.isFirstPage }">
						<li class="disabled"><a>首页</a></li>
				    </c:if>
				    <c:if test="${!pageInfo.isFirstPage }">
                        <li><a href="${pageContext.request.contextPath }/getAll?">首页</a></li>
                        <li><a href="${pageContext.request.contextPath }/getAll?pn=${pageInfo.prePage }" aria-label="Previous"> <span
                                aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="navigatepage">
					    <c:if test="${pageInfo.pageNum == navigatepage }">
							<li class="active"><a href="#">${navigatepage }</a></li>
					    </c:if>
					    <c:if test="${pageInfo.pageNum != navigatepage }">
							<li><a href="${pageContext.request.contextPath }/getAll?pn=${navigatepage }">${navigatepage }</a></li>
					    </c:if>
					</c:forEach>
					<c:if test="${pageInfo.isLastPage }">
						<li class="disabled"><a>未页</a></li>
					</c:if>
					<c:if test="${!pageInfo.isLastPage }">
						<li><a href="${pageContext.request.contextPath }/getAll?pn=${pageInfo.nextPage }" aria-label="Next"> <span
								aria-h  idden="true">&raquo;</span>
						</a></li>
						<li><a href="${pageContext.request.contextPath }/getAll?pn=${pageInfo.pages }">未页</a></li>
					</c:if>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>