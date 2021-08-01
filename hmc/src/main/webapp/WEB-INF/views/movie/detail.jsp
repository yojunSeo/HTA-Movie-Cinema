<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>영화상세정보-HMC</title>
</head>
<body>
	<div class="container">

		<header>
		</header>

		<main>
			<div class="row">
				<div class="col-12">
					<div class="card mb-3" style="max-width: 540px;">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <img src="..." class="img-fluid rounded-start" alt="...">
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title">${savedMovie.movieName }</h5>
					        <p class="card-text">관람객 평점 <strong>${savedMovie.reviewCnt }</strong>예매순위 <strong>${savedMovie.totalScore }</strong> </p>
					        <hr style="border: solid 1px gray;">
					        <p class="card-text"><small class="text-muted">장르 ${savedMovie.genre } ${savedMovie.releaseDate }개봉 ${savedMovie.runningTime }분 </br>
					        	출연 ${savedMovie.acterName } </br> ${savedMovie.company }</small></p>
					      </div>
					    </div>
					  </div>
					</div>
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active" data-toggle="tab" href="#movieInfo">영화정보</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" data-toggle="tab" href="#movieReview">평점 및 관람평</a>
					  </li>
					  
					</ul>
					<div class="tab-content">
					  <div class="tab-pane fade show active" id="movieInfo">
					    <p>영화상세정보</p>
					  </div>
					  <div class="tab-pane fade" id="movieReview">
					    <p>영화리뷰</p>
					  </div>
					
					</div>	
				</div>
			</div>
		</main>

		<footer>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script>
		
	</script>
</body>
</html>