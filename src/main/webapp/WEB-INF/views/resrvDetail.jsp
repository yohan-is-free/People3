<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = 'c' uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>Tennis_Reservation</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="resources/css/common.css">
		<script type="text/javascript" src = "resources/js/jquery.min.js"></script>
		<script type="text/javascript" src = "resources/js/moment.js"></script>
		<script type="text/javascript" src = "//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<link href='resources/fullcalendar/lib/main.css' rel='stylesheet' />
		<style>
			#calendar {
				padding-top :20px;
			}
			
			#calendar+div {
				padding : 20px 0;
			}
			
			form > div {
				padding : 5px 0;
			}
			
			form > .btn_resrv_area {
				text-align : right;
			}
		</style>
	    <script src='resources/fullcalendar/lib/main.js'></script>
	    <script>
	
	      document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
		        height: '700px',
		        expandRows: true,
		        initialView: 'dayGridMonth',
		        dateClick: (date) => {
		        	let currDate = moment().format('YYYY-MM-DD');
		        	if (currDate < date.dateStr) {
		        		calendar.removeAllEvents();
		        		calendar.addEvent({title:"Selected", start:date.dateStr});
		        		$('.slct_resrv_c_date').val(date.dateStr);
		        		$('.slct_resrv_l_date').val(date.dateStr);
		        		$('.slct_resrv_c_court').val("코트");
						$('.slct_resrv_c_time').empty().append("<option>시간</option>");
						$('.slct_resrv_l_coach').val(0);
						$('.slct_resrv_l_court').val("코트");
						$('.slct_resrv_l_time').empty().append("<option>시간</option>");
		        	} else {
		        		Swal.fire({
		        			text : "선택하신 날은 예약이 불가능합니다.",
		        			icon : "warning"
		        		}).then(() => {console.log("Sorry....")});
		        	}
		        }
	        });
	        calendar.render();
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
						<li><a href="./login.do">로그인</a></li>
						<li><a href="./join.do">회원가입</a></li>
					</ul>
				</div>
				<div class="inner">
					<nav class="gnb">
						<ul>
							<li class="pc"><a href = "./" class="home">메인</a></li>
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
				
				<div style = "width : 75%; margin: auto; padding-top : 40px; padding-bottom : 0px;">
					<h4 style = "padding-bottom : 10px;">${GJTInfo.courtName}</h4>
					<div class="tab">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item nav-resrv-court" role="presentation">
								<button class="nav-link a active w-100 btn" href="#userinfo"
									id="userinfo-tab" data-bs-toggle="tab" type="button" role="tab"
									aria-controls="userinfo" aria-selected="true">테니스 코트 예약</button>
							</li>
							<li class="nav-item nav-resrv-lesson" role="presentation">
								<button class="nav-link a w-100 btn" id="myreview-tab"
									data-bs-toggle="tab" data-bs-target="#myreview" type="button"
									role="tab" aria-controls="myreview" aria-selected="false">레슨 예약</button>
							</li>
						</ul>
					</div>
					
					<div id = 'calendar'>
					</div>
					
					
					<!-- 탭 -->
					<div class="tab-content" id="myTabContent">
						<!-- 테니스 코트 예약 -->
						<div class="tab-pane fade show active" id="userinfo" role="tabpanel" aria-labelledby="userinfo-tab">
							<form action = "./courtResrv.do" method = 'post'>
								<input class = 'hidden slct_resrv_c_date' type = 'text' name = 'revDate'/>
								
								<div class="input-group flex-nowrap">
									<span class="input-group-text" id="addon-wrapping">코트 선텍</span>
									<select class = "form-control form-select slct_resrv_c_court" name = "courtCode">
										<option>코트</option>
										<c:forEach var = 'court' items = "${courts}">
											<option>${court.courtCode}</option>
										</c:forEach>
									</select>
								</div>
								<div class="input-group flex-nowrap">
									<span class="input-group-text" id="addon-wrapping">시간 선택</span>
									<select class = "form-control form-select slct_resrv_c_time" name = "revTime">
										<option>시간</option>
									</select>
								</div>
								
								<div class = "btn_resrv_area">
									<button class = 'btn btn-primary' type = 'submit'>예약 신청</button>
								</div>
							</form>
						</div>
				
						<!-- 레슨 예약 -->
						<div class="tab-pane fade" id="myreview" role="tabpanel" aria-labelledby="myreview-tab">
							
							<form action = "./lessonResrv.do" method = 'post'>
								<input class = 'hidden slct_resrv_l_date' type = 'text' name = 'revDate'/>
								<c:choose>
									<c:when test = '${GJTInfo.isLesson eq "가능"}'>
										<div class="input-group flex-nowrap">
											<span class="input-group-text" id="addon-wrapping">코치 선텍</span>
											<select class = "form-control form-select slct_resrv_l_coach" name ="coachNo">
												<option value = 0>코치</option>
												<c:forEach var = 'coach' items = '${coachs}'>
													<option value = ${coach.coachNo}>${coach.coachName} (Tel. ${coach.coachTel})</option>
												</c:forEach>
											</select>
										</div>
										
										<div class="input-group flex-nowrap">
											<span class="input-group-text" id="addon-wrapping">코트 선텍</span>
											<select class = "form-control form-select slct_resrv_l_court" name = "courtCode">
												<option>코트</option>
												<c:forEach var = 'court' items = "${courts}">
													<option>${court.courtCode}</option>
												</c:forEach>
											</select>
										</div>
										
										<div class="input-group flex-nowrap">
											<span class="input-group-text" id="addon-wrapping">시간 선택</span>
											<select class = "form-control form-select slct_resrv_l_time" name = "revTime">
												<option>시간</option>
											</select>
										</div>
										
										<div class = "btn_resrv_area">
											<button class = 'btn btn-primary' type = 'submit'>예약 신청</button>
										</div>
									</c:when>
									<c:otherwise>
									</c:otherwise>									
								</c:choose>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer"">
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
			
			$('.slct_resrv_c_court').on('change',(e) => {
				let revdate = $('.slct_resrv_c_date').val();
				let revcourt = $('.slct_resrv_c_court').val();
				if(revcourt !== "코트") {
					if(revdate === '') {
						Swal.fire({
							text : "날짜를 선택해 주세요!!!",
							icon : "warning"
						}).then(() => {
								$('.slct_resrv_c_court').val("코트");
								$('.slct_resrv_c_time').empty().append("<option>시간</option>")
							})
					} else {
						$.ajax({
							url : "./court/timesearch.do",
							type : "post",
							data : {"revdate": revdate, "revcourt" : revcourt},
							dataType : 'json',
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(result) {
								$('.slct_resrv_c_time').empty().append("<option>시간</option>");
								for (let i = 0; i < result["length"]; i++) {
									$('.slct_resrv_c_time').append("<option>"+result[i]+"</option>")
								}
							},
							error : function(e) {
								console.log(e);
							}
						});
					}
				}
			})
			
		</script>
		
		<c:choose>
			<c:when test = '${GJTInfo.isLesson eq "가능"}'>
				<script>
					$('.slct_resrv_l_coach').on('change',() => {
						if($('.slct_resrv_l_coach').val() !== 0) {
							if($('.slct_resrv_l_date').val() === "") {
								Swal.fire({
									text : "날짜를 선택해 주세요!!!",
									icon : "warning"
								}).then(() => {
										$('.slct_resrv_l_coach').val(0);
										$('.slct_resrv_l_time').empty().append("<option>시간</option>")
								})
							}
						}
					})
					
					$('.slct_resrv_l_court').on('change',() => {
						let revdate = $('.slct_resrv_l_date').val()
						let revcoach = $('.slct_resrv_l_coach').val()
						let revcourt = $('.slct_resrv_l_court').val()
						if (revcoach === "0" || revdate === "") {
							Swal.fire({
								text : "날짜와 코치 정보를 확인해 주세요!!!",
								icon : "warning"
							}).then(() => {
									$('.slct_resrv_l_court').val("코트");
									$('.slct_resrv_l_time').empty().append("<option>시간</option>")
							})
						} else {
							$.ajax({
								url : "./lesson/timesearch.do",
								type : "post",
								data : {"revdate": revdate, "revcourt" : revcourt, "revcoach": revcoach},
								dataType : 'json',
								contentType: "application/x-www-form-urlencoded; charset=UTF-8",
								success : function(result) {
									$('.slct_resrv_l_time').empty().append("<option>시간</option>");
									for (let i = 0; i < result["length"]; i++) {
										$('.slct_resrv_l_time').append("<option>"+result[i]+"</option>")
									}
								},
								error : function(e) {
									console.log(e);
								}
							});
						}
					})
				</script>
			</c:when>
			<c:otherwise>
				<script>
					$('.nav-resrv-lesson').on('click',() => {
						Swal.fire({
		        			text : "본 테니스장은 레슨 서비스를 지원하지 않습니다.",
		        			icon : "warning"
		        		}).then(() => {
		        			console.log('click');
		        			$('.nav-resrv-court > button').trigger('click');
		        		});
					})
				</script>
			</c:otherwise>									
		</c:choose>
	</body>
</html>