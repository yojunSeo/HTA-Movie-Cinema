<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<title>상영스케줄 조회-HMC</title>
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
						<div class="mt-3">
							<h3>상영스케줄 조회/변경/삭제</h3>
						</div>
						<div class="row mb-2">
							<div class="col-12">
								<form id="form-search" class="form-inline justify-content-end" method="get" action="list">
									<input type="hidden" name="page" value="${pagination.pageNo }" id="page-no">
									<select class="form-control mr-4" name="branch" id="branch-search">
										<option selected disabled> 영화관</option>
										<c:forEach var="branch" items="${branchs }">
											<option value="${branch.code }" ${param.branch eq branch.code ? 'selected' : '' }> ${branch.name }</option>
										</c:forEach>
									</select>
									<select class="form-control mr-4" name="room" id="room-search">
										<option selected disabled> 상영관</option>
									</select>
									<select class="form-control mr-4" name="movie" id="movie-search">
										<option selected disabled> 영화</option>
										<c:forEach var="movie" items="${movies }">
											<option value="${movie.code }" ${param.movie eq movie.code ? 'selected' : ''}> ${movie.movieName }</option>
										</c:forEach>
									</select>
									<input type="date" class="form-control mr-2" name="screenDate" id="date-search" value="${param.screenDate }">
									<button type="button" class="btn btn-outline-primary" >조회</button>
									<button type="button" class="btn btn-outline-success mx-2" >초기화</button>
								</form>
							</div>
						</div>
						<!-- 상영스케줄 테이블 시작 -->
						<div class="row">
						<table class="table table-hover" id="schedule-table">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="*%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="*%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">영화관</th>
									<th class="text-center">상영관</th>
									<th class="text-center">영화</th>
									<th class="text-center">상영일자</th>
									<th class="text-center">시작</th>
									<th class="text-center">종료</th>
									<th class="text-center">예매</th>
									<th class="text-center"></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty schedules}">
										<tr>
											<td colspan="10" class="text-center">해당 조건으로 조회된 스케줄이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="schedule" items="${schedules }" >
											<tr data-schedule-code="${schedule.scheduleCode }">
												<td class="text-center">${schedule.branchName }</td>
												<td class="text-center">${schedule.roomName }</td>
												<td class="text-center">${schedule.movieName }</td>
												<td class="text-center"><fmt:formatDate value="${schedule.scheduleDate }" pattern="yyyy-MM-dd"/></td>
												<td class="text-center"><fmt:formatDate value="${schedule.startTime }" pattern="HH:mm"/></td>
												<td class="text-center"><fmt:formatDate value="${schedule.endTime }" pattern="HH:mm"/></td>
												<td class="text-center"><span id="empty-seat">${schedule.emptySeat }</span> / <span id="total-seat">${schedule.totalSeat }</span></td>
												<td class="text-center"><button class="btn btn-outline-danger btn-sm">삭제</button></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						</div>
						<c:if test="${pagination.totalRows gt 0 }">
							<div class="row mb-2" id="page-zone">
								<div class="col-12">
									<ul class="pagination justify-content-center">
										<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
											<a class="page-link" data-pageno="${pagination.pageNo - 1 }">이전</a>
										</li>
										<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
											<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
												<a class="page-link" data-pageno="${num }">${num }</a>
											</li>
										</c:forEach>
										<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
											<a class="page-link" data-pageno="${pagination.pageNo + 1 }">다음</a>
										</li>
									</ul>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</main>
	</div>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<script>
$(function(){
	
	(function(){
		var branchCode =$('#branch-search').val();
		changeRoom(branchCode);
	})();
	
	$('#branch-search').on('change', function(){
		var branchCode =$(this).val();
		changeRoom(branchCode);
	});
	
	function changeRoom(branchCode){
		$.ajax({
			type:'GET',
			url:"../rest/branch",
			data:{code:branchCode},
			dataType:"json"
		}).done(function(rooms){
			var $select = $('#room-search').empty();
				$select.append("<option value='' selected disabled> 상영관</option>");
			$.each(rooms, function(index, room){
				$select.append("<option value='"+room.code+"'>"+room.name+"</option>");
			})
			$('#room-code').append($select);
			var urlParams = new URLSearchParams(window.location.search);
			var roomCode = urlParams.get('room');
			$("#room-search [value="+roomCode+"]").prop('selected', true);
		})
	}
	
	$('#form-search .btn-outline-primary').on('click',function(){
		$('#form-search :input:first').val(1);
		$("#form-search").submit();
	});
	
	$('#form-search .btn-outline-success').on('click',function(){
		$("#form-search #page-no").val('');
		$("#form-search #branch-search").val('');
		$("#form-search #room-search").val('');
		$("#form-search #movie-search").val('');
		$("#form-search #date-search").val('');
		$("#form-search").submit();
	});
	
	$('#page-zone').on('click', 'a', function(){
		var pageNo = $(this).data('pageno');
		$('#form-search :input:first').val(pageNo);
		$("#form-search").submit();
	})
	
	// 삭제를 원하는 경우 -> 10일 이전의 스케줄일 경우에는 예매자가 한명도 없어야지 삭제가 가능하다
	$('#schedule-table tbody').on('click', '.btn' , function(){
		var screenDate = new Date($(this).closest('tr').children().eq(4).text());	
		var emptySeat = parseInt($(this).closest('tr').children().eq(7).children().first().text());	
		var totalSeat = parseInt($(this).closest('tr').children().eq(7).children().last().text());	
		var scheduleCode = $(this).closest('tr').data('schedule-code');
		var today = new Date();
		var compare = new Date(today.getFullYear(),today.getMonth(), today.getDate()+10);
			
		// 날짜지난거 삭제해야하는데 예매인원 존재하면 삭제하면 안되겠음, 참조하고 있는 것들이 있어서 (할거면 상태관련해서 변경해야할듯)
		if(compare > screenDate && emptySeat != totalSeat){
			alert('예매인원이 존재하여 삭제가 불가능합니다.');	
			return false;
		}
		location.href = "delete?schedule="+scheduleCode;
	})
	
})
</script>
</body>
</html>