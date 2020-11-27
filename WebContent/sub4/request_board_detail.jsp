<%@page import="vo.RequestBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
		id="id";
	RequestBean article = (RequestBean)request.getAttribute("article");
	String nowPage = request.getParameter("page");
%>    
<jsp:include page="../include/header.jsp"/>
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
                    <table summary="게시판" class="onebyone">
                        <caption>희망도서 신청</caption>
                        <colgroup>
                            <col width="100px">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>도서명</th>
                                <td><%= article.getSubject() %></td>
                            </tr>
                              <tr>
                                <th>저자</th>
                                <td><%= article.getAuthor() %></td>
                            </tr>
                            <tr>
                                <th>출판사</th>
                                <td><%= article.getPublisher() %></td>
                            </tr>
                            <tr>
                                <th>출판년도</th>
                                <td><%= article.getPubdate() %></td>
                            </tr>
                            <tr>
                                <th>ISBN</th>
                                <td><%= article.getIsbn() %></td>
                            </tr>
                            <tr>
                                <th>첨부 내용</th>
                                <td><%= article.getContent() %></td>
                            </tr>
                             <tr>
                                <th>첨부파일</th>
                                <td><%
									if(article.getFile() != null) {
									%> <a href="sub2/file_down.jsp?file=<%=article.getFile()%>"><%=article.getFile()%></a><%
									} %>
								</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="one-btn">
                        <input type="button" value="수정" onclick="location.href='RequestModifyForm.rq?num=<%=article.getNum()%>&page=<%=nowPage%>'">
						<input type="button" value="삭제" onclick="location.href='RequestDeletePro.rq?num=<%=article.getNum()%>&page=<%=nowPage%>'">
						<input type="button" value="목록" onclick="location.href='RequestList.rq?page=<%=nowPage%>'">
						<input type="button" value="답변" onclick="location.href='RequestReplyForm.rq?num=<%=article.getNum()%>&page=<%=nowPage%>'">  
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>