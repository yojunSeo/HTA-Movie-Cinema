<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>테스트 페이지</title>
<style>

footer {
	position: absolute;
    width: 100%;
    margin-top: 300px;
    padding-bottom: 20px;
}
body {
    overflow-y: scroll;
    min-width: 980px;
}
body, input, button, select, textarea {
    font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
    font-size: 12px;
    color: #000;
}
body, textarea {
    line-height: 1.1;
    letter-spacing: -0.03em;
}

.sub_section{
}

.slider-1 {
    height:400px;
    position:relative;
}

.slider-1 > .page-btns {
    text-align:center;
    position:absolute;
    bottom:20px;
    left:0;
    width:100%;
}

.slider-1 > .page-btns > div {
    width:20px;
    height:20px;
    background-color:rgba(255,255,255,.5);
    border-radius:4px;
    display:inline-block;
    cursor:pointer;
}

.slider-1 > .page-btns > div.active {
    background-color:rgba(255,255,255,1);
}

/* 슬라이더 1 - 슬라이드 */

.slider-1 > .slides > div {
    position:absolute;
    top:0;
    left:0;
    right:0;
    bottom:0;
    opacity:0;
    transition: opacity 0.3s;
    background-position:center;
    background-size:cover;
    background-repeat:no-repeat;
}

.slider-1 > .slides > div.active {
    opacity:1;
}

/* 슬라이더 좌우 버튼 */
.slider-1 > .side-btns > div {
    position:absolute;
    top:0;
    left:0;
    width:25%;
    height:100%;
    cursor:pointer;
}
.slider-1 > .side-btns > div:last-child {
    left:auto;
    right:0;
}
.slider-1 >.side-btns > div > span {
    position:absolute;
    top:50%;
    left:20px;
    transform:translatey(-50%);
    background-color:black;
    opacity:0.5;
    padding:1px 13px;
    border-radius:50px;
    font-size:25px;
}
.slider-1 >.side-btns > div:last-child > span {
    left:auto;
    right:20px;
}

#contents{
	width: 980px;
	height: 500px;
    margin: 0 auto;
    padding: 50px 0 0 0;
}

.movi_current_list{
	
}

.contents_main{
	position: relative;
    z-index: 1;
    width: 100%;
}

.contents_main .main_cont_wrap {
    position: relative;
    margin-bottom: 33px;
}

.contents_main .movi_current_list {
    position: static;
    margin-top: -100px;
    margin-bottom: 70px;
}



.contents_main .movi_current_list .movi_info_txt {
    position: relative;
    right: 10px;
    top: 20px;
    float: right;
    font-size: 11px;
}
.contents_main .movi_current_list .movi_info_txt {
    width: 980px;
    margin: 0 auto;
    text-align: end;
    padding-bottom: 30px;
}

<!-- --->

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

.special_wrap2 {
    margin-bottom: 3%;
    display: flex;
    padding: 3% 1%;
}

.articleSubMain{
	width: 980px;
    margin: 0 auto;
}
.articleSubMain header{
	display: flex;
    align-items: center;
    border-bottom: 1px dashed #b2b2b2;
    padding-bottom: 10px;
}

header * {
    font-family: "Open Sans",sans-serif;
}

.articleSubMain header h3{
	background-color: inherit;
    padding: 0;
    text-align: left;
    width: auto;
    height: auto;
    font-size: 16px;
}

.articleSubMain header span{
	display: inline-block;
    margin-left: auto;
    font-size: 10px;
    background-image: url(/hmc/resources/images/home/arr_rg_6.png);
    background-repeat: no-repeat;
    background-position: 100%;
    padding-right: 10px;
}

.articleSubMain ul{
	margin-bottom: 3%;
    display: flex;
    padding: 3% 1%;
}

.articleSubMain ul .mainpage_side_special-1 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/special-1.png);
    padding-top: 3%;
}

.articleSubMain ul .mainpage_side_special-2 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/special-2.png);
    padding-top: 3%;
}

