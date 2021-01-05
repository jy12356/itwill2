<%@page import="vo.RequestBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	if(id==null) {
		id = "비회원";
	}
	RequestBean article = (RequestBean)request.getAttribute("article");
	String nowPage = request.getParameter("page");
%>
<jsp:include page="../include/header.jsp"/>
<body>
	<form action="RequestReplyPro.rq" method="post" name="replyForm">
<!-- 	<input type="hidden" name="id" value="id" /> -->
	<input type="hidden" name="num" value="<%=article.getNum()%>" />
	<input type="hidden" name="page" value="<%=nowPage%>" />
	<input type="hidden" name="re_ref" value="<%=article.getRe_ref() %>" />
	<input type="hidden" name="re_lev" value="<%=article.getRe_lev() %>" />
	<input type="hidden" name="re_seq" value="<%=article.getRe_seq() %>" />
		<section class="sub">
			<div class="category-nav">
        		<div class="category-nav-inner">
           	 		<p>HOME > 희망도서 신청 목록 > 희망도서 신청 > 답글 작성</p>
        		</div>
			</div>
			<div class="contents-wrap">
				<div class="customer">
					<h3 class="coTitle">답글 작성</h3>
					<div class="customer-contents">
						<div class="customer-inner">
							<table summary="답글 작성" class="customer-notice">
								<caption>답글 작성</caption>
								<colgroup>
									<col width="15%">
		                            <col width="35%">
		                            <col width="15%">
		                            <col width="35%">
								</colgroup>
								<tbody>
			                       <tr>
			                            <td>신청자</td>
			                            <td colspan="3">
			                            	<input type="hidden" name="rid" value="<%=article.getId() %>">
			                            	<input type="text" name="id" value="관리자" readonly="readonly">
			                            </td>
			                        </tr>
	                            	<tr>
										<td>제목</td>
										<td colspan="3"><input type="text" id="subject" name="subject" value="Re : <%=article.getSubject()%>" required="required" readonly></td>
									</tr>
									<tr>
										<td>저자</td>
										<td colspan="3"><input type="text" id="author" name="author" value="<%=article.getAuthor()%>" required="required" readonly></td>
									</tr>
									<tr>
										<td>출판사</td>
										<td colspan="3"><input type="text" id="publisher" name="publisher" value="<%=article.getPublisher()%>" required="required" readonly></td>
									</tr>
									<tr>
										<td>출판년도</td>
										<td colspan="3"><input type="text" id="pubdate" name="pubdate" value="<%=article.getPubdate()%>" required="required" readonly></td>
									</tr>
									<tr>
										<td>첨부 내용</td>
										<td colspan="3"><textarea name="content" id="content"></textarea>
		                                </td>
									</tr>
								</tbody>
							</table>
							<div class="btn_inner">
								<input type="submit" class="btn" value="작성">
								<input type="button" class="btn" value="목록" onclick="location.href='RequestList.rq'">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
</body>
<jsp:include page="../include/footer.jsp" />