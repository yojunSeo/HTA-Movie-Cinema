<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>회원가입-HMC</title>
</head>
<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<main>
            <div class="row mb-3">
               <p class="mt-5 fw-normal fs-4">회원가입</p>
            </div>
            <div class="row mb-5">
               <p class="fw-normal fs-3">필수약관에 동의해주세요 :)</p>
            </div>
            <div>
               <p class="fw-bold">약관</p>
            </div>
            <div class="row mb-3">
               <table class="table border-top border-3" id="table-agree-register">
                  <thead>
                     <tr>
                        <td><input type="checkbox" id="check-all"></td>
                        <td class="fw-bold fs-6">전체동의</td>
                        <td>
                           <button type="button" class="btn btn-sm text-right" id="detail">자세히</button>
                        </td>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td><input type="checkbox" id="check1"></td>
                        <td class="fw-bold fs-6 text-black-50">개인정보의 필수적인 사항에 대한 수집 이용 동의 (필수)</td>
                        <td>
                           <button type="button" class="btn btn-sm text-right" id="detail">자세히</button>
                        </td>
                     </tr>
                     <tr>
                        <td><input type="checkbox" id="check2"></td>
                        <td class="fw-bold fs-6 text-black-50">개인정보의 필수적인 제3자 제공에 대한 동의 (필수)</td>
                        <td>
                           <button type="button" class="btn btn-sm text-right" id="detail">자세히</button>
                        </td>
                     </tr>
                     <tr>
                        <td><input type="checkbox" id="check3"></td>
                        <td class="fw-bold fs-6 text-black-50">개인정보의 선택적인 제3자 제공에 대한 동의 <span class="text-danger">(선택)</span></td>
                        <td>
                           <button type="button" class="btn btn-sm text-right" id="detail">자세히</button>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <div>
               <p class="text-danger">- 선택약관에 동의하지 않으셔도 회원가입이 가능합니다.</p>
               <p class="fw-lighter">- L.POINT 선택약관에 동의하지 않으시면 L.POINT 모든 제휴사에서 회원 혜택이 제한됩니다.</p>
               <P class="fw-lighter">1 ) 롯데백화점 MVG등 제휴사 회원 등급 선정 및 추가포인트 적립대상에서 제외</P>
               <P class="fw-lighter">2 ) 모든 제휴사 이벤트 당첨대상에서 제외</P>
            </div>
            <div class="row my-3 text-center my-5">
               <div class="col-12">
                  <a href="../home" class="btn btn-dark btn-lg w-25 text-light">취소</a>
                  <a href="form" class="btn btn-danger btn-lg w-25 text-light" id="next">다음</a>
               </div>
            </div>
            <div class="modal fade" id="form-todo-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">이용약관</h5>
						</div>
						<div class="modal-body">
							<div class="col-6 my-5">
								<img src="../resources/images/agreeJoin/agreeJoin.PNG" width=450 height="400"/>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
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
	// 전체선택/전체해제
	$("#check-all").change(function(){
		var isChecked = $("#check-all").prop("checked");
		$("#table-agree-register tbody :checkbox").prop("checked", isChecked);
	});
	
	$("#table-agree-register tbody :checkbox").change(function(){
		changeAllCheckedCheckbox();
	});
	
	
	// 선택개수에 따라 전체선택여부 변경
	function changeAllCheckedCheckbox(){
		
		var checkboxAllCnt = $("#table-agree-register tbody :checkbox").length;
		
		if(checkboxAllCnt == 0){
			$("#check-all").prop("checked",false);
			return;
		}
		
		var checkboxCheckedCnt = $("#table-agree-register tbody :checkbox:checked").length;
		
		if(checkboxAllCnt != checkboxCheckedCnt){
			$("#check-all").prop("checked", false);
		} else {
			$("#check-all").prop("checked", true);
		}
	}
	
	$("#next").click(function(){
		console.log($("#check1").prop("checked"));
		if(!$("#check1").prop("checked")){
			alert("필수약관에 동의하지 않으시면 회원가입이 불가합니다.");
			return false;
		}
		if(!$("#check2").prop("checked")){
			alert("필수약관에 동의하지 않으시면 회원가입이 불가합니다.");
			return false;
		}
		return true;
	});
	
	var modal = new bootstrap.Modal(document.getElementById("form-todo-modal"), {
		keyboard: false
	})
	// 약관내용 모달창 
	$("#table-agree-register #detail").click(function(){
		modal.show();
	})
	
	
	
});
</script>
</body>
</html>