<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>마이페이지-HMC</title>
</head>
<style type = "text/css">
html, body {
   width: 100%;
   height: 100%;
}
.box {
   width: 100vw;
   margin-left: calc(-50vw + 50%);
   
}
.box1 {
   background-color: #FF243E;
   width: 100vw;
   margin-left: calc(-50vw + 50%);
   height: 350px;   
}

.box2 {
   margin-top: 100px;

   width: 1280px;
   height: 400px;
   padding: 20px;
   background-color: #FFFFFF;
   background-position: center;
   background-size: cover;
   backgroudd-repeat: no-repeat;
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    border: none;
    outline: none;
    color: #000000;
    backgrone-color: #FFFFFF;
}

.nav-tabs, .nav-item .nav-link {
   border: none;
   outline: none;
}
.nav-link, .nav-link:hover {
   color: #000000;
}
.nav-link.active {
   font-weight : bold;
}
.dropdown-item, .dropdown-item:hover {
   color: #000000;
   border: none;
   outline: none;
   background-color: #FFFFFF;
}
.dropdown-item.active {
   font-weight : bold;
   color: #000000;
   background-color: #FFFFFF;
}
</style> 
<body>
   <div class="container">

      <header><%@ include file="../common/header.jsp"%></header>
      
      <main>
         <%@include file="main.jsp" %> 
         <h3 class="mt-5 mb-3 mx-3">쿠폰내역</h3>  
         <div class="row">
				<table class="table text-center" id="myCoupon-table">
					<thead >
						<colgroup>
							<col width="10%"/>
							<col width="10%"/>
							<col width="*"/>
							<col width="13%"/>
							<col width="13%"/>
							<col width="13%"/>
							<col width="10%"/>
						</colgroup>
						<tr>
							<th scope="col">쿠폰코드</th>
							<th scope="col">카테고리</th>
							<th scope="col">이름</th>
							<th scope="col">지급일</th>
							<th scope="col">기한일</th>
							<th scope="col">사용일</th>
							<th scope="col">사용여부</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty coupons }">
								<tr>
									<td colspan="4">쿠폰내역이 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="coupon" items="${coupons }">
									<tr data-coupon-code="${coupon.PUBLISHEDCODE }">
										<td>${coupon.COUPONCODE }</td>
										<td>${coupon.COUPONTYPE }</td>
										<td>${coupon.COUPONNAME }</td>
										<td><fmt:formatDate value="${coupon.GIVENDATE }" pattern="yyyy-MM-dd"/></td>
										<td><fmt:formatDate value="${coupon.ENDDATE }" pattern="yyyy-MM-dd"/></td>
										<td><fmt:formatDate value="${coupon.USEDDATE }" pattern="yyyy-MM-dd"/></td>
										<c:choose>
											<c:when test="${coupon.ISUSED eq 'Y' }">
												<td class="text-success fw-bold">사용완료</td>
											</c:when>
											<c:otherwise>
												<td scope="row"></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<c:if test="${pagination.totalRows gt 0 }">
				<div class="row mb-2">
					<div class="col-12">
						<ul class="pagination justify-content-center">
							<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
								<a class="page-link" href="coupon?page=${pagination.pageNo - 1 }">이전</a>
							</li>
							<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
								<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
									<a class="page-link" href="coupon?page=${num }">${num }</a>
								</li>
							</c:forEach>
							<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
								<a class="page-link" href="coupon?page=${pagination.pageNo + 1 }">다음</a>
							</li>
						</ul>
					</div>
				</div>
			</c:if>
      </main>

      <footer><%@ include file="../common/footer.jsp"%></footer>

   </div>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

   <script>
   $(function(){
   
   })
   </script>
</body>
</html>