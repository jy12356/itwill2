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
// if(id==null) { // 로긴안한상태면 로그인화면으로
// 	response.sendRedirect("../member.login.jsp");
// }
%>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 공지사항<a href="NoticeBoardList.not"></a></p>
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

	                            <div>
	                            	<input type="hidden" name="page" value="<%=nowPage %>" />
	                            	<input type="hidden" name="num" value=<%=article.getNum() %>>
	                            </div>
	                            <tr>
	                                <td>제목</td>
	                                <td colspan="3">
	                                	<input type="text" name="subject" required="required" value=<%=article.getSubject() %> />
	                                	
	                                </td>
	                            </tr>
										<tr>
										<td class="th">작성자</td>
										<td class="td"><input type="text" name="id"
											value="<%=article.getId()%>" readonly="readonly"></td>
										<td class="th">등록일</td>
										<td class="td"><%=article.getDate()%></td>
									</tr>
	                            
<!-- 	                            	<td class="th">비밀번호</td> -->
<!-- 	                            	<td> -->
<!-- 	                            		<input type="text" name="pass"> -->
<!-- 	                            	</td> -->
	                            <tr>
	                                <td class="th">내용</td>
	                                <td colspan="3" class="td">
	                               <p>
												<textarea name="content" required="required"><%=article.getContent() %></textarea>

											</p>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="th">파일</td>
	                            	<td colspan="3">
	                            	<%=article.getFile() %>
	                            	<input type="file" name="file" value=<%=article.getFile() %>>
	                            	</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                    <div class="btn_inner">	
	                    	<input type="submit" value="수정" class="btn">&nbsp;&nbsp;
	                        <input type="button" value="취소" class="btn" onclick="history.back()">
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>