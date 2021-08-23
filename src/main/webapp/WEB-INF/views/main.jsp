<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/include.jsp" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Namaste Main</title>

	<script type="text/javascript">
	  	$(function () {
	  		//파라메터msg얼럿(가입완료)
			if('${msg}' != ''){
				alert('${msg}');
			}
			if('${param.msg}' != ''){
				alert('${param.msg}');
			}
		});
	</script>
	
</head>
<body>
	<%@ include file="./include/header.jsp" %>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__sliders owl-carousel">
        
            <div class="hero__items set-bg" data-setbg="${path}/resources/img/hero/hero-1.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="hero__text">
                                <span>Welcome to Namaste</span>
<!--                                 <h2>What hurts today makes you stronger tomorrow</h2>
                                <a href="#" class="primary-btn">DISCOVER MORE</a> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Hero Section End -->
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