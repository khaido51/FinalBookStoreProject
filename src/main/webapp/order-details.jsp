<%@page import="book.store.service.GenreService"%>
<%@page import="book.store.entity.Genre"%>
<%@page import="book.store.entity.Book"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Whisper & Wonder Bookstore</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://raw.githubusercontent.com/yellowmacaron/project-img/main/smalllogo.png">

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



</head>

<body class="home-2">

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
							<li><a href="#" class="active">my-account</a></li>
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
						<h2>My-Account</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- entry-header-area-end -->
	<!-- my account wrapper start -->
	<div class="my-account-wrapper mb-70">
		<div class="container">
			<div class="section-bg-color">
				<div class="row">
					<div class="col-lg-12">
						<!-- My Account Page Start -->
						<div class="myaccount-page-wrapper">
							<!-- My Account Tab Menu Start -->
							<div class="row">
								<div class="col-lg-3 col-md-4">
									<div class="myaccount-tab-menu nav" role="tablist">
									<a href="#orders"
											data-bs-toggle="tab"><i class="fa fa-cart-arrow-down"></i>
											Orders</a> 
									</div>
								</div>
								<!-- My Account Tab Menu End -->

								<!-- My Account Tab Content Start -->
								<div class="col-lg-9 col-md-8">
									<div class="tab-content" id="myaccountContent">


										<!-- Single Tab Content Start -->
										<div class="tab-pane fade" id="orders" role="tabpanel">
											<div class="myaccount-content">
												<h5>Orders Details</h5>
												<div class="myaccount-table table-responsive text-center">
													<table class="table table-bordered">
														<thead class="thead-light">
															<tr>
																<th>ID</th>
																<th>OrderId</th>
																<th>Book Name</th>
																<th>Amount</th>
																<th>OrderedPRice</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="item" items="${orderDetails}" varStatus="loop">
																<tr>
																<td>${item.id }</td>
																<td>${item.orderId }</td>
																<td>${books[loop.index].title }</td>
																<td>${item.amount }</td>
																<td>${item.orderedPrice }</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>



											</div>

										</div>
									</div>
									<!-- Single Tab Content End -->



									<!-- Single Tab Content Start -->
									<div class="tab-pane fade" id="payment-method" role="tabpanel">
										<div class="myaccount-content">
											<h5>Payment Method</h5>
											<p class="saved-message">You Can't Saved Your Payment
												Method yet.</p>
										</div>
									</div>
									<!-- Single Tab Content End -->


								</div>
							</div>
							<!-- My Account Tab Content End -->
						</div>
					</div>
					<!-- My Account Page End -->
				</div>
			</div>
		</div>
	</div>

	<!-- my account wrapper end -->
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
