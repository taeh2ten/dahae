<%@page import="qa.QaDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${folder}script.js"></script>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( writeerror );
		//-->
	</script>
</c:if>
<c:if test="${result == 1}">
    <c:redirect url="qaList.do?pageNum=${pageNum}"/>
</c:if>

