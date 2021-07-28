<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>페이지이름-HMC</title>
</head>
<body>
	<div class="container">

		<header>
		</header>

		<main>
			<div class="row mb-3">
               <p class="mt-5 fw-normal fs-4">고객센터</p>
            </div>
            <div class="row mb-2">
            	<div class="col-12 border-bottom border-1 border-secondary">
            	</div>
            </div>
            <div class="row offset-2">
            	<div class="col-4">
            		<a href="../cs/" class="btn fw-bold text-danger">공지사항</a>
            	</div>
            	<div class="col-4">
            		<a href="../cs/inqueryForm" class="btn">1:1문의</a>
            	</div>
            	<div class="col-4">
            		<a href="../cs/membership" class="btn">멤버십</a>
            	</div>
            </div>
            <div class="row my-2">
            	<div class="col-12 border-bottom border-1 border-dark">
            	</div>
            </div>
			<div class="row border my-5 bg-light">
            	<form id="form-search" class="form-inline justify-content-center my-4 mx-4" method="get" action="#">
            		<div class="row">
            			<div class="col-2">
            				<div>
								<input type="hidden" name="no" value="" /> 
								<input type="hidden" name="page" value="${pagination.pageNo }"> 
								<select class="form-control mr-2" name="opt">
									<option value="title" ${param.opt eq 'title' ? 'selected' : '' }>제목</option>
									<option value="content"${param.opt eq 'content' ? 'selected' : '' }>내용</option>
								</select>
							</div> 
            			</div>
            			<div class="col-8">
            				<input type="text" class="form-control" name="keyword" value="${param.keyword }" placeholder="검색어를 입력해주세요.">
            			</div>
            			<div class="col-2">
            				<button type="button" class="btn btn-dark">검색</button>
            			</div>
            		</div>
            	</form>
            </div>
            <div class="row">
				<table class="table text-center">
					<thead>
						<colgroup>
							<col width="15%"/>
							<col width="15%"/>
							<col width="50%"/>
							<col width="20%"/>
						</colgroup>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">구분</th>
							<th scope="col">제목</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>전체</td>
							<td class="text-danger text-start">KT 멤버십 영화예매 적립 서비스 안내</td>
							<td>2021-04-21</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>전체</td>
							<td class="text-start">수도권 거리두기 4단계 3인 이상 모임 제한 관련 안내</td>
							<td>2021-11-21</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>전체</td>
							<td class="text-start">수도권 거리두기 4단계 3인 이상 모임 제한 관련 안내</td>
							<td>2021-11-21</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>전체</td>
							<td class="text-start">수도권 거리두기 4단계 3인 이상 모임 제한 관련 안내</td>
							<td>2021-11-21</td>
						</tr>
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
		
	</script>
</body>
</html>