<%@page import="vo.RequestBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
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
							<table summary="답글 작성" class="onebyone">
								<caption>답글 작성</caption>
								<colgroup>
									<col width="15%">
									<col width="*">
								</colgroup>
								<tbody>
	                            	<tr>
										<th>제목 <em><font color="red">(*)</font></em></th>
										<td><input type="text" name="subject" value="Re : <%=article.getSubject()%>" required="required"></td>
									</tr>
									<tr>
										<th>첨부 내용</th>
										<td><textarea name="content" required="required"></textarea></td>
									</tr>
								</tbody>
							</table>
							<div class="one-btn">
								<input type="submit" class="btn" value="작성">
								<a href="RequestList.rq" class="btn">목록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
</body>
<jsp:include page="../include/footer.jsp" />