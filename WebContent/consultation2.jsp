<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.octest.forms.NoteFrais" import="com.octest.servlets.Servlet1"  import="java.text.DecimalFormat" import="java.text.DecimalFormatSymbols"
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
     			
      <div class="row animated fadeIn page-content">
        
        
        <div class="col-sm-12">
          <div class="panel panel-danger" style="border-color: rgb(115,131,140);">
            <div class="panel-heading" style="background-color:rgb(115,131,140);color: #FFFFFF;font-size: 15px;">
              <center><h3 class="panel-title"><i>Notes Recus</i></h3></center>
            </div>
            <div class="panel-body">

            		<table class="table table-bordered table-striped" id="tableau">
                  <thead>
                    <tr>
<!--                       <th style="width: 20px;  text-align: center"><b> Numero </b></th> -->
                      <th style="width: 20px;  text-align: center"><b> Montant Total</b></th>
                      <th style="width: 20px;  text-align: center"><b>Objet</b> </th>
                      <th style="width: 20px;  text-align: center"><b>Date</b> </th>
                      
                     
                          <th style="width: 10px; text-align: center"><b> Action</b></th> 
                                      				
                    </tr>
                     </thead>
                     <tbody>    
                     
                     <%
                     DecimalFormat format = new DecimalFormat("###,###,###");
                     DecimalFormatSymbols s = format.getDecimalFormatSymbols();
                     s.setGroupingSeparator('.');
                     format.setDecimalFormatSymbols(s);
                     
                     for(NoteFrais n: Servlet1.notes){
                    	 if(n.etat==0){
                    	  out.println("<tr>");
                    	  //out.println("<th>"+n.numero+"</th>");
                    	  out.println("<th>"+format.format(n.montant1)+" FCFA</th>");
                          out.println("<th>"+n.objet+"</th>");
                          out.println("<th>"+n.date+"</th>");
                          out.println("<th style='text-align:center;'><a href='ser3?param="+n.numero+"'><button class='btn btn-secondary'>Cloturer</button> </a>");                      
                          
                          }
  
                    	 
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