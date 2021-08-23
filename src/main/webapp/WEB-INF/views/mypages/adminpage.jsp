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
    		
    		//관리자(0)접근권한
    		if('${sessionScope.admin}' != '0'){
    			alert('권한이없습니다.');
    			location.href='${path}/main';
    			return;
    		}
    		
    		//searchUser변경시
    		$('#searchUser').on('change', function () {
				var admin = this.value;
				//location.href='${path}/mypage/adminpage';
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
                                <li><span class="underline"><a href="${path}/mypages/adminpage" style="">AdminPage</a></span></li>
                                <li><a href="${path}/mypages/classlist">ClassList</a></li>
                                <li><a href="${path}/mypages/classadd">Class Add</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8 order-lg-2 order-1" >
                <!-- table start -->
			        <main class="h-full pb-16 overflow-y-auto">
			          <div class="container grid px-6 mx-auto" >
			            <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200" > Join Users </h2>
			            <!-- With actions -->
			            
			            <!-- card1 -->
<!--                         <form action="#">
                            <div class="class__filter__select">
                                <select id="searchUser">
                                    <option value="all">All</option>
                                    <option value="0">Admin</option>
                                    <option value="1">Teacher</option>
                                    <option value="2">User</option>
                                </select>
                            </div>
                        </form> -->
              			
			            <div class="w-full overflow-hidden rounded-lg shadow-xs">
			              <div class="w-full overflow-x-auto">
			                <table class="w-full whitespace-no-wrap">
			                  <thead>
			                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
			                      <th class="px-4 py-3">UserID</th>
			                      <th class="px-4 py-3">Admin</th>
			                      <th class="px-4 py-3">Auth&Join</th>
			                      <th class="px-4 py-3">RegDate</th>
			                      <th class="px-4 py-3">Actions</th>
			                    </tr>
			                  </thead>
			                  
			                  <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800" >
			                  <c:forEach var="resultList" items="${resultList}">
			                   <!-- 행시작 -->
			                    <tr class="text-gray-700 dark:text-gray-400">
			                      <!-- UserID -->
			                      <td class="px-4 py-3">
			                        <div class="flex items-center text-sm">
			                          <!-- Avatar with inset shadow -->
			                          <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block" >
			                            <img class="object-cover w-full h-full rounded-full"
			                              src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
			                              alt="" loading="lazy" />
			                            <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true" ></div>
			                          </div>
			                          <div>
			                          	<c:choose>
			                          		<c:when test="${fn:length(resultList.userid) > 10}">
			                          			<p class="font-semibold">${fn:substring(resultList.userid,0,9)}...</p>
			                          		</c:when>
			                          		<c:otherwise>
			                          			<p class="font-semibold">${resultList.userid}</p>
			                          		</c:otherwise>
			                          	</c:choose>
			                            <p class="text-xs text-gray-600 dark:text-gray-400">${resultList.email}</p>
			                          </div>
			                        </div>
			                      </td>
			                      <!-- Admin -->
			                      <td class="px-4 py-3 text-xs">
			                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
			                          ${resultList.admin eq '0'? '관리자': resultList.admin eq '1'? '강사' : '회원'}
			                        </span>
			                      </td>
			                      <!-- EmailAuth&SimpleJoin -->
			                      <td class="px-4 py-3">
			                        <div class="flex items-center text-sm">
			                          <div>
			                            <p class="text-xs text-gray-600 dark:text-gray-400">${resultList.emailauth eq '0'? '메일 미인증':'메일 인증'}</p>
			                            <p class="text-xs text-gray-600 dark:text-gray-400">${resultList.simplejoin eq '0'? '일반가입':'네이버가입'}</p>
			                          </div>
			                        </div>
			                      </td>
			                      <!-- Regdate -->
			                      <td class="px-4 py-3 text-sm">${resultList.regdate}</td>
			                      <!-- Actions -->
			                      <td class="px-4 py-3">
			                        <div class="flex items-center space-x-4 text-sm">
			                         <p class="text-xs text-gray-600 dark:text-gray-400">
				                         <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
					                      aria-label="Edit" type="button" onclick="location.href='${path}/mypages/adminmodify?userid=${resultList.userid}'">
					                      <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" >
				                          <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"></path>
					                      </svg>
				                         </button>
			                         </p>
			                        </div>
			                      </td>
			                    </tr>
			                    </c:forEach>
			                    <!-- 행종료 -->
			                  </tbody>
			                </table>
			                
			              </div>
			              
			            <!-- paging start-->
 			          	<div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
			                <span class="col-span-2"></span>
			                <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
			                  <nav aria-label="Table navigation">
			                    <ul class="inline-flex items-center">
			                    
			                      <li> 
			                      	<button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple" aria-label="Previous" >
			                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20" >
			                            <path d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
			                              clip-rule="evenodd" fill-rule="evenodd" ></path>
			                          </svg>
			                        </button>
			                      </li>
			                      
			                      <li>
			                        <button class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple">
			                          1 </button>
			                      </li>
			                      
			                      <li> <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"  value=""> 2 </button> </li>
								  <li> <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"  value=""> 3 </button> </li>
			                      <li> <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"  value=""> 4 </button> </li>
			                      
			                      <li>
			                        <button class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
			                          aria-label="Next" >
			                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20" >
			                            <path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
			                              clip-rule="evenodd" fill-rule="evenodd" ></path>
			                          </svg>
			                        </button>
			                      </li>
			                      
			                    </ul>
			                  </nav>
			                </span>
			              </div>
			              <!-- paging end-->
			              
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