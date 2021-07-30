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
            		<a href="../cs/home" class="btn">공지사항</a>
            	</div>
            	<div class="col-4">
            		<a href="../cs/inqueryForm" class="btn fw-bold text-danger">1:1문의</a>
            	</div>
            	<div class="col-4">
            		<a href="../cs/membership" class="btn">멤버십</a>
            	</div>
            </div>
            <div class="row my-2">
            	<div class="col-12 border-bottom border-1 border-dark">
            	</div>
            </div>
           	<div class="row mt-4 border border-top border-bottom bg-light">
           		<div class="row my-3 mx-4 text-center">
           			<p class="mt-2">1:1 문의글 답변 운영시간 10:00 ~ 19:00</p>
           			<p>접수 후 48시간 안에 답변 드리겠습니다.</p>
           		</div>
           	</div>
           	<div class="row mb-3">
               <p class="mt-5 fw-normal fs-4">문의내용</p>
            </div>
            <div class="row mb-2">
            	<div class="col-12 border-bottom border-1 border-secondary">
            	</div>
            </div>
            <div class="row">
				<form action="" method="post" id="inquery-form">
					<table class="table">
						<thead>
							<colgroup>
								<col width="20%"/>
								<col width="80%"/>
							</colgroup>
						</thead>
						<tbody>
							<tr>
								<th class="fw-lighter">분류</th>
								<td>
									<div class="col-3">
										<select class="form-control mr-2" name="opt">
											<option value="" selected disabled>분류 선택</option>
											<option value="영화관">영화관</option>
											<option value="영화">영화</option>
											<option value="멤버십">멤버십</option>
											<option value="예매/결제">예매/결제</option>
											<option value="개인정보">개인정보</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">제목</th>
								<td>
									<input type="text" class="form-control w-75 bg-light" name="title" placeholder="제목을 입력해주세요.">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">내용</th>
								<td>
									<textarea class="bg-light" rows="6" cols="103" placeholder="내용을 입력해주세요."></textarea>
								</td>
							</tr>
						</tbody>
					</table>
		            <div class="row my-3 text-center my-5">
						<div class="col-12">
							<a href="../home" class="btn btn-dark btn-lg w-25">취소</a>
							<button type="submit" class="btn btn-danger btn-lg w-25">확인</button>
						</div>
					</div>
				</form>
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