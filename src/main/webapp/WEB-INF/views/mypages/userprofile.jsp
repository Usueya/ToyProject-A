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
    		
    		//emailAuth_Unverified 상태 클릭시
    		$('#emailAuth').on('click', function () {
				var userid = $('#userid').val();
				var email = $('#email').val();
				var sendcfn = confirm('인증메일을 발송하시겠습니까?');
				
				if(sendcfn){
					$.ajax({
						url:'${path}/member/emailAuth',
						type:'get',
						data:{userid,email},
						dataType:'text',
						success : function(data){
							console.log(data);
							//location.href = 'https://mail.google.com/'; //페이지이동
							window.open('https://mail.google.com/','_blank'); //새창 띄우기
						},
						error:function(err){
							console.log(err);
							alert('실패');
						}
					});
				}

			});
    		
    		//Modify버튼클릭시
    		$('#btnProfileModify').on('click', function (e) {
    			e.preventDefault();
				location.href = '${path}/member/modify';
			});
    		
    		//Delete버튼클릭시
    		$('#btnProfileDelete').on('click', function (e) {
    			e.preventDefault();
    			var cfn = confirm("Do you want to close your account?");
    			if(cfn){
    				location.href = '${path}/member/delete?userid=${resultUser.userid}';
    			}
			});
			
    		//메세지얼럿
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
		                         <li><span class="underline"><a href="${path}/mypages/userprofile">Profile</a></span></li>
		                         <li><a href="${path}/mypages/userclasses">MyClasses</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8 order-lg-2 order-1">
                <!-- table start -->
		        <!-- Add form start -->
		        <main class="h-full pb-16 overflow-y-auto">
		          <div class="container px-6 mx-auto grid">
		            <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200" > Profile </h2>
		            
		            <c:if test="${sessionScope.admin eq '2'}">
						<span class="text-gray-700 dark:text-gray-400" style="text-align: right;">Level: User</span>
                     </c:if>
                     <c:if test="${sessionScope.admin eq '1'}">
						<span class="text-gray-700 dark:text-gray-400" style="text-align: right;">Level: Teacher</span>
                     </c:if>
		            <span class="text-gray-700 dark:text-gray-400" style="text-align: right;">Registration date: ${resultUser.regdate}</span>
		            <!-- General elements -->
		            <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800" >
		            
		            <!-- profile img -->
		              <label class="block mt-4 text-sm">
		                <span class="text-gray-700 dark:text-gray-400">Profile Image</span><br>
		                <img alt="" src="${path}/uploadImg/${resultUser.filename }" width="200px;">
		                <!-- 등록된 파일이 있는 경우 파일명 보이기 -->
		                <c:if test="${resultUser.filename ne null}">
   		                	<input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  	type="text" name="oldfiles" id="oldfiles" value="${resultUser.filename }" readonly="readonly"/>
	                  	</c:if>
		              </label>
		            <!-- id -->
		              <label class="block text-sm">
		                <span class="text-gray-700 dark:text-gray-400">User ID</span>
		                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  name="userid" id="userid" value="${resultUser.userid}" readonly="readonly"/>
		              </label>
					<!-- name -->
		              <label class="block text-sm">
		                <span class="text-gray-700 dark:text-gray-400">User Name</span>
		                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  name="name" id="name" value="${resultUser.name}" readonly="readonly"/>
		              </label>
		              <!-- email -->
		              <label class="block text-sm">
		                <span class="text-gray-700 dark:text-gray-400">User Email</span>
		                <c:if test="${resultUser.emailauth eq '0' }">
		                	<span class="text-gray-700 dark:text-gray-400" style="color: red; font-size: 5">
		                		<a id="emailAuth"  onclick="emailAuth()">Unverified</a>
	                		</span>
		                </c:if>
		                <c:if test="${resultUser.emailauth eq '1' }">
		                	<span class="text-gray-700 dark:text-gray-400" style="color: blue; font-size: 5">
		                		Verified
	                		</span>
		                </c:if>
		                
		                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  name="email" id="email" value="${resultUser.email}" readonly="readonly"/>
		              </label>
		              <!-- addr -->
		              <label class="block text-sm">
		                <span class="text-gray-700 dark:text-gray-400"></span><br>
		                Zip code<input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  name="zip" id="zip" value="${resultUser.zip}" readonly="readonly"/>
		                Address<input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  name="addr1" id="addr1" value="${resultUser.addr1}" readonly="readonly"/>
		                Address detail<input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                  name="addr2" id="addr2" value="${resultUser.addr2}" readonly="readonly"/>
		              </label>
		              
		              <div class="flex mt-6 text-sm" align="left">
			              <div>
			                <button class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
			                type="button" id="btnProfileModify">Modify</button>
			              </div>
			              <div>
			                <button class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
			                type="button" id="btnProfileDelete">Delete</button>
			              </div>
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