<%@page import="com.models.Admin"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <title> Admin Section </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body { padding-top: 70px; }
</style>    
</head>
<body>

 <div class="container-fluid">

 <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNavCSR.jsp" />
 
 <div class="container">
 <div class="jumbotron">
 
	 <%
 	 	//Session  
 	 	 HttpSession sessionCsr = request.getSession();
 	 	 
 	 	 
 	 	 
 	 	 try{
 	 		 
 	 	 	Admin csr = (Admin)sessionCsr.getAttribute("csr");
 	 %>
	   	
	  		 
    		<h2>Welcome To Admin Section, <b style='color:#161f6d'><%=csr.getFirstName()%>!</b> </h2>
    		 
			<br>
			This page is for Admin to manage Medicines, Customers, and Orders.

	 <%
	 	
	 
	 }
	 catch(Exception e)
	 {
	%>
		
		The username or password you entered is incorrect.
		
	<%	 
	 }
	 %>
 

   </div> 
 </div>
 
</div> 
</body>
</html>

