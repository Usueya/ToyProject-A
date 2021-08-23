<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Namaste</title>
    
    <script type="text/javascript">
    
    	$(function () {
    		
    		//로그인여부확인
    		if('${sessionScope.userid}' == ''){
    			alert('로그인후 이용가능합니다.');
    			location.href='${path}/main';
    			return;
    		}
    		
    		//유효성체크후 리뷰등록 ctrl등록
			$('#btnClassAdd').on('click', function (e) {
				e.preventDefault();
				var content = $('#content').val();
				
				if(content == ''){
					alert('Please writing your review');
					$('#content').focus();
				}else{
					$('#formAdd').submit();
				}
				
			});
		});
    
    </script>
</head>

<body>
	<%@ include file="../include/header.jsp" %>
    <!-- Blog Hero Begin -->
    <section class="breadcrumb-option blog-hero set-bg" data-setbg="${path}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__hero__text"> <h2>MyPages</h2> </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 order-lg-1 order-2">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__categories">
                            <h4>Categories</h4>
                            <ul>
		                         <li><a href="${path}/mypages/userprofile">Profile</a></li>
		                         <li><a href="${path}/mypages/userclasses">MyClasses</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8 order-lg-2 order-1">
                
                <form action="${path}/review/add" id="formAdd" method="post">
                <!-- table start -->
                
		        <!-- Add form start -->
		        <main class="h-full pb-16 overflow-y-auto">
		          <div class="container px-6 mx-auto grid">
		            <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200" > Writing Review </h2>
		            <!-- General elements -->
		            <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800" >
		            <input type="hidden" name="salenum" value="${userSales.salenum}">
		            <input type="hidden" name="userid" value="${userSales.userid}">
		            
		              <label class="block text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Class Name</span>
		                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  placeholder="100 Hour Yoga Course Rishikesh" name="clsname" id="clsname" value="${userSales.clsname}" readonly="readonly"/>
		              </label>
		              
		              <label class="block text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Class Date</span>
		                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  placeholder="2021-10-01" name="clsdate" id="clsdate" value="${userSales.clsdate}" readonly/>
		              </label>
		
 		              <label class="block mt-4 text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Message</span>
		                <textarea class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
		                  rows="3" placeholder="Enter some long form content." name="content" id="content"></textarea>
		              </label>
		
		              <div class="flex mt-6 text-sm">
			              <div>
			                <button class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
			                type="button" id="btnClassAdd">ADD</button>
			              </div>
		              </div>
		              
          			  </div>
	                </div>
	        	   </main> 
                <!-- table end -->
                </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->
    
    <%@ include file="../include/footer.jsp" %>

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