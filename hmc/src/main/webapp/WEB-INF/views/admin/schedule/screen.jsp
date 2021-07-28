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
<title>상영영화 관리-HMC</title>
</head>
<body>
   <div class="container">

      <header>
      </header>

      <main>
      	<div class="row">
      		<div class="col">
			<h2>현재 상영중인 영화</h2>
			<a href="../list">상영스케줄</a>
				<form class="row mt-3" id="form-screen-register">
    				<div class="form-group col-md-3">
      					<select class="form-control" name="movieCode" id="movie-code" >
        					<option selected disabled> 영화를 선택하세요</option>
        					<c:forEach var="movie" items="${movies }">
        						<option value="${movie.code}">  ${movie.name }</option>        					
        					</c:forEach>
      					</select>
    				</div>
   					<div class="col-2">
      					<input type="text" class="form-control" id="movie-running-time" placeholder="러닝타임" readonly>
    				</div>
    				<div class="col-3">
    				<div class="input-group">
    					<div class="input-group-prepend">
    						<div class="input-group-text">시작일</div>
    					</div>
    			  		<input type="date" class="form-control" id="screen-start-date" name="startDate" readonly>
    			  	</div>
    				</div>
    				<div class="col-3">
    					<div class="input-group">
    						<div class="input-group-prepend">
    							<div class="input-group-text">종료일</div>
    						</div>
    			  			<input type="date" class="form-control" id="screen-end-date" name="endDate">
    			  		</div>
    				</div>
    				<div class="col-1">
    			  		<button class="btn btn-outline-primary" type="button" id="screen-register-button">추가</button>
    				</div>
				</form>
		</div>
      	</div>
		<!-- screen-moive테이블 시작 -->
		<div class="row mt-3">
			<table class="table table-hover" id="table-screen-movies">
				<colgroup>
					<col width="3%">
					<col width="10%">
					<col width="10%">
					<col width="*%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
  				<thead>
    				<tr>
    					<th><input type="checkbox" id="checkbox-all-selected"></th>
     	 				<th scope="col" class="text-center">스크린코드</th>
      					<th scope="col" class="text-center">영화코드</th>
      					<th scope="col" class="text-center">제목</th>
      					<th scope="col" class="text-center">러닝타임</th>
      					<th scope="col" class="text-center">시작일</th>
    	  				<th scope="col" class="text-center">종료일</th>
    	  				<th scope="col" class="text-center"></th>
 	   				</tr>
  				</thead>
  				<tbody>
  					<c:choose>
  						<c:when test="${empty screens}">
  							<tr>
  								<td colspan="8" class="text-center" id="no-screen-movie">현재 상영중인 영화가 없습니다.</td>
  							</tr>
  						</c:when>
  						<c:otherwise>
  							<c:forEach var="screen" items="${screens }">
			   	 				<tr>
			   	 					<td><input type="checkbox" name="screenCode" value="${screen.code }" /></td>
			      					<td class="text-center">${screen.code }</td>
			      					<td class="text-center">${screen.movieCode }</td>
				      				<td class="text-center">${screen.movieName }</td>
				      				<td class="text-center">${screen.runningTime }</td>
				      				<td class="text-center"><fmt:formatDate value="${screen.startDate }" pattern="yyyy-MM-dd"/></td>
				      				<td class="text-center"><fmt:formatDate value="${screen.endDate }" pattern="yyyy-MM-dd"/> </td>
				      				<td class="text-center"><button class="btn btn-outline-danger btn-sm">삭제</button></td>
				    			</tr>
  							</c:forEach>
  						</c:otherwise>
  					</c:choose>
	  			</tbody>
			</table>
		<div class="text-right">
			<button class="btn btn-outline-secondary btn-sm" id="btn-remove-all-row">전체 삭제</button>
			<button class="btn btn-outline-secondary btn-sm" id="btn-remove-checked-row">선택 삭제</button>
		</div>
		</div>
				<div class="row mb-2">
			<div class="col-12">
				<ul class="pagination justify-content-center">
					<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
						<a class="page-link" href="javascript:goToPage(${pagination.pageNo - 1 })">이전</a>
					</li>
					<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
						<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
							<a class="page-link" href="javascript:goToPage(${num })">${num }</a>
						</li>
					</c:forEach>
					<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
						<a class="page-link" href="javascript:goToPage(${pagination.pageNo + 1 })">다음</a>
					</li>
				</ul>
			</div>
		</div>
      </main>

      <footer>
      </footer>

   </div>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
   <script>
      $(function(){
    	 // 영화코드 입력시 러닝타임이랑 개봉일 자동입력
    	 $('#movie-code').change(function(){
    		 // 영화 코드 읽어오기
    		 var movieCode = $(this).val();
    		 console.log(movieCode);
    		 
    		 $.ajax({
    			type:"GET",
    			url:"../../rest/screen/movie",
    			data:{code:movieCode},
    			dataType:"json"
    		 })
    		 .done(function(movie){
    			$('#movie-running-time').val('러닝타임: '+movie.runningTime+'분');
    			$('#screen-start-date').val(movie.releaseDate);
    		 })
    	  });
    	 
    	 // 입력값 검사 (종료일이 시작일보다 뒤여아함)
    	 $('#screen-register-button').click(function(){
    		// 영화 선택했는지 확인
    		if(!$('#movie-code').val()){
    			alert("영화를 선택하세요.");
    			return false;
    		}
    		// 종료일 입력했는지 확인 
    		if(!$('#screen-end-date').val()){
    			alert("종료일을 입력하세요.")
    			return false;
    		}

    		if($('#screen-start-date').val() > $('#screen-end-date').val()){
    			alert("시작날짜가 종료날짜보다 늦습니다.")
    			return false;
    		}
    		registerScreen();
    		
    	 });
    	 function registerScreen(){
    		$.ajax({
    			type:"POST",
    			url:"/hmc/admin/rest/screen/register",
    			data: $('#form-screen-register').serialize(),
    			dataType: "json",
    			success: function(screen){
    				var $tr = $("<tr></tr>");
    				$tr.append("<td><input type=\"checkbox\" name=\"screenCode\" value=\""+screen.code+"\" /></td>")
    				$tr.append("<td class=\"text-center\">"+screen.code+"</td>")
    				$tr.append("<td class=\"text-center\">"+screen.movieCode+"</td>")
    				$tr.append("<td class=\"text-center\">"+screen.movieName+"</td>")
    				$tr.append("<td class=\"text-center\">"+screen.runningTime+"</td>")
    				$tr.append("<td class=\"text-center\">"+screen.startDate+"</td>")
    				$tr.append("<td class=\"text-center\">"+screen.endDate+"</td>")
    				
    				var $deleteButton = $("<button></button>").addClass("btn btn-outline-danger btn-sm").text("삭제");
    				var $buttonTd = $("<td></td>").addClass("text-center")
    				$buttonTd.append($deleteButton);
    				$tr.append($buttonTd);
    				
    				$('#no-screen-movie').closest("tr").remove();
    				$('#table-screen-movies tbody').prepend($tr);
    			}
    		});
    	 } 
      });
   </script>
</body>
</html>