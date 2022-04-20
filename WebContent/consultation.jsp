<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.octest.forms.Utilisateur" import="com.octest.servlets.Servlet2" import="java.text.DecimalFormat" import="java.text.DecimalFormatSymbols"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Consultation</title>
	
   
      <link href="script1/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="script1/css/datatable.css">
      <script type="text/javascript" src="script1/css/Jquery.js" ></script>
      <script type="text/javascript" src="script1/css/datatable.js" ></script>
      <link href="script1/css/font-awesome.min.css" rel="stylesheet">
      
      <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
	
	
	
	
     
</head>
<body>
     		<%
     		String res=(String) request.getAttribute("res");
     		
     	if(res!=null){
     		out.println("<script type='text/javascript'>");
     		out.println("alert('"+res+"');");
     		out.println("</script>");
     	}
     		%>
      <div class="row animated fadeIn page-content">
       
        
        <div class="col-sm-12">
          <div class="panel panel-danger">
            <div class="panel-heading" >
              <center><h3 class="panel-title"><i>Tous les Utilisateurs</i></h3></center>
            </div>
            <div class="panel-body">

            		<table class="table table-bordered table-striped" id="tableau">
                  <thead>
                    <tr>
                      <th style="width: 20px;  text-align: center"><b> Nom </b></th>
                      <th style="width: 20px;  text-align: center"><b> Prenom</b></th>
                      <th style="width: 20px;  text-align: center"><b>Login</b> </th>
                      <th style="width: 20px;  text-align: center"><b>type</b> </th>
                      
                     
                          <th style="width: 10px; text-align: center"><b> Action</b></th> 
                                      				
                    </tr>
                     </thead>
                     <tbody>    
                     
                     <%
                     
                     for(Utilisateur u: Servlet2.users){
                    	 
                    	  out.println("<tr>");
                    	  out.println("<th>"+u.nom+"</th>");
                    	  out.println("<th>"+u.prenom+"</th>");
                          out.println("<th>"+u.getLogin()+"</th>");
                          out.println("<th>"+u.type+"</th>");
                          out.println("<th style='text-align:center;'><a href='modifuser.jsp?log="+u.getLogin()+"'><button class='btn btn-secondary'>Modifier</button></a>");                      
                          
                        
  
                    	 
                     }
                     %>
                     			
            			</tbody>
  <script type="text/javascript">
    $(document).ready(function() {
      $('#tableau').DataTable();
    });
  </script>
 
            </div>
          </div>
          </div>
          

        </div>
      </div>
</body>
</html>