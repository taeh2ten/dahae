<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<script src="${folder}script.js"></script>
	<meta name = "viewport" content = "width = device-width", initial-scale = "1">
	<link rel = "stylesheet" href = "${project}css/bootstrap.css" type="text/css">
	<link rel = "stylesheet" href = "${project}css/style.css" type="text/css">
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<c:import url = "/main/header.jsp"/>
		</div>
		<div id="main">
			<div align="center">
				<b style="font-size: 30px;">${str_notice}</b>
			</div>
			<label style="font-size: 20px;"> &nbsp; </label>
			<div class="container">
				<div class = "jumbotron" style = "background-color: transparent;">
					<form method="post" action ="noticeDeletePro.do">
						<input type="hidden" name ="pageNum" value="${pageNum}">
						<input type="hidden" name="n_number" value="${n_number}">     
						<table style = "margin-left: auto; margin-right: auto;"> 
							<tr>
								<td align="center" style="height:100px; width:300px; font-size:16px;">
									${msg_delect_ok}
								</td>
							</tr>     
							<tr>
								<th colspan ="2" style ="text-align:center;">
									<input class="btn btn-info btn-sm" type="submit" value="${btn_del}"
										onclick="return notice_admincheckRe('${sessionScope.memId}')">
									<input class="btn btn-default btn-sm" type="button" value="${btn_del_cancel}"
										onclick="location='noticeList.do?pageNum=${pageNum}'">
								</th>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url = "/main/footer.jsp"/>
		</div>
	</div>
</body>
</html>