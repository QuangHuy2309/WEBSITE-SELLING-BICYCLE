<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Bike Shop a Ecommerce Category Flat Bootstarp Responsive Website Template| Cart :: w3layouts</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="bike Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Roboto:500,900,100,300,700,400' rel='stylesheet' type='text/css'>
<!--webfont-->
<!-- dropdown -->
<script src="js/jquery.easydropdown.js"></script>
<link href="css/nav.css" rel="stylesheet" type="text/css" media="all"/>
<script src="js/scripts.js" type="text/javascript"></script>
<!--js-->

</head>
<body>
<!--banner-->
<script src="js/responsiveslides.min.js"></script>
<script>  
    $(function () {
      $("#slider").responsiveSlides({
      	auto: false,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
<div class="banner-bg banner-sec">	
	  <div class="container">
			 <div class="header">
			       <div class="logo">
						 <a href="index.htm"><img src="images/logo.png" alt=""/></a>
				   </div>							 
				  <div class="top-nav">										 
						<label class="mobile_menu" for="mobile_menu">
						<span>Menu</span>
						</label>
						<input id="mobile_menu" type="checkbox">
				 </div>
				 <div class="clearfix"></div>
			 </div>
	  </div> 				 
</div>
<!--/banner-->
<div class="cart">
	 <div class="container">
		 <div class="cart-top">
			<a href="bicycles.htm"><< Continue shopping</a>
		 </div>	
			
		 <div class="col-md-9 cart-items">
			 <h2>My Shopping Bag</h2>
				<script>$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						$('.cart-header').fadeOut('slow', function(c){
							$('.cart-header').remove();
						});
						});	  
					});
			   </script>
			<%-- <form:form modelAttribute="orders">
			<div>
			<label>Customer name:</label>
				<form:input path="name"/>
			</div>
			<div>
			<label>Model: </label>
				<form:input path="products.id" readonly="true"/>
			</div>
			<div>
			<label>Phone: </label>
				<form:input path="phone"/>
			</div>
			<div>
			<label>Email: </label>
				<form:input path="email"/>
			</div>
			<div>
			<label>Address: </label>
				<form:input path="address" maxlength="50" size="4"/>
			</div>		
		</form:form> --%>
		<div class="contact">
		<form:form action="cart.htm" modelAttribute="orders">
			<div class="container">
				<h3>CUSTOMER INFORMATION</h3>
					<div>
						<label class="label_cart">CUSTOMER NAME: </label>
						<form:input path="name" type="text" placeholder="LUONG QUANG HUY" required=""/>
						<form:errors path="name" cssStyle="color:red;font-style:italic"/>
					</div>
					<div>
						<label class="label_cart">Model No:      </label>
						<form:input type="text" path="products.id" readonly="true"/>
					</div> 
					<div>
						<label class="label_cart">Phone Number:  </label>
						<form:input type="number" placeholder="0967141557" required="" path="phone" />
						<form:errors path="phone" cssStyle="color:red;font-style:italic"/>
					</div>
					<div>
						<label class="label_cart">Email:         </label>
						<form:input type="email" path="email" placeholder="lqhuy2309@gmail.com" required=""/>
						<form:errors path="email" cssStyle="color:red;font-style:italic"/>
					</div>
					<div>
						<label>Address:       </label>
						<form:input type="text" path="address" placeholder="97 Man Thien Street, Hiep Phu Ward, District 9, HCM" required=""/>
						<form:errors path="address" cssStyle="color:red;font-style:italic"/>
					</div>
				<div class="col-md-3 cart-total">
			 <div class="clearfix"></div>
			 	<span>${message}</span>
			 	<br>
			 	<button class="btn btn-info" href="#">Place Order</button>
			 <%-- <a class="order" href="cart.htm?id=${bike.id}">Place Order</a> --%>
			 <!-- <button><a class="order" href="#">Place Order</a></button> -->
			</div>
			</div>
		</div>
			 <div class="cart-header">
				 <div class="close1"> </div>
				 <div class="cart-sec">
						<div class="cart-item cyc">
							 <img src="${bike.photo1}"/>
						</div>
					   <div class="cart-item-info">
							 <h3>${bike.name}<span>Model No: ${bike.id}</span></h3>
							 <h4><fmt:formatNumber value="${bike.price}" type="currency" /></h4>
							 
					   </div>
					   <div class="clearfix"></div>
						<div class="delivery">						 
							 <span>Delivered in 2-3 bussiness days</span>
							 <div class="clearfix"></div>
				        </div>						
				  </div>
			 </div>
			 <script>$(document).ready(function(c) {
					$('.close2').on('click', function(c){
							$('.cart-header2').fadeOut('slow', function(c){
						$('.cart-header2').remove();
					});
					});	  
					});
			 </script>
			 		
		 </div>
		 
		 <%-- <div class="col-md-3 cart-total">
			 <div class="clearfix"></div>
			 	<span>${message}</span>
			 <a class="order" href="cart.htm?id=${bike.id}">Place Order</a>
			 <button><a class="order" href="#">Place Order</a></button>
			</div> --%>
	</form:form>
	 </div>
</div>
<!---->
<div class="footer">
	 <div class="container wrap">
		<div class="logo2">
			 <a href="index.htm"><img src="images/logo2.png" alt=""/></a>
		</div>
		<div class="ftr-menu">
			 <ul>
				 <li><a href="login.htm">ADMIN</a></li>	 
			 </ul>
		</div>
		<div class="clearfix"></div>
	 </div>
</div>
<!---->

</body>
</html>

