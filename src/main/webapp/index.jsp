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
	<!-- banner-area-start -->
	<div class="banner-area banner-res-large mt-80">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6 col-12">
					<div class="single-banner mb-30">
						<div class="banner-img">
							<a href="#"><img src="img/banner/1.png" alt="banner" /></a>
						</div>
						<div class="banner-text">
							<h4>Free shipping item</h4>
							<p>For all orders over $500</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 col-12">
					<div class="single-banner mb-30">
						<div class="banner-img">
							<a href="#"><img src="img/banner/2.png" alt="banner" /></a>
						</div>
						<div class="banner-text">
							<h4>Money back guarantee</h4>
							<p>100% money back guarante</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 col-12">
					<div class="single-banner mb-30">
						<div class="banner-img">
							<a href="#"><img src="img/banner/3.png" alt="banner" /></a>
						</div>
						<div class="banner-text">
							<h4>Cash on delivery</h4>
							<p>Lorem ipsum dolor consect</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 col-12">
					<div class="single-banner mb-30">
						<div class="banner-img">
							<a href="#"><img src="img/banner/4.png" alt="banner" /></a>
						</div>
						<div class="banner-text">
							<h4>Help & Support</h4>
							<p>Call us : + 0123.4567.89</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- banner-area-end -->
	<!-- slider-area-start -->
	<div class="slider-area mt-30">
		<div class="container">
			<div class="slider-active owl-carousel">
				<div class="single-slider pt-30 pb-20">
					<a href="details?bookId=217"><img
						src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/coffee.jpg"></a>
				</div>
				<div class="single-slider pt-30 pb-20">
					<a href="details?bookId=224"><img
						src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/boat.jpg"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- slider-area-end -->
	<!-- ***************************************************************************************************************************** -->
	<!-- ADDING IMAGES HERE-->

	<!-- featured-area-start -->
	<div class="new-book-area pt-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title section-title-res text-center mb-30">
						<h2>Featured Book</h2>
					</div>
				</div>
			</div>
			<div class="tab-active owl-carousel">
				<c:forEach var="book" items="${FeaturedList }">
					<div class="tab-total">
						<!-- single-product-start -->

						<div class="product-wrapper">
							<div class="product-img-wrapper">
								<div class="product-img-hp">
									<a href="details?bookId=${book.isbn }"> <img
										src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn}.jpg"
										alt="book" class="primary" />
									</a>

									<div class="product-flag">
										<ul>
											<li><span class="sale">new</span> <br></li>

										</ul>
									</div>
								</div>
							</div>

							<div class="product-details text-center">


								<h4>
									<a href="details?bookId=${book.isbn }">${book.title }</a>
								</h4>

								<div class="product-price">
									<ul>
										<li>$${book.price }</li>
									</ul>

								</div>
								<div class="product-link">
									<div class="product-button">
										<a href="cart?command=ADD_TO_CART&bookId=${book.isbn }"
											title="Add to cart" class="add-to-cart" data-book-id="${book.isbn }"><i class="fa fa-shopping-cart"></i>Add
											to cart</a>
									</div>
									<div class="add-to-link">
										<ul>
											<li><a href="details?bookId=${book.isbn }"
												title="Details"><i class="fa fa-external-link"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- single-product-end -->
			</div>
		</div>
	</div>
	<!-- featured-area-start -->
	<!-- banner-area-start -->
	<div class="banner-area-5 mtb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="banner-img-2">
						<a href="#"><img
							src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/kidbanner.jpg"
							alt="banner" /></a>
						<div class="banner-text"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- banner-area-end -->
	<!-- Book of the month -area-start -->
	<div class="bestseller-area pb-70 w-100">
		<div class="container">
			<div class="row">
				<div class="deal-off-day-title">
					<h1>Books of the month</h1>
				</div>
				<div class="col-8 col-sm-7 mt-3">
					<div class="">
						<div class="single-deal">
						<h2>${errorMessage }</h2>
							<div class="deal-off-day">
								<h2>
									<a href="details?bookId=216">Lenny Marks Gets Away With
										Murder</a>
								</h2>
								<h6>Kerryn Mayne</h6>
								<div class="sale-area">
									<div class="price-box">
										<span class="new-sale">$32.99</span>
									</div>
								</div>
								<p>Lenny Marks is good at not remembering. She has spent the
									last twenty years not thinking about the day her mother left
									her when she was still a child. Her stepfather's parting words,
									however, remain annoyingly unforgettable- 'You did this....'</p>
								<button class="custom-btn btn-13" id="buyButton"
									value="Add to Cart"
									onClick="window.location.href = 'details?bookId=216'">Buy
									Now</button>
							</div>

							<div class="banner-img-3">
								<a href="details?bookId=216"><img
									src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/216.jpg"
									alt="banner" /></a>
							</div>

						</div>

					</div>
				</div>
				<div class="col-2 m-3">
					<div class="single-bestseller ">
						<c:forEach var="book" items="${monthlyBookList}">
							<div class="bestseller-img">
								<a href="#"><img
									src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn}.jpg"
									alt="book" /></a>
							</div>
							<div class="bestseller-text text-center">
								<h3>
									<a href="details?bookId=${book.isbn }">${book.title}</a>
								</h3>
								<div class="price">
									<ul>
										<li><span class="new-price">$${book.price }</span></li>

									</ul>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-2 m-3">
					<div class="single-bestseller ">
						<c:forEach var="book" items="${monthlyBookList1}">
							<div class="bestseller-img">
								<a href="#"><img
									src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn}.jpg"
									alt="book" /></a>
							</div>
							<div class="bestseller-text text-center">
								<h3>
									<a href="details?bookId=${book.isbn }">${book.title}</a>
								</h3>
								<div class="price">
									<ul>
										<li><span class="new-price">$${book.price }</span></li>

									</ul>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- book of the month-area-end -->
	<!-- product-area-start -->
	<!-- featured-area-start -->
	<div class="new-book-area mb-50">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title section-title-res text-center mb-30">
						<h2>New arrivals</h2>
					</div>
				</div>
			</div>
			<div class="tab-active owl-carousel">
				<c:forEach var="book" items="${NewArrivalBookList }">
					<div class="tab-total">
						<!-- single-product-start -->

						<div class="product-wrapper">
							<div class="product-img-wrapper">
								<div class="product-img-hp">
									<a href="#"> <img
										src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn}.jpg"
										alt="book" class="primary" />
									</a>

									<div class="product-flag">
										<ul>
											<li><span class="sale">new arrival</span> <br></li>

										</ul>
									</div>
								</div>
							</div>

							<div class="product-details text-center">


								<h4>
									<a href="details?bookId=${book.isbn }">${book.title }</a>
								</h4>

								<div class="product-price">
									<ul>
										<li>$${book.price }</li>
									</ul>

								</div>
								<div class="product-link">
									<div class="product-button">
										<a href="cart?command=ADD_FROM_INDEX&bookId=${book.isbn }"
											title="Add to cart"><i class="fa fa-shopping-cart"></i>Add
											to cart</a>
									</div>
									<div class="add-to-link">
										<ul>
											<li><a href="details?bookId=${book.isbn }"
												title="Details"><i class="fa fa-external-link"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- single-product-end -->
			</div>
		</div>
	</div>
	<!-- product-area-end -->
	<!-- most-product-area-start -->
	<div class="most-product-area pb-100">
		<div class="container">
			<div class="row bt-3 pt-95">
				<div class="col-lg-3 col-md-4 col-12">
					<div class="section-title-2 mb-30">
						<h3>Skills Books</h3>
					</div>
					<div class="product-active-2 owl-carousel">
						<div class="product-total-2">
							<c:forEach var="book" items="${SkillBookList }">
								<div class="single-most-product bd mb-18">
									<div class="most-product-img">
										<a href="details?bookId=${book.isbn }"><img
											src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn }.jpg"
											alt="book" /></a>
									</div>
									<div class="most-product-content">
										<h4>
											<a href="#">${book.title}</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$${book.price }</li>

											</ul>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-12">
					<div class="section-title-2 mb-30">
						<h3>Self-help Books</h3>
					</div>
					<div class="product-active-2 owl-carousel">
						<div class="product-total-2">
							<c:forEach var="book" items="${SelfHelpList }">
								<div class="single-most-product bd mb-18">
									<div class="most-product-img">
										<a href="details?bookId=${book.isbn }"><img
											src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn }.jpg"
											alt="book" /></a>
									</div>
									<div class="most-product-content">
										<h4>
											<a href="#">${book.title}</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$${book.price }</li>

											</ul>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>

					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-12">
					<div class="section-title-2 mb-30">
						<h3>Children Book</h3>
					</div>
					<div class="product-active-2 owl-carousel">
						<div class="product-total-2">
							<c:forEach var="book" items="${ChildrenList }">
								<div class="single-most-product bd mb-18">
									<div class="most-product-img">
										<a href="details?bookId=${book.isbn }"><img
											src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn }.jpg"
											alt="book" /></a>
									</div>
									<div class="most-product-content">
										<h4>
											<a href="#">${book.title}</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$${book.price }</li>

											</ul>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>

					</div>
				</div>
				<div class="col-lg-3 col-md-12 col-12">
					<div class="block-newsletter">
						<h2>Sign up for send newsletter</h2>
						<p>You can be always up to date with our company new!</p>
						<form action="#">
							<input type="text" placeholder="Enter your email address" />
						</form>
						<a href="#">Send Email</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- most-product-area-end -->
	<!-- recent-post-area-start -->
	<div class="recent-post-area pb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div
						class="section-title section-title-res pt-100 bt-3 text-center mb-30">
						<h2>Latest from our blog</h2>
					</div>
				</div>
				<div class="post-active owl-carousel text-center">
					<div class="col-lg-12">
						<div class="single-post">
							<div class="post-img">
								<a href="#"><img
									src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/blog5.jpg"
									alt="post" /></a>
								<div class="blog-date-time">
									<span class="day-time">14</span> <span class="moth-time">Aug</span>
								</div>
							</div>
							<div class="post-content">
								<h3>
									<a href="error">At the Heart of it All | Shape of Dust</a>
								</h3>

								<p>A planned enjoyable family trip to Egypt became a
									devastating ordeal for Lamisse Hamouda and her father, Hazem.
									Their book, "The Shape of Dust," recounts their journey and
									sheds light on the government's treatment of dual-citizens. In
									this touching article, Lamisse shares how writing the book
									helped them process and share their challenging experiences.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="single-post">
							<div class="post-img">
								<a href="#"><img
									src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/blog6.jpg"
									alt="post" /></a>
								<div class="blog-date-time">
									<span class="day-time">01</span> <span class="moth-time">Aug</span>
								</div>
							</div>
							<div class="post-content">
								<h3>
									<a href="error">20 of the Best Enemies to Lovers Books</a>
								</h3>

								<p>For fans of the thrilling enemies-to-lovers theme, get
									ready for an exciting ride as we present the ultimate guide to
									top-notch enemies-to-lovers books. Delving into the
									electrifying dynamic between characters who initially despise
									each other, this trend has become a beloved favorite among
									BookTok enthusiasts.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="single-post">
							<div class="post-img">
								<a href="#"><img
									src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/blog4.jpg"
									alt="post" /></a>
								<div class="blog-date-time">
									<span class="day-time">18</span> <span class="moth-time">July</span>
								</div>
							</div>
							<div class="post-content">
								<h3>
									<a href="error">Top Poetry Picks for Poetry Month</a>
								</h3>

								<p>This month we're dedicated to embracing the magic of
									poetry. It's a chance to delve into the beauty of words,
									explore different styles and themes, and discover new voices.
									From heartfelt verses to thought-provoking stanzas, Poetry
									Month encourages us to pause, reflect, and connect with the
									power of language.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="single-post">
							<div class="post-img">
								<a href="404.jsp"><img
									src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/blog7.jpg"
									alt="post" /></a>
								<div class="blog-date-time">
									<span class="day-time">06</span> <span class="moth-time">July</span>
								</div>
							</div>
							<div class="post-content">
								<h3>
									<a href="error">When the Mountain Moves Us</a>
								</h3>

								<p>Absorbing Australia's scenic splendor daily inevitably
									shapes your creativity. This is vividly evident in Ya Reeves'
									striking debut, a freelance outdoor educator. "Over This
									Backbone" unearths buried struggles, intertwining with the
									Australian landscape's essence. Gain insights into the novel's
									genesis, characters, and writing process through an exclusive
									Dymocks feature by the author.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- recent-post-area-end -->

	<!-- social-group-area-start -->
	<div class="social-group-area ptb-60 bt">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="section-title-3">
						<h3>Latest Tweets</h3>
					</div>
					<div class="twitter-content">
						<div class="twitter-icon">
							<a href="#"><i class="fa fa-twitter"></i></a>
						</div>
						<div class="twitter-text">
							<p>"Books are a uniquely portable magic."</p>
							
							<a href="#">-Stephen King, On Writing: A Memoir of the Craft</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<div class="section-title-3">
						<h3>Stay Connected</h3>
					</div>
					<div class="link-follow">
						<ul>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-youtube"></i></a></li>
							<li><a href="#"><i class="fa fa-flickr"></i></a></li>
							<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- social-group-area-end -->
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
					<div class="col-lg-8 col-12">
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
											<li><a href="my-account.jsp">My account </a></li>
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
					<div class="col-lg-4 col-12">
						<div class="single-footer mrg-sm">
							<div class="footer-title mb-20">
								<h3>STORE INFORMATION</h3>
							</div>
							<div class="footer-contact">
								<p class="adress">
									<span>My Company</span> Adelaide, SA 5000
								</p>
								<p>
									<span>Call us now:</span> 0123456789
								</p>
								<p>
									<span>Email:</span> khai6mui@hotboy.com
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
								&copy; 2023 <strong> Whisper & Wonder Book Store </strong> Made by Khai Dep Trai and Uyen <a
									href="https://hasthemes.com/" target="_blank"></a>
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