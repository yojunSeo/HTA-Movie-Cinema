<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>마이페이지-HMC</title>
</head>
<style type = "text/css"> 
html, body {
	width: 100%;
	height: 100%;
}

.box {
	background-color: #FF243E;
	width: 100vw;
	margin-left: calc(-50vw + 50%);
	height: 350px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.box2 {
	margin-top: 100px;
	margin-left: 220px;
	width: 1280px;
	height: 400px;
	padding: 20px;
	background-color: #FFFFFF;
	background-position: center;
	background-size: cover;
	backgroudd-repeat: no-repeat;
/* 	border: 3px solid black; */
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    border: none;
    outline: none;
    color: #000000;
    backgrone-color: #FFFFFF;
}
span.large{
        font-size: 18px;
      }

.nav-tabs, .nav-item .nav-link {
	border: none;
	outline: none;
}
.nav-link, .nav-link:hover {
	color: #000000;
}
.nav-link.active {
	font-weight : bold;
}
.dropdown-item, .dropdown-item:hover {
	color: #000000;
	border: none;
	outline: none;
	background-color: #FFFFFF;
}
.dropdown-item.active {
	font-weight : bold;
	color: #000000;
	background-color: #FFFFFF;
}
</style>  
<body>
	<div class="container">
		<header><%@ include file="../common/header.jsp"%></header>
		<main>
			<%@include file="main.jsp" %>
			<div class="row mt-5">
			<h5 class="fw-bold">이벤트 응모/당첨내역</h5>
				<table class="table table-hover mt-3" id="event-table">
				<colgroup>
					<col width="30%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="20%"/>
				</colgroup>
				<thead>
					<tr class="text-center">
						<th>이벤트명</th>
						<th>이벤트 기간</th>
						<th>응모일</th>
						<th>당첨여부</th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-center">
						<th>리뷰쓰고 쿠폰받자</th>
						<th>2021/08/01 ~ 2021/08/31</th>
						<th>2021/08/10</th>
						<th>진행중</th>
					</tr>
					<tr class="text-center">
						<th>리뷰쓰고 쿠폰받자</th>
						<th>2021/08/01 ~ 2021/08/31</th>
						<th>2021/08/10</th>
						<th>진행중</th>
					</tr>
					<tr class="text-center">
						<th>리뷰쓰고 쿠폰받자</th>
						<th>2021/08/01 ~ 2021/08/31</th>
						<th>2021/08/10</th>
						<th>진행중</th>
					</tr>
					<tr class="text-center">
						<th>리뷰쓰고 쿠폰받자</th>
						<th>2021/08/01 ~ 2021/08/31</th>
						<th>2021/08/10</th>
						<th>진행중</th>
					</tr>
				</tbody>
			</table>

			</div>
		</main>
		<footer><%@ include file="../common/footer.jsp"%></footer>
	</div>
	 
	 <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
      crossorigin="anonymous"></script>          
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	$(function(){
		
	})
	</script>
</body>
</html>