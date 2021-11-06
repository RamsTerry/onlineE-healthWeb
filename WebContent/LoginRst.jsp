<%@page import="com.models.Customer"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <title> Customer Section </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
body { padding-top: 70px; }
</style>  
</head>

<body>

 <div class="container-fluid">

 <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNav.jsp" />
 
 <div class="container">
 <div class="jumbotron"  style="background-color: #D5D5D5;">
	 <%
	 //Session  
	 HttpSession sessionCustomer = request.getSession();
	 
	 try{
		 
	 	Customer customer = (Customer)sessionCustomer.getAttribute("customer"); 
	 %>
	   	
	  		  
    		<h2><%=customer.getFirstName() %>, <br>Welcome to E-Health Web ! </h2>
    		
    		 
    		<br><br>
    		<h3>
    		Free Delivery on orders over R 500. <br>
    		To All <font color="red">Pain Killers</font> on SALE !! <br>
    		</h3>
		
	  
	 <%
	 	
	 }
	 catch(Exception e)
	 {
	%>
		
		<jsp:forward page="Login.jsp" />
		
	<%	 
	 }
	 %>
 

   </div> 
 </div>
 
</div> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>

