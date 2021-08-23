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
    		
    		//유효성체크후클래스등록ctlr보내기
			$('#btnClassAdd').on('click', function (e) {
				e.preventDefault();
				var clsname = $('#clsname').val();
				var clstime = $(':radio[name="clstime"]:checked').val();
				var teacherid = $(':radio[name="teacherid"]:checked').val();
				var clsdate = $('#clsdate').val();
				var clsprice = $('#clsprice').val();
				var files = $('#files').val();
				
				if(clsname==''){
					alert('please input class name');
					$('#clsname').focus();
				}else if(clstime ==''){
					alert('please check class time');
					$('#clstime').focus();
				}else if(teacherid ==''){
					alert('please check teacher name');
					$('#teacherid').focus();
				}else if(clsdate ==''){
					alert('please input class date');
					$('#clsdate').focus();
				}else if(files == ''){
					alert('please input 1 or more class picture');
					$('#files').focus();
				}else if(clsprice ==''){
					alert('please input class price');
					$('#clsprice').focus();
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
                                <li><a href="${path}/mypages/adminpage" style="">AdminPage</a></li>
                                <li><a href="${path}/mypages/classlist">ClassList</a></li>
                                <li><span class="underline"><a href="${path}/mypages/classadd">Class Add</a></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8 order-lg-2 order-1">
                <form action="${path}/class/add" id="formAdd" method="post" enctype="multipart/form-data">
                <!-- table start -->
		        <!-- Add form start -->
		        <main class="h-full pb-16 overflow-y-auto">
		          <div class="container px-6 mx-auto grid">
		            <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200" > Class Add </h2>
		            <!-- General elements -->
		            <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800" >
		            
		              <label class="block text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Class Name</span>
		                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  placeholder="100 Hour Yoga Course Rishikesh" name="clsname" id="clsname"/>
		              </label>
		
		              <div class="block mt-4 text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Time</span>
		                <div class="mt-2">
		                  <label class="inline-flex items-center text-gray-600 dark:text-gray-400" >
		                    <input type="radio" class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
		                      name="clstime" value="1" /> <span class="ml-2">오전</span>
		                  </label>
		                  <label class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400" >
		                    <input type="radio" class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
		                      name="clstime" value="2" /> <span class="ml-2">오후</span>
		                  </label>
		                </div>
		              </div>
		              
		              <div class="block mt-4 text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Teacher</span>
		                <div class="mt-2">
			                <c:forEach var="list" items="${teacherList}">
			                  <label class="inline-flex items-center text-gray-600 dark:text-gray-400" >
			                    <input type="radio" class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
			                      name="teacherid" value="${list.userid }" /> <span class="ml-2">${list.name }</span>
			                  </label>
			                 </c:forEach>
		                </div>
		              </div>
		              
		              <label class="block mt-4 text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Class Date</span>
		                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  type="date" name="clsdate" id="clsdate"/>
		              </label>
		              
		              <label class="block mt-4 text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Class Picture</span>
		                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  type="file" name="files" id="files"/>
		              </label>
		              
		              <label class="block mt-4 text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Class Price</span>
		                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  type="number" name="clsprice" id="clsprice"/>
		              </label>
		              
		              <label class="block mt-4 text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Class Capacity</span>
		                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  type="number" name="clsnumber" min="10" max="20" value = "10" placeholder="10"/>
		              </label>
		
<!-- 		              <label class="block mt-4 text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Message</span>
		                <textarea class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
		                  rows="3" placeholder="Enter some long form content." ></textarea>
		              </label> -->
		
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