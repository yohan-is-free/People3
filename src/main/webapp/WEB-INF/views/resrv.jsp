<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = 'c' uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>Tennis_Reservation</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="resources/css/common.css">
		<style>
			.tennis_area.active {
				background-color : #226331;
				color : #cce1ff;
			}
			
			.tennis_area.m_over {
				background-color : #226331;
				color : #cce1ff;
			}
		</style>
		<script type="text/javascript" src = "resources/js/jquery.min.js"></script>
		<script type="text/javascript" src = "//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
						<c:choose>
							<c:when test = "${empty sessionScope.member}">
								<li><a href="./login.do">로그인</a></li>
								<li><a href="./join.do">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li><a>${sessionScope.member.nick}님</a></li>
								<li><a href="./logout.do">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
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
					<div class="allmenu_area" style = 'display:none;'>
						<h2 class="tit_type02">메뉴바로가기</h2>
						<ul class="all_menu">
							<li><a href="./resrv.do">예약신청</a></li>
							<li><a href="./boardlist.do">게시판</a></li>
							<li><a href="./productlist.do">테니스 상품 정보</a></li>
							<li><a href="./match.do">매칭</a></li>
						</ul>
						<ul class="all_menu">
							<li><a href="./join.do">회원가입</a></li>
							<li><a href="./resrvShow.do"">예약내역</a></li>
							<li><a>마이페이지</a></li>
							<li><a>공지사항</a></li>
						</ul>
						
						<c:choose>
							<c:when test = "${empty member}">
								<div class="login_before">
									<a href="./login.do" class="btn_base off">로그인</a>
								</div>
							</c:when>
						</c:choose>

						<a class="btn_close">닫기</a>
					</div>
				</div>
			</div>

			
			<div id="container" class="tennis_main">
				<div class="section visual_area">
					<div class="inner">
						<p class="txt">
							<br><br><br><br><br><br>
							<br> 셋이 왔어요 
						<strong class="stress">LOVETENNIS</strong>
						</p>
					</div>
				</div>
				
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
				

				<div id="content">
					<div style = "width : 75%; margin: auto; padding-top : 40px;">
						<h2><b>테니스장 예약</b></h2>
						<div class="container" style = 'text-align : center; margin : 20px;'>
							<div class="row" style = "width :100%;">
								<c:forEach  var="GJT" items="${GJTennisInfo}">
									<div class="col-3 tennis_area" >
						    			<p style = "padding : 7px; font-size : 15px;" data-no = ${GJT.courtNo}>${GJT.courtName}</p>
						    		</div>	
								</c:forEach>
							</div>
						</div>
					</div>
					
					<div class = "tennis_info hidden" style = "width : 75%; margin: auto; padding-top : 40px;">
						<h3><b>시설 정보</b></h3>
						<div class = 'd-flex' style = "margin : 20px;">
							<!-- 이미지 자리 -->
							<div class = 'GJT_img' style = 'max-width :440px;'>
								
							</div>
							<!-- 정보 -->
							<div style = 'width :100%;'>
								<table class = 'table table-striped' style = 'width : 100%;'>
									<tbody>
										<tr>
											<th class = 'GJT_name' colspan = '2'; style = 'text-align : center'>name</th>
										</tr>
										<tr>
											<th style = "width : 20%;">위치</th>
											<td class = 'GJT_addr' style = "width : 80%;">addr</td>
										</tr>
										<tr>
											<th>연락처</th>
											<td class = 'GJT_tel' >tel</td>
										</tr>
										<tr>
											<th>코트 수</th>
											<td class = 'GJT_court_cnt' >cnt</td>
										</tr>
										<tr>
											<th>레슨 신청</th>
											<td class = 'GJT_lsn_psbl' >lesson</td>
										</tr>
									</tbody>
								</table>
								<div style = 'text-align : right;'>
									<button class = 'btn btn-resrv btn-primary'>예약하기</button>
								</div>
							</div>
						</div>
					</div>
					
					<div class = "tennis_info hidden" style = "width : 75%; margin: auto; padding-top : 40px;">
						<h3><b>이용 시간/요금</b></h3>
						<div style = 'margin : 20px;'>
							<table class="table" style = 'text-align : center; vertical-align: middle;'>
								<thead>
									<tr class = 'bg-light'>
										<th style = "width:20%;"></th>
										<th style = "width:40%;"><b>평일</b></th>
										<th style = "width:40%;"><b>주말/공휴일</b></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class = 'bg-light'><b></b>주간<br/>06:00 - 18:00</th>
										<td><b>20,000원</b></td>
										<td><b>30,000원</b></td>
									</tr>
									<tr>
										<th class = 'bg-light'><b>야간</b><br/>18:00 - 22:00</th>
										<td><b>30,000원</b></td>
										<td><b>45,000원</b></td>
									</tr>
								</tbody>
							</table>
							<p>※ 예약은 하루 전날 까지만 가능합니다.</p>
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
									<li><a href="https://smhrd.or.kr/">스마트인재개발원</a></li>
									<li><a href="https://gj-aischool.or.kr/">광주인공지능사관학교</a></li>
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
		
			let idx = -1;
			
			$('.tennis_area').on('mouseover',(e) => {
				$(e.currentTarget).addClass('m_over');
			})
			
			$('.tennis_area').on('mouseout',(e) => {
				$(e.currentTarget).removeClass('m_over');
			})
			
			$('.tennis_area').on('click',(e) => {
				if (!$(e.currentTarget).hasClass('active')){
					$('.tennis_area').each((idx,obj) => {
						if ($(obj).hasClass('active')) {
							$(obj).removeClass('active')
						}
					});
					$(e.currentTarget).addClass('active');
					idx = $(e.currentTarget).children('p').data('no');
					$.ajax({
						url : "./tennissearch.do",
						type : "post",
						data : {"courtNo": idx},
						dataType : 'json',
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(result) {
							<!-- console.log(result); -->
							$('.GJT_name').text(result.courtName);
							$('.GJT_addr').text(result.courtAddr);
							$('.GJT_tel').text(result.courtTel);
							$('.GJT_court_cnt').text(result.courtCnt);
							$('.GJT_lsn_psbl').text(result.lesson);
							$('.GJT_img').empty().append("<img style ='padding : 0 10px;' src = 'resources/images/content/"+result.imgPath+"'>")
							if ($('.tennis_info').hasClass('hidden')) {
								$('.tennis_info').removeClass('hidden')
							}
						},
						error : function(e) {
							console.log(e);
						}
					});
				}
			})
			
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
			
			$('.btn-resrv').on('click',() => {
				if(true) {
					
					
					location.href="./resrvDetail.do?courtNo="+idx
				} else {
					Swal.fire("로그인 후에 이용가능합니다.").then(() => {location.href="./login.do"});
				}
			})
			
		</script>
	</body>
</html>