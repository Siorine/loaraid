<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/layout.css" rel="stylesheet">
<link href="css/jquery-ui.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.min.js"></script>  
<script src="js/jquery-ui.min.js"></script>
<script type="text/javascript">
    function clearA()
    {
    	var al = document.getElementsByTagName("a");
    	for(var i=0;i<al.length;i++)
    	{
    		al[i].classList.remove("sel");
    	}
    }
    function goRaid()
    {
    	clearA();
    	document.getElementById("all").classList.add('sel');
    	$("#if").attr('src','raid_status_board.jsp');
    }
    function goRaidRecipe()
    {
    	clearA();
    	document.getElementById("raidrecipe").classList.add('sel');
    	$("#if").attr('src','raid_recipe.jsp');
    }
    function mouseOver(id,imgname)
    {
  	  	$("#"+id).attr('src','image/'+imgname+'-hover.png');
    }
    function mouseOut(id,imgname)
    {
     	$("#"+id).attr('src','image/'+imgname+'.png');
    }
</script>
<meta charset="UTF-8">
<title>Raid</title>
<%
	
%>
</head>
<body onload="goRaid();">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
	    <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
	        <ul class="navbar-nav">
	            <li class="nav-item">
	                <a id="all" class="nav-link text-uppercase font-weight-bold mem_name" href="#" onclick="goRaid();">현황</a>
	            </li>
	            <li class="nav-item">
	                <a id="raidrecipe" class="nav-link text-uppercase font-weight-bold mem_name" href="#" onclick="goRaidRecipe();">레이드 조합</a>
	            </li>
	        </ul>
	    </div>
    </div>
</nav>
<iframe src="" id="if" name="iframe_target" class="if"></iframe>
</body>
<script>

</script>
</html>