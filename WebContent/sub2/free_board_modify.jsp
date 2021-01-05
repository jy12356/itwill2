<%@page import="vo.FreeBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");

int board_num = Integer.parseInt(request.getParameter("board_num"));
FreeBoardBean article = (FreeBoardBean) request.getAttribute("article");
String nowPage = request.getParameter("page");
%>
<jsp:include page="../include/header.jsp" />
<body>
	<form action="FreeBoardModifyPro.free" method="post" enctype="multipart/form-data" name="modifyForm">
		<input type="hidden" name="board_num"
			value="<%=article.getBoard_num()%>" /> <input type="hidden"
			name="page" value="<%=nowPage%>" />
		<%
			if (id == null) {
			id = "gang";
		}
		%>



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
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>

								<tbody>
									<tr>
										<!-- 제목 -->
										<td>제목</td>
										<td colspan="3"><input type="text" name="title"
											style="text-align: left;"
											value="<%=article.getBoard_subject()%>" required="required">
										</td>
									</tr>
									<tr>
										<td class="th">작성자</td>
										<td class="td"><input type="text" name="id"
											value="<%=article.getBoard_id()%>" readonly="readonly"></td>
										<td class="th">등록일</td>
										<td class="td"><%=article.getBoard_date()%></td>
									</tr>
									<tr>
										<!-- 										<td >첨부파일</td> -->
										<!-- 										<td colspan="3" class="td"> -->
										<%
// 											if (article.getBoard_file() != null) {
										%>
<!-- 										<a class="file" -->
<%-- 											href="sub2/file_down.jsp?downFile=<%=article.getBoard_file()%>"><%=article.getBoard_file()%></a> --%>
										<%
// 											}
										%>
										<!-- 										</td> -->
									</tr>
									<tr>
										<td class="th">내용</td>

										<td colspan="3" class="td">
											<p>
												<textarea name="desc" required="required"><%=article.getBoard_content()%></textarea>

											</p>
										</td>
									</tr>
									<tr>
										<td class="th">파일</td>
										<td colspan="3" class="td">
<%-- 											<img src='/FreeboardUpload/<%=article.getBoard_file()%>'> --%>
<%-- 										<input type="file" name="file" value="<%=article.getBoard_file()%>"> --%>
										<input type="file" name="file">
											<%
												if (article.getBoard_file() != null) {
											%> <a class="file" 
											href="sub2/file_down.jsp?downFile=<%=article.getBoard_file()%>"><%=article.getBoard_file()%></a>
											<%
												}
											%></td>
									</tr>
								</tbody>

							</table>
							<div class="btn_inner">
								<input type="submit" class="btn" value="수정"> 
									<input type="button" onClick="history.back();" class="btn" value="취소">
<!-- 								<a href="javascript:window.history.back();" class="btn">취소</a> -->
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
	</form>
</body>
<jsp:include page="../include/footer.jsp" />