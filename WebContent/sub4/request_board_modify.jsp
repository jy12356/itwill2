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
	<form action="RequestModifyPro.rq" method="post" name="modifyForm">
	<input type="hidden" name="num" value="<%=article.getNum()%>" />
	<input type="hidden" name="page" value="<%=nowPage%>" />
		<section class="sub">
			<div class="category-nav">
        		<div class="category-nav-inner">
           	 		<p>HOME > 희망도서 신청 목록 > 희망도서 신청</p>
        		</div>
			</div>
			<div class="contents-wrap">
				<div class="customer">
					<h3 class="coTitle">희망도서 신청</h3>
					<div class="customer-contents">
						<div class="customer-inner">

							<table summary="희망도서 신청" class="onebyone">
								<caption>희망도서 신청</caption>
								<colgroup>
									<col width="15%">
									<col width="*">
								</colgroup>
								<tbody>
								
	                            	<tr>
										<th>도서명 <em><font color="red">(*)</font></em></th>
										<td><input type="text" name="subject" value="<%=article.getSubject()%>" required="required"></td>
									</tr>
									<tr>
										<th>저자 <em><font color="red">(*)</font></em></th>
		                            	<td><input type="text" name="author" value="<%=article.getAuthor()%>" required="required"></td>
		                            </tr>
									<tr>
										<th>출판사<em><font color="red">(*)</font></em></th>
										<td><input type="text" name="author" value="<%=article.getPublisher()%>" required="required"></td>
									</tr>
									<tr>
										<th>출판년도 <em><font color="red">(*)</font></em></th>
										<td><input type="text" name="pubdate" value="<%=article.getPubdate()%>" required="required"></td>
									</tr>
									<tr>
										<th>ISBN</th>
										<td><input type="text" name="isbn" value="<%=article.getIsbn()%>" maxlength="13"></td>
									</tr>
									<tr>
										<th>첨부 내용 </th>
										<td><textarea name="content" value="<%=article.getContent()%>"></textarea></td>
									</tr>
									<tr>
										<th>파일첨부</th>
										<td>
											<%
												if (article.getFile() != null) {
											%> 
												<a href="sub4/file_down.jsp?downFile=<%=article.getFile()%>"><%=article.getFile()%></a>
											<%
												}
											%>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="one-btn"> 
								<input type="submit" class="btn" value="수정">
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