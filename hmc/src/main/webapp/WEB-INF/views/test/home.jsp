<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>테스트 페이지</title>
</head>
<body>
<div class="container my-3">
	<h1>기존영화리스트..</h1>

	<a href="/hmc/test/seo">서요준 테스트페이지</a><br /><br />
	<a href="/hmc/test/lim">임채은 테스트페이지</a><br /><br />
	<a href="/hmc/text/lee">이지민 테스트페이지</a><br /><br />
	<p>${LOGINED_USER.name }</p>
	<iframe width="320" height="180" src="https://www.youtube.com/embed/B1ustvQPSJ0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</body>
</html>
