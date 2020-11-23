<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
					   <!-- <ul class="nav">						 
						  <a class="shop" href="cart.htm"><img src="images/cart.png" alt=""/></a>
					  </ul> -->
				 </div>
				 <div class="clearfix"></div>
			 </div>
	  </div> 				 
</div>
<!--/banner-->
<div class="bikes">		 
	 <div class="mountain-sec">
		 <h2>MOUNTAIN BIKES</h2>
			 <c:forEach var="bike" items="${mountain}">
			 	<a href="single.htm?id=${bike.id}"><div class="bike">		
			 		<img src="${bike.photo1}" alt=""/>
			 		<div class="bike-cost">
			 			<div class="bike-mdl">
						 <h4>${bike.name}<span>Model:${bike.id}</span></h4>
						 </div>
					<div class="bike-cart">						 
						 <a class="buy" href="single.htm?id=${bike.id}">BUY NOW</a>
					</div>
					<div class="clearfix"></div>
				 	</div>
				 <div class="fast-viw">
						<a href="single.htm?id=${bike.id}">Quick View</a>
				 </div>
			 </div></a>
			 </c:forEach>
			 <div class="clearfix"></div>
	  </div>
		 
	  <div class="singlespeed-sec">
		   <h2>SINGLE SPEED-BIKES</h2>
			 <c:forEach var="bike" items="${street}">
			 	<a href="single.htm?id=${bike.id}"><div class="bike">		
			 		<img src="${bike.photo1}" alt=""/>
			 		<div class="bike-cost">
			 			<div class="bike-mdl">
						 <h4>${bike.name}<span>Model:${bike.id}</span></h4>
						 </div>
					<div class="bike-cart">						 
						 <a class="buy" href="single.htm?id=${bike.id}">BUY NOW</a>
					</div>
					<div class="clearfix"></div>
				 	</div>
				 <div class="fast-viw">
						<a href="single.htm?id=${bike.id}">Quick View</a>
				 </div>
			 </div></a>
			 </c:forEach>
			 <div class="clearfix"></div>
		 </div>
		 
		 <div class="road-sec">
		   <h2>ROAD-BIKES</h2>
			<c:forEach var="bike" items="${road}">
			 	<a href="single.htm?id=${bike.id}"><div class="bike">		
			 		<img src="${bike.photo1}" alt=""/>
			 		<div class="bike-cost">
			 			<div class="bike-mdl">
						 <h4>${bike.name}<span>Model:${bike.id}</span></h4>
						 </div>
					<div class="bike-cart">						 
						 <a class="buy" href="single.htm?id=${bike.id}">BUY NOW</a>
					</div>
					<div class="clearfix"></div>
				 	</div>
				 <div class="fast-viw">
						<a href="single.htm?id=${bike.id}">Quick View</a>
				 </div>
			 </div></a>
			 </c:forEach>
			 <div class="clearfix"></div>
		 </div>
		 
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

