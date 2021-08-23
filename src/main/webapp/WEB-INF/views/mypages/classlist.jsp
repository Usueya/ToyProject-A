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
    		
			//하이퍼링크 페이지를 클릭했을 떄
			$('.aList').on('click', function (e) {
				e.preventDefault();
				//내자신의 href속성의 값을 가져오기
				var curPage = $(this).attr('href');
				//alert(curPage);
				location.href='${path}/mypages/classlist?curPage='+curPage;
			});
    		
    		//로그인여부확인
    		if('${sessionScope.userid}' == ''){
    			alert('로그인후 이용가능합니다.');
    			location.href='${path}/main';
    			return;
    		}
    		
    		//관리자(0)접근권한
    		if('${sessionScope.admin}' != '0'){
    			alert('권한이없습니다.');
    			location.href='${path}/main';
    			return;
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
                                <li><a href="${path}/mypages/adminpage" style="">AdminPage</a></li>
                                <li><span class="underline"><a href="${path}/mypages/classlist">ClassList</a></span></li>
                                <li><a href="${path}/mypages/classadd">Class Add</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8 order-lg-2 order-1">
                <!-- table start -->
			        <main class="h-full pb-16 overflow-y-auto">
			          <div class="container grid px-6 mx-auto">
			            <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200" > Class List </h2>
			            <!-- With actions -->
			            <div class="w-full overflow-hidden rounded-lg shadow-xs">
			              <div class="w-full overflow-x-auto">
			                <table class="w-full whitespace-no-wrap">
			                  <thead>
			                    <tr
			                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
			                    >
			                      <th class="px-4 py-3">Class&Teacher</th>
			                      <th class="px-4 py-3">Price</th>
			                      <th class="px-4 py-3">Read&Like</th>
			                      <th class="px-4 py-3">Class Date</th>
			                      <th class="px-4 py-3">Actions</th>
			                    </tr>
			                  </thead>
			                  
			                  <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800" >
			                  <c:forEach var="list" items="${resultList}">
			                    <tr class="text-gray-700 dark:text-gray-400">
			                      <td class="px-4 py-3">
			                        <div class="flex items-center text-sm">
			                          <!-- Avatar with inset shadow -->
			                          <div>
			                            <p class="font-semibold">${list.clsname }</p>
			                            <p class="text-xs text-gray-600 dark:text-gray-400">${list.name }</p>
			                          </div>
			                        </div>
			                      </td>
			                      <td class="px-4 py-3 text-sm"> ${list.clsprice }</td>
			                      <td class="px-4 py-3 text-xs">
			                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
			                          ${list.readcnt }
			                        </span>
			                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
			                          ${list.likecnt }
			                        </span>
			                      </td>
			                      <td class="px-4 py-3 text-sm">${list.clsdate }</td>
			                      <td class="px-4 py-3">
			                        <div class="flex items-center space-x-4 text-sm">
			                          <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
			                            aria-label="Edit"  type="button" onclick="location.href='${path}/class/detail?clsnum=${list.clsnum}'" >
			                            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" >
			                              <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"
			                              ></path>
			                            </svg>
			                          </button>
			                          
<%-- 			                          <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
			                            aria-label="Delete" type="button" onclick="location.href='${path}/class/delete?clsnum=${list.clsnum}'" >
			                            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" >
			                              <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
			                                clip-rule="evenodd" ></path>
			                            </svg>
			                          </button> --%>
			                          
			                        </div>
			                      </td>
			                    </tr>
			                   </c:forEach> 
			                  </tbody>
			                </table>
			                
			              </div>
			              <div
			                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
			              >
			               <!--  <span class="flex items-center col-span-3"> Showing 21-30 of 100 </span> -->
			                <span class="col-span-2"></span>
			                
			                <!-- Pagination -->
			                <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
			                  <nav aria-label="Table navigation">
			                  
 			                    <ul class="inline-flex items-center">
 			                    
<!-- 			                      <li> 
			                      	<button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple" aria-label="Previous" >
			                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20" >
			                            <path d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
			                              clip-rule="evenodd" fill-rule="evenodd" ></path>
			                          </svg>
			                        </button>
			                      </li>
			                      <li> <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple" > 1 </button> </li>
			                      <li> <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple" > 2 </button> </li>
			                      <li>
			                        <button class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple">
			                          3 </button>
			                      </li>
			                      <li> <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple" > 4 </button> </li>
			                      <li>
			                        <button class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
			                          aria-label="Next" >
			                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20" >
			                            <path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
			                              clip-rule="evenodd" fill-rule="evenodd" ></path>
			                          </svg>
			                        </button>
			                      </li> -->
			                      
			                    </ul>
			                    
			                  </nav>
			                </span>
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