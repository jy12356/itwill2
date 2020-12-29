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
                	<form action="NoticeBoardModifyPro.not" method="post"
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
<!-- 	                        <div class="select-wrap"> -->
<!-- 											<div class="one-sel"> -->
<!-- 												<p class="one-select"> -->
<!-- 													분류 선택 -->
<!-- 												</p> -->
<!-- 												<ul class="one-list sel1" > -->
<!-- 												<li data-num="1"><input type="hidden" name="kind" id="kind" value="공지">공지</li> -->
<!-- 												<li data-num="2"><input type="hidden" name="kind" id="kind" value="공지2">공지2</li> -->
<!-- 												<li data-num="3"><input type="hidden" name="kind" id="kind" value="공지3">공지3</li> -->
<!-- 												<li data-num="4"><input type="hidden" name="kind" id="kind" value="공지4">공지4</li> -->
<!-- 													<li data-num="1" value="">오류문의</li> -->
<!-- 													<li data-num="2" value="">작품관련 문의</li> -->
<!-- 													<li data-num="3" value="">취소/환불/현금영수증 발급</li> -->
<!-- 													<li data-num="4" value="">이용관련 문의</li> -->
<!-- 												</ul> -->
<!-- 											</div> -->
<!-- 											</div> -->
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
	                                	<input type="text" name="subject" required="required" value=<%=article.getSubject() %> />
	                                	
	                                </td>
	                            </tr>
	                            
	                            <tr>
	                            	<td>작성자</td>
	                            	<td colspan="3">
	                            	<input type="text" name="id" required="required" value=<%=article.getId() %> />
	                            	</td>
<!-- 	                            	<td class="th">비밀번호</td> -->
<!-- 	                            	<td> -->
<!-- 	                            		<input type="text" name="pass"> -->
<!-- 	                            	</td> -->
	                            </tr>
	                            <tr>
	                                <td>내용</td>
	                                <td colspan="3">
	                                <input type="text" name="content" required="required" value=<%=article.getContent() %> />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>파일</td>
	                            	<td colspan="3">
	                            	<%=article.getFile() %>
	                            	<input type="file" name="file" value=<%=article.getFile() %>>
	                            	</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                    <div class="default-btn-wrap">	
	                    	<input type="submit" value="수정" class="btn">&nbsp;&nbsp;
	                        <input type="button" value="목록" class="btn" onclick="history.back()">
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>