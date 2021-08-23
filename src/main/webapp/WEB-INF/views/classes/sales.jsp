<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %> 
<!DOCTYPE html>
<html>
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
			
			//참여인원cnt 입력시 결제금액amount
			$('#cnt').on('change', function () {
				var cnt = $('#cnt').val();
				var price = '${resultClass.clsprice }';
				$('#amount').val(cnt*price);
			});
			
			//유효성 확인 후 컨트롤러로 전송
			$('#btnSalesAdd').on('click', function (e) {
				e.preventDefault();
				var cnt = $('#cnt').val();
				if('${sessionScope.admin}' == '0'){
					alert('관리자 계정은 신청이 불가합니다.');
				}else if(cnt == ''){
					alert('please input number of persons');
					$('#cnt').focus();
				}else{
					$('#addForm').submit();
				}
			});
			
			
		});
	
	</script>
	
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="${path}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>Classes Detail</h2>
                        <div class="breadcrumb__widget">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->
	
	 <!-- Classes Section Begin -->
    <section class="classes-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="classes__sidebar">
                        <div class="classes__sidebar__item classes__sidebar__item--info">
                            <h4>Classes Information</h4>
                            <ul class="classes__sidebar__item__widget">
                                <li><span class="icon_calendar"></span>${resultClass.clsdate }</li>
                                <li><span class="icon_clock_alt"></span>${resultClass.clstime eq '1'? 'AM 10:00':'PM 09:00' }</li>
                                <li><span><i class="far fa-eye"></i></span>${resultClass.readcnt }</li>
                            </ul>
                            <br>
                            
                        </div>
                        
                        <div class="classes__sidebar__item">
                            <h4>About Instructor</h4>
                            <div class="classes__sidebar__instructor">
                                <div class="classes__sidebar__instructor__pic">
                                    <img src="${path}/resources/img/classes-details/classes-instructor.png" alt="">
                                </div>
                                <div class="classes__sidebar__instructor__text">
                                    <div class="classes__sidebar__instructor__title">
                                        <h4>${resultClass.name }</h4>
                                        <span>Yoga Teacher</span>
                                    </div>
                                    <div class="classes__sidebar__instructor__social">
                                        <a href="#"><span class="social_facebook"></span></a>
                                        <a href="#"><span class="social_twitter"></span></a>
                                        <a href="#"><span class="social_instagram"></span></a>
                                        <a href="#"><span class="social_linkedin"></span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8">
                
	                <form id="addForm" name="addForm" action="${path}/sales/add" method="post">
			        <!-- Add form start -->
			        <main class="h-full pb-16 overflow-y-auto">
			          <div class="container px-6 mx-auto grid">
			            <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200" > Class Join </h2>
			            <input type="hidden" name="userid" value="${sessionScope.userid}">
			            <input type="hidden" name="clsnum" value="${resultClass.clsnum }">
			            <!-- General elements -->
			            <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800" >
			            
			              <label class="block text-sm">
			                <span class="text-gray-700 dark:text-gray-400">Class Name</span>
			                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
			                  placeholder="100 Hour Yoga Course Rishikesh" name="clsname" id="clsname" value="${resultClass.name }" readonly/>
			              </label>
			              
			              <label class="block mt-4 text-sm">
			                <span class="text-gray-700 dark:text-gray-400">Number Of Persons</span>
			                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
			                  type="number" name="cnt" id="cnt" min="1" max="5" />
			              </label>
			              
			              <label class="block mt-4 text-sm">
			                <span class="text-gray-700 dark:text-gray-400">Class Total Price</span>
			                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
			                  type="number" name="amount" id="amount" readonly/>
			              </label>
			
			              <div class="flex mt-6 text-sm">
				              <div>
				                <button class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
				                type="button" id="btnSalesAdd">ADD</button>
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
    <!-- Classes Section End -->

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