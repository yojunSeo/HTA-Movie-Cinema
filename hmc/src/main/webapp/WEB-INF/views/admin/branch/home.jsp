<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>관리자-지점관리-HMC</title>
</head>
<body>
	<div class="container-fluid">


		<main class="mt-5">
		<div class="row">
			<div class="col-2">
				<%@include file ="../sidebar.jsp"%>
			</div>
			
			<div class="col-8">
				<h3>지점 정보 수정</h3>
				
				<div class="row mt-5">
					<c:forEach var="branch" items="${branchList}" >
						<div class="col-3 d-grid gap-2 mt-3">
							<a class="btn btn-outline-primary" href="detail?branchCode=${branch.code}">${branch.name}</a>
						</div>
					</c:forEach>
					<div>
					</div>
				</div>
			</div>
		</div>
			


		</main>


	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		
	</script>
</body>
</html>