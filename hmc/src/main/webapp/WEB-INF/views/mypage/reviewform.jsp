<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>관람평작성-HMC</title>
</head>
<body>
	<div class="container">

		<header>
		</header>

		<main>
			<div class="main-section1">
			<div class="rating-part">
				<div style="clear: both;"></div>
				<div class="reviews">
					<h1>Reviews</h1>
				</div>
				<form class="row justify-content-center mb-5 position-relative" action="/sb/product/itemDetail" method="post">
				<input type="hidden" name="no" value="${product.no }">
				 
				 <div class="col-1 p-0">
					 <select name="opt" style="width:100%;">
						<option value="5" selected> 5</option>
						<option value="4" > 4</option>
						<option value="3" > 3</option>
						<option value="2" > 2</option>
						<option value="1" > 1</option>
					 </select>
				 </div>
				 
				 <div class="col-9">
				 	<textarea rows="3" style="width:100%; border-radius: 5px; border: 1px solid #ddd;" name="comment"></textarea>
				 </div>
				 
				 <div class="col-1 p-0 align-bottom">
				 	<button class="btn btn-outline-secondary w-100 position-absolute" style="bottom:6px;" type="submit">등록</button>
				 </div>
				 
				</form>
				<div class="comment-part">
					<c:forEach var="review" items="${reviews }">
					
					<div class="user-img-part">
						<div class="user-text">
							<p>${review.userId }</p>
							<h4><fmt:formatDate value="${review.createdDate }" pattern="yyyy.MM.dd"/></h4>
						</div>
						<div style="clear: both;"></div>
					</div>
					<div class="comment">
					<c:choose>
					<c:when test="${review.score eq 5 }">
						<i aria-hidden="true" class="fa fa-star"></i> 
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
					</c:when>
					<c:when test="${review.score eq 4 }">
						<i aria-hidden="true" class="fa fa-star"></i> 
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
					</c:when>
					<c:when test="${review.score eq 3 }">
						<i aria-hidden="true" class="fa fa-star"></i> 
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
					</c:when>
					<c:when test="${review.score eq 2 }">
						<i aria-hidden="true" class="fa fa-star"></i> 
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
					</c:when>
					<c:otherwise>
						<i aria-hidden="true" class="fa fa-star"></i> 
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
					</c:otherwise>	
					</c:choose>
						<div style="display: inline;">
							<div style='float: right;'>
								<a href="=${review.code }"><button type="button" class="btn btn-danger">삭제</button></a>
							</div>
						</div>
						<p>${review.content }</p>
					</div>
					
					
					<div style="clear: both;"></div>
					</c:forEach>
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