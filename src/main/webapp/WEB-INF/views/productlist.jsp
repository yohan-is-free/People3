<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Tennis_Reservation</title>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<style type="text/css">
.subcontent {
	margin: 40px 100px;
	text-align : center;
}

.item_cont {
	display: inline-block;
	width: 200px;
	margin : 35px;
	text-align : left;
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
					<li><a href="./login.do">로그인</a></li>
					<li><a href="./join.do">회원가입</a></li>
				</ul>
			</div>
			<div class="inner">
				<nav class="gnb">
					<ul>
						<li class="pc"><a class="home">메인</a></li>
						<li><a href="" class="cart">예약내역</a></li>
						<li><a href="" class="mypage">마이페이지</a></li>
					</ul>
				</nav>
				<a class="pc_allmenu"><span>전체메뉴</span></a>
				<div class="allmenu_area" style="display: none;">
					<h2 class="tit_type02">메뉴바로가기</h2>
					<ul class="all_menu">
						<li><a href="">예약신청</a></li>
						<li><a href="">게시판</a></li>
						<li><a href="">신청방법안내</a></li>
						<li><a href="">시설이용안내</a></li>
					</ul>
					<ul class="all_menu">
						<li><a href="./join.do">회원가입</a></li>
						<li><a href="">예약내역</a></li>
						<li><a href="">마이페이지</a></li>
						<li><a href="">공지사항</a></li>
					</ul>

					<div class="login_before">
						<a href="./login.do" class="btn_base off">로그인</a>
					</div>

					<a class="btn_close">닫기</a>
				</div>
			</div>
		</div>


		<div id="container" class="tennis_main">


			<div class="section sticky_area">
				<div class="inner">
					<ul class="sticky_menu">
						<li><a href="">예약신청</a></li>
						<li><a href="">게시판</a></li>
						<li><a href="">신청방법안내</a></li>
						<li><a href="">시설이용안내</a></li>
					</ul>
				</div>
			</div>

			<form id="listFormTennis" method="post" action="">
				<input type="hidden" name="reserveDate" id="quickReserveDate">
				<input type="hidden" name="startT" id="quickStartT"> <input
					type="hidden" name="endT" id="quickEndT">
			</form>

			<div id="content">
				<div class="subcontent">
					<div class="item_cont">
						<div class="item_photo_box">
							<!--      상품 a태그     -->
							<a href=""> <!--      제품 이미지     --> <img class='tennis_imgs'
								src="resources/images/tennis/0.jpg">

							</a>
						</div>

						<!-- //item_photo_box -->

						<div class="table">

							<div class="item_info_cont">

								<div class="item_tit_box">
									<!--      판매사이트 태그  -->
									<a> 바볼랏 테니스라켓 부스트 에어로 2020 (260g/102)/그립사이즈 2가지 </a>
								</div>
								<!-- //item_tit_box -->
								<div class="item_money_box">

									<strong class="item_price"
										style="font-size: 15px; font-weight: 600;">149,000원 </strong>
								</div>
							</div>
						</div>
					</div>
					<div class="item_cont">

						<div class="item_photo_box">
							<!--      상품 a태그     -->
							<a href=""> <!--      제품 이미지     --> <img class='tennis_imgs'
								src="resources/images/tennis/0.jpg">

							</a>
						</div>

						<!-- //item_photo_box -->

						<div class="table">

							<div class="item_info_cont">

								<div class="item_tit_box">
									<!--      판매사이트 태그  -->
									<a> 바볼랏 테니스라켓 부스트 에어로 2020 (260g/102)/그립사이즈 2가지 </a>
								</div>
								<!-- //item_tit_box -->
								<div class="item_money_box">

									<strong class="item_price"
										style="font-size: 15px; font-weight: 600;">149,000원 </strong>
								</div>
							</div>
						</div>
					</div>
					<div class="item_cont">
						<div class="item_photo_box">
							<!--      상품 a태그     -->
							<a href=""> <!--      제품 이미지     --> <img class='tennis_imgs'
								src="resources/images/tennis/0.jpg">

							</a>
						</div>

						<!-- //item_photo_box -->

						<div class="table">

							<div class="item_info_cont">

								<div class="item_tit_box">
									<!--      판매사이트 태그  -->
									<a> 바볼랏 테니스라켓 부스트 에어로 2020 (260g/102)/그립사이즈 2가지 </a>
								</div>
								<!-- //item_tit_box -->
								<div class="item_money_box">

									<strong class="item_price"
										style="font-size: 15px; font-weight: 600;">149,000원 </strong>
								</div>
							</div>
						</div>
					</div>
					<div class="item_cont">
						<div class="item_photo_box">
							<!--      상품 a태그     -->
							<a href=""> <!--      제품 이미지     --> <img class='tennis_imgs'
								src="resources/images/tennis/0.jpg">

							</a>
						</div>

						<!-- //item_photo_box -->

						<div class="table">

							<div class="item_info_cont">

								<div class="item_tit_box">
									<!--      판매사이트 태그  -->
									<a> 바볼랏 테니스라켓 부스트 에어로 2020 (260g/102)/그립사이즈 2가지 </a>
								</div>
								<!-- //item_tit_box -->
								<div class="item_money_box">

									<strong class="item_price"
										style="font-size: 15px; font-weight: 600;">149,000원 </strong>
								</div>
							</div>
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
										<li><a href="">국민체육진흥공단</a></li>
										<li><a href="">문화체육관광부</a></li>
										<li><a href="">경륜경정사업본부</a></li>
										<li><a href="">KCYCLE 경륜</a></li>
										<li><a href="">KBOAT 경정</a></li>
										<li><a href="">서울올림픽파크텔</a></li>
										<li><a href="">한국스포츠정책과학원</a></li>
										<li><a href="">서울올림픽기념관</a></li>
										<li><a href="">소마미술관</a></li>
										<li><a href="">올림픽공원</a></li>
										<li><a href="">국민체력센터</a></li>
										<li><a href="">국민권익위원회</a></li>
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