<%@page import="vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 글쓰기 폼
// String id = (String) session.getAttribute("id"); // 아이디가져오기
// if(id==null) { // 로긴안한상태면 로그인화면으로
// 	response.sendRedirect("../member.login.jsp");
// }
NoticeBean article = (NoticeBean)request.getAttribute("article");
    String nowPage = request.getParameter("page");
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
	                        <div class="select-wrap">
											<div class="one-sel">
												<p class="one-select">
													분류 선택
												</p>
												<ul class="one-list sel1" >
												<li data-num="1"><input type="hidden" name="kind" id="kind" value="공지">공지</li>
												<li data-num="2"><input type="hidden" name="kind" id="kind" value="공지2">공지2</li>
												<li data-num="3"><input type="hidden" name="kind" id="kind" value="공지3">공지3</li>
												<li data-num="4"><input type="hidden" name="kind" id="kind" value="공지4">공지4</li>
												</ul>
											</div>
							</div>
	                            <tr>
	                                <td>제목</td>
	                                <td colspan="3">
	                                	<input type="text" name="subject">
	                                </td>
	                            </tr>
	                            
	                            <tr>
	                            	<td>작성자</td>
	                            	<td colspan="3">
	                            		<input type="text" name="id">
	                            	</td>
<!-- 	                            	<td class="th">비밀번호</td> -->
<!-- 	                            	<td> -->
<!-- 	                            		<input type="text" name="pass"> -->
<!-- 	                            	</td> -->
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
	                        <input type="button" value="목록" class="btn" onclick="history.back()">
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>