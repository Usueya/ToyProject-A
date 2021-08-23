<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>

<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Create account</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="${path}/resources/assets/css/tailwind.output.css" />
  <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer ></script>
  <script src="${path}/resources/assets/js/init-alpine.js"></script>
  
  <script type="text/javascript">
  
  	$(function () {
  		
		//아이디 중복여부 노출
		$('#userid').on('change', function () {
			var userid = $('#userid').val();
			if(userid == ''){
				alert('아이디를 입력해주세요');
				$('#userid').focus();
			}else{
				$.ajax({
					url:'${path}/member/checkId/'+userid,
					type:'get',
					dataType: 'text',
					success : function(data) {
						$('#idChk').val('y');
						$('#resultFindId').html(data);
						//alert(data);
					},
					error: function(err) {
						$('#idChk').val('n');
						console.log(err);
						alert('실패');
					}
				});
			}
		});
		
		//아이디 변경시 중복
		$('#userid').change(function() {
			$('#resultFindId').html('');
			$('#idChk').val('n');
		});
  		
  		//유효성체크후 컨트롤러로 전송
  		$('#moveCreateAccount').on('click', function (e) {
  			e.preventDefault();
  			var userid = $('#userid').val();
  			var idChk = $('#idChk').val();
  			var name = $('#name').val();
  			var email = $('#email').val();
  			var passwd = $('#passwd').val();
  			var passwdConfirm = $('#passwdConfirm').val();
  			var passwdChk = $('#passwdChk').val();
  			
  			if (idChk !='y'){
  				alert('아이디를 확인해 주세요!');
  				$('#userid').focus();
  			}else if(name ==''){
				alert('이름을 입력해주세요');
				$('#name').focus();
			}else if(email ==''){
				alert('이메일을 입력해주세요');
				$('#email').focus();
			}else if(passwd ==''){
				alert('비밀번호를 입력해주세요');
				$('#passwd').focus();
			}else if(passwd != passwdConfirm){
				alert('일치한 비밀번호를 입력해주세요');
				$('#passwdConfirm').focus();
			}else{
				$('#createAccountForm').submit();
			}
		});
		
	});	
  </script>
  
</head>
  
<body>
<form action="${path}/member/join" id="createAccountForm" method="post">
  <div class="flex items-center min-h-screen p-6 bg-gray-50 dark:bg-gray-900">
    <div class="flex-1 h-full max-w-4xl mx-auto overflow-hidden bg-white rounded-lg shadow-xl dark:bg-gray-800" >
      <div class="flex flex-col overflow-y-auto md:flex-row">
      
         <div class="h-32 md:h-auto md:w-1/2">
          <img aria-hidden="true" class="object-cover w-full h-full dark:hidden"
            src="${path}/resources/img/blog/purple-sunset-yoga.jpg" alt="" />
          <img aria-hidden="true" class="hidden object-cover w-full h-full dark:block"
            src="${path}/resources/img/blog/purple-sunset-yoga.jpg" alt=""/>
        </div>
        
        <div class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">
          <div class="w-full">
            <h1 class="mb-4 text-xl font-semibold text-gray-700 dark:text-gray-200" >Create account </h1>
            
            <label class="block text-sm">
              <span class="text-gray-700 dark:text-gray-400">ID</span>
              <!-- id중복체크출력 -->
              <span class="text-gray-700 dark:text-gray-400" id="resultFindId" style="font-size: 9; color: red;"></span>
              <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                placeholder="JaneDoe1" type="text" id="userid" name="userid"/>
              <input type="hidden"  id="idChk" value="n">
            </label>
            
             <label class="block text-sm">
              <span class="text-gray-700 dark:text-gray-400">NAME</span>
              <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                placeholder="JaneDoe" type="text" id="name" name="name"/>
            </label>
            
            <label class="block text-sm">
              <span class="text-gray-700 dark:text-gray-400">Email</span>
              <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                placeholder="JaneDoe@gmail.com" type="email" id="email" name="email"/>
            </label>
            
            <label class="block mt-4 text-sm">
              <span class="text-gray-700 dark:text-gray-400">Password</span>
              <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                placeholder="***************" type="password" id="passwd" name="passwd"/>
            </label>
            
            <label class="block mt-4 text-sm">
              <span class="text-gray-700 dark:text-gray-400"> Confirm password </span>
              <span class="text-gray-700 dark:text-gray-400" id ="Passwordmatches" style="font-size: 9; color: red;"></span>
              <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                placeholder="***************" type="password" id="passwdConfirm"/>
              <input type="hidden"  id="passwdChk" value="n">
            </label>

            <a class="block w-full px-4 py-2 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
              href="" id="moveCreateAccount"> Create account </a>

            <hr class="my-8" />

            <p class="mt-4">
              <a class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline"
                href="${path}/login" > Already have an account? Login </a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
</body>
</html>
