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
               <p class="mt-5 fw-normal fs-4">공지사항 추가</p>
            </div>
            <div class="row mb-2">
            	<div class="col-12 border-bottom border-1 border-secondary">
            	</div>
            </div>
			<div class="row mb-5">
				<form action="insertNotice" method="post" id="notice-form">
					<table class="table">
						<thead>
							<colgroup>
								<col width="20%"/>
								<col width="80%"/>
							</colgroup>
						</thead>
						<tbody>
							<tr>
								<th class="fw-lighter">중요도</th>
								<td id="status">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="status" value="Y"> 
										<label class="form-check-label" for="inlineCheckbox1">보통</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="status" value="I"> 
										<label class="form-check-label" for="inlineCheckbox1">중요</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="status" value="N"> 
										<label class="form-check-label" for="inlineCheckbox1">삭제</label>
									</div>
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">카테고리</th>
								<td>
									<div class="col-3">
										<select class="form-control mr-2" name="category" id="category">
											<option value="0">카테고리 선택</option>
											<option value="전체">전체</option>
											<option value="신림점">신림점</option>
											<option value="이태원점">이태원점</option>
											<option value="왕십리점">왕십리점</option>
											<option value="서울역점">서울역점</option>
											<option value="강남역점">강남역점</option>
											<option value="사당점">사당점</option>
											<option value="목동점">목동점</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">제목</th>
								<td>
									<input type="text" class="form-control w-75 bg-light" name="title" id="title" placeholder="제목을 입력하세요">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">내용</th>
								<td>
									<textarea class="bg-light" rows="6" cols="103" name="content" id="content" placeholder=" 내용을 입력하세요"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
		            <div class="row my-3 text-center my-5">
						<div class="col-12">
							<a href="noticeList" class="btn btn-dark btn-lg w-25 text-light">취소</a>
							<button type="submit" class="btn btn-danger btn-lg w-25 text-light ${empty LOGINED_USER ? 'disabled' : '' }">확인</button>
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
$(function(){
	$("#notice-form").submit(function(){
		var status = $("#status :radio:checked").length;
		if(status == 0){
			alert("중요도는 필수 선택값입니다.");
			$("#status").focus();
			return false;
		}
		var category = $("#category option:selected").val();
		if(category == 0){
			alert("카테고리는 필수 선택값입니다.");
			$("#category").focus();
			return false;
		}
		var title = $.trim($("#title").val());
		if(!title){
			alert("제목은 필수 입력값입니다.");
			return false;
		}
		var content = $.trim($("#content").val());
		if(!content){
			alert("내용은 필수 입력값입니다.");
			$("#content").focus();
			return false;
		}
		return true;
		
	});
})
</script>

</body>
</html>