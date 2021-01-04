<%@page import="vo.RequestBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	RequestBean article = (RequestBean) request.getAttribute("article");
	String nowPage = request.getParameter("page");
%>
<jsp:include page="../include/header.jsp" />
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>HOME > 희망도서 신청 목록 > 신청도서</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="customer">
			<h3 class="coTitle">신청도서</h3>
			<div class="customer-contents">
				<div class="customer-inner">
					<table summary="게시판" class="onebyone customer-notice">
						<caption>희망도서 신청 상세보기</caption>
						<colgroup>
							<col style="width: 22%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<td colspan="2" class="th"><%=article.getSubject()%></td>
							</tr>
							<tr>
								<td>저자</td>
								<td><%=article.getAuthor()%></td>
							</tr>
							<tr>
								<td>출판사</td>
								<td><%=article.getPublisher()%></td>
							</tr>
							<tr>
								<td>출판년도</td>
								<td><%=article.getPubdate()%></td>
							</tr>
							<tr>
								<td>첨부 내용</td>
								<td><%=article.getContent()%></td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td>
									<%
										if (article.getFile() != null) {
									%> <a class="file" href="sub4/file_down.jsp?file=<%=article.getFile()%>"><%=article.getFile()%></a>
									<%
										}
									%>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_inner">
					<%
						if(id != null) {
						if(id.equals(article.getId())) {
					%>
						<input type="button" class="btn" value="수정"
							onclick="location.href='RequestModifyForm.rq?num=<%=article.getNum()%>&page=<%=nowPage%>'">
						<input type="button" class="btn" value="삭제"
							onclick="location.href='RequestDeletePro.rq?num=<%=article.getNum()%>&page=<%=nowPage%>'">
						<input type="button" class="btn" value="목록"
							onclick="location.href='RequestList.rq?page=<%=nowPage%>'">
						<input type="button" class="btn" value="답변"
							onclick="location.href='RequestReplyForm.rq?num=<%=article.getNum()%>&page=<%=nowPage%>'">
					<%
						}}
					%>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<jsp:include page="../include/footer.jsp" />