<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>Tennis_Reservation</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="resources/css/common.css">
		<script type="text/javascript" src="resources/js/jquery.min.js"></script>
		<script type="text/javascript" src = "resources/js/moment.js"></script>
		<script type="text/javascript" src = "//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<link href='resources/fullcalendar/lib/main.css' rel='stylesheet' />
		<script src='resources/fullcalendar/lib/main.js'></script>
	    <script>
			
	    	let tennis_dict = {
	    			1 : "염주전천후테니스장 ",
	    			2 : "염주실외테니스장 ",
	    			3 : "월드테니스장 ",
	    			4 : "광주테니스코트 ",
	    			5 : "진월국제테니스장 ",
	    			6 : "봉선테니스코트 ",
	    			7 : "패밀리테니스코트장 ",
	    			8 : "일곡테니스장 ",
	    			9 : "88테니스코트장 ",
	    			10 : "첨단구립테니스장 ",
	    			11 : "소촌구립테니스장 ",
	    			12 : "월곡테니스코트장 ",
	    			13 : "안청테니스장 "
	    	}
	    
		    document.addEventListener('DOMContentLoaded', function() {
			    var calendarEl = document.getElementById('calendar');
			    var calendar = new FullCalendar.Calendar(calendarEl, {
					height: '700px',
					expandRows: true,
					initialView: 'dayGridMonth',
					headerToolbar: {
							left: 'prev,next today',
							center: 'title',
							right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
						},
					eventClick : (event) => {
						Swal.fire({
							text: "예약을 취소하시겠습니까?",
							icon: "question",
							showCancelButton: true
						}).then((result) => {
							if(result.isConfirmed) {
								$.ajax({
							        contentType:'application/x-www-form-urlencoded',
							        data: {"courtCode" : event.event.title.split(" ")[1],
							        	"revDate" : moment(event.event.start).format("YYYY-MM-DD HH:mm").split(" ")[0],	
							        	"revTime" : moment(event.event.start).format("YYYY-MM-DD HH:mm").split(" ")[1]+"%"	
							        },
							        dataType:'json',
							        url:'cancelResrv.do',
							        type:'POST',
							        success:function(result){
										if(result.result) {
											Swal.fire({
												title : '예약이 취소되었습니다.',
												icon : 'success'
											}).then(() => {location.reload()})
										} else {
											Swal.fire({
												title : '다시 시도해 주십시오.',
												icon : 'info'
											})
										}
							        },
							        error:function(){
							        }
							    });
							}
						})
					}
				    });
			    calendar.render();
			    $.ajax({
			        contentType:'application/json',
			        dataType:'json',
			        url:'calendar/getall.do',
			        type:'post',
			        success:function(result){
						for (let i = 0; i < result.length; i++) {
							calendar.addEvent({
								title : tennis_dict[result[i].title.split("_")[0]] + decodeURI(result[i].title).replace('+',' '),
								start : result[i].start,
								end : result[i].end
							})
						}
			        },
			        error:function(){
			            Swal.fire({
			            	text: "데이터를 불러 오지 못했습니다.",
			            	icon : "warning",
			            }).then()
			        }
			    });
		    });
	
	    </script>
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
								<li><a>${sessionScope.member.nick} 님</a></li>
								<li><a href="./logout.do">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="inner">
					<nav class="gnb">
						<ul>
							<li class="pc"><a class="home">메인</a></li>
							<li><a href="./resrvShow.do" class="cart">예약내역</a></li>
							<li><a class="mypage">마이페이지</a></li>
						</ul>
					</nav>
					<a class="pc_allmenu"><span>전체메뉴</span></a>
					<div class="allmenu_area" style="display: none;">
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
							<br><br><br><br><br><br><br> 
							셋이 왔어요 
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
					<div style = "width : 75%; margin: auto; padding-top : 40px; padding-bottom : 0px;">
						<div id = "calendar">
						</div>
					</div>
					<div style = "width : 75%; margin: auto; padding-top : 10px; padding-bottom : 0px; text-align : right;">
						<button class = "btn btn-dark resrv-dark-btn">예약하기</button>
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
			
			$('.resrv-dark-btn').on('click',() => {
				location.href="./resrv.do"
			})
		</script>
	</body>
</html>