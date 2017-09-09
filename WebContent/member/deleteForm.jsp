<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<script src="${folder}script.js"></script>
		<meta name = "viewport" content = "width = device-width", initial-scale = "1">
		<link rel = "stylesheet" href = "${project}css/bootstrap.css" type="text/css">
		<link rel = "stylesheet" href = "${project}style.css" type="text/css">
	</head>
	<body>
		<div id="wrapper">
			<div id="header">
				<c:import url = "/main/header.jsp"/>
			</div>
			<div id="main">
				<div align="center">
					<b style="font-size: 30px;">${page_delete}</b>
				</div>
				<div align="center">
					<b style="font-size: 20px; line-height: 300%;"> ${msg_passwd} </b>
				</div>
			 	<div class="container">
					<form method="post" action="deletePro.do">
						<table style = "margin-left: auto; margin-right: auto; text-heigth:50px; line-height:500%;"> 
						   <tr>		
								<td>
									<input class="form-control" type="password" name="passwd"
										placeholder="비밀번호를 입력해주세요">
								</td>
							</tr>
							<tr>
								<th colspan="2" style="text-heigth:50px; text-align:center;" >
									<input class="btn btn-info btn-sm" type="submit" 
										value="${btn_del}">
									<input class="btn btn-info btn-sm" type="button"
										value="${btn_del_cancel}"	
										onclick="location='myPage.do'">
								</th>
							</tr>
						</table>		
					</form>
				</div>
			</div>
			<div id="footer">
				<c:import url = "/main/footer.jsp"/>
			</div>
		</div>
	</body>
</html>
