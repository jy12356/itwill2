<%@page import="vo.FreeBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	FreeBoardBean article = (FreeBoardBean)request.getAttribute("article");
	String nowPage = request.getParameter("page");
%>
<jsp:include page="../include/header.jsp" />
<body>
	<form action="FreeBoardModifyPro.free" method="post" name="modifyForm">
	<input type="hidden" name="board_num" value="<%=article.getBoard_num()%>" />
	<input type="hidden" name="page" value="<%=nowPage%>" />
		<section class="sub">
			<div class="category-nav">
				<div class="category-nav-inner">
					<p>
						<a href="">HOME</a> > <a href="FreeBoardList.free">게시판</a>
					</p>
				</div>
			</div>
			<div class="contents-wrap">
				<div class="customer">
					<h3 class="coTitle">게시판</h3>
					<div class="customer-contents">
						<div class="customer-inner">

							<table summary="게시판" class="customer-notice">
								<caption>게시판</caption>
								<colgroup>
									<col width="15%">
									<col width="*">
								</colgroup>

								<tbody>
									<tr>
										<td>제목</td>
										<td><input type="text" name="title" value="<%=article.getBoard_subject()%>" required="required" > </td>
									</tr>
									 <tr>
	                            	<td>작성자</td>
	                            	<td colspan="3">
	                            		<input type="text" name="id" value="<%=article.getBoard_id()%>" readonly="readonly">
	                            	</td>
	                            </tr>
									<tr>
										<td>등록일</td>
										<td><%=article.getBoard_date()%></td>
									</tr>
									<tr>
										<td>첨부파일</td>
										<td>
											<%
												if (article.getBoard_file() != null) {
											%> <a
											href="sub2/file_down.jsp?downFile=<%=article.getBoard_file()%>"><%=article.getBoard_file()%></a>
											<%
												}
											%>
										</td>
									</tr>
									<tr>
										<td>내용</td>
										
										<td>
											<p>
											  <textarea name="desc" required="required" ><%=article.getBoard_content()%></textarea>
												
											</p>
										</td>
									</tr>
								</tbody>

							</table>
							<span class="default-btn-wrap"> 
								<input type="submit" class="btn" value="수정">
							</span>
							<span class="default-btn-wrap"> 
								<a href="javascript:window.history.back();" class="btn">취소</a>
							</span>
						</div>
					</div>

				</div>
			</div>
		</section>
	</form>
</body>
<jsp:include page="../include/footer.jsp" />