.articleSubMain ul .mainpage_side_special-3 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/special-3.png);
    padding-top: 3%;
}

.articleSubMain ul .mainpage_side_special-4 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/special-4.png);
    padding-top: 3%;
}

.articleSubMain ul .mainpage_side_special-5 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/special-5.png);
    padding-top: 3%;
}

.articleSubMain ul .mainpage_side_special-6 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/special-6.png);
    padding-top: 3%;
}

.articleSubMain ul .mainpage_side_special-7 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/special-7.png);
    padding-top: 3%;
}

.articleSubMain ul .mainpage_side_special-8 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/special-8.png);
    padding-top: 3%;
}

.articleEvent header {
    display: flex;
    align-items: center;
    padding-bottom: 10px;
    border: none;
}

.articleEvent header h3 {
    background-color: inherit;
    padding: 0;
    text-align: left;
    width: auto;
    height: auto;
    font-size: 16px;
}

.articleEvent header span{
	display: inline-block;
    margin-left: auto;
    font-size: 10px;
    background-image: url(/hmc/resources/images/home/arr_rg_6.png);
    background-repeat: no-repeat;
    background-position: 100%;
    padding-right: 10px;
}

.articleEvent ul {
    padding-bottom: 3%;
    position: relative;
    width: 980px;
    height: 540px;
}


.articleEvent ul .mainpage_side_event-1{
    position: absolute;
    top: 0;
    left: 0;
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/event-1.jpg);
    width: 182px;
    height: 250px;
}

.articleEvent ul .mainpage_side_event-2{
    position: absolute;
    top: 0;
    left: 192px;
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/event-2.jpg);
    width: 182px;
    height: 250px;
}

.articleEvent ul .mainpage_side_event-3{
    position: absolute;
    top: 0;
    left: 384px;
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/event-3.jpg);
    width: 285px;
    height: 250px;
}

.articleEvent ul .mainpage_side_event-4{
    position: absolute;
    top: 48%;
    left: 0;
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/event-4.jpg);
    width: 478px;
    height: 250px;
}

.articleEvent ul .mainpage_side_event-5{
    position: absolute;
    top: 48%;
    left: 50%;
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/event-5.jpg);
    width: 182px;
    height: 250px;
}

.articleEvent ul .mainpage_side_event-6{
    position: absolute;
    top: 0;
    right: 0;
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/event-6.jpg);
    width: 296px;
    height: 511px;
}

.articleEvent ul .mainpage_side_event-1{
    position: absolute;
    top: 0;
    left: 0;
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/event-1.jpg);
    width: 182px;
    height: 250px;
}

.articleEvent ul li {
    border-radius: 5px;
}

.articleInfo {
    width: 980px;
    margin: 0 auto;
}

.articleInfo ul {
    padding-bottom: 6%;
    display: flex;
}

.articleInfo ul .info-1 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/info-1.png);
    padding-top: 13.5%;
}

.articleInfo ul .info-2 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/info-2.png);
    padding-top: 13.5%;
}

.articleInfo ul .info-3 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/info-3.png);
    padding-top: 13.5%;
}

.articleInfo ul .info-4 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/info-4.png);
    padding-top: 13.5%;
}

.articleInfo ul .info-5 {
    background-size: contain;
    background-position: 50%;
    background-repeat: no-repeat;
    width: 100%;
    height: 0;
    background-image: url(/hmc/resources/images/home/mainpage_side/info-5.png);
    padding-top: 13.5%;
}

