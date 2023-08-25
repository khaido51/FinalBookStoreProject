<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Whisper Wonder Bookstore</title>
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




<script>
var totalAmount = 0; // Initialize total amount
$(document).ready(function() {
    $(".view-cart").click(function(event) {
        var cartCount = parseInt($("#cartCount").text());

        // Check if the cart is empty
        if (cartCount === 0) {
            alert("Your cart is empty. Please add items to your cart first.");
            event.preventDefault(); // Prevent navigation
        }
    });

    $(".add-to-cart").click(function(event) {
        event.preventDefault();
      
        var bookId = $(this).data("book-id");

        $.ajax({
            type: "GET",
            url: "cart",
            data: {
                command: "ADD_TO_CART",
                bookId: bookId
            },
            dataType: "json",
            cache: false,
            success: function(response) {
                console.log("AJAX success:", response);
                $("#cartCount").text(response.cartCount);

                // Update the cart items' display
                updateCartItems(response.cartItems);
                
           	  // Show the "Item added to cart" alert
                showAlert();
             
                console.log("Total " + totalAmount);
            },
            error: function() {
                // Handle error
                console.log("Error connecting to the server.");
            }
        });
    });
   
	
    // Event delegation for remove buttons
    /*$(".mini-cart-sub").on("click", ".remove-from-cart", function(event) {
        event.preventDefault();
        console.log("Total before remove" + totalAmount);
        var cartItem = $(this).closest(".single-cart");
        var isbn = cartItem.data("isbn"); // Use data-isbn here
        console.log("ISBN: " + isbn);
        
        var removedItemPrice = $(this).data("price-id"); // Retrieve price using data("price-id")
        var bookId = $(this).data("book-id"); // Retrieve book ID using data("book-id")

        console.log("ISBN of bookID: " + bookId);
        console.log("Removed Item Price: " + removedItemPrice);
        // Send AJAX request to remove the item
        $.ajax({
            type: "GET",
            url: "cart",
            data: {
                command: "REMOVE_CART",
                bookId: isbn
            },
            dataType: "json",
            cache: false,
            success: function(response) {
                // Update the cart count
                updateCartCount(response.cartCount);

                // Remove the cart item from the UI
                cartItem.remove();
                
                
                
                totalAmount -= removedItemPrice;
                
                $(".cart-totals h5 span").text('$' + totalAmount.toFixed(2));
            },
            error: function() {
                console.log("Error connecting to the server.");
            }
        });
    });*/

    // Function to update cart items' display
    function updateCartItems(cartItems) {
        var cartItemsDiv = $(".mini-cart-sub .cart-product");

        cartItemsDiv.empty(); // Clear previous items

        if (cartItems && cartItems.length > 0) {
            $.each(cartItems, function(index, item) {
                console.log("Item:", item);
                totalAmount += item.price;
                cartItemsDiv.append('<div class="single-cart" data-isbn="' + item.isbn + '">'
                    + '<div class="cart-img"><a href="details?bookId=' + item.isbn + '">'
                    + '<img src="' + item.imglink + '" alt="book" /></a></div>'
                    + '<div class="cart-info">'
                    + '<h5><a href="details?bookId=' + item.isbn + '">' + item.title + '</a></h5>'
                    + '<p>$' + item.price + '</p></div>'
                    + '<div class="cart-icon">'
                    + '<a href="cart?command=REMOVE_CART&bookId=' + item.isbn + '" class="remove-from-cart">'
                    + '<i class="fa fa-remove"></i></a></div></div>');
            });
        } else {
            cartItemsDiv.append('<span>The shopping cart is empty</span>');
        }

        // Update total amount
        $(".cart-totals h5 span").text('$' + totalAmount.toFixed(2));
    }

    // Function to update the cart count
    function updateCartCount(cartCount) {
        $("#cartCount").text(cartCount);
        
    }
    
    /// Function to show the "Item added to cart" alert
    function showAlert() {
        var alertHtml = '<div class="alert alert-success alert-dismissible fade show" role="alert">';
        alertHtml += 'Item has been added to your cart!';
        alertHtml += '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>';
        alertHtml += '</div>';

        // Add the alert to the container
        $(".alert-container").html(alertHtml);

        // Calculate the appropriate position based on viewport height
        var alertHeight = $(".alert").outerHeight();
        var bottomMargin = 20; // Adjust this value if needed
        var windowHeight = window.innerHeight;
        var positionTop = windowHeight - alertHeight - bottomMargin;

        // Set the calculated top position for the alert
        $(".alert").css("top", positionTop + "px");

        // Automatically close the alert after 5 seconds
        setTimeout(function() {
            $(".alert").alert('close');
        }, 3000);
    }

});
</script>

