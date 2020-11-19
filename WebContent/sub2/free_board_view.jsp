<%@page import="vo.FreeBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
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
                            <col width="15%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>제목</td>
                                <td><%= article.getBoard_subject() %></td>
                            </tr>
                            <tr>
                                <td>등록일</td>
                                <td><%= article.getBoard_date() %></td>
                            </tr>
                             <tr>
                                <td>첨부파일</td>
                                <td><%
				if(article.getBoard_file() != null) {
					%> <a href="sub2/file_down.jsp?downFile=<%=article.getBoard_file()%>"><%=article.getBoard_file() %></a> <%
				}
			%></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <p>
                                        <%= article.getBoard_content() %>
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <span class="default-btn-wrap">
                        <a href="FreeBoardList.free" class="btn">목록</a></span>
                        <%
//                         if(id != null) {
//                         	if(id.equals(article.getBoard_id())) {
                        		%>
                        		<span class="default-btn-wrap">
                        <a href="FreeBoardModifyForm.free?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>" class="btn">수정</a></span>
                        		<span class="default-btn-wrap">
                        <a href="FreeBoardDeleteForm.free?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>" class="btn">삭제</a></span>
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