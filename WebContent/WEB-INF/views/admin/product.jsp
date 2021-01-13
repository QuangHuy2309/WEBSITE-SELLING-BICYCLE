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
<div class="bikes">
	
	
	<div class="road-sec">
		<h2>PRODUCTS</h2>
		<span>${message}</span>
		<br>
		<a href="importfile.htm" class="btn btn-info" role="button">Add new Product</a>
		<a href="changetoorder.htm" class="btn btn-info" role="button">Orders</a>
		<br>
		<br>
		
		<table class="table table-hover">
		<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>QUANTITY</th>
				<th>TYPE</th>
				<th>PRICE</th>
				<th>BRAND</th>
				<th>DESCRIPTION</th>
				<th>PHOTO1</th>
				<th>PHOTO2</th>
				<th>PHOTO3</th>
				<th>PHOTO4</th>
				<th></th>
			</tr>
		<c:forEach var="u" items="${products}">
			<tr>
				<td>${u.id}</td>
				<td>${u.name}</td>
				<td>${u.quantity}</td>
				<td>${u.type}</td>
				<td>${u.price}</td>
				<td>${u.brand}</td>
				<td>${u.description}</td> 
				<td>${u.photo1}</td> 
				<td>${u.photo2}</td> 
				<td>${u.photo3}</td>
				<td>${u.photo4}</td>
				<td>				
						<a href="editproduct.htm?id=${u.id}" class="btn btn-success" role="button">Edit</a>		
						<br><br>
						<a href="deleteproduct.htm?id=${u.id}" class="btn btn-danger" role="button">Delete</a>				
				 </td>
				
			</tr>
		</c:forEach>
		</table>
		<div class="clearfix"></div>
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


