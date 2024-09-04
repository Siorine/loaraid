<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%@ page import="raid.vo.*"%>
<%@ page import="raid.data.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/layout.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script>
</script>
<%
	Raid r = new Raid();
	r.connOpen();
	
	r.setRaidStatus();
	ArrayList<RaidStatusBoard> rsb_list = r.getRaidStatus();
	
	r.connClose();
	request.setAttribute("rsb_list", rsb_list);
%>
<meta charset="UTF-8">
</head>
<body style="overflow:auto !important;">
<table class="wtbl">
	<tr>
		<th class="w150">레이드</th>
		<th class="w250 mem1title">Mem 1</th>
		<th class="w250 mem2title">Mem 2</th>
		<th class="w250 mem3title">Mem 3</th>
		<th class="w250 mem4title">Mem 4</th>
		<th class="w350">전체시너지</th>
	</tr>
	<c:forEach items="${rsb_list }" var="rsb_list" varStatus="p">
	<tr>
		<td>${rsb_list.recipename}</td>
		<td class="mem1">${rsb_list.m1_name} (${rsb_list.m1_job})</td>
		<td class="mem2">${rsb_list.m2_name} (${rsb_list.m2_job})</td>
		<td class="mem3">${rsb_list.m3_name} (${rsb_list.m3_job})</td>
		<td class="mem4">${rsb_list.m4_name} (${rsb_list.m4_job})</td>
		<td>${rsb_list.m1_synergy}, ${rsb_list.m2_synergy}, ${rsb_list.m3_synergy}, ${rsb_list.m4_synergy}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>