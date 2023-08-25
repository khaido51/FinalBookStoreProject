<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
<script>
/*$(".remove_cart").click(function (event){
	event.preventDefault();
	
	var row = $(this).closest('tr');
	var bookID = $(this).data("book-id");
	
	$.ajax({
		type: "GET",
		url: "cart",
		data: {
			command= "REMOVE_CART",
			bookId: bookId
		},
		dataType: "json",
		success: function(response){
			row.remove();
			updateCartCount(response.cartCount);
		},
		error: function(){
			alert('An error occured while delete items');
		}
	
	});
});*/


function updateSubtotal(inputElement, price){
	//Get the quantity value from input
	var quantity = parseInt(inputElement.value);
	
	//Calculate the new subtotal
	var subtotal = quantity * price;
	
	//Update subtotal in the corresponding cell
	var subtotalCell = inputElement.parentNode.nextElementSibling;
	subtotalCell.innerHTML = subtotal.toFixed(2);
	
	// Call the function to update the total price
    updateTotalPrice();
	
}

function updateTotalPrice() {
    // Calculate the total price again and update it
    var total = 0;
    var subtotalCells = document.getElementsByClassName("product-subtotal");
    for (var i = 0; i < subtotalCells.length; i++) {
    	var subtotalValue = parseFloat(subtotalCells[i].innerHTML);
        
        if (!isNaN(subtotalValue)) {
            total += subtotalValue;
        }
    }

    // Update the total price in the element with ID "totalPrice"
    document.getElementById("subTotalPrice").innerHTML = total.toFixed(2);
    console.log("Total" + total);

    // Update the total price in the "order-total" row as well
    document.getElementById("orderTotalAmount").innerHTML = total.toFixed(2);
}
</script>

<jsp:include page="nav.jsp" />

</head>
<body class="cart">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	
	<!-- header-area-end -->
	<!-- breadcrumbs-area-start -->
	<div class="breadcrumbs-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#" class="active">cart</a></li>
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
						<h2>Cart</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- entry-header-area-end -->
	<!-- cart-main-area-start -->
	<div class="cart-main-area mb-70">
	<form action="cart" method="POST">
	<input type="hidden" name="command" value="PROCEED_TO_CHECKOUT">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form action="#">
						<div class="table-content table-responsive mb-15 border-1">
							
								<table>
									<thead>
										<tr>
											<th class="product-thumbnail">Image</th>
											<th class="product-name">Product</th>
											<th class="product-price">Price</th>
											<th class="product-quantity">Quantity</th>
											<th class="product-subtotal">Total</th>
											<th class="product-remove">Remove</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="item" items="${cart }">

											
											<tr>
												<td class="product-thumbnail"><a href="details?bookId=${item.value.isbn }"><img
													src="${item.value.imglink }" alt="man" /></a></td>
												<td class="product-name"><a href="#">${item.value.title}</a></td>									
												<td class="product-price"><span class="amount">${item.value.price}</span></td>
												<td class="product-quantity"><input type="number"
													name="amount_${item.value.isbn}" value="1" min="1"
													onchange="updateSubtotal(this, ${item.value.price})">
												</td>
												<td class="product-subtotal">${item.value.price}</td>
												<td class="product-remove"><a
													href="cart?command=REMOVE_CART&bookId=${item.value.isbn}&bookPrice=${item.value.price}" class="remove_cart" data-id="${item.value.isbn}"><i
														class="fa fa-times"></i></a></td>
												<!-- Place the hidden input field in a separate <td> element -->
												<td class="product-ordered-price" style="display: none;">
													<input type="hidden" name="orderedPrice"
													value="${item.value.price}">
												</td>
											</tr>
											

										</c:forEach>


									</tbody>
								</table>
								
						</div>
					</form>
				</div>
			</div>
			
			<!-- ********************************************************************************************* -->
			<div class="row">
				<div class="col-lg-8 col-md-6 col-12">
					<div class="buttons-cart mb-30">
						<ul>
							<li><a href="home">Continue Shopping</a></li>
						</ul>
					</div>
					
				</div>
				<div class="col-lg-4 col-md-6 col-12">
					<div class="cart_totals">
						<h2>Cart Totals</h2>
						<table>
							<tbody>
								<tr class="cart-subtotal">
									<th>Subtotal</th>
									<td><span class="amount" id="subTotalPrice">
										<fmt:formatNumber type="number" value="${totalPrice}" minFractionDigits="2" maxFractionDigits="2" />
									</span></td>
								</tr>
								<tr class="shipping">
									<th>Shipping</th>
									<td>
										<ul id="shipping_method">
											<li><input type="radio"> <label> Flat
													Rate: <span class="amount">$0.00</span>
											</label></li>
											<li><input type="radio"> <label> Free
													Shipping </label></li>
										</ul> <a href="#">Calculate Shipping</a>
									</td>
								</tr>
								<tr class="order-total">
									<th>Total</th>
									<td><strong> <span class="amount"
											id="orderTotalAmount">
											 <fmt:formatNumber type="number" value="${totalPrice}" minFractionDigits="2" maxFractionDigits="2" />
										</span>
										<input type="hidden" name="totalPrice" value="${totalPrice}">
									</strong></td>
								</tr>
							</tbody>
						</table>
						<div class="wc-proceed-to-checkout">
					
							<!--<a href="cart?command=CHECKOUT&totalPrice=${totalPrice} id="checkoutLink">Proceed to Checkout</a>  -->
							
							<button type="submit" value="PROCEED_TO_CHECKOUT">PROCEED TO CHECKOUT</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<!-- cart-main-area-end -->
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
