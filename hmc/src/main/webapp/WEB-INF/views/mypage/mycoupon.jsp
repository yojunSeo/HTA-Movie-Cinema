<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>쿠폰함HMC</title>
</head>
<body>
	<div class="container">
		<main>
			<div class="row mt-5">
				<table class="table table-hover" id="coupon-table">
				<colgroup>
					<col width="15%"/>
					<col width="*%"/>
					<col width="15%"/>
					<col width="15%"/>
					
				</colgroup>
				<thead>
					<tr class="text-center">
						<th>쿠폰명</th>
						<th>쿠폰내용</th>
						<th>유효기간</th>
						<th>쿠폰상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty coupons }">
							<tr class="text-center">
									<td colspan="5">사용가능한 쿠폰이 없습니다.</td>
								</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="coupon" items="${coupons }">
								<tr class="text-center" id="${coupon.type }">
									<td>${coupon.type }</td>
									<td>${coupon.name }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			</div>
		</main>

		<footer>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script>
	$(function(){
		
	})
	</script>
</body>
</html>