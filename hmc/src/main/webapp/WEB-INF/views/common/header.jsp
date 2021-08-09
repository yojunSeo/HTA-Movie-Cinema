<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="string" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
.header {
    position: relative;
    height: 114px;
    border-bottom: 1px solid #EEE;
    background-color: #fff;
}

.header.ty3 .logo {
    background-image: url(/hmc/resources/images/header/logo_color.png);
}

.header .logo {
    position: absolute;
    z-index: 1;
    top: 18px;
    left: 50%;
    margin-left: -109px;
    text-indent: -9999em;
    width : 219px;
    height: 37px;
    background: url(/hmc/resources/images/header/logo_color.png) no-repeat center center;
}

.header .logo a {
    display: block;
    width: 219px;
    height: 37px;
}

a, a:link, a:visited, a:active, a:hover {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.header .gnb {
    position: relative;
    width: 1280px;
    height: 70px;
    margin: 0 auto;
    border-bottom: 1px solid #B2B2B2;
}

div {
    display: block;
}

.header.ty3 .gnb .g_menu2 {
    opacity: .5;
}

.header .gnb .g_menu2 {
    float: right;
}

.header .gnb > ul {
    margin-top: 40px;
}

ul, ol {
    list-style: none;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

#nav {
    width: 980px;
    margin: 3px auto 0;
    text-align: center;
}

#nav > ul > li > a {
    display: block;
    position: relative;
    height: 40px;
    line-height: 40px;
    padding: 0 24px;
    font-size: 14px;
    letter-spacing: 0.1em;
    white-space: nowrap;
}

#nav > ul > li > div {
    position: absolute;
    z-index: 2;
    left: 0;
    right: 0;
    text-align: center;
    background-color: #F8F8F8;
}
li{
	display: inline-block;
	text-align: -webkit-match-parent;
}

.header .gnb .g_menu1 {
    float: left;
}

.header .gnb .g_menu3 {
    position: absolute;
    right: 0;
    top: 88px;
    margin-top: 0;
}

.header .gnb .g_menu3 .a{
	content: "";
    opacity: .2;
    position: absolute;
    left: 0;
    top: 50%;
    height: 9px;
    margin-top: -5px;
    border-left: 1px solid #707070;
}

.header .gnb .g_menu2 .gbar::after {
	content: "";
	padding-right: 5px;
}

.header .gnb > ul {
    margin-top: 40px;
}

#nav {
    width: 980px;
    margin: 3px auto 0;
    text-align: center;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

body, h1, h2, h3, h4, h5, h6, fieldset, ul, ol, dl, dt, dd, p, figure {
    margin: 0;
    padding: 0;
}

a, a:link, a:visited, a:active, a:hover {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

#nav > ul > li > a:before {
    content: "";
    opacity: .2;
    position: absolute;
    left: 0;
    top: 50%;
    height: 9px;
    margin-top: -5px;
    border-left: 1px solid #707070;
}


.dropbtn {
	background-color: #FFFFFF;
	color: black;
	padding: 8px;
	font-size: 16px;
	border: none;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
    z-index: 2;
    width:94px;
    text-align: center;
    white-space: nowrap;
    background-color: #F8F8F8;
}

.dropdown-content .a {
	position: relative;
	float: left;
    margin: 0 10px;
	display: inline-block;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn1 {
	border-bottom: 2px solid #FF243E;
	width: 79px;
	margin: auto;
}

.dropdown:hover .dropbtn2 {
	border-bottom: 2px solid #FF243E;
	width: 94.2px;
	margin: auto;
}

.header .gnb .g_menu1 > li > a {
    height: 14px;
    line-height: 14px;
    background-repeat: no-repeat;
    background-position: 0 center;
}

.as{
	display: block;
    height: 38px;
    line-height: 38px;
    padding-right: 1%;
    padding-left: 1%;
    font-size: 12px;
    transition-property: color;
    transition-duration: 1s;
    color: transparent;
}

</style>

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
							<a href="">예매</a>
						</li>
					</ul>
			</c:when>
				<c:otherwise>	<!--로그인시-->
					<ul class="g_menu2" >
						<li class="gbar"><a href="/hmc/cs/home">고객센터</a></li>
						<li class="gbar"><a href="/hmc/login/logOut">로그아웃</a></li>
					</ul>
					<ul class="g_menu3">
						<li class="">
							<img alt="" src="/hmc/resources/images/header/nav_side_my.png">
							<a href="/hmc/mypage/">내정보</a>
						</li>
						<li class="">
							<img alt="" src="/hmc/resources/images/header/nav_side_reserve.png">
							<a href="">예매</a>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="nav">
			<ul>
				<li class="dropdown">
					<a href="" class="dropbtn1">예매</a>
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
					<a href="/hmc/event/main" class="dropbtn2">이벤트</a>
					<div class="dropdown-content">
						<a class="as" href="/hmc/event/main">이벤트</a>
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