<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='C' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Tennis_Reservation</title>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>

<style type="text/css">
.subcontent {
	margin: 40px 100px;
	text-align: center;
}

.item_cont {
	display: inline-block;
	width: 200px;
	margin: 35px;
	text-align: left;
}

.int_pdt {
	margin: 25%;
}

.line {
	margin: 25%;
}
</style>
</head>
<body>
	<div id="skipNavi">
		<a href="#content">본문 바로가기</a>
	</div>
	<div id="wrap">
		<div id="header">
			<div class="top_area">
				<div class="logo_area">
					<strong style="font-size: 72px;">L<img
						src="resources/images/common/tennisball.png">VE
					</strong>
				</div>
				<ul class="top_menu">
					<C:choose>
						<C:when test = "${empty sessionScope.member}">
							<li><a href="./login.do">로그인</a></li>
							<li><a href="./join.do">회원가입</a></li>
						</C:when>
						<C:otherwise>
							<li><a>${sessionScope.member.nick} 님</a></li>
							<li><a href="./logout.do">로그아웃</a></li>
						</C:otherwise>
					</C:choose>
				</ul>
			</div>
			<div class="inner">
				<nav class="gnb">
					<ul>
						<li class="pc"><a href = "./" class="home">메인</a></li>
						<li><a href="./resrvShow.do" class="cart">예약내역</a></li>
						<li><a class="mypage">마이페이지</a></li>
					</ul>
				</nav>
				<a class="pc_allmenu"><span>전체메뉴</span></a>
				<div class="allmenu_area" style="display: none;">
					<h2 class="tit_type02">메뉴바로가기</h2>
					<ul class="all_menu">
						<li><a href="./resrv.do">예약신청</a></li>
						<li><a href="./board.do">게시판</a></li>
						<li><a href="./productlist.do">테니스 상품 정보</a></li>
						<li><a href="./match.do">매칭</a></li>
					</ul>
					<ul class="all_menu">
						<li><a href="./join.do">회원가입</a></li>
						<li><a href="./resrvShow.do"">예약내역</a></li>
						<li><a>마이페이지</a></li>
						<li><a>공지사항</a></li>
					</ul>

					<C:choose>
						<C:when test = "${empty member}">
							<div class="login_before">
								<a href="./login.do" class="btn_base off">로그인</a>
							</div>
						</C:when>
					</C:choose>

					<a class="btn_close">닫기</a>
				</div>
			</div>
		</div>


		<div id="container" class="tennis_main">


			<div class="section sticky_area">
				<div class="inner">
					<ul class="sticky_menu">
						<li><a href="./resrv.do">예약신청</a></li>
						<li><a href="./board.do">게시판</a></li>
						<li><a href="./productlist.do">테니스 상품 정보</a></li>
						<li><a href="./match.do">매칭</a></li>
					</ul>
				</div>
			</div>
			<br> <span class="int_pdt">상품 <strong>100</strong> 개 - 최근
				<b>한 달</b>간의 데이터가 <b>24시간</b> 간격으로 <b>자동으로 집계되어</b> 업데이트됩니다. 프로그램의 자동
				추출방식으로 어떤 <b>인위적인 개입</b>이 없습니다. 쇼핑에 도움이 되길 바랍니다.
			</span> <span class="line">__________________________________________________________________________________________________</span>

			<div id="content">
				<div class="subcontent">
					
					<C:forEach var="product" items="${list}">
						<div class="item_cont" style="vertical-align: top;">
							<div class="item_photo_box">
								<!--      상품 a태그     -->
								<a href="${product.pdtsellurl}"> <!--      제품 이미지     --> <img
									class='tennis_imgs' src="resources/images/tennis/${product.pdtimgpath}">

								</a>
							</div>

							<!-- //item_photo_box -->

							<div class="table">

								<div class="item_info_cont">

									<div class="item_tit_box">
										<!--      판매사이트 태그  -->
										<a>${product.pdtname}</a>
									</div>
									<!-- //item_tit_box -->
									<div class="item_money_box">

										<strong class="item_price"
											style="font-size: 15px; font-weight: 600;">${product.pdtprice}
										</strong>
									</div>
								</div>
							</div>
						</div>
					</C:forEach>


				</div>
			</div>

		</div>
		
		<div id="footer">
			<div class="footer_top">
				<div class="inner">
					<ul class="foot_menu">
						<li><a href=""><b style="color: #F29600;">개인정보처리방침</b></a></li>
						<li><a href=""><b>이용약관</b></a></li>
					</ul>
					<div class="family_site">
						<div class="con_site">
							<a class="tit_site">관련사이트</a>
							<ul class="list_site" style="display: none;">
								<li><a href="https://smhrd.or.kr/">스마트인재개발원</a></li>
								<li><a href="https://gj-aischool.or.kr/">광주인공지능사관학교</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<script>
		$('.pc_allmenu').on('click',(e) => {
			$('.allmenu_area')[0].style.display = 'block'
		})

		$('.allmenu_area > .btn_close').on('click',() => {
			$('.allmenu_area')[0].style.display = 'none'
		})

		$('.tit_site').on('click',(e) => {
			e.preventDefault();
			if ($('.list_site')[0].style.display === 'none') {
				$('.list_site')[0].style.display = 'block'
			} else {
				$('.list_site')[0].style.display = 'none'
			}
		})
	</script>
</body>
</html>