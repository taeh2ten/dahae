<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
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
				<b style="text-font:30px;"> ${page_list}( ${str_count} : ${count} )</b>
			</div>
			<div id = "write" style ="text-align:right;">
				<a style ="font-size:20px;" href="#" onclick="return rmembercheck('${sessionScope.memId}')">${str_write}</a>&nbsp;&nbsp;&nbsp;
			</div>
			<table class="table table-stroped table-bordered table-hover">
				<thead>
					<tr>
						<th style="width : 8%"> ${str_num}</th>
						<th style="width : 28%"> ${str_goods_name}</th>
						<th style="width : 30%"> ${str_subject}</th>
						<th style="width : 8%"> ${str_id}</th>
						<th style="width : 10%"> ${str_reg_date}</th>
						<th style="width : 8%"> ${str_readcount}</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${count == 0}">
					<tr>
						<td colspan="6" align="center">
							${msg_list_x}
						</td>
					</tr>
					</c:if>			
					<c:if test="${count != 0}">
						<c:forEach var="reviewDto" items="${articles}">
							<tr>
								<td align="center">	${number} </td>
								<c:set var="number" value="${number-1}"/>
								<c:set var="level" value="${reviewDto.re_level}"/>
								<c:set var="wid" value="${(level-1)*10}"/>
								<td align = "center"> ${reviewDto.goods_name} </td>
								<td>
									<c:if test="${level gt 1}">
										<img src="${folder}images/level.gif" border="0" width="${wid}" height="15">
									</c:if>	
									<c:if test="${level gt 0}">
										<img src="${folder}images/re.gif" border="0" width="20" height="15">
									</c:if>
									<a href="reviewContent.do?pageNum=${pageNum}&num=${reviewDto.num}&number=${number+1}">
										${reviewDto.subject}
									</a>						
									<c:if test="${reviewDto.readcount gt 20}">
										<img src="${folder}images/hot.gif" border="0" width="20" height="15">
									</c:if>
								</td>
								<td align = "center">
									${reviewDto.id}
								</td>
								<td align = "center">
									<fmt:formatDate value="${reviewDto.reg_date}" type="both"
									pattern="yyyy-MM-dd HH:mm"/>	
								</td>
								<td align = "center">
									${reviewDto.readcount}
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<div id="paging"  style ="text-align:center;">
				<c:if test="${count gt 0}">
					<c:if test="${startPage gt pageBlock}">
						<a href="reviewSearchList.do?pageNum=${1}&search_code=${search_code}&keyword=${keyword}">[◀◀]</a>
						<a href="reviewSearchList.do?pageNum=${startPage-pageBlock}&search_code=${search_code}&keyword=${keyword}">[◀]</a>
					</c:if>				
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span>[${i}]</span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="reviewSearchList.do?pageNum=${i}&search_code=${search_code}&keyword=${keyword}">[${i}]</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageCount gt endPage}">
						<a href="reviewSearchList.do?pageNum=${startPage+pageBlock}&search_code=${search_code}&keyword=${keyword}">[▶]</a>
						<a href="reviewSearchList.do?pageNum=${pageCount}&search_code=${search_code}&keyword=${keyword}">[▶▶]</a>
					</c:if>
				</c:if>
				<form method="post" action="reviewSearchList.do" name="searchform" class="form-inline">
					<input type="hidden" name="pageNum" value="${currentPage}">
					<select class="input-small" name="search_code">
						<option value="goods_name">상품명</option>
						<option value="id">작성자 아이디</option>
					</select>
					<input class="input-small" type="text" name="keyword">
					<input class="btn btn-info btn-sm" type="submit" value="${btn_search}">
				</form>
			</div>
		</div>
		<div id="footer">
			<c:import url = "/main/footer.jsp"/>
		</div>
	</div>
</body>
</html>