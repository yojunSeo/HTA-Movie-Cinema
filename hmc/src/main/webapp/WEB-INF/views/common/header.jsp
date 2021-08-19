<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="string" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>

<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/hmc/resources/css/header.css">
</head>

<header class="my-3">
	<nav id="header_section" class="header ty3">
		<h1 class="logo">
			<a href="/hmc/home">시네마</a>
		</h1>
		<div class="gnb">
		<c:choose>
			<c:when test="${empty LOGINED_USER}">
					<ul class="g_menu2" >
						<li class="gbar"><a href="/hmc/cs/home">고객센터</a></li>
						<li class="gbar"><a href="/hmc/login/">로그인</a></li>
					</ul>
					<ul class="g_menu3">
						<li class="">
							<img alt="" src="/hmc/resources/images/header/nav_side_my.png">
							<a href="/hmc/register/">회원가입</a>
						</li>
						<li class="">
							<img alt="" src="/hmc/resources/images/header/nav_side_reserve.png">
							<a href="/hmc/booking/schedule">예매</a>
						</li>
					</ul>
			</c:when>
				<c:otherwise>	<!--로그인시-->
					<ul class="g_menu2" >
						<li class="gbar"><a href="/hmc/cs/home">고객센터</a></li>
						<li class="gbar"><a href="/hmc/login/logOut">로그아웃</a></li>
					</ul>
					<ul class="g_menu3">
						<c:choose>
							<c:when test="${LOGINED_USER.adminYN eq 'Y' }">
								<li class="">
									<img alt="" src="/hmc/resources/images/header/nav_side_my.png">
									<a href="/hmc/admin/main">관리자</a>
								</li>							
							</c:when>
							<c:otherwise>
								<li class="">
									<img alt="" src="/hmc/resources/images/header/nav_side_my.png">
									<a href="/hmc/mypage/home">내정보</a>
								</li>
							</c:otherwise>
						</c:choose>
						<li class="">
							<img alt="" src="/hmc/resources/images/header/nav_side_reserve.png">
							<a href="/hmc/booking/schedule">예매</a>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="nav">
			<ul>
				<li class="dropdown">
					<a href="/hmc/booking/schedule" class="dropbtn1">예매</a>
					<div class="dropdown-content">
						<a class="as" href="/hmc/booking/schedule">예매하기</a>
				    	<a class="as" href="/hmc/booking/schedule/branch">상영시간표</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="/hmc/movie/home" class="dropbtn1">영화</a>
					<div class="dropdown-content">
						<a class="as" href="/hmc/movie/home">홈</a>
				    	<a class="as" href="/hmc/movie/now">현재상영작</a>
				    	<a class="as" href="/hmc/movie/commingsoon">상영예정작</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="/hmc/branch/" class="dropbtn2">영화관</a>
					<div class="dropdown-content">
						<a class="as" href="/hmc/branch/">영화관찾기</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="/hmc/event/home" class="dropbtn2">이벤트</a>
					<div class="dropdown-content">
						<a class="as" href="/hmc/event/home">이벤트</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="/hmc/store/" class="dropbtn2">스토어</a>
					<div class="dropdown-content">
						<a class="as" href="/hmc/store/">스토어</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</header>