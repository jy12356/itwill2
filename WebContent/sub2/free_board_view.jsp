<%@page import="vo.FreeBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
// 	if(id==null) {
// 		id = "gang";
// 	}
	FreeBoardBean article = (FreeBoardBean)request.getAttribute("article");
	String nowPage = request.getParameter("page");
%>    
<jsp:include page="../include/header.jsp"/>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p><a href="main/index.jsp">HOME</a> > 게시판</p>
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
                            <tr> <!-- 제목 -->
                                <td colspan="4"><%= article.getBoard_subject() %></td>
                                
                            </tr>
                              <tr>
                                <td class="th">작성자</td>
                                <td class="td"><%= article.getBoard_id() %></td>
                                <td class="th">등록일</td>
                                <td class="td"><%= article.getBoard_date() %></td>
                            </tr>
                             <tr>
                                <td class="th">첨부파일</td>
                                <td colspan="3" class="td"><%
				if(article.getBoard_file() != null) {
					%> <a class="file" href="sub2/file_down.jsp?file=<%=article.getBoard_file()%>"><%=article.getBoard_file()%></a><%
				}
			%></td>
                            </tr>
                            <tr>
                                <td class="th">내용</td>
                                <td colspan="3" class="td">
                                    <p>
                                        <%= article.getBoard_content() %>
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
                        		
                        <a href="FreeBoardModifyForm.free?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>" class="btn">수정</a>
                        		
                        <a href="FreeBoardDeletePro.free?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>&id=<%=article.getBoard_id()%>" class="btn">삭제</a>
                   </div>
                        		<% 
//                         	}
//                         }
                        %>
                    
                </div>
            </div>

        </div>
    </div>

</section>

<!-- <section> -->
<!-- 댓글목록 -->
<!-- 			<div id="comment"> -->
<!-- 				<ul> -->
<%-- 				<% --%>
<!-- // 					for (int i = 0; i < commentList.size(); i++) { -->
<!-- // 					cb = (CommentBean) commentList.get(i); -->
<%-- 				%> --%>
<%-- 				<li class="clear a"><%=cb.getComment_id()%></li> --%>
<%-- 				<li class="c-size"><%=cb.getComment_content()%></li> --%>

<!-- 				<li class="f-right"> -->
<%-- 					<% --%>
<!-- // 						if (id != null) { -->
<!-- // 							if (id.equals(cb.getComment_id())) { -->
<%-- 					%> <a href="c_updateForm.jsp?num=<%=bb.getNum()%>&cnum=<%=cb.getCnum()%>&comment_content=<%=cb.getComment_content()%>">수정</a> /  --%>
<%-- 					<a href="c_delete.jsp?content_num=<%=bb.getNum()%>&cnum=<%=cb.getCnum()%>">삭제</a>  --%>
<%-- 					<% --%>
<!-- //  							} else { -->
<%--  								%><a href="commentcomment.jsp?num=<%=bb.getNum()%>&cnum=<%=cb.getCnum()%>">답글</a> --%>
 								
<%--  								<%  --%>
<!-- //  							} -->
							
<!-- // 						 } -->
<%--  					%> --%>
<!-- 				</li> -->
<%-- 				<% --%>
<!-- // 					} -->
<%-- 				%> --%>
<!-- 					</ul> -->
<!-- 				</div> -->

<!-- <table> -->
<!-- 				<tr> -->
<!-- 					<td colspan="3"> -->
<!-- 						<form action="commentPro.jsp" method="post"> -->
<%-- 							<input type="hidden" name="content_num" value="<%=num%>"> --%>
<%-- 							<input type="hidden" name="id" value="<%=id%>"> <input --%>
<!-- 								type="hidden" name="board_type" value="1"> -->
<%-- 							    						<input type="hidden" name="comment_num" value="<%=no %>"> --%>
<!-- 							<textarea name="comment_content" rows="4" cols="90" -->
<!-- 								placeholder="댓글 입력" required></textarea> -->
<%-- 								<% --%>
								
<%-- 								%> --%>
<!-- 							<span style="float: right;"><input type="submit" -->
<!-- 								value="댓글등록"></span> -->
<!-- 						</form> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->


<!-- </section> -->

<jsp:include page="../include/footer.jsp"/>