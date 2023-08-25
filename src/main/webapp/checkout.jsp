<%@page import="book.store.service.GenreService"%>
<%@page import="book.store.entity.Genre"%>
<%@page import="book.store.entity.Book"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Koparion – Book Shop HTML5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="css/animate.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="css/meanmenu.min.css">
<!-- owl.carousel css -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- font-awesome css -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- flexslider.css-->
<link rel="stylesheet" href="css/flexslider.css">
<!-- chosen.min.css-->
<link rel="stylesheet" href="css/chosen.min.css">
<!-- style css -->
<link rel="stylesheet" href="style.css">
<!-- responsive css -->
<link rel="stylesheet" href="css/responsive.css">
<!-- modernizr css -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>


<script
	src="https://www.paypal.com/sdk/js?client-id=AYNtFibTKN4CT9N1pohi7nmCYAyfsMxf7L_TcUBLq1cHBMgnR5lwHG7wI1bdS8qAJrtL9dz0kD__9FKV&currency=AUD"></script>
<script>
  function enablePlaceOrderButton() {
    var placeOrderButton = document.getElementById("placeOrderButton");
    placeOrderButton.removeAttribute("disabled");
  }
</script>

<script>
paypal.Buttons({
    createOrder: function(data, actions) {
        // Set up the transaction details
        return actions.order.create({
            purchase_units: [{
                amount: {
                    value: ${finalTotalPrice } // Total amount
                }
            }]
        });
    },
    onApprove: function(data, actions) {
        // Capture the payment when the user approves
        return actions.order.capture().then(function(details) {
            // Show a success message
            alert('Transaction completed by ' + details.payer.name.given_name);
            enablePlaceOrderButton();
        });
    }
}).render('#paypal-button-container');
</script>

<head>


