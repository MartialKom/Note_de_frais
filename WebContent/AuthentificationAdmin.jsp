<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>

<link rel="stylesheet" type="text/css" href="script1/css/styleadmin.css">
<link rel="stylesheet" href="bootStrap/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="bootStrap/css/bootstrap.min.css">
<body>
	<div class="container logDiv">

		<h1>
			Page d'administrateur
		</h1><br><br>
		<form method="POST" action="ser2">
			<div class="login">
                    <div class="input-group mb-3 containerr" style="width: 99%;
                    margin: auto;">
                        <span class="input-group-text" id="basic-addon1">@</span>
                        <input name="adminlogin" type="text" class="form-control user" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1"
                        style="background-color: transparent; color: black;" required>
                    </div>
                </div>
        
                <div class="login">
                    <div class="input-group mb-3 containerr" style="width: 99%;
                    margin: auto;">
                        <span class="input-group-text" id="basic-addon1">$</span>
                        <input name="adminpass" type="password" class="form-control user" placeholder="PassWord" aria-label="Username" aria-describedby="basic-addon1"
                        style="background-color: transparent; color: black;" required>
                    </div>
                </div>
                
    
                <input type="submit" class="btn btn-primary btnP" value="S'authentifier" />
                <input type="reset" class="btn btn-danger btnP">
		</form>
                
                <br><br>
	</div>





	 <script src="bootStrap/js/bootstrap.min.js"></script>
</body>
</html>l>