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
    		
			//참여인원cnt 입력시 결제금액amount
			$('#cnt').on('change', function () {
				var cnt = $('#cnt').val();
				var price = '${resultSale.clsprice }';
				$('#amount').val(cnt*price);
			});
			
			//sale > modify 컨트롤러전송
			$('#btnSalesModify').on('click', function (e) {
				e.preventDefault();
				var cnt = $('#cnt').val();
				if(cnt == ''){
					alert('please input number of persons');
					$('#cnt').focus();
				}else{
					$('#addForm').submit();
				}
			});
			
			//sale > delete 컨트롤러전송
			$('#btnSalesDelete').on('click', function (e) {
				e.preventDefault();
				var salenum = $('#salenum').val();
				var recfm = confirm("신청한 클래스를 취소하시겠습니까?");
				if(recfm){
					location.href="${path}/sales/delete?salenum="+salenum;
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
					<form id="addForm" name="addForm" action="${path}/sales/modify" method="post">
			        <!-- Add form start -->
			        <main class="h-full pb-16 overflow-y-auto">
			          <div class="container px-6 mx-auto grid">
			            <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200" > Class Modify </h2>
			            <input type="hidden" name="userid" value="${sessionScope.userid}">
			            <input type="hidden" name="salenum" id="salenum" value="${resultSale.salenum }">
			            <!-- General elements -->
			            <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800" >
			            
			              <label class="block text-sm">
			                <span class="text-gray-700 dark:text-gray-400">Class Name</span>
			                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
			                  placeholder="100 Hour Yoga Course Rishikesh" name="clsname" id="clsname" value="${resultSale.clsname }" readonly/>
			              </label>
			              
			              <label class="block mt-4 text-sm">
			                <span class="text-gray-700 dark:text-gray-400">Number Of Persons</span>
			                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
			                  type="number" name="cnt" id="cnt" min="1" max="5" value="${resultSale.cnt }"/>
			              </label>
			              
			              <label class="block mt-4 text-sm">
			                <span class="text-gray-700 dark:text-gray-400">Class Total Price</span>
			                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
			                  type="number" name="amount" id="amount" value="${resultSale.amount }" readonly/>
			              </label>
			
			              <div class="flex mt-6 text-sm" >
				              <div>
				                <button class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
				                type="button" id="btnSalesModify">Submit</button>
				              </div>
				              <div>
				                <button class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
				                type="button" id="btnSalesDelete">Delete</button>
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