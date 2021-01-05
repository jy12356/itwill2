<%@page import="vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 글쓰기 폼
String id = (String) session.getAttribute("id"); // 아이디가져오기
if(id==null) { // 로긴안한상태면 로그인화면으로
	response.sendRedirect("MemberLoginForm.me");
}
NoticeBean article = (NoticeBean)request.getAttribute("article");
    String nowPage = request.getParameter("page");
%>

<jsp:include page="../include/header.jsp"/>

						<script>
						
						
                         </script>
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
	                                <td>제목</td>
	                                <td colspan="3">
	                                	<input type="text" name="subject">
	                                </td>
	                            </tr>
	                            
	                            <tr>
	                            	<td>작성자</td>
	                            	<td colspan="3">
	                            		<input type="text" name="id" value="<%=id%>" readonly="readonly">
	                            	</td>
	                            </tr>
	                            <tr>
	                                <td>내용</td>
	                                <td colspan="3">
	                                    <textarea name="content"></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>파일</td>
	                            	<td colspan="3">
	                            		<input type="file" name="file">
	                            	</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                    <div class="default-btn-wrap">
	                    	<input type="submit" class="btn" value="글쓰기">
	                    	<a href="NoticeBoardList.not" class="btn">목록</a>
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>