<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Bike Shop a Ecommerce Category Flat Bootstarp Responsive Website Template| Bicycles :: w3layouts</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bike-shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
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
<base href="${pageContext.servletContext.contextPath}/">
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
					   <ul class="nav">						 
						  <a class="shop" href="cart.htm"><img src="images/cart.png" alt=""/></a>
					  </ul>
				 </div>
				 <div class="clearfix"></div>
			 </div>
	  </div> 				 
</div>
<!--/banner-->
<div class="contact">
	<div class="container">
		<div class="cart-top">
			<a href="product.htm"><< BACK TO PRODUCTS PAGE</a>
		 </div>	
		 	<form:form action="insert.htm" modelAttribute="bike">
		 		<h1>PRODUCT DETAILS</h1>
		 		<hr>
		 			<span>${message}</span>
		 		<hr>
		 			<div>
		 				<label class="label_cart">MODEL: </label>
						<form:input path="id" type="text" />
						<form:errors path="id" cssStyle="color:red;font-style:italic"/>
					</div>
					<div>
						<label class="label_cart">PRODUCT NAME:</label>
						<form:errors path="name" cssStyle="color:red;font-style:italic"/>
						<form:input path="name" class="user" type="text" required="" />
						
					</div>
					<div>
						<label class="label_cart">QUANTITY: </label>
						<form:input path="quantity" type="number" min="0" />
					</div>
					<div>
						<label class="label_cart">TYPE: </label>
						<form:radiobutton path="type" value="Mountain" label="Mountain Bike" />
						<form:radiobutton path="type" value="Road" label="Road Bike" />
						<form:radiobutton path="type" value="Street" label="Street Bike" />
						<form:errors path="type" cssStyle="color:red;font-style:italic"/>
					</div>
					<div>
						<label class="label_cart">PRICE: </label>
						<form:input path="price" type="number" min="100000" step="10000"/>
					</div>
					<div>
						<label class="label_cart">BRAND: </label>
						<form:input path="brand" type="text" />
						<form:errors path="brand" cssStyle="color:red;font-style:italic"/>
					</div>
					<div>
						<label class="label_cart">DESCRIPTION: </label>
						<form:textarea path="description" type="text" />
					</div>
					<!-- <div>
						<label class="label_cart">PHOTO LINK: </label>
						<input name="photo1" type="file" />
						<input name="photo2" type="file" />
						<input name="photo3" type="file" />
						<input name="photo4" type="file" />
					</div>	 -->
					<div>
						<label class="label_cart">PHOTO LINK: </label>
						<form:input path="photo1" type="text" />
						<form:input path="photo2" type="text" />
						<form:input path="photo3" type="text" />
						<form:input path="photo4" type="text" />
					</div>					
					<div class="clearfix"></div>
					<br>
					<button class="btn btn-warning" href="#">ADD</button>	
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
				 <li><a href="bicycles.htm">LOG OUT</a></li>	 
			 </ul>
		</div>
		<div class="clearfix"></div>
	 </div>
</div>
<!---->

</body>
</html>


