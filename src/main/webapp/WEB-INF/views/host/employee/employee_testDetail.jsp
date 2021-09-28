<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | Data Tables</title>

<link href="${path}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/resources/bootstrap/css/font-awesome.css" rel="stylesheet">
<link href="${path}/resources/bootstrap/css/summernote-bs4.css" rel="stylesheet">
                            
<link href="${path}/resources/bootstrap/css/datepicker3.css" rel="stylesheet">
                            
<link href="${path}/resources/bootstrap/css/animate.css" rel="stylesheet">
<link href="${path}/resources/bootstrap/css/style.css" rel="stylesheet">

</head>
<body style="background-color:white;">
	
<!-- Main -->
<div class="row">
    <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>회원정보<small>With custom checbox and radion elements.</small></h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#" class="dropdown-item">Config option 1</a>
                        </li>
                        <li><a href="#" class="dropdown-item">Config option 2</a>
                        </li>
                    </ul>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            
            <!-- 직원 정보 -- 시작 -->
            <div class="ibox-content">
                <form method="get">
                	<table class="table table-striped table-bordered table-hover dataTables-example" style="border:0px solid;">
			           
			            <tbody>
			            <tr class="gradeX">
			                <td>직원코드</td>
			                <td><input type="text" value="E1"></td>
			                <td>부서</td>
			                <td><input type="text" value="회계"></td>
			            </tr>
			            <tr class="gradeC">
			                <td>직원ID</td>
			                <td><input type="text" value="test"></td>
			                <td>직책</td>
			                <td><input type="text" value="신입"></td>
			            </tr>
			            <tr class="gradeA">
			                <td>직원이름</td>
			                <td><input type="text" value="정원제"></td>
			                <td>직위</td>
			                <td><input type="text" value="신입"></td>
			            </tr>
			            <tr class="gradeA">
			                <td>성별</td>
			                <td><input type="text" value="남"></td>
			                <td>직무</td>
			                <td><input type="text" value="잡일"></td>
			            </tr>
			            <tr class="gradeA">
			                <td>나이</td>
			                <td><input type="text" value="27"></td>
			                <td>고용형태</td>
			                <td><input type="text" value="계약직"></td>
			            </tr>
			            
			            <tr class="gradeA">
			                <td>입사날짜</td>
			                <td><input type="date" value="2021-09-16"></td>
			                <td class="center">퇴사날짜</td>
			                <td><input type="date" value="27"></td>
			            </tr>
			            </tbody>
			         
			          </table>
						<div class="form-group row">
							<div class="col-sm-4 col-sm-offset-2">
						</div>
                    </div>
                </form>
            </div>
            
            <button class="btn btn-white btn-sm" type="submit">Cancel</button>
            <button class="btn btn-primary btn-sm" type="submit">Save changes</button>
            <!-- 직원 정보 -- 끝 -->
            
            <!-- 근태 / 휴가 / 급여 -- 시작 -->
            <div class="wrapper wrapper-content animated fadeInRight ecommerce">

            <div class="row">
                <div class="col-lg-12">
                    <div class="tabs-container">
                            <ul class="nav nav-tabs">
                                <li><a class="nav-link active" data-toggle="tab" href="#tab-1"> 근태 </a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab-2"> 휴가 </a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab-3"> 급여 </a></li>
                            </ul>
                            <div class="tab-content">
                            
                            <!-- 근태 시작 -->
                                <div id="tab-1" class="tab-pane active">
                                    <div class="wrapper wrapper-content animated fadeInRight">
							            <div class="row">
							                <div class="col-lg-12">
							                    <div class="ibox ">
							                        <div class="ibox-title">
							                            <h5>FooTable with row toggler, sorting and pagination</h5>
							
							                            <div class="ibox-tools">
							                                <a class="collapse-link">
							                                    <i class="fa fa-chevron-up"></i>
							                                </a>
							                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
							                                    <i class="fa fa-wrench"></i>
							                                </a>
							                                <ul class="dropdown-menu dropdown-user">
							                                    <li><a href="#" class="dropdown-item">Config option 1</a>
							                                    </li>
							                                    <li><a href="#" class="dropdown-item">Config option 2</a>
							                                    </li>
							                                </ul>
							                                <a class="close-link">
							                                    <i class="fa fa-times"></i>
							                                </a>
							                            </div>
							                        </div>
							                        <div class="ibox-content">
							
							                            <table class="footable table table-stripped toggle-arrow-tiny">
							                                <thead>
							                                <tr>
							
							                                    <th data-toggle="true">Project</th>
							                                    <th>Name</th>
							                                    <th>Phone</th>
							                                    <th data-hide="all">Company</th>
							                                    <th data-hide="all">Completed</th>
							                                    <th data-hide="all">Task</th>
							                                    <th data-hide="all">Date</th>
							                                    <th>Action</th>
							                                </tr>
							                                </thead>
							                                <tbody>
							                                <tr>
							                                    <td>Project - This is example of project</td>
							                                    <td>Patrick Smith</td>
							                                    <td>0800 051213</td>
							                                    <td>Inceptos Hymenaeos Ltd</td>
							                                    <td><span class="pie">0.52/1.561</span></td>
							                                    <td>20%</td>
							                                    <td>Jul 14, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Alpha project</td>
							                                    <td>Alice Jackson</td>
							                                    <td>0500 780909</td>
							                                    <td>Nec Euismod In Company</td>
							                                    <td><span class="pie">6,9</span></td>
							                                    <td>40%</td>
							                                    <td>Jul 16, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Betha project</td>
							                                    <td>John Smith</td>
							                                    <td>0800 1111</td>
							                                    <td>Erat Volutpat</td>
							                                    <td><span class="pie">3,1</span></td>
							                                    <td>75%</td>
							                                    <td>Jul 18, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Gamma project</td>
							                                    <td>Anna Jordan</td>
							                                    <td>(016977) 0648</td>
							                                    <td>Tellus Ltd</td>
							                                    <td><span class="pie">4,9</span></td>
							                                    <td>18%</td>
							                                    <td>Jul 22, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Alpha project</td>
							                                    <td>Alice Jackson</td>
							                                    <td>0500 780909</td>
							                                    <td>Nec Euismod In Company</td>
							                                    <td><span class="pie">6,9</span></td>
							                                    <td>40%</td>
							                                    <td>Jul 16, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Project
							                                        <small>This is example of project</small>
							                                    </td>
							                                    <td>Patrick Smith</td>
							                                    <td>0800 051213</td>
							                                    <td>Inceptos Hymenaeos Ltd</td>
							                                    <td><span class="pie">0.52/1.561</span></td>
							                                    <td>20%</td>
							                                    <td>Jul 14, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Gamma project</td>
							                                    <td>Anna Jordan</td>
							                                    <td>(016977) 0648</td>
							                                    <td>Tellus Ltd</td>
							                                    <td><span class="pie">4,9</span></td>
							                                    <td>18%</td>
							                                    <td>Jul 22, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Project
							                                        <small>This is example of project</small>
							                                    </td>
							                                    <td>Patrick Smith</td>
							                                    <td>0800 051213</td>
							                                    <td>Inceptos Hymenaeos Ltd</td>
							                                    <td><span class="pie">0.52/1.561</span></td>
							                                    <td>20%</td>
							                                    <td>Jul 14, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Alpha project</td>
							                                    <td>Alice Jackson</td>
							                                    <td>0500 780909</td>
							                                    <td>Nec Euismod In Company</td>
							                                    <td><span class="pie">6,9</span></td>
							                                    <td>40%</td>
							                                    <td>Jul 16, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Betha project</td>
							                                    <td>John Smith</td>
							                                    <td>0800 1111</td>
							                                    <td>Erat Volutpat</td>
							                                    <td><span class="pie">3,1</span></td>
							                                    <td>75%</td>
							                                    <td>Jul 18, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Gamma project</td>
							                                    <td>Anna Jordan</td>
							                                    <td>(016977) 0648</td>
							                                    <td>Tellus Ltd</td>
							                                    <td><span class="pie">4,9</span></td>
							                                    <td>18%</td>
							                                    <td>Jul 22, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Alpha project</td>
							                                    <td>Alice Jackson</td>
							                                    <td>0500 780909</td>
							                                    <td>Nec Euismod In Company</td>
							                                    <td><span class="pie">6,9</span></td>
							                                    <td>40%</td>
							                                    <td>Jul 16, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Project
							                                        <small>This is example of project</small>
							                                    </td>
							                                    <td>Patrick Smith</td>
							                                    <td>0800 051213</td>
							                                    <td>Inceptos Hymenaeos Ltd</td>
							                                    <td><span class="pie">0.52/1.561</span></td>
							                                    <td>20%</td>
							                                    <td>Jul 14, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                <tr>
							                                    <td>Gamma project</td>
							                                    <td>Anna Jordan</td>
							                                    <td>(016977) 0648</td>
							                                    <td>Tellus Ltd</td>
							                                    <td><span class="pie">4,9</span></td>
							                                    <td>18%</td>
							                                    <td>Jul 22, 2013</td>
							                                    <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
							                                </tr>
							                                </tbody>
							                                <tfoot>
							                                <tr>
							                                    <td colspan="5">
							                                        <ul class="pagination float-right"></ul>
							                                    </td>
							                                </tr>
							                                </tfoot>
							                            </table>
							
							                        </div>
							                    </div>
							                </div>
							            </div>
							        </div>
                                </div>
                                <div id="tab-2" class="tab-pane">
                                    <div class="panel-body">

                                        <fieldset>
                                            <div class="form-group row"><label class="col-sm-2 col-form-label">ID:</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="543"></div>
                                            </div>
                                            <div class="form-group row"><label class="col-sm-2 col-form-label">Model:</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="..."></div>
                                            </div>
                                            <div class="form-group row"><label class="col-sm-2 col-form-label">Location:</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="location"></div>
                                            </div>
                                            <div class="form-group row"><label class="col-sm-2 col-form-label">Tax Class:</label>
                                                <div class="col-sm-10">
                                                    <select class="form-control" >
                                                        <option>option 1</option>
                                                        <option>option 2</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row"><label class="col-sm-2 col-form-label">Quantity:</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="Quantity"></div>
                                            </div>
                                            <div class="form-group row"><label class="col-sm-2 col-form-label">Minimum quantity:</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="2"></div>
                                            </div>
                                            <div class="form-group row"><label class="col-sm-2 col-form-label">Sort order:</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="0"></div>
                                            </div>
                                            <div class="form-group row"><label class="col-sm-2 col-form-label">Status:</label>
                                                <div class="col-sm-10">
                                                    <select class="form-control" >
                                                        <option>option 1</option>
                                                        <option>option 2</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </fieldset>


                                    </div>
                                </div>
                                <div id="tab-3" class="tab-pane">
                                    <div class="panel-body">

                                        <div class="table-responsive">
                                            <table class="table table-stripped table-bordered">

                                                <thead>
                                                <tr>
                                                    <th>
                                                        Group
                                                    </th>
                                                    <th>
                                                        Quantity
                                                    </th>
                                                    <th>
                                                        Discount
                                                    </th>
                                                    <th style="width: 20%">
                                                        Date start
                                                    </th>
                                                    <th style="width: 20%">
                                                        Date end
                                                    </th>
                                                    <th>
                                                        Actions
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <select class="form-control" >
                                                            <option selected>Group 1</option>
                                                            <option>Group 2</option>
                                                            <option>Group 3</option>
                                                            <option>Group 4</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="10">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="$10.00">
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                            <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <select class="form-control" >
                                                            <option selected>Group 1</option>
                                                            <option>Group 2</option>
                                                            <option>Group 3</option>
                                                            <option>Group 4</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="10">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="$10.00">
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <select class="form-control" >
                                                            <option selected>Group 1</option>
                                                            <option>Group 2</option>
                                                            <option>Group 3</option>
                                                            <option>Group 4</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="10">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="$10.00">
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <select class="form-control" >
                                                            <option selected>Group 1</option>
                                                            <option>Group 2</option>
                                                            <option>Group 3</option>
                                                            <option>Group 4</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="10">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="$10.00">
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <select class="form-control" >
                                                            <option selected>Group 1</option>
                                                            <option>Group 2</option>
                                                            <option>Group 3</option>
                                                            <option>Group 4</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="10">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="$10.00">
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <select class="form-control" >
                                                            <option selected>Group 1</option>
                                                            <option>Group 2</option>
                                                            <option>Group 3</option>
                                                            <option>Group 4</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="10">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="$10.00">
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <select class="form-control" >
                                                            <option selected>Group 1</option>
                                                            <option>Group 2</option>
                                                            <option>Group 3</option>
                                                            <option>Group 4</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="10">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" placeholder="$10.00">
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="07/01/2014">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>

                                                </tbody>

                                            </table>
                                        </div>

                                    </div>
                                </div>
                                <div id="tab-4" class="tab-pane">
                                    <div class="panel-body">

                                        <div class="table-responsive">
                                            <table class="table table-bordered table-stripped">
                                                <thead>
                                                <tr>
                                                    <th>
                                                        Image preview
                                                    </th>
                                                    <th>
                                                        Image url
                                                    </th>
                                                    <th>
                                                        Sort order
                                                    </th>
                                                    <th>
                                                        Actions
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <img src="img/gallery/2s.jpg">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" disabled value="http://mydomain.com/images/image1.png">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" value="1">
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="img/gallery/1s.jpg">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" disabled value="http://mydomain.com/images/image2.png">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" value="2">
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="img/gallery/3s.jpg">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" disabled value="http://mydomain.com/images/image3.png">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" value="3">
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="img/gallery/4s.jpg">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" disabled value="http://mydomain.com/images/image4.png">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" value="4">
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="img/gallery/5s.jpg">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" disabled value="http://mydomain.com/images/image5.png">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" value="5">
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="img/gallery/6s.jpg">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" disabled value="http://mydomain.com/images/image6.png">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" value="6">
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="img/gallery/7s.jpg">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" disabled value="http://mydomain.com/images/image7.png">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" value="7">
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-white"><i class="fa fa-trash"></i> </button>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
	                    </div>
	                </div>
	            </div>
        	</div>
        	<!-- 근태 / 휴가 / 급여 -- 끝 -->
        	
        </div>
    </div>
</div>
                            
</body>
</html>