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
			var userid = '${sessionScope.userid}';
			
			//클래스명을 클릭했을 때
			$('.classDetail').on('click', function (e) {
				e.preventDefault();
				var link = $(this).attr('href');
				if(userid == ''){
					alert('로그인후 이용가능합니다.');
					return;
				}else{
					location.href=link;
				}
			});
			
			//JOIN NOW 클릭했을 때
			$('.class-btn').on('click', function (e) {
				e.preventDefault();
				var link = $(this).attr('href');
				if(userid == ''){
					alert('로그인후 이용가능합니다.');
					return;
				}else{
					location.href=link;
				}
			});
			
			//페이지이동
			$('.aList').on('click', function (e) {
				e.preventDefault();
				//내자신의 href속성의 값을 가져오기
				var curPage = $(this).attr('href');
				//alert(curPage);
				location.href='${path}/class/main?curPage='+curPage;
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
                        <h2>Our Classes</h2>
                        <div class="breadcrumb__widget">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- Classes Section Begin -->
    <section class="classes spad">
        <div class="container">
        
<!--        <div class="classes__filter">
                <div class="row">
                     <div class="col-lg-12">
                        <form action="#">
                            <div class="class__filter__select">
                                <p>Filter By Day:</p>
                                <select>
                                    <option>All</option>
                                    <option>Option 1</option>
                                    <option>Option 2</option>
                                    <option>Option 3</option>
                                </select>
                            </div>
                            <div class="class__filter__select">
                                <p>Level:</p>
                                <select>
                                    <option>All Levels</option>
                                    <option>Option 1</option>
                                    <option>Option 2</option>
                                    <option>Option 3</option>
                                </select>
                            </div>
                            <div class="class__filter__select">
                                <p>Teacher:</p>
                                <select>
                                    <option>All Teachers</option>
                                    <option>Option 1</option>
                                    <option>Option 2</option>
                                    <option>Option 3</option>
                                </select>
                            </div>
                            <div class="class__filter__select">
                                <p>Style:</p>
                                <select>
                                    <option>All Styles</option>
                                    <option>Option 1</option>
                                    <option>Option 2</option>
                                    <option>Option 3</option>
                                </select>
                            </div>
                            <div class="class__filter__btn">
                                <button><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div> 
            </div> -->
            
            <div class="row">
            	<!-- class -->
            	<c:forEach var="list" items="${resultList}">
	                <div class="col-lg-4 col-md-6">
	                    <div class="classes__item classes__item__page">
	                        <div class="classes__item__pic set-bg" data-setbg="${path}/uploadImg/${list.filename }">
	                            <span><i class="far fa-heart"></i>&nbsp ${list.likecnt }</span>
	                        </div>
	                        <div class="classes__item__text">
	                            <ul>
	                                <li><span class="icon_calendar"></span>${list.clsdate }</li>
	                                <li><span class="icon_clock_alt"></span>${list.clstime eq '1'? 'AM 10:00':'PM 09:00' }</li>
	                                <li><i class="far fa-comments"></i>${list.reviewcnt}</li>
	                            </ul>
	                            <h4><a href="${path}/class/classdetail?clsnum=${list.clsnum}" class="classDetail" >${list.clsname }</a></h4>
	                            <h6>${list.name }<span>- Yoga Teacher</span></h6>
	                            <a href="${path}/class/sales?clsnum=${list.clsnum}" class="class-btn">JOIN NOW</a>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
                
                <!-- paging -->
                
                <div class="col-lg-12">
                    <div class="classes__pagination">
                    
                    	<c:if test="${page.startPage ne 1}">
							<a href="${page.startPage-1}" class="aList"><span class="arrow_carrot-left"></span></a>
						</c:if>
						
						<c:forEach var="num" begin="${page.startPage}"  end="${page.endPage}">
							<!-- 현재페이지 -->
							<c:if test="${page.curPage==num}">
								<span class="underline">
									<a href="${num}" class="aList" id="aCurPage" style="background-color: #5768AD; color: white;">
										${num}
									</a>
								</span>
							</c:if>
							<!-- 다른페이지 -->
							<c:if test="${page.curPage!=num}">
								<a href="${num}" class="aList" >${num}</a>
							</c:if>
						</c:forEach>
                        
                        <c:if test="${page.endPage < page.totPage}">
                        	<a href="${page.endPage+1}" class="aList"><span class="arrow_carrot-right"></span></a>
                        </c:if>
                        
                    </div>
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