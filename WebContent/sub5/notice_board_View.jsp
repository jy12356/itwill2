<%@page import="vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    NoticeBean article = (NoticeBean)request.getAttribute("article");
    String nowPage = request.getParameter("page");
    %>
<% 
// 글쓰기 폼
// String id = (String) session.getAttribute("id"); // 아이디가져오기
// if(id==null) { // 로긴안한상태면 로그인화면으로
// 	response.sendRedirect("../member.login.jsp");
// }
%>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p><a href="../main/index.jsp">HOME</a> > 공지사항</p>
        </div>
    </div>
    <div class="contents-wrap">
        <div class="customer">
            <h3 class="coTitle">공지사항 작성</h3> 
            <div class="customer-contents">
                <div class="customer-inner">
                	<form action="NoticeBoardWritePro.not" method="post"
                	enctype="multipart/form-data" name="notice_writeForm">
	                    <table summary="게시판" class="customer-notice">
	                        <caption>게시판</caption>
	                        <colgroup>
	                            <col width="15%">
	                            <col width="35%">
	                            <col width="15%">
	                            <col width="35%">
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                            <td>글 번호</td>
	                            <td colspan="3">
	                            <%=article.getNum() %>
	                            	<input type="hidden" name="page" value="<%=nowPage %>" />
	                            	<input type="hidden" name="num" value=<%=article.getNum() %>>
	                            	</td>
	                            </tr>
	                            <tr>
	                                <td>제목</td>
	                                <td colspan="3">
	                                	<%=article.getSubject() %>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td>작성자</td>
	                            	<td colspan="3">
	                            		<%=article.getId() %>
	                            	</td>
<!-- 	                            	<td class="th">비밀번호</td> -->
<!-- 	                            	<td> -->
<!-- 	                            		<input type="text" name="pass"> -->
<!-- 	                            	</td> -->
	                            </tr>
	                            <tr>
	                                <td>파일</td>
	                            	<td colspan="3">
	                            		<%
				if(article.getFile() != null) {
					%> <a href="sub5/file_down.jsp?downFile=<%=article.getFile()%>"><%=article.getFile() %></a> <%
				}
			%>
	                            	</td>
	                            </tr>
	                            <tr>
	                                <td>내용</td>
	                                <td colspan="3">
	                                    <%=article.getContent() %>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                    <div class="default-btn-wrap">	
	                    	<input type="button" value="수정" class="btn" onclick="location.href='NoticeBoardModifyForm.not?num=<%=article.getNum()%>&page=<%=nowPage%>'">
	                        <input type="button" value="삭제" class="btn" onclick="location.href='NoticeBoardDelete.not?num=<%=article.getNum()%>&page=<%=nowPage%>'">
	                        <input type="button" value="목록" class="btn" onclick="location.href='NoticeBoardList.not?page=1'">
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>