<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>accueil</title>
    <link href="script1/css/bootstrap.min.css" rel="stylesheet">
    <link href="script1/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="script1/css/sidebar.css">
    <link href="script1/css/dashboard.css" rel="stylesheet">
    <script src="script1/assets/js/ie-emulation-modes-warning.js"></script>
     <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
    <style type="text/css">
    body{
    width:100%;
  heigth:100%;
    }
    
    </style>
  </head>

  <body>
  <div class="row animated fadeIn page-content ">
  
<% String nom =(String) request.getAttribute("nom"); %>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
<!--           <img src="images/logo.jpg" style="margin-left:-13px;"> -->
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="consultation.jsp" target="zone1">Consultation</a></li>
             <li><a href="#">Profil</a></li>
            <li><a href="#">aide?</a></li>
          </ul>
            <table style="float: right; margin-top:9px;">  
            <tr>
            <td>   
            <% 
            out.println(" <a href='Authentification.jsp?nom="+nom+"'><button type='button' class='btn btn-warning' >Déconnexion</button></a></td></tr></table>");
            %>
        </div>
      </div>
    </nav>
  		
    <div class="container">
      <div class="row">
        <div id="sidebar">
        <div class="col-sm-3 col-md-2 sidebar ">
          
          <ul class="nav nav-sidebar fluid">
            <li class=""><a href="ser2"  ><button  class="btn btn-primary btn-block bt">Accueil </button> </a></li>
            <li><a href="ajout.jsp" target="zone1"><button  class="btn btn-primary btn-block bt" >Enregistrer un employe</button></a></li>
          </ul>
        </div>
      </div>
      <div class="col-sm-9 col-sm-offset-0 col-md-10 col-md-offset-1 main">
       <!--  vue principalle -->
       <frame  >
         <iframe src="" scrolling="yes"  name="zone1" style="width: 130%; height: 722px; border: none;  margin:auto; border-radius: 20px;"></iframe>
       </frame>

       <!--  fin vue principale -->
          
      </div>
    <script src="jquery/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <script src="assets/js/vendor/holder.min.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
    
  </body>
</html>
