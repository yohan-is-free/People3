<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
					</ul>
				</div>
				<div class="inner">
					<nav class="gnb">
						<ul>
							<li class="pc"><a href="./main.do" class="home">메인</a></li>
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
					<div class="tit_area">
						<h1 class="tit_type01">회원가입</h1>
					</div>
					<form action="${contextPath}/Register.do" method="post">
						<div class="join_area">
							<div class="join_box">
								<p class="join_form">
									<span class="label">아이디</span>
									<input type="text" id="id" name="id" class="c_input" title="아이디 입력" maxlength="20" required="required" placeholder="아이디">
								</p>
								<p class="join_form">
									<span class="label">비밀번호</span>
									<input type="password" id="password1" name="password" class="c_input" title="비밀번호 입력" maxlength="20"  minlength="8" required="required" placeholder="비밀번호">
								</p>
								<p class="join_form">
									<span class="label">비밀번호 확인</span>
									<input type="password" id="password2" name="password2" class="c_input" title="비밀번호 입력" placeholder="비밀번호 확인">
								</p>
								<p class="join_form">
									<span class="label">닉네임</span>
									<input type="text" id="nick" name="nick" class="c_input" title="닉네임 입력" required="required" placeholder="닉네임">
								</p>
								<p class="join_form">
									<span class="label">전화번호</span>
									<input type="text" id="tel" name="tel" class="c_input" title="전화번호 입력" required="required" placeholder="전화번호">
								</p>
								<div class="join_form" style = "text-align:center;">
									<button href="#none" class="btn_base on">회원 가입</button>
								</div>
								
								
							</div>
						</div>
					</form>
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
			
			$('#id').on('focusout',function(){
				 let id = $('#id').val()
				$.ajax({
					type : "get",
					url : "idcheck.do",
					data : {"id": id},
					dataType : "json",
					success : idcheck,
					error : function () { alert("error");}
					
					
					
					
				})
			} )
			
			function idcheck(data) { // data =[{},{},{},{},,,,]
  				if (data.length==0) {
					alert("사용할 수 있는 아이디 입니다.");
				}else {
					alert("사용할 수 없는 아이디 입니다.");
					$('#id').val("");
				}
			
			}
			
			$('#password2').on('focusout',function(){
				 let password2 = $('#password2').val()
				 let password1 = $('#password1').val()
				 
				 if (password2==password1) {
					 
				}else {
					alert("비밀번호가 일치하지 않습니다.");
				
				}
				 
			})
		</script>
	</body>
</html>