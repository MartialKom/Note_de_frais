<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<title>Comptabilité</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="script2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="script2/css/interface1.css">
	<script src="script2/jquery.js"></script>
	<script src="script2/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="assets/css/animate.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-editable.css">
	<link rel="stylesheet" type="text/css" href="assets/css/dropzone.min.css">
	<script src="assets/js/jquery-3.3.1.min.js"></script>
</head>
<body >

<div class="animated fadeIn page-content ">

   	<div class="container-fluid  bg" id='bg'>
		<div class="row">
			<div class="menu-bar">
    	<ul>
    		<% 	out.println("<li><a href='traitement2.jsp' target='zone1'>Acceuil</a></li>");%>
    	<% 	out.println("<li class='animated flash infinite'><a href='consultation3.jsp' target='zone1'>Consultation</a></li>");%>
    	
    
    	</ul>

    		<table style="float:right; margin-top:9px; margin-right:15px;">
    		<tr>
    		<td>
<a href='ser1'><button type='button' class='btn btn-warning' >Déconnexion</button></a></td></tr></table>
  
    </div>
		 
		   
			<br>
			
             <div class="menu-vertical" style="margin-top:48px;">
             	<div class="avatar">
             		<h2><img src="images/user1.png" class=" image"></h2>
             	</div>
             	<h3>Bienvenue</h3>
             	<div class="menu"><p> ${ sessionScope.nom}</p></div>
             	<div class="menu"><p>Service Comptable</p></div>
               </div>

		     </div>
	</div>
	 <div class="col-sm-9 col-sm-offset-0 col-md-10 col-md-offset-1 main ">
       <!--  vue principalle -->
       
       
<%--        <c:forEach items="${ tableau }" var="tab" > --%>
<%--        <p><c:out value="${ tab }"/></p> --%>
<%--        </c:forEach> --%>
       
       <frame class="animated bounce p-3">
       <% out.println("<iframe src='traitement2.jsp'  name='zone1' style='width: 109.5%; height: 93.5vh; border: none;'>");%>
         </iframe>
       </frame>

       <!--  fin vue principale -->
          
      </div>
      </div>

</body>
</html>