</head>
<body>
	<!-- header-top-area-start -->
	<div class="header-top-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-12"></div>
				<div class="col-lg-6 col-md-6 col-12">
					<div class="account-area text-end">
						<ul>
							<c:if test="${empty sessionScope.userName }">
								<li><a href="login.jsp">Sign in</a></li>
								<li><a href="register.jsp">Register</a></li>
							</c:if>
							<c:if test="${not empty sessionScope.userName }">
								<li><a href="customer">${userName }</a></li>

								<li><a href="wishlist?command=VIEW_WISHLIST">Wishlist
										(${wishListItemcount}) </a></li>
								<li><a href="logout">Logout</a></li>

							</c:if>



						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header-top-area-end -->
	<!-- header-mid-area-start -->
	<div class="header-mid-area ptb-40">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5 col-12">
					<div class="header-search">
						<form action="book" method="GET">
							<input type="text" name="bookName"
								placeholder="Please enter book name..." />
							<button type="submit" class="form-button">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>
				<div class="col-lg-6 col-md-4 col-12">
					<div class="logo-area text-center logo-xs-mrg "
						style="margin-left: 6rem;">
						<a href="home"><img
							src="https://raw.githubusercontent.com/yellowmacaron/project-img/main/8.png"
							alt="logo" /></a>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-12">
					
					<div class="my-cart">
						<ul>
							<li><a href="cart?command=VIEW_CART"><i
									class="fa fa-shopping-cart"></i>My Cart</a> <span id="cartCount">${empty sessionScope.cart? 0 : sessionScope.cart.size()}</span>
								<div class="mini-cart-sub">
									<div class="cart-product">
										<span>${empty sessionScope.cart? "The shopping cart is empty" : "" }</span>
										<c:forEach var="item" items="${cart}">
											<c:set var="total" value="${total + item.value.price}" />
											<div class="single-cart" data-book-id="${item.value.isbn}" data-price-id="${item.value.price}">
										
												<div class="cart-img">
													<a href="details?bookId=${item.value.isbn}"><img
														src="${item.value.imglink}" alt="book" /></a>
												</div>
												<div class="cart-info">
													<h5>
														<a href="details?bookId=${item.value.isbn}">${item.value.title}</a>
													</h5>
													<p>$${item.value.price}</p>
												</div>
												<div class="cart-icon" >
													<!--<a href="cart?command=REMOVE_CART&bookId=${item.value.isbn}" class="remove-from-cart" data-book-id="${item.value.isbn}" data-price-id="${item.value.price}">
           												<i class="fa fa-remove"></i>
     											    </a>-->
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="cart-totals">
										<h5>

											Total: <span>$<fmt:formatNumber type="number" value="${total}" minFractionDigits="2" maxFractionDigits="2" /></span>
										</h5>
									</div>
									<div class="cart-bottom">
										<a class="view-cart" href="cart?command=VIEW_CART">view cart</a>
									</div>
								</div></li>
						</ul>
					</div>
					<div class="alert-container"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- header-mid-area-end -->
	<!-- main-menu-area-start -->
	<div class="main-menu-area d-md-none d-none d-lg-block sticky-header-1"
		id="header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="menu-center-wrap">
						<div class="menu-area">
							<nav>
								<ul>
									<li class="active"><a href="home">Home<i
											class="fa fa-angle-down"></i></a>
										<div class="sub-menu">
											<ul>
												<li><a href="home">Home</a></li>
											</ul>
										</div></li>

									<li><a href="book">Fiction<i class="fa fa-angle-down"></i></a>
										<div class="sub-menu sub-menu-2">
											<c:forEach var="genre" items="${FicList}">
												<ul>
													<li><a href="book?genreId=${genre.id}">${genre.name}
													</a></li>
												</ul>
											</c:forEach>
										</div></li>


									<li><a href="book">Non-Fiction<i
											class="fa fa-angle-down"></i></a>
										<div class="sub-menu sub-menu-2">
											<c:forEach var="genre" items="${NonFicList}">
												<ul>
													<li><a href="book?genreId=${genre.id}">${genre.name}
													</a></li>
												</ul>
											</c:forEach>
										</div></li>
									<li><a href="book">Kids<i class="fa fa-angle-down"></i></a>
										<div class="sub-menu sub-menu-2">
											<c:forEach var="genre" items="${genreChildrenList}">
												<ul>
													<li><a href="book?genreId=${genre.id}">${genre.name}
													</a></li>
												</ul>
											</c:forEach>
										</div></li>
								</ul>
							</nav>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- main-menu-area-end -->

	<!-- mobile-menu-area-start -->
	<div class="mobile-menu-area d-lg-none d-block fix">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="mobile-menu">
						<nav id="mobile-menu-active">
							<ul id="nav">
								<li><a href="home">Home</a>
									<ul>
										<li><a href="home">Home</a></li>

									</ul></li>
								<li><a href="book">Fiction</a>
									<ul>
										<c:forEach var="genre" items="${FicList }">
											<li><a href="book?genreId=${param.genre.id }">${genre.name }</a></li>
										</c:forEach>

									</ul></li>
								<li><a href="book">Non-fiction</a>
									<ul>
										<c:forEach var="genre" items="${NonFicList }">
											<li><a href="book?genreId=${genre.id }">${genre.name }</a></li>
										</c:forEach>
									</ul></li>

								<li><a href="book">Kids</a>
									<ul>
										<c:forEach var="genre" items="${genreChildrenList }">
											<li><a href="book?genreId=${genre.id }">${genre.name }</a></li>
										</c:forEach>
									</ul></li>

							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- mobile-menu-area-end -->
</body>
</html>