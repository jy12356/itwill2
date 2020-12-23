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
			<p>HOME > 내 메세지확인 </p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="customer">
			<h3 class="coTitle">메세지</h3>
			<div class="customer-contents">
				<div class="customer-inner">
					<table summary="게시판" class="onebyone customer-notice">
						<caption>메세지 상세보기</caption>
						<colgroup>
							<col style="width: 22%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<td>저자</td>
								<td><%=article.getAuthor()%></td>
							</tr>
							<tr>
								<td colspan="2"><%= %></td>
								
							</tr>
						</tbody>
					</table>
					<div class="btn_inner">
						<input type="button" class="btn" value="수정"
							onclick="location.href='RequestModifyForm.rq?num=<%=article.getNum()%>&page=<%=nowPage%>'">
						<input type="button" class="btn" value="삭제"
							onclick="location.href='RequestDeletePro.rq?num=<%=article.getNum()%>&page=<%=nowPage%>'">
						<input type="button" class="btn" value="목록"
							onclick="location.href='RequestList.rq?page=<%=nowPage%>'">
						<input type="button" class="btn" value="답변"
							onclick="location.href='RequestReplyForm.rq?num=<%=article.getNum()%>&page=<%=nowPage%>'">
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<jsp:include page="../include/footer.jsp" />