</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="sub_section">
	<section id="sub_section">
		<div id="visualAd" class="visual_tp visual_main">
			<div class="inner">
				<div class="slider-1">
					<div class=slides>
						<div class="active" 
							style="background-image:url(/hmc/resources/images/home/movie/Free_1920774.jpg);">
						</div>
				        <div style="background-image:url(/hmc/resources/images/home/movie/Ice_1920774.jpg);"></div>
				        <div style="background-image:url(/hmc/resources/images/home/movie/Jungle_1920774.jpg);"></div>
				        <div style="background-image:url(/hmc/resources/images/home/movie/Squad_1920774.jpg);"></div>
					</div>
					<div class="page-btns">
				        <div class="active"></div>
				        <div></div>
				        <div></div>
				        <div></div>
				    </div>
				    <div class="side-btns">
				        <div>
				            <span><img src="/hmc/resources/images/home/arr_lf_19_wht.png"></span>
				        </div>
				        <div>
				            <span><img alt="" src="/hmc/resources/images/home/arr_rg_19_wht.png"></span>
				        </div>
				    </div>
					</div>
			</div>
		</div>
		<div id="contents" class="contents_main">
			<div class="movi_current_list">
				<div class="movi_info_txt"><img src="/hmc/resources/images/home/time2.png"> 07.30 09:00 기준</div>
				
			</div>
			
			<div id="main_specialCinema" class="main_cont_wrap special">
				<article class="articleSubMain">
					<header>
						<h3>스페셜관</h3>
						<span>더보기</span>
					</header>
					<ul>
						<li class="mainpage_side_special-1"></li>
						<li class="mainpage_side_special-2"></li>
						<li class="mainpage_side_special-3"></li>
						<li class="mainpage_side_special-4"></li>
						<li class="mainpage_side_special-5"></li>
						<li class="mainpage_side_special-6"></li>
						<li class="mainpage_side_special-7"></li>
						<li class="mainpage_side_special-8"></li>
					</ul>
				</article>
				<article class="articleEvent">
					<header>
						<h3>이벤트</h3>
						<span>더보기</span>
					</header>
					<ul>
						<li class="mainpage_side_event-1"></li>
						<li class="mainpage_side_event-2"></li>
						<li class="mainpage_side_event-3"></li>
						<li class="mainpage_side_event-4"></li>
						<li class="mainpage_side_event-5"></li>
						<li class="mainpage_side_event-6"></li>
					</ul>
				</article>
				<article class="articleInfo">
					<ul>
						<li style="cursor:pointer;" onclick="location.href='#'" class="info-1"></li>
						<li style="cursor:pointer;" onclick="location.href='#'" class="info-2"></li>
						<li style="cursor:pointer;" onclick="location.href='#'" class="info-3"></li>
						<li style="cursor:pointer;" onclick="location.href='#'" class="info-4"></li>
						<li style="cursor:pointer;" onclick="location.href='#'" class="info-5"></li>
					</ul>
				</article>
				
				<section class="sections">
					<img alt="" src="/hmc/resources/images/home/mainpage_side/section_img.jpg">
				</section>
				
			</div>
		</div>
	</section>
	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$('.slider-1 > .page-btns > div').click(function(){
    var $this = $(this);
    var index = $this.index();
    
    $this.addClass('active');
    $this.siblings('.active').removeClass('active');
    
    var $slider = $this.parent().parent();
    
    var $current = $slider.find(' > .slides > div.active');
    
    var $post = $slider.find(' > .slides > div').eq(index);
    
    $current.removeClass('active');
    $post.addClass('active');
});

// 좌/우 버튼 추가 슬라이더
$('.slider-1 > .side-btns > div').click(function(){
    var $this = $(this);
    var $slider = $this.closest('.slider-1');
    
    var index = $this.index();
    var isLeft = index == 0;
    
    var $current = $slider.find(' > .page-btns > div.active');
    var $post;
    
    if ( isLeft ){
        $post = $current.prev();
    }
    else {
        $post = $current.next();
    };
    
    if ( $post.length == 0 ){
        if ( isLeft ){
            $post = $slider.find(' > .page-btns > div:last-child');
        }
        else {
            $post = $slider.find(' > .page-btns > div:first-child');
        }
    };
    
    $post.click();
});

setInterval(function(){
    $('.slider-1 > .side-btns > div').eq(1).click();
}, 3000);

</script>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>
