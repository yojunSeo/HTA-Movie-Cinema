<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/hmc/resources/css/main.css">
<title>HMC-메인화면</title>
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
						<!--  <span>더보기</span> -->
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
						<!--  <span>더보기</span>-->
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

$(function(){
	
	// 회원 탈퇴가 완료되었을때 실행할 alert창
	var urlParams = new URLSearchParams(window.location.search);
	var userWithdrawal = urlParams.get('witdrawal');
	if(userWithdrawal != null){
		alert("회원탈퇴가 완료되었습니다.");
		location.href = "home";
	}
	
	// 비밀번호가 성공적으로 변경되었을때 실행할 alert창
	var urlParams = new URLSearchParams(window.location.search);
	var userchangePwd = urlParams.get('changePwd');
	if(userchangePwd != null){
		alert("비밀번호가 변경되었습니다.");
		location.href = "home";
	}
})


</script>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>
