<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu">
        <div class="offcanvas__logo">
            <a href="${path}/main"><img src="${path}/resources/img/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__widget">
            <c:if test="${empty sessionScope.userid}">
                        	<a href="${path}/login" class="primary-btn">LOG IN</a>
                        </c:if>  
            <c:if test="${!empty sessionScope.userid}">
            	<ul>
					<li>${sessionScope.userid}(등급:${sessionScope.admin})</li>
				</ul>
            	<a href="${path}/logout" class="primary-btn">LOG OUT</a>
            </c:if>
        </div>
        <nav class="header__menu">
            <ul class="mobile-menu">
                <li class="active"><a href="${path}/main">Home</a></li>
                <li><a href="${path}/class/">Classes</a></li>
                <li><a href="${path}/contact">Contact</a></li>
               	<!-- 로그인된 회원에게만  MyPages 접근-->
               	<c:if test="${!empty sessionScope.userid}">
	               	<!-- 일반회원&강사 -->
	                <c:if test="${sessionScope.admin ne '0'}"> 
		                 <li><a href="${path}/mypages/userprofile">MyPages</a>
		                     <ul class="dropdown">
		                         <li><a href="${path}/mypages/userprofile">Profile</a></li>
		                         <li><a href="${path}/mypages/userclasses">MyClasses</a></li>
		                     </ul>
		                 </li>
	                </c:if>
	                <!-- 관리자 -->
	                <c:if test="${sessionScope.admin eq '0'}"> 
		                 <li><a href="${path}/mypages/adminpage">MyPages</a>
		                     <ul class="dropdown">
		                         <li><a href="${path}/mypages/adminpage">AdminPage</a></li>
		                         <li><a href="${path}/mypages/classlist">ClassList</a></li>
		                         <li><a href="${path}/mypages/classadd">ClassAdd</a></li>
		                     </ul>
		                 </li>
	                </c:if>
               	</c:if>
            </ul>
        </nav>
        <div class="offcanvas__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="header__logo">
                            <a href="${path}/main"><img src="${path}/resources/img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9">
                        <div class="header__top__widget">
				            <c:if test="${empty sessionScope.userid}">
                            	<a href="${path}/login" class="primary-btn">LOG IN</a>
                            </c:if>  
				            <c:if test="${!empty sessionScope.userid}">
				            	<ul>
									<li>${sessionScope.userid}(등급:${sessionScope.admin})</li>
								</ul>
				            	<a href="${path}/logout" class="primary-btn">LOG OUT</a>
				            </c:if>
                        </div>
                    </div>
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </div>
        <div class="header__nav">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-9">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="${path}/main">Home</a></li>
                                <li><a href="${path}/class/">Classes</a></li>
                                <li><a href="${path}/contact">Contact</a></li>
                                <!-- 로그인된 회원에게만  MyPages 접근-->
                                <c:if test="${!empty sessionScope.userid}">
                                	<!-- 일반회원&강사 -->
	                                <c:if test="${sessionScope.admin ne '0'}"> 
		                                <li><a href="${path}/mypages/userprofile">MyPages</a>
		                                    <ul class="dropdown">
						                         <li><a href="${path}/mypages/userprofile">Profile</a></li>
						                         <li><a href="${path}/mypages/userclasses">MyClasses</a></li>
		                                    </ul>
		                                </li>
	                                </c:if>
	                                <!-- 관리자 -->
	                                <c:if test="${sessionScope.admin eq '0'}"> 
		                                <li><a href="${path}/mypages/adminpage">MyPages</a>
		                                    <ul class="dropdown">
						                         <li><a href="${path}/mypages/adminpage">AdminPage</a></li>
						                         <li><a href="${path}/mypages/classlist">ClassList</a></li>
						                         <li><a href="${path}/mypages/classadd">ClassAdd</a></li>
		                                    </ul>
		                                </li>
	                                </c:if>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <div class="header__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    
</html>