<body class="home-2">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	<header>
		<jsp:include page="nav.jsp" />
	</header>
	<!-- header-area-end -->
	<!-- breadcrumbs-area-start -->
	<div class="breadcrumbs-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#" class="active">checkout</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	<!-- entry-header-area-start -->
	<div class="entry-header-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="entry-header-title">
						<h2>Checkout</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- entry-header-area-end -->

	<!-- checkout-area-start -->
	<div class="checkout-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<form action="cart" method="POST">
						<input type="hidden" name="command" value="CHECKOUT">

						<div class="row">
							<div class="col-lg-6 col-md-12 col-12">
								<div class="checkbox-form">
									<h3>Billing Details</h3>
									<div class="row">
										<c:choose>
											<c:when test="${not empty address}">
												<!-- Display the saved shipping address from the database -->
												<!-- Use JSTL to access the fields of the 'shippingAddress' object -->
												<p>Shipping Address:</p>
												<p>${address.streetNo},${address.streetName}</p>
												<br>
												<p>${address.suburb},${address.state}
													${address.postcode}</p>
												<br>
												<!-- Add other address fields here -->
											</c:when>
											<c:otherwise>
												<div class="add-address">
													

														<div class="col-lg-12 col-md-12 col-12">
															<div class="checkout-form-list">
																<label>Street Number <span class="required">*</span></label>
																<input type="text" name="streetNo" placeholder="Street address">
															</div>
														</div>

														<div class="col-lg-12 col-md-12 col-12">
															<div class="checkout-form-list">
																<label>Street Name <span class="required">*</span></label>
																<input type="text" name="streetName" placeholder="Street address">
															</div>
														</div>

														<div class="col-lg-12 col-md-12 col-12">
															<div class="checkout-form-list">
																<label>Suburb <span class="required">*</span></label> 
																<input type="text" name="suburb" placeholder="Suburb">
																	
															</div>
														</div>
														<div class="col-lg-6 col-md-6 col-12">
															<div class="checkout-form-list">
																<label>State<span class="required">*</span></label> 
																<input type="text" name="state" placeholder="">
																	
															</div>
														</div>
														<div class="col-lg-6 col-md-6 col-12">
															<div class="checkout-form-list">
																<label>Postcode <span class="required">*</span></label>
																<input type="text" name="postcode" placeholder="Postcode">
															</div>
														</div>
												
												</div>

											</c:otherwise>
										</c:choose>





									</div>

								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-12">
								<div class="your-order">
									<h3>Your order</h3>
									<div class="your-order-table table-responsive">
										<table>
											<thead>
												<tr>
													<th class="product-name">Product</th>
													<th class="product-total">Total</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${cart}" varStatus="loop">
													<input type="hidden" name="amount_${item.value.isbn}"
														value="${amountList[loop.index]}">
													<tr class="cart_item">
														<td class="product-name">${item.value.title }<strong
															class="product-quantity">

																${amountList[loop.index]} </strong>
														</td>
														<td class="product-total"><span class="amount">$${item.value.price * amountList[loop.index]}</span>
														</td>
													</tr>

												</c:forEach>

											</tbody>
											<tfoot>
												<tr class="cart-subtotal">
													<th>Cart Subtotal</th>
													<td><span class="amount">$
														<fmt:formatNumber type="number" value="${finalTotalPrice }" minFractionDigits="2" maxFractionDigits="2" />
													</span></td>
													
												</tr>
													
												<tr class="order-total">
													<th>Order Total</th>
													<td><strong><span class="amount">$
														<fmt:formatNumber type="number" value="${finalTotalPrice }" minFractionDigits="2" maxFractionDigits="2" />
													</span></strong>
													</td>
												</tr>

											</tfoot>
										</table>
									</div>
									<div class="payment-method">
										<div class="payment-accordion">
											<div class="collapses-group">
												<div class="panel-group" id="accordion" role="tablist"
													aria-multiselectable="true">


													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingThree">
															<h4 class="panel-title">
																<a class="collapsed" role="button"
																	data-bs-toggle="collapse" data-bs-parent="#accordion"
																	href="#collapseThree" aria-expanded="false"
																	aria-controls="collapseThree"> PayPal <img
																	src="img/2.png" alt="payment" />
																</a>
															</h4>
														</div>
														<div id="collapseThree" class="panel-collapse collapse"
															role="tabpanel" aria-labelledby="headingThree">
															<div class="panel-body">
																<p>Pay via Paypal you can pay with your credit card</p>

																<div id="paypal-button-container"></div>
															</div>


														</div>
													</div>
												</div>
											</div>
										</div>
										<input type="hidden" name="totalPrice"
											value="${finalTotalPrice}">
										<div class="order-button-payment">
											<input type="submit" value="Place order"
												id="placeOrderButton" disabled>

										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- checkout-area-end -->
	<!-- footer-area-start -->
	<footer>
		<!-- footer-top-start -->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="footer-top-menu bb-2">
							<nav>
								<ul>
									<li><a href="#">home</a></li>
									<li><a href="#">Enable Cookies</a></li>
									<li><a href="#">Privacy and Cookie Policy</a></li>
									<li><a href="#">contact us</a></li>
									<li><a href="#">blog</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-top-start -->
		<!-- footer-mid-start -->
		<div class="footer-mid ptb-50">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-12">
						<div class="row">
							<div class="col-lg-4 col-md-4 col-12">
								<div class="single-footer br-2 xs-mb">
									<div class="footer-title mb-20">
										<h3>Products</h3>
									</div>
									<div class="footer-mid-menu">
										<ul>
											<li><a href="about.html">About us</a></li>
											<li><a href="#">Prices drop </a></li>
											<li><a href="#">New products</a></li>
											<li><a href="#">Best sales</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-12">
								<div class="single-footer br-2 xs-mb">
									<div class="footer-title mb-20">
										<h3>Our company</h3>
									</div>
									<div class="footer-mid-menu">
										<ul>
											<li><a href="contact.html">Contact us</a></li>
											<li><a href="#">Sitemap</a></li>
											<li><a href="#">Stores</a></li>
											<li><a href="register.html">My account </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-12">
								<div class="single-footer br-2 xs-mb">
									<div class="footer-title mb-20">
										<h3>Your account</h3>
									</div>
									<div class="footer-mid-menu">
										<ul>
											<li><a href="contact.html">Addresses</a></li>
											<li><a href="#">Credit slips </a></li>
											<li><a href="#"> Orders</a></li>
											<li><a href="#">Personal info</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-12">
						<div class="single-footer mrg-sm">
							<div class="footer-title mb-20">
								<h3>STORE INFORMATION</h3>
							</div>
							<div class="footer-contact">
								<p class="adress">
									<span>My Company</span> Your address goes here.
								</p>
								<p>
									<span>Call us now:</span> 0123456789
								</p>
								<p>
									<span>Email:</span> demo@example.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-mid-end -->
		<!-- footer-bottom-start -->
		<div class="footer-bottom">
			<div class="container">
				<div class="row bt-2">
					<div class="col-lg-6 col-md-6 col-12">
						<div class="copy-right-area">
							<p>
								&copy; 2022 <strong> Koparion </strong> Mede with ❤️ by <a
									href="https://hasthemes.com/" target="_blank"><strong>HasThemes</strong></a>
							</p>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-12">
						<div class="payment-img text-end">
							<a href="#"><img src="img/1.png" alt="payment" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-bottom-end -->
	</footer>
	<!-- footer-area-end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="js/vendor/jquery-1.12.4.min.js"></script>


	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- owl.carousel js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- meanmenu js -->
	<script src="js/jquery.meanmenu.js"></script>
	<!-- wow js -->
	<script src="js/wow.min.js"></script>
	<!-- jquery.parallax-1.1.3.js -->
	<script src="js/jquery.parallax-1.1.3.js"></script>
	<!-- jquery.countdown.min.js -->
	<script src="js/jquery.countdown.min.js"></script>
	<!-- jquery.flexslider.js -->
	<script src="js/jquery.flexslider.js"></script>
	<!-- chosen.jquery.min.js -->
	<script src="js/chosen.jquery.min.js"></script>
	<!-- jquery.counterup.min.js -->
	<script src="js/jquery.counterup.min.js"></script>
	<!-- waypoints.min.js -->
	<script src="js/waypoints.min.js"></script>
	<!-- plugins js -->
	<script src="js/plugins.js"></script>
	<!-- main js -->
	<script src="js/main.js"></script>



</body>
</html>
