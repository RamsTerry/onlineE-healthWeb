<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title> Medicine List </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
body { padding-top: 70px; }
</style>  
<script>

// set to move form to edit info
function moveEditPage(itemId,mode){
		
	var form = document.listForm;
	
	form.mode.value = mode;
	form.itemId.value = itemId;
	form.submit();
}

</script>  
</head>
<body>

 <div class="container-fluid">

 <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNavCSR.jsp" />
 
 <div class="container">
 
   <ul class="pagination">
    <li><a href="CsrMedicineController?category=Women">Women</a></li>
    <li><a href="CsrMedicineController?category=Men">Men</a></li>
    <li><a href="CsrMedicineController?category=Kids">Kids</a></li>
  </ul>
  
 <div class="jumbotron">
<h3>${requestScope.category}</h3>

 <ul class="list-group">

<!-- /////////////    medicine List Start  : forEach  /////////////// -->

	<c:forEach var="medi" items="${requestScope.medicinesList}" begin="0" step="1" varStatus="status">
	
	  <li class="list-group-item">
	  	
	  	<table >
	  		<tr>
	  			<td> <h4>${status.count}. &nbsp;</h4></td><td colspan="2"><h4><b style='color:#1e747c'>${medi.itemName}</b></h4></td>
	  			<td align="right">
	  				<button type="button" class="btn btn-primary btn-sm" onClick="javascript:moveEditPage('${medi.itemId}','search')">Edit</button> 
	  				<button class="btn btn-danger btn-sm" onClick="javascript:moveEditPage('${medi.itemId}','del')">Delete</button>
	  			</td>
	  		</tr>
	  		<tr>
	  			<td> </td><td width="120px"><img src="images/ehealth.jpg" width="100px" class="img-thumbnail" alt="Cinque Terre"></td>
	  			<td colspan="2"> 
	  			    - <b>R ${medi.price}</b><br>
	  			    - category: ${medi.category} <br>
	  				- Number of Medicine Available: ${medi.numberofmedicine} <br>
	  				- qty: ${medi.quantity} <br>
	  				- ${medi.content}
	  			</td>
	  		</tr>
	  	</table>
	  		 
	  	  
	  </li> 
		 
	</c:forEach>
	
<!-- /////////////   End  : forEach  /////////////// -->	
 </ul> 

   </div> 
 </div>
          <!-- form for edit or del --> 
		 <form action="CsrMedicineInfController" method="post" name="listForm"> 
		 	<input type="hidden" value="" name="mode">
		 	<input type="hidden" value="" name="itemId">
		 	<input type="hidden" value="${requestScope.category}" name="category">
		 </form> 
</div> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>

