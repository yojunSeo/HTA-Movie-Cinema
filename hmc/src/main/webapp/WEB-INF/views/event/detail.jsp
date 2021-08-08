<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>이벤트 페이지</title>
<style>
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container my-3">
	<div class="eventHeader">
	    <div class="title">
	    	<h3>번호</h3>
	    	제목
	    </div>
	    <div class="writer">
	    	<a>작성자</a>
	    </div>
    </div>
    <div>
    	<div class="eventContent">
    		<a>내용</a>
    	</div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>


</script>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>
