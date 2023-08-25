<%@page import="book.store.service.GenreService"%>
<%@page import="book.store.entity.Genre"%>
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

<body class="shop">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	<header>
		<jsp:include page="nav.jsp" />
	</header>
	<!-- shop-main-area-start -->
	<div class="shop-main-area mb-70 mt-50">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-3 col-md-12 col-12 order-lg-1 order-2 mt-sm-50 mt-xs-40">
					<div class="shop-left">
						<div class="section-title-5 mb-30">
							<h2>Shopping Options</h2>
						</div>
						<div class="left-title mb-20">
							<h4>Category</h4>
						</div>
						<div class="left-menu mb-30">
							<ul>
								<c:set var="bookCount" value="0" />
								<c:forEach var="genre" items="${genreList }">
									<li><a href="book?genreId=${genre.id }">${genre.name}</a></li>
								</c:forEach>

							</ul>
						</div>



						<div class="left-title mb-20">
							<h4>Price</h4>
						</div>
						<div class="left-menu mb-30">
							<ul>
								<li><a href="#">$0.00-$9.99<span>(1)</span></a></li>
								<li><a href="#">$30.00-$39.99<span>(11)</span></a></li>
								<li><a href="#">$40.00-$49.99<span>(2)</span></a></li>
								<li><a href="#">$50.00-$59.99<span>(3)</span></a></li>
								<li><a href="#">$70.00-and above<span>(1)</span></a></li>
							</ul>
						</div>
						<div class="left-title mb-20">
							<h4>Book you may like</h4>
						</div>
						<div class="random-area mb-30">
							<div class="product-active-2 owl-carousel">
								<div class="product-total-2">
									<c:forEach var="book" items="${randomBookList}">
										<div class="single-most-product bd mb-18">

											<div class="most-product-img">
												<a href="details?bookId=${book.isbn }"><img
													src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn }.jpg"
													alt="book" /></a>
											</div>
											<div class="most-product-content">

												<h4>
													<a href="details?bookId=${book.isbn }">${book.title}</a>
												</h4>
												<div class="product-price">
													<ul>
														<li>$${book.price}</li>
														<!-- <li class="old-price">$33.00</li> -->
													</ul>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="product-total-2">
									<c:forEach var="book" items="${randomBookList1}">
										<div class="single-most-product bd mb-18">

											<div class="most-product-img">
												<a href="details?bookId=${book.isbn }"><img
													src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn }.jpg"
													alt="book" /></a>
											</div>
											<div class="most-product-content">
												<h4>
													<a href="details?bookId=${book.isbn }">${book.title}</a>
												</h4>
												<div class="product-price">
													<ul>
														<li>${book.price}</li>
														<!-- <li class="old-price">$33.00</li> -->
													</ul>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>
						<div class="banner-area mb-30">
							<div class="banner-img-2">
								<a href="error"><img
									src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/disc%2020%25%20off.jpg"
									alt="banner" /></a>
							</div>
						</div>
						<div class="left-title-2">
							<h2>My Wish List</h2>
							<div class="product-total-2">
								<p>You have ${wishListItemcount} items in your wish list.</p>
								<br>
								<c:forEach var="book" items="${booksInWishlist}" varStatus="loop">
									<c:if test="${loop.index < 2}">
										<!-- Only display the first two items -->
										<div class="single-most-product bd mb-18">
											<div class="most-product-img">
												<a href="details?bookId=${book.isbn}"><img
													src="${book.imglink}" alt="book" /></a>
											</div>
											<div class="most-product-content">
												<h4>
													<a href="details?bookId=${book.isbn}">${book.title}</a>
												</h4>
												<div class="product-price">
													<ul>
														<li>$${book.price}</li>
													</ul>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<a href="wishlist?command=VIEW_WISHLIST">See more </a>


						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-12 col-12 order-lg-2 order-1">

					<div class="section-title-5 mb-30">
						<h2>Book</h2>
					</div>
					<div class="toolbar mb-30">
						<div class="shop-tab">
							<div class="tab-3">
								<ul class="nav">
									<li><a href="#th" data-bs-toggle="tab"><i
											class="fa fa-th-large"></i>Grid</a></li>
									<li><a href="#list" data-bs-toggle="tab" class="active"><i
											class="fa fa-bars"></i>List</a></li>
								</ul>
							</div>
							<div class="list-page">
								<p>Items 1-7 of ${totalPage}</p>
							</div>
						</div>
						<div class="field-limiter">
							<div class="control">
								<span>Show</span>
								<!-- chosen-start -->
								<select data-placeholder="Default Sorting" style="width: 50px;"
									class="chosen-select" tabindex="1">
									<option value="Sorting">1</option>
									<option value="popularity">2</option>
									<option value="rating">3</option>
									<option value="date">4</option>
								</select>
								<!-- chosen-end -->
							</div>
						</div>
						<div class="toolbar-sorter">
							<span>Sort By</span> <select id="sorter" class="sorter-options"
								data-role="sorter">
								<option selected="selected" value="position">Position</option>
								<option value="name">Product Name</option>
								<option value="price">Price</option>
							</select> <a href="#"><i class="fa fa-arrow-up"></i></a>
						</div>
					</div>
					<!-- tab-area-start -->
					<div class="tab-content">
						<div class="tab-pane fade" id="th">
							<div class="row">
								<c:forEach var="book" items="${bookList }">

									<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
										<!-- single-product-start -->
										<div class="product-wrapper mb-40">
											<div class="product-img">
												<a href="details?bookId=${book.isbn }"> <img
													src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn}.jpg"
													alt="book" class="primary" />
												</a>
												<div class="quick-view">
													<a class="action-view" href="details?bookId=${book.isbn }"
														data-bs-target="#productModal" data-bs-toggle="modal"
														title="Quick View"> <i class="fa fa-search-plus"></i>
													</a>
												</div>

											</div>
											<div class="product-details text-center">
												<div class="product-rating">
													<ul>
														<li><a href="#"><i class="fa fa-star"></i></a></li>
														<li><a href="#"><i class="fa fa-star"></i></a></li>
														<li><a href="#"><i class="fa fa-star"></i></a></li>
														<li><a href="#"><i class="fa fa-star"></i></a></li>
														<li><a href="#"><i class="fa fa-star"></i></a></li>
													</ul>
												</div>
												<h4>
													<a href="details?bookId=${book.isbn }">${book.title }</a>
												</h4>
												<div class="product-price">
													<ul>
														<li>$${book.price }</li>
													</ul>
												</div>
											</div>
											<div class="product-link">
												<div class="product-button">
													<a href="#" title="Add to cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												<div class="add-to-link">
													<ul>
														<li><a href="product-details.html" title="Details"><i
																class="fa fa-external-link"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
										<!-- single-product-end -->
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="tab-pane fade show active" id="list">
							<!-- single-shop-start -->
							<c:forEach var="book" items="${bookList }">

								<div class="single-shop mb-30">
									<div class="row">
										<div class="col-lg-4 col-md-4 col-12">
											<div class="product-wrapper-2">
												<div class="product-img-hp">
													<a href="details?bookId=${book.isbn }"> <img
														src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn}.jpg"
														alt="book" class="primary" />
													</a>
												</div>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-12">
											<div class="product-wrapper-content">
												<div class="product-details">
													<div class="product-rating">
														<ul>
															<li><a href="#"><i class="fa fa-star"></i></a></li>
															<li><a href="#"><i class="fa fa-star"></i></a></li>
															<li><a href="#"><i class="fa fa-star"></i></a></li>
															<li><a href="#"><i class="fa fa-star"></i></a></li>
															<li><a href="#"><i class="fa fa-star"></i></a></li>
														</ul>
													</div>
													<h4>
														<a href="details?bookId=${book.isbn }">${book.title }</a>
													</h4>
													<div class="product-price">
														<ul>
															<li>$${book.price }</li>

														</ul>
													</div>
													<div class="add-read-more show-less-content" id="Overview">${book.description}</div>

												</div>
												<div class="product-link">
													<div class="product-button">
														<a href="cart?command=ADD_TO_CART&bookId=${book.isbn }"
															title="Add to cart" class="add-to-cart"
															data-book-id="${book.isbn }"><i
															class="fa fa-shopping-cart"></i>Add to cart</a>
													</div>
													<div class="add-to-link">
														<ul>
															<li><a href="product-details.html" title="Details"><i
																	class="fa fa-external-link"></i></a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- single-shop-end -->




						</div>
					</div>
					<!-- tab-area-end -->
					<!-- pagination-area-start -->
					<div class="pagination-area mt-50">
						<div class="list-page-2">
							<p>Items 1-7</p>
						</div>
						<!--<p>Genre ID in JSP: ${genreId}</p>  -->
						<div class="page-number">
							<ul>
								<c:forEach var="pageNumber" begin="1" end="${totalPage}">
									<li><a href="book?page=${pageNumber}&genreId=${genreId}">${pageNumber}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- pagination-area-end -->
				</div>
			</div>
		</div>
	</div>
	<!-- shop-main-area-end -->
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
	<!-- Modal -->
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-5 col-sm-5 col-xs-12">
							<div class="modal-tab">
								<div class="product-details-large tab-content">
									<div class="tab-pane active" id="image-1">
										<img src="img/product/quickview-l4.jpg" alt="" />
									</div>
									<div class="tab-pane" id="image-2">
										<img src="img/product/quickview-l2.jpg" alt="" />
									</div>
									<div class="tab-pane" id="image-3">
										<img src="img/product/quickview-l3.jpg" alt="" />
									</div>
									<div class="tab-pane" id="image-4">
										<img src="img/product/quickview-l5.jpg" alt="" />
									</div>
								</div>
								<div class="product-details-small quickview-active owl-carousel">
									<a class="active" href="#image-1"><img
										src="img/product/quickview-s4.jpg" alt="" /></a> <a
										href="#image-2"><img src="img/product/quickview-s2.jpg"
										alt="" /></a> <a href="#image-3"><img
										src="img/product/quickview-s3.jpg" alt="" /></a> <a
										href="#image-4"><img src="img/product/quickview-s5.jpg"
										alt="" /></a>
								</div>
							</div>
						</div>
						<div class="col-md-7 col-sm-7 col-xs-12">
							<div class="modal-pro-content">
								<h3>Chaz Kangeroo Hoodie3</h3>
								<div class="price">
									<span>$70.00</span>
								</div>
								<p>Pellentesque habitant morbi tristique senectus et netus
									et malesuada fames ac turpis egestas. Vestibulum tortor quam,
									feugiat vitae, ultricies eget, tempor sit amet.</p>
								<div class="quick-view-select">
									<div class="select-option-part">
										<label>Size*</label> <select class="select">
											<option value="">S</option>
											<option value="">M</option>
											<option value="">L</option>
										</select>
									</div>
									<div class="quickview-color-wrap">
										<label>Color*</label>
										<div class="quickview-color">
											<ul>
												<li class="blue">b</li>
												<li class="red">r</li>
												<li class="pink">p</li>
											</ul>
										</div>
									</div>
								</div>
								<form action="#">
									<input type="number" value="1" />
									<button>Add to cart</button>
								</form>
								<span><i class="fa fa-check"></i> In stock</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal end -->






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