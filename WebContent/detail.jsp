<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.octest.forms.NoteFrais" import="com.octest.servlets.Servlet1" import="java.text.DecimalFormat" import="java.text.DecimalFormatSymbols"
 import="com.octest.forms.Employe"   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Consultation</title>
	
   
      <link href="script1/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="script1/css/datatable.css">
      <script src="script1/jquery/jquery.js"></script>
     <script src="script1/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="script1/css/datatable.js" ></script>
      <link href="script1/css/font-awesome.min.css" rel="stylesheet">
      
      <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
	

	<script type="text/javascript">
	function cacher(){
	 $('#log').hide();
	}
	</script>
     			
	
     
</head>
<body>
<%
     			Employe e= (Employe) request.getAttribute("Employe");
     			String numero= (String) request.getAttribute("numero");
     			String v="valider";
     			String c="cloturer";
     			%>

  <div class="modal fade" id="exampleModal"  role="dialog" tabindex="-1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modifier le montant</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <% out.println ("<form id='myform'  action='ser3'  id='form'  method='post' >");%>
        
        							<div class="form-group">
     							  	<label>Numero note</label>
     							  	 <% out.println("<input type='number' name='NumN' value='"+numero+"' readonly='readonly' >");%>
     							  	 <% out.println("<input type='text' name='login' value='"+e.getLogin()+"' style='border:none; color:white;' readonly='readonly' >");%>
     							  </div>
		     	                   <div class="form-group">
     							  	<label>Montant validé</label>
     							  	<input type="number" class="form-control"  name="MV"  required>
     							  </div>
     							 
     							 
     	<div class="modal-footer">
        <button type="submit" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        <%  out.println("</form>");%>
      </div>
      
    </div>
  </div>
</div>
        





      <div class="row animated rubberBand">
        
        
        <div class="col-sm-12">
          <div class="panel panel-danger" style="border-color: rgb(115,131,140);">
            <div class="panel-heading" style="background-color:rgb(115,131,140);color: #FFFFFF;font-size: 15px;">
              <center><h3 class="panel-title"><i>Note de frais</i></h3></center>
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
                    	  out.println("<th>"+e.nom+"</th>");
                    	  out.println("<th>"+e.getDepartement()+"</th>");
                          out.println("<th>"+n.details+"</th>");
                          out.println("<tr>");
                          out.println("<th style='text-align:center;'><b> Montant requis:</b> <u>"+format.format(n.montant1)+" FCFA</u> </button>");
                       	  out.println("<th style='text-align:center;'><b> Montant validé:</b> <button type='button' data-toggle='modal' data-target='#exampleModal'> <u>"+n.montantV+" FCFA</u> </button>");
                    	 }
                  
                     }
                     
                    
                     %>
                  		
            			</tbody>
            		<% 	out.println("<a href='ser3?etat="+v+"&num="+numero+"'><button class='btn btn-primary' align='right'>Valider</button></a>");	%>	
                     
                     <% out.println("<a href='ser3?etat="+c+"&num="+numero+"'><button class='btn btn-danger' align='left' style='margin-left:18px;'>Rejeter</button></a>");%>
                     
                    
                     
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