<%@page import="vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int num = Integer.parseInt(request.getParameter("num"));
    String nowPage = request.getParameter("page");
	String id = (String) session.getAttribute("id");
	if (id == null) {
	id = "ㅇㅇ";
	}
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
                	<form action="NoticeBoardDeletePro.not" method="post"
                	enctype="multipart/form-data" name="notice_DeleteForm">
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
	                           <td colspan="3">
	                            공지사항이 삭제 됩니다.
	                            <input type="hidden" name="page" value=<%=nowPage %> >
	                            <input type="hidden" name="num" value=<%=num%> >
	                            <input type="hidden" name="id" value=<%=id %> >
	                            </td>
	                            </tr>
	                      
	                        </tbody>
	                    </table>
	                    <div class="default-btn-wrap">	
	                        <input type="submit" value="삭제" class="btn"value="삭제">
	                        <input type="button" value="목록" class="btn" onclick="location.href='NoticeBoardList.not?page=1'">
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>