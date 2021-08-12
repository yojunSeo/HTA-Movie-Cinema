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
	<div class="container-fluid">
      <main>
         <div class="container-fluid mt-5">
            <div class="row">
               <div class="col-2">
                  <%@include file ="../sidebar.jsp"%>
               </div>
               <div class="col-10">
				<div class="row mt-3 mb-2">
	               <p class="fw-normal fs-4">공지사항 수정</p>
	            </div>
	            <div class="row mb-3">
	            	<div class="col-12 border-bottom border-1 border-secondary">
	            	</div>
	            </div>
				<div class="row mb-5">
					<form action="noticeModify" method="post" id="notice-form">
						<table class="table">
							<thead>
								<colgroup>
									<col width="20%"/>
									<col width="80%"/>
								</colgroup>
							</thead>
							<tbody>
								<tr>
									<th class="fw-lighter">공지코드</th>
									<td>
										<input type="text" class="form-control w-75 bg-light" name="code" id="code" value="${notice.code }" placeholder="${notice.code }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th class="fw-lighter">중요도</th>
									<td>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="status" value="Y" ${notice.status == 'Y' ? 'checked':'' }> 
											<label class="form-check-label" for="inlineCheckbox1">보통</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="status" value="I" ${notice.status == 'I' ? 'checked':'' }> 
											<label class="form-check-label" for="inlineCheckbox1">중요</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="status" value="N" ${notice.status == 'N' ? 'checked':'' }> 
											<label class="form-check-label" for="inlineCheckbox1">삭제</label>
										</div>
									</td>
								</tr>
								<tr>
									<th class="fw-lighter">카테고리</th>
									<td>
										<div class="col-3">
											<select class="form-control mr-2" name="category">
												<option value="전체" ${notice.category == '전체' ? 'selected': '' }>전체</option>
												<option value="신림점" ${notice.category == '신림점' ? 'selected': '' }>신림점</option>
												<option value="이태원점" ${notice.category == '이태원점' ? 'selected': '' }>이태원점</option>
												<option value="왕십리점" ${notice.category == '왕십리점' ? 'selected': '' }>왕십리점</option>
												<option value="서울역점" ${notice.category == '서울역점' ? 'selected': '' }>서울역점</option>
												<option value="강남역점" ${notice.category == '강남역점' ? 'selected': '' }>강남역점</option>
												<option value="사당점" ${notice.category == '사당점' ? 'selected': '' }>사당점</option>
												<option value="목동점" ${notice.category == '목동점' ? 'selected': '' }>목동점</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th class="fw-lighter">제목</th>
									<td>
										<input type="text" class="form-control w-75 bg-light" name="title" id="title" data-notice-title="${notice.title }" placeholder="${notice.title }">
									</td>
								</tr>
								<tr>
									<th class="fw-lighter">내용</th>
									<td>
										<textarea class="bg-light" rows="6" cols="103" name="content" id="content" data-notice-content="${notice.content }" placeholder="${notice.content }"></textarea>
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
               </div>
            </div>
         </div>
		</main>
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
$(function(){
	$("#notice-form").submit(function(){
		var noticeTitle = $("#title").data('notice-title');
		var title = $.trim($("#title").val());
		if(!title){
			$("#title").val(noticeTitle);
			return false;
		}
		var noticeContent = $("#content").data('notice-content');
		var content = $.trim($("#content").val());
		if(!content){
			$("#content").val(noticeContent);
		}
		return true;
	});
	
})

</script>
</body>
</html>