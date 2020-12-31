<%@page import="vo.PageInfo"%>
<%@page import="vo.FreeBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<FreeBoardBean> articleList = (ArrayList<FreeBoardBean>) request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
int listCount = pageInfo.getListCount();
%>

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
		<div class="sub_container">
			<h3 class="coTitle">자유게시판</h3>
			<div class="boxmenu1-top-menu">
				<ul>
					<li class="on"><a href="FreeBoardList.free"><em>자유게시판</em></a></li>
					<li><a href="RequestList.rq"><em>희망도서신청</em></a></li>
					<li><a href="NoticeBoardList.not?page=1"><em>공지사항</em></a></li>
				</ul>
			</div>
			<div class="customer-contents">
				<div class="customer-inner">
					<table summary="공지사항" class="customer-table notice">

						<caption>자유게시판</caption>
						<colgroup>
							<col style="width: 8%;">
							<col style="width: 50%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
							<col style="width: 7%;">

						</colgroup>
						<%
							if (articleList != null && listCount > 0) {
						%>
						<thead>
							<tr>
								<th scope="col" abbr="번호">번호</th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="작성자">작성자</th>
								<th scope="col" abbr="등록일">등록일</th>
								<th scope="col" abbr="조회수">조회수</th>
							</tr>
						</thead>
						<tbody>
							<%
								// 게시물목록불러오기
							for (int i = 0; i < articleList.size(); i++) {
							%>
							<tr>
								<td class="tac"><%=articleList.get(i).getBoard_num()%></td>
								<td>
									<%
										if (articleList.get(i).getBoard_re_lev() != 0) {
									
 										for (int j = 0; j <= articleList.get(i).getBoard_re_lev() * 2; j++) {
 									%> &nbsp; <%
 										}
 										%> ▶ <%
 										}
 										%> <a
									href="FreeBoardDetail.free?board_num=<%=articleList.get(i).getBoard_num()%>&page=<%=nowPage%>&board_type=<%=1%>&limit=10">
										<%=articleList.get(i).getBoard_subject()%>
								</a>
								</td>
								<td align="center"><%=articleList.get(i).getBoard_id()%></td>
								<td align="center"><%=articleList.get(i).getBoard_date()%></td>
								<td align="center"><%=articleList.get(i).getBoard_readcount()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<%
						String id = (String) session.getAttribute("id"); //

// 					if (id != null) {
					%>
					<div class="btn_inner">
						<a href="FreeBoardWriteForm.free" class="btn">글쓰기</a>
					</div>
					<%
// 						}
					%>
					<input type="hidden" name="id" id="myId" value="<%=id%>">
<script type="text/javascript">
$(".btn").on("click", function() {
	var myid = document.getElementById('myId').value;
	if (myid == "null") {
		alert("로그인 해주시길 바랍니다.");
		return false;
	}
});

</script>

					<div class="paging">

						<!-- 이전페이지 -->
						<%
							if (nowPage <= 1) {
						%>
						<input type="button" value="이전">&nbsp;
						<%
							} else {
						%>
						<input type="button" value="이전"
							onclick="location.href='FreeBoardList.free?page=<%=nowPage - 1%>'">&nbsp;
						<%
							}
						%>

						<%
							for (int i = startPage; i <= endPage; i++) {
							if (i == nowPage) {
						%>
						[<%=i%>]&nbsp;
						<%
							} else {
						%>
						<a href="FreeBoardList.free?page=<%=i%>">[<%=i%>]
						</a>&nbsp;
						<%
							}
						%>
						<%
							}
						%>
						<!-- 다음페이지 -->
						<%
							if (nowPage >= maxPage) {
						%>
						<input type="button" value="다음">
						<%
							} else {
						%>
						<input type="button" value="다음"
							onclick="location.href='FreeBoardList.free?page=<%=nowPage + 1%>'">
						<%
							}
						%>
						<%
							} else {
						%>
						<section id="emptyArea">등록된 글이 없습니다</section>
						<%
							}
						%>
					</div>
				</div>
			</div>

		</div>
	</div>

</section>

<jsp:include page="../include/footer.jsp" />