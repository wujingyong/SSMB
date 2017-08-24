<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRUD</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.js"></script>
<link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
    rel="stylesheet">
<script type="text/javascript"
    src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    
    <!-- Modal -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal add_form">
						<div class="form-group">
							<label class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control" id="empName"
									placeholder="Name">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="email" name="email"
									placeholder="Email">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Gender</label>
							<label class="radio-inline">
                                <input type="radio" name="gender" id="option_m" value="m" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="option_f" value="f">女
							</label>
						</div>
						 <div class="form-group">
							<label class="col-sm-2 control-label">Department</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_add_select">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="save_emp">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal update_form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="empName_update"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email_update" name="email"
                                    placeholder="Email">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Gender</label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="m">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="f">女
                            </label>
                        </div>
                         <div class="form-group">
                            <label class="col-sm-2 control-label">Department</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="dept_update_select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="update_emp">更新</button>
                </div>
            </div>
        </div>
    </div>

	<div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary" id="emp_add">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button class="btn btn-danger" id="delete_checked">
                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th><input type="checkbox" id="checkAll"></th>
                        <th>#</th>
                        <th>lastName</th>
                        <th>email</th>
                        <th>gender</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
       	var divTd = $("<div></div>").addClass("row pageInfo");
       	divTd.appendTo(".container");
       	var totalRecord,currentNum,check_size;
       	function build_emps_table(result){
       		var emps = result.extend.pageInfo.list;
       		$.each(emps,function(index,item){
       			var selectTd = $("<td></td>").append("<input type='checkbox' class='check_item'></input>");
       			var empIdTd = $("<td></td>").append(item.empId);
       			var empNameTd = $("<td></td>").append(item.empName);
       			var emailTd = $("<td></td>").append(item.email);
       			var gender = item.gender == 'm' ? '男':'女';
       			var genderTd = $("<td></td>").append(gender);
       			var deptNameTd = $("<td></td>").append(item.department.deptName);
       			var editBtn = $("<button></button>").addClass("btn btn-info btn-sm")
       			.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
       			var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm btn_delete")
       			.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
       			var btnTd = $("<td></td>").append(editBtn).append(delBtn);
       			$("<tr></tr>").addClass("need_remove").append(selectTd).append(empIdTd).append(empNameTd).append(empNameTd)
       			.append(emailTd).append(genderTd).append(deptNameTd)
       			.append(btnTd).appendTo(".table");
       		});
       	}
       	function build_page_info(result){
       		var pageInfo = result.extend.pageInfo;
       		$("<div></div>").addClass("col-md-6").append(" 当前第" + pageInfo.pageNum + "页 共 " + pageInfo.pages + "页   总共 " + pageInfo.total + "条记录")
       		.appendTo(divTd);
       		totalRecord = pageInfo.pages + 1;
       		currentNum = pageInfo.pageNum;
       		check_size = pageInfo.size;
       	}
       	function build_nav(result){
       		var ulTd = $("<ul></ul>").addClass("pagination");
       		$("<div></div>").addClass("col-md-6").append("<nav></nav>").append(ulTd).appendTo(divTd);
       		if(result.extend.pageInfo.isFirstPage){
       			$("<li></li>").addClass("disabled").append($("<a></a>").append("首页")).appendTo(ulTd);
       		}else{
       			$("<li></li>").append($("<a></a>").append("首页").attr("href","#")).click(function(){to_page(1)}).appendTo(ulTd);
       			$("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;")).attr("href","#"))
       			              .click(function(){to_page(result.extend.pageInfo.prePage)}).appendTo(ulTd);
       		}
       		$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
       			var liTd = $("<li></li>").append($("<a></a>").append(item).attr("href","#")).click(function(){to_page(item);}).appendTo(ulTd);
       			if(result.extend.pageInfo.pageNum == item){
       				liTd.addClass("active");
       			}
       		})
       		
            var nextNd = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;")).attr("href","#"))
                                       .click(function(){to_page(result.extend.pageInfo.nextPage);});
       		nextNd.appendTo(ulTd);
            var endNd = $("<li></li>").append($("<a></a>").append("未页").attr("href","#"))
                                       .click(function(){to_page(result.extend.pageInfo.pages);});
            endNd.appendTo(ulTd);
       		if(result.extend.pageInfo.isLastPage){
                nextNd.remove();
                endNd.addClass("disabled").unbind("click");
            }
       	}
       	function to_page(pn){
       		$("#checkAll").prop("checked",false);
       		$(".need_remove").remove();
       		$(".pageInfo").empty();
        	$.ajax({
        		url:"${pageContext.request.contextPath}/getAll",
        		data:"pn="+pn,
        		type:"get",
        		success:function(result){
        			build_emps_table(result);
        			build_page_info(result);
        			build_nav(result);
        		}
        	});
       	}
       	function getDepts(nodeName){
       		$.ajax({
       			type:"get",
       			url:"${pageContext.request.contextPath}/getDepts",
       			success:function(result){
    				$(nodeName).empty();
       				$.each(result.extend.depts,function(){
	       				$("<option></option>").append(this.deptName).attr("value",this.deptId).appendTo(nodeName);
       				})
       			}
       		})
       	}
       	function show_validate_msg(node,msg,status){
       		$(node).parent().removeClass("has-error has-success");
       		if(!status){
       			 $(node).parent().addClass("has-error");
                 $(node).next("span").text(msg);
                 return false;
       		}else{
       			 $(node).parent().addClass("has-success");
                 $(node).next("span").text(msg);
       		}
       	}
       	function validate_addEmp(){
       		var empName = $("#empName").val();
       		var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/
       		if(!regName.test(empName)){
       		    show_validate_msg("#empName", "用户名为3-16位英文符号或2-5位中文", false);
       		}else{
       			show_validate_msg("#empName", "", true);
           }
       		var email = $("#email").val();
       		var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
       		if(!regEmail.test(email)){
       			show_validate_msg("#email", "邮箱格式不正确", false);
       			return false;
       		}else{
       			show_validate_msg("#email", "", true);
       		}
       		return true;
       	}
       	function getEmp(id){
       		$.ajax({
       			type:"get",
       			url:"${pageContext.request.contextPath}/getEmp/"+id,
       			data:"empName",
       			success:function(result){
       				$("#empName_update").text(result.extend.employee.empName);
       				$("#email_update").val(result.extend.employee.email);
       				$("#empUpdateModal [type='radio']").val([result.extend.employee.gender]);
       				$("#empUpdateModal select").val([result.extend.employee.dId]);
       			}
       		})
       	}       	
        $(function(){
        	to_page(1);
        	$("#emp_add").click(function(){
        		$(".add_form")[0].reset();
        		$(".add_form").find("*").removeClass("has-error has-success");
        		$(".help-block").text("");
        		$("#empAddModal").modal({
        			backdrop:"static"
        		})
        		getDepts("#dept_add_select");
        	})
        	$("#save_emp").click(function(){
        		if($("#save_emp").attr("isCommit")=="false")
        			return false;
        		if(!validate_addEmp())
        			return false;
        		$.ajax({
        			url:"${pageContext.request.contextPath}/addEmp",
        			type:"post",
        			data:$(".add_form").serialize(),
        			success:function(result){
        				if(result.code == 100){
	        				$("#empAddModal").modal("hide");
	        				to_page(totalRecord);
        				}else if(result.code == 200){
        					if(result.extend.errors.email != null){
        						if(undefined != result.extend.errors.empNameemail)
        							show_validate_msg("#empName", result.extend.errors.empName, false);
        						if(undefined != result.extend.errors.email)
        							show_validate_msg("#email", result.extend.errors.email, false);
        					}
        				}
        				alert(result.msg);
        			}
        		})
        	})
        	$("#empName").focus(function(){
                $("#empName").parent().removeClass("has-error has-success");
                $("#empName").next("span").text("");
            })
            $("#empName").change(function(){
            	var empName = $("#empName").val();
                var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/
                if(!regName.test(empName)){
                   show_validate_msg("#empName", "用户名为3-16位英文符号或2-5位中文", false);
                   return false;
                }else{
	            	$.ajax({
	            		type:"post",
	            		url:"${pageContext.request.contextPath}/validateEmpName",
	            		data:"empName="+empName,
	            		success:function(result){
	            			if(result.code == 100){
	            				show_validate_msg("#empName", "用户名可用", true);
	            				$("#save_emp").attr("isCommit",true);
	            			}else if(result.code == 200){
	            				show_validate_msg("#empName", "用户名不可用", false);
	            				$("#save_emp").attr("isCommit",false);
	            			}
	            		}
	            	})
                }
            })
			$(document).on("click", ".btn-info", function() {
					$("#empUpdateModal").modal();
					getDepts("#dept_update_select");
					var id = $(this).parents("tr").find("td:eq(1)").text();
					$("#update_emp").attr("update_id",id);
					getEmp(id);
			})
			$("#update_emp").click(function(){
				var id = $(this).attr("update_id");
				var email = $("#email_update").val();
	            var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	            if(!regEmail.test(email)){
	                show_validate_msg("#email_update", "邮箱格式不正确", false);
	                return false;
	            }else{
	                show_validate_msg("#email_update", "", true);
	            }
				$.ajax({
					type:"put",
					url:"${pageContext.request.contextPath}/updateEmp/"+id,
					data:$(".update_form").serialize(),
					success:function(result){
						alert(result.msg);
						$("#empUpdateModal").modal("hide");
						to_page(currentNum);
					}
				})
				return true;
			})
			$(document).on("click",".btn_delete",function(){
				var empName = $(this).parents("tr").find("td:eq(2)").text();
				var empId = $(this).parents("tr").find("td:eq(1)").text();
				var flag = confirm("你确定要删除"+empName+"的值吗？");
				if(flag){
					$.ajax({
						type:"delete",
						url:"${pageContext.request.contextPath}/deleteOne/"+empId,
						data:"",
						success:function(result){
							alert(result.msg);
							to_page(currentNum);
						}
					})
				}
			})
			$("#checkAll").click(function(){
				var flag = $("#checkAll").prop("checked");
				$(".check_item").prop("checked",flag);
			})
			$(document).on("click",".check_item",function(){
                if($(".check_item:checked").length==check_size)
                	$("#checkAll").prop("checked",true);
                else
                	$("#checkAll").prop("checked",false);
			})
			$("#delete_checked").click(function(){
				var empNames="";
				$.each($(".check_item:checked"),function(){
					empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
				})
				if($(".check_item:checked").length<1){
					return false;
				}
				empNames = empNames.substring(0,empNames.length -1);
				if(confirm("确定删除【" +empNames+"】吗？")){
					var data="";
					$.each($(".check_item:checked"),function(){
	                    data += $(this).parents("tr").find("td:eq(1)").text() + "-";
	                })
	                data = data.substring(0,data.length -1);
					$.ajax({
						type:"delete",
                        url:"${pageContext.request.contextPath}/deleteOne/"+data,
                        success:function(result){
                            alert(result.msg);
                            to_page(currentNum);
                        }
					})
				}
			})
		})
		</script>
</body>
</html>