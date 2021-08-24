<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>1:1문의 관리-HMC</title>
</head>
<body>
	<div class="container-fluid">
      <main>
         <div class="container-fluid mt-5">
            <div class="row">
               <div class="col-2">
                  <%@include file ="../sidebar.jsp"%>
               </div>
               <div class="col-10">
				<div class="row mt-3 mb-2">
	               <p class="fw-normal fs-4">1:1 문의</p>
	            </div>
	            <div class="row">
	            	<div class="col-12 border-bottom border-1 border-secondary">
	            	</div>
	            </div>
	            <div class="row mt-2">
			    	<p class="fw-bold fs-6 mt-2">${inquery.title }</p>
	            </div>
	            <div class="row border border-top border-bottom bg-light">
	            	<div class="row my-2 mx-5">
		            	<div class="col-3 mt-3">
		            		<p>문의코드 | <span class="fw-bold">${inquery.code }</span></p>
		            	</div>
		            	<div class="col-3 mt-3">
		            		<p>문의자 | <span class="fw-bold">${inquery.userId }</span></p>
		            	</div>
		            	<div class="col-3 mt-3">
		            		<p>카테고리 | <span class="fw-bold">${inquery.category }</span></p>
		            	</div>
		            	<div class="col-3 mt-3">
		            		<p>등록일 | <span class="fw-bold"><fmt:formatDate value="${inquery.createdDate }" pattern="yyyy-MM-dd"/></span></p>
		            	</div>
	            	</div>
	            </div>
	            <div class="row my-5">
	            	<div class="col-7 offset-2">
	            		<div>
	            			${inquery.content }
						</div>
	            	</div>
	            </div>
	            <div class="row mb-5">
	            	<div class="col-12 border-bottom border-1 border-secondary">
	            	</div>
	            </div>
	            <div class="row mb-5">
					<form action="submitInquery" method="post" id="inquery-form">
						<table class="table">
							<thead>
								<colgroup>
									<col width="20%"/>
									<col width="20%"/>
									<col width="60%"/>
								</colgroup>
							</thead>
							<tbody>
								<tr>
									<th class="fw-lighter">문의 코드</th>
									<td>
										<input type="hidden" name="code" value="${inquery.code }"> 
										<input type="hidden" name="responder" value="${LOGINED_USER.id }"> 
									 	<p class="text-danger fw-bold">${inquery.code}</p>						 
									 </td> 
								</tr>
								<tr>
									<th class="fw-lighter">내용</th>
									<td>
										<textarea class="bg-light" rows="6" cols="103" name="content" id="content" placeholder="답변내용을 입력해주세요."></textarea>
									</td>
								</tr>
							</tbody>
						</table>
			            <div class="row text-center my-5">
							<div class="col-12">
								<a href="inqueryList" class="btn btn-dark w-25 h-100 text-light fs-5">목록</a>
								<button type="submit" class="btn btn-danger btn-lg w-25 h-100 text-light">등록하기</button>
							</div>
						</div>
					</form>
				</div>
               </div>
            </div>
         </div>
		</main>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
$(function(){
	$("#inquery-form").submit(function(){
		var content = $.trim($("#content").val());
		if(!content){
			alert("답변내용을 입력해 주세요.")
			$("#content").focus();
			return false;
		}
		return true;
	});
})
	
</script>
</body>
</html>