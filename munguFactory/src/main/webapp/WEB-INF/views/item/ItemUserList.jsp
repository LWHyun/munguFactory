<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemUserList</title>
</head>
<body>
	<div class="subulContainer">
		<table>
			<thead>
				<tr>
					<th>품목 목록 조회</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="num" value="${page.total-page.start+1 }"></c:set>
				<tr>
					<th>품번</th>
					<th>HS코드</th>
					<th>품명</th>
					<th>생산 여부</th>
				</tr>
				<c:forEach var="iul" items="${itemUserList }">
					<tr>
						<td scope="row">${iul.rn}</td>
						<td>${iul.item_no }</td>
						<td>${iul.hs_code }</td>
						<td><a href="user/ItemUserSelect?item_no=${iul.item_no}">${iul.item_name }</a></td>
						<td>${iul.item_check }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
				<li class="page-item"><a class="page-link"
					href="/user/ItemUserList?currentPage=${i}">${i}</a></li>
			</c:forEach>
		</ul>
	</nav>
</body>
</html>