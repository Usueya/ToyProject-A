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
	
	var state = '${resultClass.state}';
	
	//아이콘(fontawesome)
	let like = '<i class="far fa-thumbs-up"></i>';
	let likeNo = '<i class="fas fa-thumbs-up"></i>';
	
	function stateChange() {
		if(state == '0'){
			$('#btnLike').html(like);
		}else if(state == '1'){
			$('#btnLike').html(likeNo);
		}else if(state == '2'){
			$('#btnLike').html(like);
			$('#btnDisLike').html(dislikeNo);
		}
	}
	
	$(function () {
		
		//로그인여부확인
		if('${sessionScope.userid}' == ''){
			alert('로그인후 이용가능합니다.');
			location.href='${path}/main';
			return;
		}
		
		//좋아요 버튼 클릭
		$('#btnLike').on('click', function () {
			if(state == '0'){ //조회상태(0)일때
				//좋아요처리
				var clsnum = '${resultClass.clsnum}';
				//비동기방식(AJAX)으로 서버로 전달
				$.ajax({
					url: '${path}/class/like/'+clsnum ,
					type: 'get',
					dataType: 'text',
					success : function(data) {
						state = '1'; //좋아요로바꾸기
						stateChange();
						$('#likeCnt').text($('#likeCnt').text() + 1); 
					},
					error: function(err) {
						console.log(err);
						alert('실패');
					}
				});
			}else if(state == '1'){ //좋아요상태(1)일때
				//좋아요취소
				var clsnum = '${resultClass.clsnum}';
				$.ajax({
					url: '${path}/class/likeCancel/'+clsnum ,
					type: 'get',
					dataType: 'text',
					success : function(data) {
						state = '0';
						stateChange();
						$('#likeCnt').text(parseInt($('#likeCnt').text()) - 1); 
					},
					error: function(err) {
						console.log(err);
						alert('실패');
					}
				});
			}else if(state == '2'){ //싫어요상태(2)일때
				alert('싫어요를 취소 후 다시 시도해주세요!');
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
                            <a href="${path}/class/sales?clsnum=${resultClass.clsnum}" class="sidebar-btn" style="margin-top: 20">JOIN NOW</a>
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
                        
<!--                         <div class="classes__sidebar__item">
                            <h4>Review & Comment</h4>
                            <div class="classes__sidebar__comment__list">
                            
                                <div class="classes__sidebar__comment">
                                    <div class="classes__sidebar__comment__pic">
                                        <img src="img/classes-details/comment-1.png" alt="">
                                        <div class="classes__sidebar__comment__rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </div>
                                    </div>
                                    <div class="classes__sidebar__comment__text">
                                        <span>04 Mar 2018</span>
                                        <h6>Brandon Kelley</h6>
                                        <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                            adipisci velit,</p>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        
                    </div>
                </div>
                <div class="col-lg-8">
                
                    <div class="classes__details">
                        <div class="classes__details__large">
                            <img src="${path}/uploadImg/${resultClass.filename }" alt="" style="width: 700">
                            <span>
                            	<button id="btnLike">
                            		<i class="far fa-thumbs-up"></i> 
                            		<i id="likeCnt" >${resultClass.likecnt}</i>
                            	</button>
                           	</span>
                        </div>
                        <ul class="classes__details__widget">
                            <li><span class="icon_calendar"></span>${resultClass.clsdate }</li>
                            <li><span class="icon_clock_alt"></span>${resultClass.clstime eq '1'? 'AM 10:00':'PM 09:00' }</li>
                        </ul>
                        <h2>${resultClass.clsname }</h2>
                    </div>
                    <br>
                    <h4>Review & Comment</h4>
                    
                    <!-- Comment 1 -->
                    <br>
                    <c:forEach var="list" items="${reviewList }">
	                   	<div class="blog__details__author">
							<div class="blog__details__author__pic">
								<img src="${path}/resources/img/blog/details/blog-posted.png" alt="">
							</div>
							<div class="blog__details__author__text">
								<h4>${list.USERID }</h4>
								<p>${list.CONTENT }</p>
							</div>
						</div>
					</c:forEach>
					<!-- Comment 1 end-->
					
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