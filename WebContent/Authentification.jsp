<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<title>authentification</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="script1/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="script1/css/styleperso.css">
	 <script src="script1/jquery/jquery.js"></script>
	<script type="script1/js/bootstrap.min.js"></script>
	<link href="script1/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="assets/css/animate.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-editable.css">
	<link rel="stylesheet" type="text/css" href="assets/css/dropzone.min.css">
	<script src="assets/js/jquery-3.3.1.min.js"></script>
	
	
	
	
	
      <link href="script1/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="script1/css/datatable.css">
      <script src="script1/jquery/jquery.js"></script>
     <script src="script1/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="script1/css/datatable.js" ></script>
      <link href="script1/css/font-awesome.min.css" rel="stylesheet">
      
      <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
	
</head>
<body >




<%
String resultat = (String) request.getAttribute("r");

	
	
// 	if(resultat!=null){
// 		 out.println("<script type='text/javascript'>");
// 		out.println("confirm('"+resultat+"');");
// 		out.println("</script>"); 

// 	}
%>


	
     			<div class="modal fade"  id="loginmodal" role="dialog" tabindex="-1" >
     				<div class="modal-dialog" role="document">
     					<div class="modal-content">
     						<div class="modal-header">
     							<button class="close" data-dismiss="modal">&times;</button>
     							<h4 class="modal-title">Accès Administrateur</h4>
     						</div>
     						<div class="modal-body">
     							<form id="myform"  action="ser2"  id="form"  method="post" >
		     	                   <div class="form-group">
     							  	<label>Login:</label>
     							  	<input type="text" class="form-control" id="userName"  name="adminlogin" required>
     							  </div>

		     	                  <div class="form-group">

		     	                  	<label>Mot de passe: </label>
		     	         			<input type="password" class="form-control" name="adminpass" required>
		     	                  </div>
                                  <div class="modal-footer">
     							     <input type="submit" value="Connecter" class="btn btn-primary">
     							     <span id="msg"></span>
     							     <button class="btn btn-primary" data-dismiss="modal">Close</button>
     						</div>
     							</form>
     						</div>
     						
     					</div>
     				</div>
     			</div>
     			
     			
     			
     				<div class="modal fade" data-keyboard="false"  id="recordmodal" tabindex="-1" >
     				<div class="modal-dialog">
     					<div class="modal-content">
     						<div class="modal-header">
     							<button class="close" data-dismiss="modal">&times;</button>
     							<h4 class="modal-title">Remplissez ce formulaire pour l'enregistrement</h4>
     						</div>
     						<div class="modal-body">
     							<form  action="ser2"  id="form"  method="post" >
     							  <div class="form-group">
     							  	<label>Nom</label>
     							  	<input type="text" class="form-control" id="exempleIputName" name="nom" placeholder="Votre nom" required>
     							  </div>
     							   <div class="form-group">
     							  	<label>Prenom</label>
     							  	<input type="text" class="form-control" id="exempleIputLasName" name="prenom" placeholder="Votre prenom" required>
     							  </div>
		     	                   <div class="form-group">
     							  	<label>Nom Utilisateur/Login</label>
     							  	<input type="text" class="form-control" id="userName" name="user" placeholder="User name" required>
     							  </div>
		     	                  <div class="form-group">
		     		                  <label for="exampleInputPassword1">Password</label>
		     		                  <input type="Password" class="form-control" id="exampleInputPassword1" name="pass" placeholder="Password" required>
		     		                  <span id="erreur"></span>
		     	                  </div>
		     	                  <div class="form-group">
		     	                     <table> 
		     	                  <tr>
		     	                  	<td><label>Type d'utilisateur: </label></td>
		     	                  	<td>
		     	                  	<select name="a">
		     	                  <option>	Employe</option>
		     	                  <option>  Service de comptabilite</option>
		     	                  	</select>
		     	                  	</td>
		     	                  	</tr>
		     	                  	</table>
		     	                  </div>
		     	                  <div class="form-group">
		     	                  	<label>Departement</label>
		     	                  	<input type="text" name="dep" class="form-control" placeholder="Exemple: Informatique" />
		     	                  </div>
                                  <div class="modal-footer">
     							     <input type="submit" value="Login" class="btn btn-primary">
     							     <span id="msg" style=""></span>
     							     <button class="btn btn-primary" data-dismiss="modal">Close</button>
     						</div>
     							</form>
     						</div>
     						
     					</div>
     				</div>
     			</div>
     		
     			


<div class="row animated fadeIn page-content ">

   	<div class="container-fluid  bg" id='bg'>
		<div class="row">

			<div class="menu-bar">
    	<ul>
    		<li><a href="#">Description</a></li>
    		<li><a href="#">Documentation</a></li>
    	</ul>
    	<button type='button'   style='color:white; background-color:rgb(105,105,105); border:none; ' data-toggle='modal' data-target='#loginmodal'> Administrateur</button>
    </div>
		    <div class="col-md-4 col-sm-4 col-xs-12"></div>
		    <div class="col-md'4 col-sm-4 col-xs-12">
		    	
			     <form class="form-region" action="Servlet1" method="post">
				     <h2><img src="images/user1.png" class="image"></h2>
				     <div class="form-group">
				     <div>
				     
				     <%if (resultat!=null) {
				    	 
				    	 out.println("<div class = 'alert alert-danger animated shake'>");
				    	 out.println("<center><p> Mauvaise Authentification!! </p></center>");
				    	 out.println("</div>"); 
				     }
				     %>
				     
				     </div>
				     
				     	<label for="exampleInputEmail1">Nom d'Utilisateur</label>
				     	<input type="text" class="form-control" id="userName" placeholder="User Name" name="login" required="required">
				     </div>
				     <div class="form-group">
				     	<label for="exampleInputPassword1">Mot de Passe</label>
				     	<input type="Password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="mdp" required="required">
				     </div>
                     <div class="checkbox">
				     	<label>
                           <input type="checkbox">remember
				     	</label>
				     </div>
				     	<button type="submit" class="btn btn-primary btn-block bt"> Connexion</button>
<%-- 				   <%  out.println("<button type='button' class='btn btn-primary btn-block bt' data-toggle='modal' data-target='#recordmodal'> Inscription</button>");%> --%>
			     </form>	
			     	
		    </div>  
		</div>
	</div>
	</div>
</body>
</html>