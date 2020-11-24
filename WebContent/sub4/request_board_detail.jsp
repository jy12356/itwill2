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
                            <col width="15%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>도서명</td>
                                <td><%= article.getSubject() %></td>
                            </tr>
                              <tr>
                                <td>저자</td>
                                <td><%= article.getAuthor() %></td>
                            </tr>
                            <tr>
                                <td>출판사</td>
                                <td><%= article.getPublisher() %></td>
                            </tr>
                            <tr>
                                <td>출판년도</td>
                                <td><%= article.getPubdate() %></td>
                            </tr>
                            <tr>
                                <td>ISBN</td>
                                <td><%= article.getIsbn() %></td>
                            </tr>
                            <tr>
                                <td>첨부 내용</td>
                                <td><%= article.getContent() %></td>
                            </tr>
                             <tr>
                                <td>첨부파일</td>
                                <td><%
									if(article.getFile() != null) {
									%> <a href="sub2/file_down.jsp?file=<%=article.getFile()%>"><%=article.getFile()%></a><%
									} %>
								</td>
                            </tr>
                        </tbody>
                    </table>
                    <span class="default-btn-wrap">
                        <a href="RequestList.rq" class="btn">목록</a></span>
                        <%
//                         if(id != null) {
//                         	if(id.equals(article.getBoard_id())) {
                        		%>
                        		<span class="default-btn-wrap">
                        <a href="RequestModifyForm.rq?num=<%=article.getNum()%>&page=<%=nowPage%>&id=<%=id %>" class="btn">수정</a></span>
                        		<span class="default-btn-wrap">
                        <a href="RequestDeletePro.rq?num=<%=article.getNum()%>&page=<%=nowPage%>&id=<%=id %>" class="btn">삭제</a></span>
                        		<% 
//                         	}
//                         }
                        %>
                    
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>