<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>영화 홈-HMC</title>
</head>
<style>
.box{
	width: 100px;
	height: 120px;
}
</style>
<body>
	<div class="container">

		<header>
		</header>

		<main>
			<form action="insertMoive" enctype="text" method="post">
				<input type="text" name="movie" />
				<input type="submit" vlaue="api저장" />
			</form>
			<div class="row">
				<p>현재 상영작 <strong>TOP5</strong></p>
				<div class="box">
					<table class="table" id="table-boxoffice">
						<thead>
							<tr>
								<td></td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</main>

		<footer>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script>
// 	$.ajax({
// 		type: "GET",
// 		url: "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json",
// 	    data: {key:"b5dd3da81db2d6020a6151195126a153", targetDt:dateString},
// 	    dataType: 'json',
// 	    success: function(boxoffice) {
	    	
// 	    	var boxofficeList = boxoffice.boxOfficeResult.dailyBoxOfficeList;
	    
// 	    	$.each(boxofficeList, function(index, item){
// 	    		var $tr = $("<tr></tr>");
// 	    		$("<td></td>").text(item.rank).appendTo($tr);
// 	    		$("<td></td>").text(item.movieNm).appendTo($tr);
// 	    		$("<td></td>").text(item.openDt).appendTo($tr);
// 	    		$("<td></td>").text(item.salesShare).appendTo($tr);
	    		
// 	    		$tbody.append($tr);
	    		
// 	    	})
// // 		},
// // 		error: function(){
// // 			alert("박스오피스 조회중 오류가 발생하였습니다.");
// 		}	
// 	}); 
	</script>
</body>
</html>