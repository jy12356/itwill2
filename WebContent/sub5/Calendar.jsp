<%@page import="vo.PageInfo"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
if (id == null) {
	id = "ㅇㅇ";
}
%>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar'); // 캘린더가 위치할 엘리먼트

	var calendar = new Calendar(calendarEl, {
		plugins: [ dayGridPlugin ]
	});

	calendar.render();
});
<jsp:include page="../include/header.jsp" />

<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>
				<a href="../main/index.jsp">HOME</a> > 게시판
			</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="customer">
			<h3 class="coTitle">캘린더</h3>
			<div class="customer-top-menu">
				<ul>
					<li><a href="../sub2/free_board.jsp" class=""><em>자유게시판</em></a></li>
					<li><a href="../sub2/book_apl.jsp" class=""><em>도서신청</em></a></li>
				</ul>
			</div>
			<div class="customer-contents">
				<div class="customer-inner">
					<table summary="공지사항" class="customer-table notice">

						<caption>캘린더</caption>
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 50%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
							<col style="width: 7%;">
						</colgroup>
						
						
<!-- 						<thead> -->
<!-- 							<tr> -->
<!-- 								<th scope="col" abbr="번호">번호</th> -->
<!-- 								<th scope="col" abbr="제목">제목</th> -->
<!-- 								<th scope="col" abbr="작성자">작성자</th> -->
<!-- 								<th scope="col" abbr="등록일">등록일</th> -->
<!-- 							</tr> -->
<!-- 						</thead> -->
					</table>

				</div>
			</div>
		</div>
	</div>

</section>
<jsp:include page="../include/footer.jsp" />