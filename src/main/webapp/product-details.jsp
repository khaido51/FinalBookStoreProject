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
<!-- Social media -->
<link rel="stylesheet" href="css/socialmedia.css">
<!-- font -->
<link rel="stylesheet" href="css/font.css">
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
<body class="product-details">
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
							<li><a href="#" class="active"></a></li>
							<li><a
								href="http://localhost:8080/BookStoreWebProject/details?bookId=${book.isbn}"
								class="active">${book.title}</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	<!-- product-main-area-start -->
	<div class="product-main-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 col-md-12 col-12 order-lg-1 order-1">
					<!-- product-main-area-start -->
					<div class="product-main-area">
						<div class="row">
							<div class="col-lg-5 col-md-6 col-12">
								<div class="flexslider">
									<ul class="slides">
										<li data-thumb="img/thum-2/1.jpg"><img
											src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn }.jpg"
											alt="${book.title }" /></li>
									</ul>

								</div>

							</div>
							<div class="col-lg-7 col-md-6 col-12">
								<div class="product-info-main">
									<div class="page-title">
										<h1>${book.title}</h1>
									</div>
									<!--<div class="product-info-stock-sku">
											<span>In stock</span>
											<div class="product-attribute">
												<span>SKU</span>
												<span class="value">24-WB05</span>
											</div>
										</div>  -->
									<div class="product-attribute">
										<span>By:</span> <a href="#authorpage"><span>${author.name }</span></a>
									</div>
									<div class="product-reviews-summary">
										
										<div class="reviews-actions">
											<a href="#">${reviewCount} Reviews</a> <a href="#Reviews"
												class="view">Add Your Review</a>
										</div>
									</div>
									<div class="product-info-price">
										<div class="price-final">
											<span>$ ${book.price}</span>
											<!-- <span class="old-price">$40.00</span>  -->

										</div>
									</div>
									<div class="product-add-form">
										<form action="#">
											<a href="cart?command=ADD_TO_CART&bookId=${book.isbn }"
											title="Add to cart" class="add-to-cart" data-book-id="${book.isbn }"><i class="fa fa-shopping-cart"></i>Add
											to cart</a>
											
											<a href="wishlist?command=ADD_TO_WISHLIST&bookId=${book.isbn}"
											data-book-id="${book.isbn }"><i class="fa fa-heart"></i>Add
											to Wishlist</a>
										</form>
									</div>
								
								</div>
							</div>
						</div>
					</div>
					<!-- product-main-area-end -->
					<!-- product-info-area-start -->
					<div class="product-info-area mt-80">
						<!-- Nav tabs -->
						<ul class="nav">
							<li><a href="#Overview" class="tab-product"
								data-bs-toggle="tab">Overview</a></li>
							<li><a href="#Details" class="tab-product"
								data-bs-toggle="tab">Product Details</a></li>
							<li><a href="#Author" class="tab-product"
								data-bs-toggle="tab">About the Author </a></li>
							<li><a href="#Reviews" class="tab-product"
								data-bs-toggle="tab">Reviews </a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="Overview">
								<div class="valu valu-2">${book.description}</div>
							</div>
							<div class="tab-pane fade" id="Details">
								<div class="valu">

									<ul>
										<li><span>Title:</span>${book.title }</li>
										<li><span>Author:</span>${author.name }</li>
										<li><span>Publisher:</span> ${book.publisher }</li>
										<li><span>ISBN:</span>${book.isbn }</li>
										<li><span>Product Dimension:</span>${book.dimension }</li>
										<li><span>Languages:</span>${book.language }</li>
										<c:if test="${empty book.series}">
										</c:if>
										<c:if test="${not empty book.series}">
											<li><span>Series:</span>${book.series }
										</c:if>
										<li><span>Format:</span> ${book.format }</li>
										<li><span>Category:</span> <c:forEach var="genre"
												items="${genreList }">
												<li><a href="book?genreId=${genre.id }">${genre.name }</a></li>
											</c:forEach></li>
										<li><span>Publication Date:</span>${book.publicdate }</li>
										<li><span>Page:</span>${book.page }</li>


									</ul>
								</div>
							</div>
							<div class="tab-pane fade" id="Author">
								<div class="valu valu-2">${author.description}</div>
							</div>
							<div class="tab-pane fade" id="Reviews">
								<div class="valu valu-2">
									<div class="section-title mb-10 mt-20">
										<h2>Customer Reviews</h2>
										<c:if test="${empty reviewList }">
										<p>There is no review for this book</p></c:if>
										
									</div>
								
											
											<div class="container">
										<div class="row">
											<ul>
												<c:forEach var="review" items="${reviewList}">
													<li class="row">
														<div class="col-md-3">
															<div class="review-details">
																<p class="review-author">
																	<a href="#">${review.userName}</a>
																</p>
																<p class="review-date">
																	Posted on <span>${review.date}</span>
																</p>
															</div>
														</div>
														<div class="col-md-9">
															<div class="review-title">
																<h3>${review.reviewTitle}</h3>
															</div>
															<div class="review-content">
																<p>${review.description }</p>
															</div>
														</div>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
									<div class="review-add">
										<h3>You're reviewing:</h3>
										<h4>${book.title }</h4>
									</div>
											
											
											
									<div class="review-form">
										<form action="details" method="POST">
											<input type="hidden" name="command" value="SUBMIT_REVIEW">
											<c:if test="${empty sessionScope.userName }">
												<p>
													Please <a href="login.jsp">login</a> to write a review!Not
													yet a member? Register <a href="register.jsp">here</a>
												</p>
											</c:if>
											<c:if test="${not empty sessionScope.userName }">
												<div class="single-form">
													<label for="userName">Name: ${userName }</label><br> <input
														type="hidden" id="custId" name="customerId"
														value="${customerId }">
													<!-- input type="text" id="userName" name="userName " required> -->

												</div>
												<div class="single-form">

													<input type="hidden" id="custId" name="bookId"
														value="${bookId }">
													<!-- input type="text" id="userName" name="userName " required> -->

												</div>


												<div class="single-form single-form-2">
													<label for="title">Title <sup>*</sup></label><br> <input
														type="text" id="title" name="reviewTitle" required>
												</div>
												<div class="single-form">
													<label for="review">Review <sup>*</sup></label><br>
													<textarea id="review" name="description" cols="30" rows="4"
														style="white-space: pre-wrap;" required></textarea>

												</div>
												<div class="review-form-button">
													<button type="submit">Submit Review</button>
												</div>
											</c:if>
										</form>

									</div>
									
								</div>
							</div>
						</div>
					</div>
					<!-- product-info-area-end -->
					<!-- new-book-area-start -->
					<div class="new-book-area mt-60">
						<div class="section-title text-center mb-30">
							<h3>Discover similar books</h3>
						</div>
						<div class="tab-active owl-carousel">
							<c:forEach var="book" items="${bookList }">
								<div class="tab-total">
									<!-- single-product-start -->

									<div class="product-wrapper">

										<div class="product-img">
											<a href="details?bookId=${book.isbn }"> <img
												src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn }.jpg"
												alt="book" class="primary" />
											</a>

										</div>


										<div class="product-details text-center">

											<h4>
												<a href="details?bookId=${book.isbn }">${book.title }</a>
											</h4>
											<c:forEach var="author" items="${authorList}">
												<h6>
													<a href="#">${author.name}</a>
												</h6>
											</c:forEach>

											<div class="product-price">
												<ul>
													<li>$${book.price }</li>
												</ul>
											</div>
										</div>
										<div class="product-link">
											<div class="product-button">
												<a href="cart?command=ADD_TO_CART&bookId=${book.isbn }"
													title="Add to cart" class="add-to-cart" data-book-id="${book.isbn }"><i class="fa fa-shopping-cart"></i>Add
													to cart</a>
												
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
							</c:forEach>
							<!-- single-product-end -->
						</div>
					</div>
					<!-- new-book-area-start -->
				</div>
				<div class="col-lg-3 col-md-12 col-12 order-lg-2 order-2">
					<div class="shop-left">
						<div class="left-title mb-20">
							<h4>Books by Author</h4>
						</div>
						<div class="random-area mb-30">
							<div class="product-active-2 owl-carousel">
								<div class="product-total-2">
									<c:forEach var="book" items="${AuthorBookList }">
										<div class="single-most-product bd mb-18">
											<div class="most-product-img">
												<a href="#"><img
													src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/${book.isbn }.jpg"
													alt="book" /></a>
											</div>
											<div class="most-product-content">
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
													<a href="#">${book.title }</a>
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
						<div class="banner-area mb-30">
							<div class="banner-img-2">
							<a href="error"><img
									src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/whisper%20and%20(1).png"
									alt="banner" /></a>
							</div>
						</div>

						<div class="left-title-2">
							<h2>My Wish List</h2>
							<div class="product-total-2">
								<p>You have ${countWishlistItem} items in your wish list.</p>
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
			</div>
		</div>
	</div>
	<!-- product-main-area-end -->
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
								&copy; 2022 <strong> Koparion </strong> Mede with â¤ï¸
								by <a href="https://hasthemes.com/" target="_blank"><strong>HasThemes</strong></a>
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
