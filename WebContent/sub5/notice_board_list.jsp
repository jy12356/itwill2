<%@page import="vo.PageInfo"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
// if(id==null) { // 로긴안한상태면 로그인화면으로
// 	response.sendRedirect("../member.login.jsp");
// }

// 전달받은 request 객체로부터 데이터 가져오기
// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
// 전부 Object타입이라 형변환 필요
ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList");
PageInfo PageInfo = (PageInfo) request.getAttribute("PageInfo");
int nowPage = PageInfo.getPage();
int maxPage = PageInfo.getMaxPage();
int startPage = PageInfo.getStartPage();
int endPage = PageInfo.getEndPage();
int listCount = PageInfo.getListCount();
%>

<jsp:include page="../include/header.jsp" />

<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>
				<a href="../main/index.jsp">HOME</a> > 게시판
			</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="customer">
			<h3 class="coTitle">공지사항</h3>
<!-- 				<div class="boxmenu1-top-menu"> -->
<!-- 				<ul> -->
<!-- 					<li class="on"><a href="NoticeBoardList.not?page=1"><em>공지사항</em></a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
			<div class="customer-contents">
				<div class="customer-inner">
					<table summary="공지사항" class="customer-table notice">

						<caption>공지사항</caption>
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 50%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
							<col style="width: 7%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" abbr="번호">	번호</th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="작성자">작성자</th>
								<th scope="col" abbr="등록일">등록일</th>
							</tr>
						</thead>
						<tbody>
						<%
							if (articleList.size() != 0) {
								for (int i = 0; i < articleList.size(); i++) {
							%>
							<tr>
								<td align="center" class = "tac"><%=articleList.get(i).getNum()%></td>
								<td class = "tac">
								<a href="NoticeBoardDetail.not?num=<%=articleList.get(i).getNum()%>">
										<%=articleList.get(i).getSubject()%></a>
								</td>
								<td align="center"><%=articleList.get(i).getId()%></td>
								<td align="center"><%=articleList.get(i).getDate()%></td>
							</tr>
							<%
								}
							%>
							<%
							} else {
							%><tr id="emptyArea"><td colspan="4" class="tac">작성된 글이 없습니다</td></tr>
							<%
							}
							%>
						</tbody>
					</table>
					 <%
	                   
							                        if(id != null) {
						                        	if( id.equals("admin")){
						%> 
					<div class="btn_inner">
						<a href="NoticeWriteForm.not" class="btn">글쓰기</a>
					</div>
					<%
						        }
							                        }
					%>
					
					
											<div class="paging">
                            	<a href="NoticeBoardList.not?page=1" class="arr" data-page-num="1">
										<img src="images/p-first.png"><span class="hide">처음페이지</span>
								</a>
                            	<%if(nowPage <=1) {%>
									
                            		<a href="NoticeBoardList.notpage=<%=nowPage%>" class="arr prev" data-page-num="1">
										<img src="images/p-prev.png"><span class="hide">이전페이지</span>
									</a>
								<%}else{%>
								<a href="NoticeBoardList.not?page=<%=nowPage - 1 %>" class="arr prev" data-page-num="1">
										<img src="images/p-prev.png"><span class="hide">이전페이지</span>
									</a>
								
								<%} %>
								
								<%for(int i = startPage; i <= endPage; i++) { 
										if(i == nowPage) { %>
											<a href="NoticeBoardList.not?page=<%=i%>" class="on" data-page-num="<%=i%>"><%=i%></a>
										<%} else { %>
											<a href="NoticeBoardList.not?page=<%=i%>" class="" data-page-num="<%=i%>"><%=i%></a>
										<%} %>
								<%} %>
								
                            	<%if(nowPage >= maxPage) { %>
									<a href="NoticeBoardList.not?page=<%=nowPage%>" class="arr next" data-page-num="11">
	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span>
	                            	</a>
	                            <%}else{%>   
	                            	<a href="NoticeBoardList.not?page=<%=nowPage + 1%>" class="arr next" data-page-num="11">
	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span>
	                            	</a>
                            	<%} %>
	                            	<a href="NoticeBoardList.not?page=<%=maxPage%>" class="arr" data-page-num="781">
                                		<img src="images/p-last.png"><span class="hide">마지막페이지</span>
                               		</a>                        
                            </div>
<%-- 							<% --%>
<!-- 							} else { -->
<!-- 							%> -->
<!-- 							<section id="emptyArea">등록된 글이 없습니다</section> -->
<%-- 							<% --%>
<!-- 							} -->
<!-- 							%> -->
					</div>
					

	
				</div>
			</div>

		</div>

</section>
<footer><jsp:include page="../include/footer.jsp" /></footer>