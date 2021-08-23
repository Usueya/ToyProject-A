<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Namaste</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=99gnlsqvs2"></script>
	
	<script>
	 	$(function () {
	 		
	 		var x ='${resultMap.x }' ;
	 		var y ='${resultMap.y }' ;
	 		console.log(x,y);
	
	 		var mapOptions = {
	 			    center: new naver.maps.LatLng(y, x),
	 			    zoom: 12,
	 			   zoomControl: true
			};
	 		
	 		var map = new naver.maps.Map('map', mapOptions);
	
	 		var marker = new naver.maps.Marker({
	 			//(y,x)
	 			position: new naver.maps.LatLng(y, x),
	 			map: map
	 		});
	 		
		});
	
</script>
</head>

<body>
	<%@ include file="./include/header.jsp" %>
    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="${path}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>Contact Us</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="contact__widget__item">
                        <span class="icon_phone"></span>
                        <h4>Phone</h4>
                        <p>+82-10-0000-0000</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="contact__widget__item">
                        <span class="icon_pin_alt"></span>
                        <h4>Loation</h4>
                        <p>Korea, Seoul...</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="contact__widget__item">
                        <span class="icon_clock_alt"></span>
                        <h4>Operating</h4>
                        <p>Mon - Fri: 9:00am - 17:00pm</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="contact__widget__item">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>namaste@namaste.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
    <div class="map">
		<div id="map" style="width:100%;height:500px;"></div>
    </div>
    <!-- Map End -->
    
    <%@ include file="./include/footer.jsp" %>
    
    <!-- Js Plugins -->
    <script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/js/bootstrap.min.js"></script>
    <script src="${path}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${path}/resources/js/jquery.barfiller.js"></script>
    <script src="${path}/resources/js/jquery.slicknav.js"></script>
    <script src="${path}/resources/js/owl.carousel.min.js"></script>
    <script src="${path}/resources/js/main.js"></script>
</body>
</html>