<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>
<head>
  <title> Medicine Info </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <style>
body { padding-top: 70px; }
.itemTitle{ color:#4C4C4C; size:14px }
</style>  
  <script>
  
  	// submit form
	  function FormValid()
	  {
			var form = document.RegistForm;
			
		  	// validate null value 
			if(document.getElementById("itemName").value == "" || document.getElementById("price").value == "" || document.getElementById("numberofmedicine").value == "" || document.getElementById("quantity").value == "")
			{
				$('#myModal').modal('show'); 
				return;
			}
			else if(form.category[0].checked == false && form.category[1].checked == false && form.category[2].checked == false )
			{
				$('#myModal').modal('show'); 
				return;
			}
			else
			{ 
				form.action = "CsrMedicineInfController";
				 
				form.submit();
			}
			  
	  }
	  
	  $('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
		})
	
  </script>
</head>
<body>

<div class="container-fluid">
 
 <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNavCSR.jsp" />
 
 <div class="container"> 
 
<!--  Login Form  --> 
  <h2>Medicines Information</h2>
  <br>  
  <form class="form-inline"  method="post" name="RegistForm" action="" onSubmit="return false;">
  <!-- new data or existed data to edit -->
  <c:choose>
		<c:when test="${mode == 'edit'}">
  			<input type="hidden" name="mode" value="edit">
  			<input type="hidden" name="itemId" value="${requestScope.medicines.itemId }">
  		</c:when>
  		<c:otherwise >
  			<input type="hidden" name="mode" value="new">
  		</c:otherwise>
  </c:choose>
   
    <div class="checkbox">
      <label><input type="radio" name="category" id="category" value="Women" <c:if test="${requestScope.medicines.category=='Women'}"> checked </c:if> > Women </label>
      <label><input type="radio" name="category" id="category" value="Men" <c:if test="${requestScope.medicines.category=='Men'}"> checked </c:if> > Men </label>
      <label><input type="radio" name="category" id="category" value="Kids" <c:if test="${requestScope.medicines.category=='Kids'}"> checked </c:if> > Kids </label>
    </div>
     <br><br>
   <div class="form-group">
      <label for="focusedInput">Medicine Name : </label><br>
      <input class="form-control" type="text" id="itemName" size="50" placeholder="Enter Medicine name (50 characters)" name="itemName" value="${requestScope.medicines.itemName}" maxlength="50"> 
   </div>
   <br>
 	<div class="form-group">
      <label for="focusedInput">Number Of Medicine Available : </label><br>
      <input class="form-control" type="text" id="numberofmedicine" size="10" placeholder="10" name="numberofmedicine" value="${requestScope.medicines.numberofmedicine}">
   </div>
   <br>  
 	<div class="form-group">
      <label for="focusedInput">Quantity : </label><br>
      <input class="form-control" type="text" id="quantity" size="10" placeholder="100" name="quantity" value="${requestScope.medicines.quantity}">
   </div>
   <br> 
   <div class="form-group">
      <label for="focusedInput">Price : </label><br>
      <input class="form-control" type="text" id="price" size="10" placeholder="000.00" name="price" value="${requestScope.medicines.price}">
   </div>
   <br> 
   <div class="form-group">
      <label for="focusedInput">Description : </label><br>
      <textarea class="form-control" id="content" name="content" rows="5" cols="100" >${requestScope.medicines.content}</textarea>
   </div>
   <br> 
   
   <br><br>
    <button type="submit" class="btn btn-primary active" onclick="javascript:FormValid();">Submit</button>
  </form>
 </div> 
 
<!-- the modal for Login Msg--> 
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">New Product</h4>
        </div>
        <div class="modal-body">
          <p>Please select the category and <br>
          enter Medicine name, Number of Medicine, price, and its quantity.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
</div> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
