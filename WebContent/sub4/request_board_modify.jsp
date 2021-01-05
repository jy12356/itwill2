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
	<input type="hidden" name="num" value="<%=article.getNum()%>" />
	<input type="hidden" name="page" value="<%=nowPage%>" />
	<input type="hidden" name="id" value="id" />
		<section class="sub">
			<div class="category-nav">
        		<div class="category-nav-inner">
           	 		<p>HOME > 희망도서 신청 목록 > 신청도서 수정</p>
        		</div>
			</div>
			<div class="contents-wrap">
				<div class="customer">
					<h3 class="coTitle">희망도서 신청</h3>
					<div class="customer-contents">
						<div class="customer-inner">
						<form action="RequestModifyPro.rq"  method="post" enctype="multipart/form-data"  name="request_board_write">
							<table summary="희망도서 신청" class="onebyone">
								<caption>희망도서 신청</caption>
								<colgroup>
									<col width="15%">
									<col width="*">
								</colgroup>
								<tbody>
		                        	<tr>
			                            <th>신청자</th>
			                            <td colspan="3">
			                            	<input type="hidden" name="num" value="<%=article.getNum()%>">
                   				            <input type="hidden" name="page" value="<%=nowPage%>">
			                            	<input type="text" name="id" value="<%=id%>" readonly="readonly">
			                            </td>
			                        </tr>
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
										<td><input type="text" name="publisher" value="<%=article.getPublisher()%>" required="required"></td>
									</tr>
									<tr>
										<th>출판년도 <em><font color="red">(*)</font></em></th>
										<td><input type="text" name="pubdate" value="<%=article.getPubdate()%>" required="required"></td>
									</tr>
									<tr>
										<th>첨부 내용 </th>
										<td><textarea name="content"><%=article.getContent()%></textarea></td>
									</tr>
									<tr>
										<th>파일첨부</th>
										<td>
										<input type="file" name="file">
										<p class="one-s-ps">*2MB 이하의 이미지 파일 및 5MB  이하의 *hwp, *doc, *docx 확장자만 첨부 가능합니다.</p>
										</td>
										<td>
											<%
												if (article.getFile() != null) {
											%> 
												<a class="file" href="sub4/file_down.jsp?file=<%=article.getFile()%>"><%=article.getFile()%></a>
											<%
												}
											%>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn_inner"> 
								<input type="submit" class="btn" value="수정">
								<input type="button" class="btn" value="목록" onclick="location.href='RequestList.rq'">
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
<jsp:include page="../include/footer.jsp" />