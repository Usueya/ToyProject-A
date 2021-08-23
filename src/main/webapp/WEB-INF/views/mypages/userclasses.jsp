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
    		
    		//관리자계정으로 접속 불가
    		if('${sessionScope.admin}' == '0'){
    			alert('일반계정으로 접속가능합니다.');
    			location.href='${path}/main';
    			return;
    		}
    		
    		//로그인여부확인
    		if('${sessionScope.userid}' == ''){
    			alert('로그인후 이용가능합니다.');
    			location.href='${path}/main';
    			return;
    		}
    		
    		//메세지 얼럿
    		if('${param.msg}' != ''){
    			alert('${param.msg}');
    		}
    		
    		
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
		                         <li><span class="underline"><a href="${path}/mypages/userclasses">MyClasses</a></span></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-lg-8 order-lg-2 order-1">
                <!-- table start -->
			        <main class="h-full pb-16 overflow-y-auto">
			          <div class="container grid px-6 mx-auto">
			            <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200" > My Classes</h2>
			            <!-- With actions -->
			            <div class="w-full overflow-hidden rounded-lg shadow-xs">
			              <div class="w-full overflow-x-auto">
			                <table class="w-full whitespace-no-wrap">
			                  <thead>
			                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
			                      <th class="px-4 py-3">Class&Teacher</th>
			                      <th class="px-4 py-3">Class Date</th>
			                      <th class="px-4 py-3">Class Time</th>
			                      <th class="px-4 py-3">Class Price</th>
			                      <th class="px-4 py-3">Review</th>
			                    </tr>
			                  </thead>
			                  
			                  <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800" >
			                  
 				                  <c:forEach var="list" items="${userSales}">
 				                  
				                    <tr class="text-gray-700 dark:text-gray-400">
				                      <td class="px-4 py-3">
				                        <div class="flex items-center text-sm">
				                          <!-- Avatar with inset shadow -->
				                          <div>
				                            <p class="font-semibold">
				                            	<a href="${path}/sales/modify?salenum=${list.salenum}">${list.clsname }</a>
			                            	</p>
				                            <p class="text-xs text-gray-600 dark:text-gray-400"> ${list.name } </p>
				                          </div>
				                        </div>
				                      </td>
				                      
				                     <td class="px-4 py-3 text-sm">${list.clsdate }</td>
				                      
				                      <td class="px-4 py-3 text-xs">
				                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
				                          ${list.clstime eq '1'? 'AM':'PM' }
				                        </span>
				                      </td>
				                      
				                      <td class="px-4 py-3 text-sm"> ${list.amount }</td>
									
				                      <td class="px-4 py-3">
				                        <div class="flex items-center space-x-4 text-sm">
				                        
				                          <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
				                            aria-label="Edit"  type="button" onclick="location.href='${path}/mypages/userreview?salenum=${list.salenum}'" >
				                            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" >
				                              <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"
				                              ></path>
				                            </svg>
				                          </button>
				                          
				                        </div>
				                      </td>
				                      
				                    </tr>
				                   </c:forEach>
			                  </tbody>
			                </table>
			              </div>
			              
			            </div>
			          </div>
			        </main> 
                    <!-- table end -->
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