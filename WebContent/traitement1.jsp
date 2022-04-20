<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="script2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="script2/css/styleperso.css">
	<script src="script1/jquery.js"></script>
	<script src="script1/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="assets/css/animate.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-editable.css">
	<link rel="stylesheet" type="text/css" href="assets/css/dropzone.min.css">
	<script src="assets/js/jquery-3.3.1.min.js"></script>
	
	<title></title>
	<style type="text/css">
	div{
	text-align:center;
	}
	
	</style>
</head>
<body id='bg'><br><br><br><br><br><br>
<div class="animated fadeIn page-content">
<%


String rs = (String) request.getAttribute("rs");
String log= request.getParameter("log");
String log2= (String) request.getAttribute("login");
%>


<% 



out.println("<div id='test'>");

// if (rs!=null) {
	 
// 	 out.println("<div class = 'col-sm-2 alert alert-danger animated shake'>");
// 	 out.println("<center><p>"+rs+"!!</p></center>");
// 	 out.println("</div>"); 
	 
// }



out.println("<div class='animated bounce infinite'>");
if(log!=null){
      out.println("<a href='formulaire2.jsp?param="+log+"'><button id='img'> <center><img src='images/icone_note.jpg'></center></button></a>");}
else 
	 out.println("<a  href='formulaire2.jsp?param="+log2+"'><button id='img'> <center><img  src='images/icone_note.jpg'></center></button></a>");
out.println("</div>");
out.println("</div>");
       %>   
       </div>
</body>
</html>