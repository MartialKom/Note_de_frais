<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.octest.forms.NoteFrais" import="com.octest.servlets.Servlet1" import="java.text.DecimalFormat" import="java.text.DecimalFormatSymbols"
 import="com.octest.forms.Employe"   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Consultation</title>
	
   
      <link href="script1/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="script1/css/datatable.css">
     
      <script type="text/javascript" src="script1/css/datatable.js" ></script>
      <link href="script1/css/font-awesome.min.css" rel="stylesheet">
      
      <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
	 <script src="dist/jquery.js"></script>
	<script type="text/javascript">
	function imprimer(divName){
		  var printContents = document.getElementById(divName).innerHTML;
		  var originalContents = document.body.innerHTML;
		  document.body.innerHTML=printContents;
		  window.print();
		  document.body.innerHTML = originalContents;
		}
	
	</script>
	
	<style type="text/css" media="print">
	@page {
	size: A4 landscape;
	margin: 10px;
	margin-left:15px;
	margin-right:15px;
	
	}
	</style>
     
</head>
<body>
     			<%
     			String nom= (String) request.getParameter("nom");
     			String dep= (String) request.getParameter("dep");
     			String numero= (String) request.getParameter("numero");
     			%>
      <div class="row animated rubberBand">
        
         <div id="sectionAimprimer">
        <div class="col-sm-12">
          <div class="panel panel-danger" style="border-color: rgb(115,131,140);">
            <div class="panel-heading" style="background-color:rgb(115,131,140);color: #FFFFFF;font-size: 15px;">
              <center><h3 class="panel-title"><i>Note de frais validée</i></h3></center>
            </div>
            <div class="panel-body">

            		<table class="table table-bordered table-striped" id="tableau">
                  <thead>
                    <tr>
                      <th style="width: 20px;  text-align: center"><b> Nom </b></th>
                      <th style="width: 20px;  text-align: center"><b> Departement</b></th>
                      <th style="width: 20px;  text-align: center"><b>Détails</b></th>
                      
                                      				
                    </tr>
                     </thead>
                     <tbody>    
                     
                     <%
                     DecimalFormat format = new DecimalFormat("###,###,###");
                     DecimalFormatSymbols s = format.getDecimalFormatSymbols();
                     s.setGroupingSeparator('.');
                     format.setDecimalFormatSymbols(s);
                   
                     for(NoteFrais n: Servlet1.notes){
                    	 if(numero.equals(""+n.numero+"")){
                    	  out.println("<tr>");
                    	  out.println("<th>"+nom+"</th>");
                    	  out.println("<th>"+dep+"</th>");
                          out.println("<th>"+n.details+"</th>");
                          out.println("<tr>");
                          out.println("<th style='text-align:center;'><b> Montant total:</b> <u>"+format.format(n.montantV)+" FCFA</u>");
                          }
                  
                     }
                     
                    
                     %>
                  		
            			</tbody>
            			</div>
            			
            		
  <script type="text/javascript">
    $(document).ready(function() {
      $('#tableau').DataTable();
    });
   
  </script>
 </table>
 </div>
            </div>
          </div>
          
   

        </div>
         <script type="text/javascript"> imprimer('sectionAimprimer')</script>
      </div>
        
</body>
</html>