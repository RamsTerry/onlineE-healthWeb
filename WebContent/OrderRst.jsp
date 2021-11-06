<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Order List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
body {
	padding-top: 70px;
}

.itemTitle {
	color: #4C4C4C;
	size: 14px
}
</style>

<script>
	function delCart(itemId) {

		document.cartForm.itemId.value = itemId;
		document.cartForm.submit();

	}

	function checkOut() {

		document.cartForm.submit();

	}
</script>

</head>
<body>

	<div class="container-fluid">

		<!--  INCLUDE : TOP MENU NAVIGATION  -->
		<jsp:include page="/TopNav.jsp" />

		<div class="container">
			<div class="jumbotron">

				<!--  Menu title  -->

				<h2>${sessionScope.customer.userName},</h2>
				<h3>your order is successfully placed. You can change your
					order on 'My Page'.</h3>
				<br>


				<ul class="list-group">


					<!-- /////////////    Order List Start  : forEach  /////////////// -->

					<c:set var="total" value="${0}" />

					<c:forEach var="orders" items="${requestScope.ordersList}"
						begin="0" step="1" varStatus="status">
						<!-- total price for all items -->
						<c:set var="total" value="${total + orders.price}" />

						<li class="list-group-item">

							<table>
								<tr>
									<td width="100px">${status.count}&nbsp; <img
										src="images/shoe${orders.itemId}.jpg" width="50px"
										class="img-thumbnail" alt="Cinque Terre">&nbsp;&nbsp;

									</td>
									<td width="800px" class="itemTitle"><h3>${orders.itemName}</h3></td>
									<td align="right" width="70px">Medicine In Store: ${orders.numberofmedicine}</td>
									<td align="right" width="50px">* ${orders.quantity}</td>
									<td align="right" width="100px"><b>$${orders.price}</b></td>

								</tr>
							</table>

						</li>

					</c:forEach>

					<li class="list-group-item">
						<table>
							<tr>
								<td align="right" width="800px" align="right">
									<h3>Total Amount Left For Items : R ${total}</h3>
								</td>
							</tr>
						</table>

					</li>
					<!-- /////////////   End  : forEach  /////////////// -->
				</ul>


				<!-- Customer's delivery address information  -->
				<ul class="list-group">
					<li class="list-group-item"><b>Address To Deliver :</b>

						${sessionScope.customer.address} <br> <b>City :</b>

						${sessionScope.customer.city} <br> <b>Postal Code :</b>

						${sessionScope.customer.postalCode} <br>
					<br></li>
				</ul>

				<div></div>
			</div>
		</div>
		<!-- form for cart -->
		<form action="DelCartController" method="post" name="cartForm">
			<input type="hidden" value="" name="itemId"> <input
				type="hidden" value="delete" name="mode"> <input
				type="hidden" value="${sessionScope.customer.customerId}"
				name="customerId">
		</form>


	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>