<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>Tennis_Reservation</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
							<li class="pc"><a href = "./" class="home">메인</a></li>
							<li><a href="" class="cart">예약내역</a></li>
							<li><a href="" class="mypage">마이페이지</a></li>
						</ul>
					</nav>
					<a class="pc_allmenu"><span>전체메뉴</span></a>
					<div class="allmenu_area" style="display: none;">
						<h2 class="tit_type02">메뉴바로가기</h2>
						<ul class="all_menu">
							<li><a>예약신청</a></li>
							<li><a href="./boardlist.do">게시판</a></li>
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
							<li><a>예약신청</a></li>
							<li><a href="./boardlist.do">게시판</a></li>
							<li><a href="">신청방법안내</a></li>
							<li><a href="">시설이용안내</a></li>
						</ul>
					</div>
				</div>
				

				<div id="content">
					<div style = "width : 75%; margin: auto; padding-top : 40px;">
						<h2><b>테니스장 예약</b></h2>
						<table class = "table table-borderless" style = 'text-align : center; margin : 20px;'>
						  <tbody>
						    <tr>
						      <td class = 'tennis_area active'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>						      
						    </tr>
						    <tr>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>						      
						    </tr>
						    <tr>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>						      
						    </tr>
						    <tr>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>
						      <td class = 'tennis_area'><b>테니스장</b></td>						      
						    </tr>
						  </tbody>
						</table>
					</div>
					
					<div style = "width : 75%; margin: auto; padding-top : 40px;">
						<h3><b>시설 정보</b></h3>
					</div>
					
					<div style = "width : 75%; margin: auto; padding-top : 40px;">
						<h3><b>이용 시간</b></h3>
						<table class="table" style = 'text-align : center; margin : 20px;'>
							<thead>
								<tr class = 'bg-light'>
									<th style = "width:20%;"></th>
									<th style = "width:40%;"><b>평일</b></th>
									<th style = "width:40%;"><b>주말/공휴일</b></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th class = 'bg-light'><b>주간</b></th>
									<td><b>09:00 - 18:00</b></td>
									<td><b>19:00 - 22:00</b></td>
								</tr>
								<tr>
									<th class = 'bg-light'><b>야간</b></th>
									<td><b>09:00 - 18:00</b></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div id="footer">
				<div class="footer_top">
					<div class="inner">
						<ul class="foot_menu">
							<li><a href=""><b style = "color : #F29600;">개인정보처리방침</b></a></li>
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
		
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
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