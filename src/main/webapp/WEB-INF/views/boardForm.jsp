<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Tennis_Reservation</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/common.css">
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
						<br>
						<br>
						<br>
						<br>
						<br>
						<br> 셋이 왔어요 <strong class="stress">L<img
							src="resources/images/common/tennisball.png">VE
						</strong>
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
					<h1 class="tit_type01">게시판</h1>
				</div>
				<div class="container">
					<!--<h2>MVC02</h2>  -->
					<div class="panel panel-default">
						<div class="panel-heading">BOARD</div>

						<form action="boardInsert.do" method="post">
							<table class="table">
								<tr>
									<td>제목</td>
									<td><input type="text" name="title" class="form-control" /></td>
								</tr>
								
								<tr>
									<td>내용</td>
									<td> <textarea rows="7" class="form-control" name="content"></textarea></td>
								</tr>
								
								<tr>
									<td>작성자</td>
									<td><input type="text" name="id" class="form-control" value="${member.id}" readonly="readonly" /></td>
								</tr>

								<tr>
									<td colspan="2" align="center">
										<button type="submit" class="btn btn-success btn-xs">등록</button>
										<button type="reset" class="btn btn-success btn-xs">취소</button>
										<a href = "board.do" class ="btn btn-success btn-xs">목록</a>
									</td>
								</tr>
							</table>
						</form>
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