<%@page import="vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    NoticeBean article = (NoticeBean)request.getAttribute("article");
    String nowPage = request.getParameter("page");
    %>
<% 
// 글쓰기 폼
String id = (String) session.getAttribute("id"); // 아이디가져오기

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
	                        <caption>공지사항</caption>
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
	                        <tbody>
<!-- 	                            <tr> -->
<!-- <!-- 	                            <td>글 번호</td> -->
<!-- 	                            <td colspan="3"> -->
<%-- 	                            <%=article.getNum() %> --%>
<%-- 	                            	<input type="hidden" name="page" value="<%=nowPage %>" /> --%>
<%-- 	                            	<input type="hidden" name="num" value=<%=article.getNum() %>> --%>
<!-- 	                            	</td> -->
<!-- 	                            </tr> -->
	                            <tr>
<!-- 	                                <td>제목</td> -->
	                                <td colspan="4">
	                                	<%=article.getSubject() %>
	                                </td>
	                            </tr>
	                            <tr>
								<td class="th">작성자</td>
								<td class="td"><%=article.getId() %></td>
								<td class="th">등록일</td>
								<td class="td"><%=article.getDate() %></td>
							</tr>
	                            <tr>
	                                <td>파일</td>
	                            	<td colspan="3">
	                            		<%
				if(article.getFile() != null) {
					%> <a href="sub5/notice_file_down.jsp?file_name=<%=article.getFile()%>"><%=article.getFile() %></a> <%
				}
			%>
	                            	</td>
	                            </tr>
	                            <tr>
	                                <td class = "th">내용</td>
	                                <td colspan="3" class = "td">
	                                <p>
	                                    <%=article.getContent() %>
	                                </p>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                    <div class="btn_inner">	
	                        <input type="button" value="목록" class="btn" onclick="location.href='NoticeBoardList.not?page=1'">
	                   <%
	                   
							                        if(id != null) {
						                        	if(id.equals(article.getId()) || id.equals("admin")){
						%> 
	                    	<input type="button" value="수정" class="btn" onclick="location.href='NoticeBoardModifyForm.not?num=<%=article.getNum()%>&page=<%=nowPage%>'">
	                       <input type="button" value="삭제" class="btn" onclick="location.href='NoticeBoardDelete.not?num=<%=article.getNum()%>&page=<%=nowPage%>'">
	                       	<%
						                        	}
					                        }
					%>
	                       
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>