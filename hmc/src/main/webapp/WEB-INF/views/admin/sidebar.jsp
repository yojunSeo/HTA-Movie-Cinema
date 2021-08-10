<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.87.0">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

		ul, ol {
		    list-style: none;
		}
		
		a, a:link, a:visited, a:active, a:hover {
		    color: #000;
		    text-decoration: none;
		    cursor: pointer;
		}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="../../../resources/sidebars/sidebars.css" rel="stylesheet">
  </head>
  <body>

<main>

  <div class="flex-shrink-0 p-3 bg-white" style="width: 200px;">
    <p class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <span class="fs-3 fw-semibold">관리자 메뉴</span>
    </p>
    <ul class="p-0">
      <li class="mb-1" style="width: 200px">
      	<button class="btn btn-light fw-bold fs-6" type="button" data-bs-toggle="collapse" data-bs-target="#user-service" aria-expanded="false" aria-controls="user-service">
    		회원관리
  		</button>
  		<ul class="collapes collapse" id="user-service">
  			<li class="p-2" style="width: 200px"><a href="#">회원리스트</a></li>
  		</ul>
      </li>
      <li class="mb-1" style="width: 200px">
      	<button class="btn btn-light fw-bold fs-6" type="button" data-bs-toggle="collapse" data-bs-target="#schedule-service" aria-expanded="false" aria-controls="schedule-service">
    		상영스케줄 관리
  		</button>
  		<ul class="collapes collapse" id="schedule-service">
  			<li class="p-2" style="width: 200px"><a href="/hmc/admin/schedule/screen/list">스크린 영화 등록/조회</a></li>
  			<li class="p-2" style="width: 200px"><a href="/hmc/admin/schedule/list">스케줄 조회</a></li>
  			<li class="p-2" style="width: 200px"><a href="/hmc/admin/schedule/register">스케줄 등록</a></li>
  		</ul>
      </li>
      <li class="mb-1" style="width: 200px">
      	<button class="btn btn-light fw-bold fs-6" type="button" data-bs-toggle="collapse" data-bs-target="#store-service" aria-expanded="false" aria-controls="store-service">
    		스토어 관리
  		</button>
  		<ul class="collapes collapse" id="store-service">
  			<li class="p-2" style="width: 200px"><a href="#">상품리스트</a></li>
  		</ul>
      </li>
      <li class="mb-1" style="width: 200px">
      	<button class="btn btn-light fw-bold fs-6" type="button" data-bs-toggle="collapse" data-bs-target="#event-service" aria-expanded="false" aria-controls="event-service">
    		이벤트 관리
  		</button>
  		<ul class="collapes collapse" id="event-service">
  			<li class="p-2" style="width: 200px"><a href="#">이벤트 등록/조회</a></li>
  			<li class="p-2" style="width: 200px"><a href="#">쿠폰 등록/조회</a></li>
  		</ul>
      </li>
      <li class="mb-1" style="width: 200px">
      	<button class="btn btn-light fw-bold fs-6" type="button" data-bs-toggle="collapse" data-bs-target="#notice-service" aria-expanded="false" aria-controls="notice-service">
    		공지사항 관리
  		</button>
  		<ul class="collapes collapse" id="notice-service">
  			<li class="p-2" style="width: 200px"><a href="#">공지사항 등록/조회</a></li>
  		</ul>
      </li>
      <li class="mb-1" style="width: 200px">
      	<button class="btn btn-light fw-bold fs-6" type="button" data-bs-toggle="collapse" data-bs-target="#inquery-service" aria-expanded="false" aria-controls="inquery-service">
    		1:1 문의 관리
  		</button>
  		<ul class="collapes collapse" id="inquery-service">
  			<li class="p-2" style="width: 200px"><a href="#">1:1 문의 답변/조회</a></li>
  		</ul>
      </li>
      <li class="mb-1" style="width: 200px">
      	<a class="btn btn-light fw-bold fs-6" href="/hmc/home">HMC 메인가기</a>
      </li>
    </ul>
  </div>


</main>

      <script src="../../../resources/sidebars/sidebars.js"></script>
  </body>
</html>
