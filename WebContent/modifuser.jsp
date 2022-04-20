<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.octest.forms.Utilisateur" import="com.octest.servlets.Servlet2"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="script1/css/bootstrap.min.css">
	<link href="css/globale.css" rel="stylesheet" type="text/css" >
	<script src="script1/jquery/jquery.js"></script>
	<script src="script1/js/bootstrap.min.js"></script>
	<!-- <script src="js/popper.js"></script> -->
	<!-- controle du formulaire -->
	<style>
		
		.center {
			position: absolute;
			top:50%;
			left: 50%;
			transform: translate(-50%,-50%);
		}
		body{
			background:#ddd;
			font-family: "Raleway";
		}
		 body{
    width:100%;
    margin:auto;
    min-width:600px;
    max-width:2000px;
    }
	</style>

<meta charset="ISO-8859-1">
<title>Crediter</title>
</head>
<body>

 <%
    String log = request.getParameter("log");
String nom="null";
String prenom="null";
String type="null";
 for(Utilisateur u:Servlet2.users){
	 if(u.getLogin().equals(log)){
		 nom=u.nom;
		  prenom=u.prenom;
		  type=u.type;
		 
	 }
 }
 

  
        %>
	<div class="row">
     		<!-- <button class="btn btn-primary btn-sm" data-target="#loginmodal" data-toggle="modal">login</button> -->
     			<div class="modal fade" data-keyboard="false"  id="loginmodal" tabindex="-1" >
     				<div class="modal-dialog">
     					<div class="modal-content">
     						<div class="modal-header">
     							<button class="close" data-dismiss="modal">&times;</button>
     							<h4 class="modal-title">Modifier l'utilisateur</h4>
     						</div>
     						<div class="modal-body">
     							<form  action="ser2"  method="post" >
     							<div class="form-group">
     							  	<label>Login </label>
     							  	<input type="text" class="form-control" id="login" name="login" value='<%=log %>' readonly="readonly" >
     							  </div>
		     	                   <div class="form-group">
     							  	<label>Nom </label>
     							  	<input type="text" class="form-control" id="nomN" name="nomN" value='<%=nom %>'  >
     							  </div>

		     	                  <div class="form-group">

		     	                  	<label>Prenom: </label>
		     	         			<input type="text" class="form-control" name="prenomN"  value='<%=prenom %>'  >
		     	                  </div>
		     	                  <div class="form-group">
		     	                  	<label>Nouveau Login</label>
		     	                  	<input type="text" name="loginN" class="form-control" value='<%=log %>' />
		     	                  </div>
		     	                  <div class="form-group">
		     	                  	<label>Mot de passe</label>
		     	                  	<input type="password" name="mdpN" class="form-control"  />
		     	                  </div>
                                  <div class="modal-footer">
     							     <input type="submit" value="Modifier" class="btn btn-primary">
     							     <span id="msg"></span>
     							     <button class="btn btn-primary" data-dismiss="modal">Close</button>
     						</div>
     							</form>
     						</div>
     						
     					</div>
     				</div>
     			</div>
     		

		    
		    	<div class="center">
		     	<button class="btn btn-primary btn-block bt" data-target="#loginmodal" data-toggle="modal">Modifier l'utilisateur</button>
		     	</div>
		    
     	</div>

</body>
</html>