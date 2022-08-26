<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>Tennis_Reservation</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css">
		<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	</head>
	<body>
		<div id="skipNavi">
			<a href="#content">본문 바로가기</a>
		</div>
		<div id="wrap">
			<div id="header">
				<div class="top_area">
					<div class="logo_area">
						<strong style="font-size: 72px;">L<img src ="resources/images/common/tennisball.png">VE</strong>
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
							<li><a href="./resrvShow.do"" class="cart">예약내역</a></li>
							<li><a href="" class="mypage">마이페이지</a></li>
						</ul>
					</nav>
					<a class="pc_allmenu"><span>전체메뉴</span></a>
					<div class="allmenu_area" style="display: none;">
						<h2 class="tit_type02">메뉴바로가기</h2>
						<ul class="all_menu">
							<li><a href="./resrv.do">예약신청</a></li>
							<li><a href="./boardlist.do">게시판</a></li>
							<li><a href="">신청방법안내</a></li>
							<li><a href="">시설이용안내</a></li>
						</ul>
						<ul class="all_menu">
							<li><a href="./join.do">회원가입</a></li>
							<li><a href="./resrvShow.do"">예약내역</a></li>
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
				<div class="section visual_area">
					<div class="inner">
						<p class="txt">
							<br><br><br><br><br><br>
							셋이 왔어요
							<strong class="stress">L<img src ="resources/images/common/tennisball.png">VE</strong>
						</p>
					</div>
				</div>
				
				<div class="section sticky_area">
					<div class="inner">
						<ul class="sticky_menu">
							<li><a href="./resrv.do">예약신청</a></li>
							<li><a href="./boardlist.do">게시판</a></li>
							<li><a href="">신청방법안내</a></li>
							<li><a href="">시설이용안내</a></li>
						</ul>
					</div>
				</div>

				<div id="content">
					<div class="section info_area01">
						<div class="inner">
							<div class="info_con01">
								<h2 class="tit_type01">테니스장/레슨<br><strong>예약신청</strong></h2>
								<a href="./resrv.do" class="btn_app">예약신청</a>
								<span class="bg_img"><img src="resources/images/content/tennisman.png" alt=""></span>
							</div>
							<div class="info_con02">
								<h2 class="tit_type01">공지사항</h2>
								<ul class="notice">
									<li>
										<a href="">
											실외 코트 개보수 공사 알림 (22.8.22~ ) 
										</a>
									</li>
								
									<li>
										<a href="">
											테니스 대회 안내 (2022년 8월) 
										</a>
									</li>
								</ul>
								<a href="" class="con_more" title="공지사항 더보기">더보기</a>
							</div>
							<div class="info_con03">
								<h2 class="tit_type01">고객센터 안내</h2>
								<p class="txt">테니스장 <strong>02-2180-3778</strong></p>
							</div>
						</div>
					</div>

					<div class="section info_area02">
						<div class="inner">
							<div class="info_con">
								<h2 class="tit_type01">예약신청 안내</h2>
								<p class="con_txt">예약신청이 어려우신가요? <br>안내 페이지에서 자세하게 설명 드립니다.</p>
								<a href="" class="btn_info">신청방법 안내</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="footer">
				<div class="footer_top">
					<div class="inner">
						<ul class="foot_menu">
							<li><a><b style = "color : #F29600;">개인정보처리방침</b></a></li>
							<li><a><b>이용약관</b></a></li>
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