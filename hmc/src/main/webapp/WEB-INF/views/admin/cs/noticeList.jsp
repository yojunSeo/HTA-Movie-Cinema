<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>공지사항 관리-HMC</title>
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
			              <p class="fw-normal fs-4">공지사항 관리</p>
			           </div>
			           <div class="row">
			           	<div class="col-12 border-bottom border-1 border-secondary">
			           	</div>
					<div class="row border my-5 bg-light">
			           	<form id="form-search" class="form-inline justify-content-center my-4 mx-4" method="get" action="noticeList">
			           		<div class="row">
			           			<div class="col-2">
			           				<div>
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
			           				<button type="submit" class="btn btn-dark">검색</button>
			           			</div>
			           		</div>
			           	</form>
			           </div>
			           <div class="row">
						<table class="table text-center" id="notice-table">
							<thead>
								<colgroup>
									<col width="10%"/>
									<col width="10%"/>
									<col width="40%"/>
									<col width="20%"/>
									<col width="20%"/>
								</colgroup>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">구분</th>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty notices }">
										<tr>
											<td colspan="4">검색결과가 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="notice" items="${notices }">
											<tr data-notice-code="${notice.code }">
												<th scope="row">${notice.code }</th>
												<td>${notice.category }</td>
												<td class="${notice.status eq 'I' ? 'text-danger' : '' } text-start" id="goDetail">${notice.title }</td>
												<td><fmt:formatDate value="${notice.createdDate }" pattern="yyyy-MM-dd"/></td>
												<td><a class="btn btn-outline-danger mx-2 h-5">삭제</a><a href="noticeModify?code=${notice.code }" class="btn btn-outline-warning h-5 text-warning">수정</a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-12 text-end">
							<a href="insertNotice" class="btn btn-success text-light">추가</a>
						</div>
					</div>
					<c:if test="${pagination.totalRows gt 0 }">
						<div class="row mb-2" id="page-zone">
							<div class="col-12">
								<ul class="pagination justify-content-center">
									<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
										<a class="page-link" data-pageno = "${pagination.pageNo - 1 }">이전</a>
									</li>
									<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
										<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
											<a class="page-link" data-pageno = "${num }">${num }</a>
										</li>
									</c:forEach>
									<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
										<a class="page-link" data-pageno = "${pagination.pageNo + 1 }">다음</a>
									</li>
								</ul>
							</div>
						</div>
					</c:if>
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
	$("#notice-table tbody tr #goDetail").click(function(){
		var noticeCode = $(this).closest('tr').data('notice-code');
		
		location.href = "noticeDetail?code=" + noticeCode;
		
	});
	
	$("#notice-table tbody tr .btn-outline-danger").on('click',function(){
		var returnValue = confirm("공지사항을 삭제하시겠습니까?");
		if(returnValue){
			var noticeCode = $(this).closest('tr').data('notice-code');
			location.href = "noticeDelete?code="+noticeCode;
		}
			return false;
	})
	

	// 공지사항이 성공적으로 수정되었을때 실행할 alert창
	var urlParams = new URLSearchParams(window.location.search);
	var noticeModify = urlParams.get('noticeModify');
	if(noticeModify != null){
		alert("공지사항이 수정되었습니다.");
		location.href = "noticeList";
	}
	
	// 공지사항이 성공적으로 추가되었을때 실행할 alert창
	var urlParams = new URLSearchParams(window.location.search);
	var insertNotice = urlParams.get('insertNotice');
	if(insertNotice != null){
		alert("공지사항이 추가되었습니다.");
		location.href = "noticeList";
	}
	
	// 검색기능
	$("#form-search .btn-dark").on('click', function(){
		$("#form-search :input:first").val(1);
		$("#form-search").submit();
	})	
	
	// 페이지 이동
	$("#page-zone").on('click', 'a', function(){
		var pageNo = $(this).data('pageno');
		$("#form-search :input:first").val(pageNo);
		$("#form-search").submit();
	})
	
	
	
})
</script>
</body>
</html>