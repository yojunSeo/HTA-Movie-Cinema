<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

.footer .f_logo {
    display: block;
    margin-bottom: 20px;
}

.footer {
    padding-top: 80px;
}

.footer .inner {
    position: relative;
    width: 980px;
    margin: 0 auto;
}



.footer .f_menu {
    margin-bottom: 15px;
}

ul, ol {
    list-style: none;
}


.footer .bx_address {
    line-height: 1.5;
    font-size: 12px;
    color: #4D4D4D;
}

.footer .bx_info {
	float:right;
    line-height: 1.5;
    font-size: 12px;
    color: #4D4D4D;
}


.footer .bx_address .a .bar::before {
    content: "";
    position: absolute;
    left: 0;
    top: 4px;
    height: 10px;
    border-left: 1px solid #707070;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.footer .copyright {
    display: block;
    margin-top: 4px;
    font-size: 12px;
    color: #4D4D4D;
}

.footer .f_menu a:before {
    content: "";
    position: absolute;
    left: 0;
    top: 2px;
    height: 10px;
    border-left: 1px solid #707070;
}

.footer .f_menu a {
    position: relative;
    float: left;
    margin-right: 10px;
    padding-left: 10px;
}

a, a:link, a:visited, a:active, a:hover {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>

<div id="footer_section" class="footer">
	<div class="inner">
		<span class="f_logo">
			<img alt="HTA MOVIE CINEMA" src="/hmc/resources/images/footer/logo_blacks.png">
		</span>
		<div class="f_menu">
			<a>회원약관</a>
			<a>개인정보처리방침</a>
			<a>이메일무단수집거부</a>
			<a>영상정보처리기기 운영 및 관리방침</a>
			<a>POINT회원안내</a>
			<a>배정기준</a>
			<a>채용안내</a>
			<a>광고/임대문의</a>
			<a>윤리경영</a>
			<a>기업정보</a>
		</div>
		<div class="bx_address">
			<br>
			<span style="cursor:pointer;" onclick="location.href='https://github.com/yojunSeo/HTA-Movie-Cinema'" class="bar">https://github.com/yojunSeo/HTA-Movie-Cinema</span>
			<br>
			<span>기획자 서요준, 윤장희, 이강욱, 이지민, 임채은</span>
			<br>
		</div>
		<p class="copyright">COPYRIGHT© HTA MOVIE CINEMA ALL RIGHT RESERVED.</p>
	</div>
	<div class="artivle_award">
		<div class="inner">
			<ul>
				<li>
					<img src="/hmc/resources/images/footer/footer_award_NCSI5.png" 
					alt="">
				</li>
				<li>
					<img src="/hmc/resources/images/footer/footer_award_kcsi.png" 
					alt="">
				</li>
				<li>
					<img src="/hmc/resources/images/footer/footer_award_kssqi.png" 
					alt="">
				</li>
				<li>
					<img src="/hmc/resources/images/footer/footer_award_brandcinema.png" 
					alt="">
				</li>
				<li>
					<img src="/hmc/resources/images/footer/footer_award_greenstar.png" 
					alt="">
				</li>
				<li>
					<img src="/hmc/resources/images/footer/footer_award_brandstar.png" 
					alt="">
				</li>
				<li>
					<img src="/hmc/resources/images/footer/footer_award_familyship.png" 
					alt="">
				</li>
				<li>
					<img src="/hmc/resources/images/footer/footer_award_winner.png" 
					alt="">
				</li>
			</ul>
		</div>
	</div>
	
	
	
</div>