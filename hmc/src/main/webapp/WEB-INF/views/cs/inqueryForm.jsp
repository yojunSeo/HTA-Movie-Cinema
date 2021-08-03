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
			<%@ include file="../common/header.jsp" %>
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
            <div class="row mb-5">
				<form action="submitInquery" method="post" id="inquery-form">
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
										<select class="form-control mr-2" name="opt" id="opt">
											<option value="0" selected disabled="disabled">분류 선택</option>
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
									<input type="text" class="form-control w-75 bg-light" name="title" id="title" placeholder="제목을 입력해주세요.">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">내용</th>
								<td>
									<textarea class="bg-light" rows="6" cols="103" name="content" id="content" placeholder="내용을 입력해주세요."></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="row mt-5">
						<p class="fw-normal fs-4">개인정보 수집에 대한 동의</p>
						<p class="text-secondary text-end">문의를 통해 아래의 개인정보를 수집합니다. 수집된 개인정보는 문의 외 목적으로 사용하지 않습니다.</p>
					</div>
					<div class="row border" style="width: 100%; height:200px; overflow-y:auto; overflow-x: hidden;">
						<nav id="navbar-example2" class="navbar navbar-light bg-light px-3">
							<a class="navbar-brand" href="#">개인정보의 수집목적 및 항목</a>
						</nav>
						<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">
							<div class="txtarea">
								<br>① 수집 목적 : 원활한 고객 상담, 불편사항 및 문의사항 관련 의사소통 경로 확보
								<br>② 수집 항목
								<br>*필수입력사항
								<br>- 이용자 식별을 위한 항목 : 성명, 연락처,  이메일, 아이디(로그인 시 수집)
								<br><span class="text-danger">
								<br>개인정보의 보유 및 이용기간
								<br>입력하신 개인정보는 소비자 보호에 관한 법률 등 관계 법률에 의해 다음과 같이 보유합니다.
								<br>보유기간 : 문의접수 후 처리 완료시점으로 부터 3년</span>
								<br>
								<br>※ 1:1문의 서비스 제공을 위한 최소한의 개인정보이며 거부할 수 있습니다. 다만, 수집에 동의하지 않을 경우 서비스 이용이 제한됩니다.
							</div>
						</div>
					</div>
					<div class="row my-3" id="agreeCheck">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="agree" value="Y" id="agree"> 
							<label class="form-check-label" for="inlineCheckbox1">동의</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="agree" value="N"> 
							<label class="form-check-label" for="inlineCheckbox1">동의하지않음</label>
						</div>
					</div>
		            <div class="row my-3 text-center my-5">
						<div class="col-12">
							<a href="../home" class="btn btn-dark btn-lg w-25 text-light">취소</a>
							<button type="submit" class="btn btn-danger btn-lg w-25 text-light ${empty LOGINED_USER ? 'disabled' : '' }">확인</button>
						</div>
					</div>
				</form>
			</div>
		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
	$(function(){
		$("#inquery-form").submit(function(){
			var category = $("#opt option:selected").val();
			if(category == 0){
				alert("분류는 필수 선택값입니다.");
				$("#opt").focus();
				return false;
			}
			var title = $.trim($("#title").val());
			if(!title){
				alert("제목은 필수 입력값입니다.");
				$("#title").focus();
				return false;
			}
			var content = $.trim($("#content").val());
			if(!content){
				alert("내용은 필수 입력값입니다.");
				$("#content").focus();
				return false;
			}
			var agree = $("#agree:radio:checked").length;
			if(agree == 0){
				alert("개인정보 수집 동의를 해주셔야 등록이 가능합니다.");
				$("#agree").focus();
				return false;
			}	
			return true;
		});
	})
</script>
</body>
</html>