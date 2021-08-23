<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 

<!-- jquery $()-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/6bbb598aff.js" crossorigin="anonymous"></script>
<!-- Font&Css -->
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">

	<!-- Css Styles -->
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${path}/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${path}/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${path}/resources/css/barfiller.css" type="text/css">
	<link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${path}/resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${path}/resources/css/style.css" type="text/css">
	
	<!-- windmill link -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link  href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${path}/resources/assets/css/tailwind.output.css" />
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer ></script>
    <script src="${path}/resources//assets/js/init-alpine.js"></script>
