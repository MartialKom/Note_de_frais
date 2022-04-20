<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <title></title>
      <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="script1/css/bootstrap.min.css" rel="stylesheet">    
    <link href="script1/css/theme.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="script1/css/styleperso.css">
 <style type="text/css">
 body{
 background-color:rgb(158,158,158);
 }
 </style>
  </head>

  <body>
  <%String log=request.getParameter("param"); %>
      <div class="row">
       <div class="col-sm-2">
        </div>
        <div class="col-sm-8">
          <div class="panel panel-info" style="border-color: rgb(91,155,213)">
            <div class="panel-heading"style="background-color:rgb(91,155,213);color: #FFFFFF;font-size: 15px">
              <center><h3 class="panel-title">Ma note de frais</h3></center>
            </div>
            <div class="panel-body">
             <form action="ser1" method="post">
                <div class="col-sm-4">
                   <label>Login:</label>     	
                   <% out.println("<input type='text' name='nom' value='"+log+"' readonly='readonly' >");%>
                </div>  
                <div class="col-sm-4">
                	<label>Libellé:</label>
                    <select name="lib">
                    	<option >voyage</option>
                    	<option >colis</option>
                    	<option >voyage</option>
                    </select>
                </div> 
                <div class="col-sm-4">
                	<label>Montant Total:</label>
                	<input type="number" name="mt">
                </div>
                <div class="col-sm-12">
                	<br><div class="menu-bar">
                	<p><b>Plus de Details:</b></p>
                	</div>
                </div>
                <div class="col-sm-4">
                	<br><label>Lieu de départ:</label>
                	<input type="text" name="ld">
                </div>
                <div class="col-sm-4">
                	<br><label>Lieu d'arrivé:</label>
                	<input type="text" name="la">
                </div>
                 <div class="col-sm-4">
                	<br><label>Trajet fait</label>
                	<select name="nbt">
                		<option>1</option>
                		<option>2</option>
                		<option>3</option>
                		<option>4</option>
                		<option>5</option>
                	</select>
                	<label>fois</label>
                </div>
                <div class="col-sm-5">
                	<br><label>Du</label>
                	<input type="date" name="dd">
                </div>
                <div class="col-sm-5">
                	<br><label>Au</label>
                	<input type="date" name="df">
                </div>
                <div class="col-sm-12"><br>
                	<p ><b>Autre précision? </b></p>
                	<textarea  name="autreprecision" rows="8" cols="120" placeholder="ajouter une precision si nécessaire:">
                		
                	</textarea><br>
                </div>

                  <div class="col-sm-3"></div>
                   <div class="col-sm-3"><br><button style="float: right;" type="submit" class="btn btn-primary" align="rigth">Soummetre</button></div>
                

             </form> 
            </div>
          </div>
          </div>
          <div class="col-sm-4">
        </div>
        </div>
      </div>
  </body>
</html>

 