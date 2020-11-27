<%@page import="vo.CommentBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.FreeBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
if (id == null) {
	id = "gang";
}
FreeBoardBean article = (FreeBoardBean) request.getAttribute("article");
String nowPage = request.getParameter("page");
%>
<jsp:include page="../include/header.jsp" />
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>
				<a href="main/index.jsp">HOME</a> > 게시판
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
								<td colspan="4"><%=article.getBoard_subject()%></td>

							</tr>
							<tr>
								<td class="th">작성자</td>
								<td class="td"><%=article.getBoard_id()%></td>
								<td class="th">등록일</td>
								<td class="td"><%=article.getBoard_date()%></td>
							</tr>
							<tr>
								<td class="th">첨부파일</td>
								<td colspan="3" class="td">
									<%
										if (article.getBoard_file() != null) {
									%> <a class="file"
									href="sub2/file_down.jsp?file=<%=article.getBoard_file()%>"><%=article.getBoard_file()%></a>
									<%
										}
									%>
								</td>
							</tr>
							<tr>
								<td class="th">내용</td>
								<td colspan="3" class="td">
									<p>
										<%=article.getBoard_content()%>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_inner">
						<a href="FreeBoardList.free" class="btn">목록</a>
						<%
							//                         if(id != null) {
						//                         	if(id.equals(article.getBoard_id())) {
						%>

						<a
							href="FreeBoardModifyForm.free?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>"
							class="btn">수정</a> <a
							href="FreeBoardDeletePro.free?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>&id=<%=article.getBoard_id()%>"
							class="btn">삭제</a>
					</div>
					<%
						//                         	}
					//                         }
					%>

				</div>
			</div>
			<!-- 댓글 ------------------------------------------------------------------------------>
			<%
			ArrayList<CommentBean> commentList = (ArrayList<CommentBean>) request.getAttribute("commentList");
			PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
			int commentnowPage = pageInfo.getPage();
			int maxPage = pageInfo.getMaxPage();
			int startPage = pageInfo.getStartPage();
			int endPage = pageInfo.getEndPage();
			int listCount = pageInfo.getListCount();
			%>
			<div class="comment_inner">
				<div class="tab">
					<ul class="tab-list orderYN">
						<!-- 댓글 리스트 -->
						<li><a href="javascript:;" class="on" data-order="False">댓글</a></li>
						<!--li><a href="javascript:;" class="" data-order="True">구매자</a></li-->
					</ul>
					<div id="comment">
						<!-- 댓글이 없을떄 -->
						<%
							if (commentList == null && listCount < 0) {
						%>

						<div class="comment_list">

							<p class="no">댓글이 없습니다.</p>
						</div>
						
						<!-- 댓글이 있을때 -->
						<%
							} else if (commentList != null && listCount > 0) {
						
							// 게시물 목록 불러오기
// 							for(int i = 0; i < commentList.size(); i++) {
						%>
						<div class="comment_list">
							<%for(int i=0; i < commentList.size(); i++){ %>
							<div class="comment">
								<p class="comment-vote">
									<i><%=commentList.get(i).getComment_id() %></i><em>|</em> <span class="date"><%=commentList.get(i).getDate() %></span><em>|</em>
									댓글 <%=commentList.get(i).getRe_lev() %>
								</p>
								<div class="comment-content">
									<span><%=commentList.get(i).getComment_desc() %></span>
								</div>
								<div class="comment-btn">
									<div>
										<a href="javascript:;" class="comment_modify_show" data-comment-count="0">수정</a> 
										<a href="javascript:;" class="comment_write_show" data-comment-count="0">댓글</a>
									</div>
								</div>
							</div>
				<!-- 대댓글 ------------------------------------------->
							<form action="CommentReply.free" method="post" class="comment-write reply-write" style="display: none;">
<!-- 							<div class="comment-write reply-write" data-review-num="536286"	data-comment-num="" style="display: none;"> -->
<%-- <input type="hidden" name="page" value="<%=request.getParameter("page") %>" /> --%>
<%-- 			<input type="hidden" name="board_num" value="<%=article.getBoard_num() %>" /> --%>
<%-- 			<input type="hidden" name="board_re_ref" value="<%=article.getBoard_re_ref() %>" /> --%>
<%-- 			<input type="hidden" name="board_re_lev" value="<%=article.getBoard_re_lev() %>" /> --%>
<%-- 			<input type="hidden" name="board_re_seq" value="<%=article.getBoard_re_seq() %>" /> --%>
							<input type="hidden" name="board_type" value="1"> 
							<input type="hidden" name="page" value=<%=nowPage %>>
							<input type="hidden" name="board_num" value="<%=article.getBoard_num()%>"> 
							<input type="hidden" name="comment_id" value="<%=id%>">
								<input type="hidden" name="" value="">
								<textarea name="comment_desc"></textarea>
								<p>
									<span><em>0</em>/500자</span>
<!-- 									<button name="" class="cancel">취소</button> -->
<!-- 									<button name="" class="commit">등록</button> -->
								</p>
									<div class="btn_inner">
									<input type="submit" value="등록" class="btn">
									<input type="button" value="취소" class="btn" onclick="history.back()">
									</div>
<!-- 							</div> -->
							</form>
				<!-- 대댓글 ------------------------------------------->
							<%
								}
							}
							%>
						</div>
						<div class="d-more reviewMore" style="display: none;">
							<a href="javascript:;">20개 더보기</a>
						</div>
					</div>
				</div>
				<!------------------------------ 댓글쓰기 ---------------------------------------------------->
				<div class="comment-text-area">
					<form action="CommentWritePro.free" method="post">
						<div class="comment-text" style="display: block;">
							<h3 class="coTitle tal">댓글쓰기</h3>
							<input type="hidden" name="board_type" value="1"> 
							<input type="hidden" name="page" value=<%=nowPage %>>
							<input type="hidden" name="board_num" value="<%=article.getBoard_num()%>"> 
							<input type="hidden" name="comment_id" value="<%=id%>">
							<textarea name="comment_desc" placeholder="작품과 무관한 광고, 욕설 및 비방, 청소년보호정책에 위배되는 내용은 사전 동의 없이 비공개 처리될 수 있습니다."></textarea>
							<div class="btn_inner">
								<input type="submit" class="btn reviewInput" value="등록">
								<a href="javascript:;" class="btn reviewCancel">취소</a>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>

	</div>

</section>




<jsp:include page="../include/footer.jsp" />