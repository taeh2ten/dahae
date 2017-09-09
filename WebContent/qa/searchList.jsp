<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="qa.QaDataBean"%>
<%@page import="qa.QaDBBean"%>
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
				<b style="font-size:30px;"> ${page_list}</b>
			</div>
			<div id ="list">
				<div align="center">
					<b> ( ${str_count} : ${count} ) </b>
				</div>
			</div>
			<div  id = "write" style ="text-align:right;">
				<a style ="font-size:20px;" href="qaWriteForm.do" onclick="qa_membercheck('${sessionScope.memId}')">${str_write}</a>&nbsp;&nbsp;&nbsp;
			</div>
			<table class="table table-stroped table-bordered table-hover">
				<tr>
					<th colspan="6" align="right">
						<a href="#" onclick="qa_membercheck('${sessionScope.memId}')">${str_write}</a>&nbsp;&nbsp;&nbsp;
					</th>
				</tr>
				<tr>
					<th style="width: 7%"> ${str_num} </th>
					<th style="width: 35%"> ${str_subject} </th>
					<th style="width: 8%"> ${str_id} </th>
					<th style="width: 15%"> ${str_reg_date} </th>
					<th style="width: 8%"> ${str_readcount} </th>
				</tr>
				<c:if test="${count == 0}">
					<tr>
						<td colspan="6" align="center">
							${msg_list_x}
						</td>
					</tr>
				</c:if>
				<c:if test="${count != 0}">		
					<c:forEach var="qaDto" items="${articles}">
						<tr>
							<td align="center">${number}</td>
							<c:set var="number" value="${number-1}"/>
							<td>
								<c:set var="level" value="${qaDto.re_level}"/>
								<c:set var="wid" value="${(level-1)*10}"/>
								<c:if test="${level gt 1}">
									<img src="${folder}images/level.gif" border="0" width="${wid}" height="15">
								</c:if>
								<c:if test="${level gt 0}">
									<img src="${folder}images/re.gif" border="0" width="20" height="15">
								</c:if>					
								<a href="qaContent.do?pageNum=${pageNum}&num=${qaDto.num}&number=${number+1}">
									${qaDto.subject}
								</a>	
								<c:if test="${qaDto.readcount gt 20}">
									<img src="${folder}images/hot.gif" border="0" width="30" height="15">
								</c:if>
							</td>
							<td align="center">${qaDto.id}</td>
							<td align="center">
								<fmt:formatDate value="${qaDto.reg_date }" type="both"
									pattern="yyyy-MM-dd HH:mm"/>					
							</td>				
							<td align="center">${qaDto.readcount}</td>
						</tr>				
					</c:forEach>			
				</c:if>
			</table>	
			<div id="paging"  style ="text-align:center;">
				<c:if test="${count gt 0}">
					<c:if test="${startPage gt pageBlock}">
						<a href="qaSearchList.do?pageNum=${1}&search_code=${search_code}&keyword=${keyword}">[◀◀]</a>
						<a href="qaSearchList.do?pageNum=${startPage-pageBlock}&search_code=${search_code}&keyword=${keyword}">[◀]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span>[${i}]</span>
						</c:if>	
						<c:if test="${i != currentPage}">	
							<a href="qaSearchList.do?pageNum=${i}&search_code=${search_code}&keyword=${keyword}">[${i}]</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageCount gt endPage}">
						<a href="qaSearchList.do?pageNum=${startPage+pageBlock}&search_code=${search_code}&keyword=${keyword}">[▶]</a>
						<a href="qaSearchList.do?pageNum=${pageCount}&search_code=${search_code}&keyword=${keyword}">[▶▶]</a>
					</c:if>
				</c:if>
			</div> 
			<div align="center">  
				<form method="get" action="qaSearchList.do" name="searchform">
					<input type="hidden" name="pageNum" value="${currentPage}">
					<select name="search_code">
						<option value="q_subject">제목</option>			               
						<option value="id">작성자</option>
					</select>
					<input class="input" type="text" name="keyword">
					<input class="inputbutton" type="submit" value="${btn_search}">
				</form>
			</div>
		</div>
		<div id="footer">
			<c:import url = "/main/footer.jsp"/>
		</div>
	</div>
</body>
</html>