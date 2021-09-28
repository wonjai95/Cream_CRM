<!-- 
이름 : 장현정
작성날짜 : 2021-09-19 ~ 2021-09-20 
마이페이지
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>My Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body style="background-color:white;">
	
<!-- Main -->
<div class="row">
    <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>마이 페이지</h5>   
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
            
            
            
            
            
            
            
            
            
            
            
            
            <!-- 마이페이지 -- 시작 -->
            <div class="ibox-content">
                <form method="get" action="modifyUserAction">
                	<table class="table table-striped table-bordered table-hover dataTables-example" style="border:0px solid;">
			           
			            <tbody>
			            <tr class="gradeX">
			                <td>회원코드</td>
			                <td><input type="text" value="U12444"></td>
			                <td>이메일</td>
			                <td><input type="text" value="guswjd9598@gmail.com"></td>
			            </tr>
			            <tr class="gradeC">
			                <td>회원ID</td>
			                <td><input type="text" value="guswjd"></td>
			                <td>휴대폰 번호</td>
			                <td><input type="text" value="010-1111-1111"></td>
			            </tr>
			            <tr class="gradeA">
			                <td>회원이름</td>
			                <td><input type="text" value="정원제"></td>
			                <td>주소</td>
			                <td><input type="text" value="서울시 금천구 가산동"></td>
			            </tr>
			            <tr class="gradeA">
			                <td>성별</td>
			                <td><input type="text" value="남"></td>
			                <td></td>
			                <td><input type="text" value="월드메르디앙"></td>
			            </tr>
			            <tr class="gradeA">
			                <td>나이</td>
			                <td><input type="text" value="27"></td>
			                <td>생년월일</td>
			                <td><input type="text" value="2021-11-03"></td>
			            </tr>
			            
			            <tr class="gradeA">
			                <td>가입날짜</td>
			                <td><input type="date" value="2021-09-16"></td>
			                <td class="center">탈퇴날짜</td>
			                <td><input type="date" value="2025-09-16"></td>
			            </tr>
			            </tbody>
			          </table> 
			          
						<div class="form-group row"  align="center">
							<div>
							<table>
				            	<tr> 
				            		<td>
						            	<button class="btn btn-white btn-sm" onclick="window.close();">Cancel</button>
						            	<button class="btn btn-primary btn-sm" type="submit">Save changes</button>
					            	</td>
				            	</tr>
				            </table>
						
							</div>
                    	</div>
                    
                </form>
            </div>
            
            
            <!-- 직원 정보 -- 끝 -->
        </div>
    </div>
</div>
                            
</body>
</html>