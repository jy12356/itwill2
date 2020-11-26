<%@page import="vo.NoticeVo.PageInfo"%>
<%@page import="vo.NoticeVo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
if (id == null) {
	id = "ㅇㅇ";
}

// 전달받은 request 객체로부터 데이터 가져오기
// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
// 전부 Object타입이라 형변환 필요
ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList");
PageInfo PageInfo = (PageInfo) request.getAttribute("PageInfo");
int nowPage = PageInfo.getPage();
int maxPage = PageInfo.getMaxPage();
int startPage = PageInfo.getStartPage();
int endPage = PageInfo.getEndPage();
int listCount = PageInfo.getListCount();
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
		<div class="customer">
			<h3 class="coTitle">공지사항</h3>
			<div class="customer-top-menu">
				<ul>
					<li><a href="../sub2/free_board.jsp" class=""><em>자유게시판</em></a></li>
					<li><a href="../sub2/book_apl.jsp" class=""><em>도서신청</em></a></li>
				</ul>
			</div>
			<div class="customer-contents">
				<div class="customer-inner">
					<table summary="공지사항" class="customer-table notice">

						<caption>자유게시판</caption>
						<colgroup>
							<col width="75%">
							<col width="10%">
							<col width="*">
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
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < articleList.size(); i++) {
							%>
							<tr>
								<td align="center"><%=articleList.get(i).getNum()%></td>
								<td>
								<a href="NoticeBoardDetail.not?num=<%=articleList.get(i).getNum()%>&page=<%=nowPage%>">
										<%=articleList.get(i).getSubject()%>
								</a>
								</td>
								<td align="center"><%=articleList.get(i).getId()%></td>
								<td align="center"><%=articleList.get(i).getDate()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<div class="btn_inner">
						<a href="NoticeWriteForm.not" class="btn">글쓰기</a>
					</div>

					<div class="paging">
						<a href="NoticeList.not?pageNum=1" class="arr" data-page-num="1"><img
							src="../images/p-first.png"><span class="hide">처음페이지</span></a>

						<!-- 이전페이지 -->
						<%
							if (nowPage <= 1) {
						%>
						<input type="button" value="이전">&nbsp;
						<%
							} else {
						%>
						<input type="button" value="이전"
							onclick="location.href='NoticeList.not?page=<%=nowPage - 1%>'">&nbsp;
						<%
							}
						%>

						<!-- 게시글 목록 -->
						<%
							for (int i = startPage; i <= endPage; i++) {
							if (i == nowPage) {
						%>
						[<%=i%>]&nbsp;
						<%
							} else {
						%>
						<a href="NoticeList.not?page=<%=i%>">[<%=i%>]
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
							onclick="location.href='NoticeList.not?page=<%=nowPage + 1%>'">
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
						<!-- 						<a href="board.jsp?pageNum=27" class="arr" data-page-num="27"><img -->
						<!-- 							src="../images/p-last.png"><span class="hide">마지막페이지</span></a> -->
					</div>
				</div>
			</div>

		</div>
	</div>

</section>
<jsp:include page="../include/footer.jsp" />