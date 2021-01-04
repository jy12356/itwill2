<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="vo.PageInfo"%>
<%@page import="vo.QnaBean"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="../include/header.jsp"/>
<%
String id = (String)session.getAttribute("id");
ArrayList<QnaBean> articleList = (ArrayList<QnaBean>)request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
int listCount = pageInfo.getListCount();
%>
<section class="sub">
<div class="category-nav">
	<div class="category-nav-inner">
		<p>
			HOME > 고객센터 > 1:1문의</p>
	</div>
</div>
<div class="contents-wrap">
	<div class="customer">
		<h3 class="coTitle">1:1문의</h3>
		<div class="customer-contents">
			<div class="customer-inner">
				<div class="customer-contents">
					<div class="customer-use-wrap">
						<ul class="customer-s-menu one">
							<li>
							<%if(id == null){ %>
							<a href="QnaList.qna" class="" onclick='cCheck()'>1:1 문의하기</a>
							<script>
							function cCheck(){
								var u = alert("로그인해 주시기 바랍니다");
							}</script>
							<%}else{ %>
							<a href="QnaWriteForm.qna" class="">1:1 문의하기</a>
							<%} %>
							</li>
							<li>
							<a href="QnaList.qna" class="on">문의 내역 확인</a>
							</li>
						</ul>
						<div class="onebyone-step">
							<img src="sub5/mypageimg/circle.jpg" alt="1.문의접수 2.문의 내용 확인 3.추가 답변 예정 4.답변 완료">
							<p>
								*추가 답변 예정인 문의에는 이후 답변이 추가됩니다.
							</p>
							<p>
								문의주신 내용을 24시간 내에 답변드릴 수 있도록 노력하고 있습니다.<br>
								단, <span>주말,공휴일 문의 및 확인 절차가 많아지는 경우</span>에는 지연될 수 있는 점 양해 부탁드립니다.
							</p>
						</div>
						<table class="onebyone-list" summary="문의 내역 확인 표">
						<caption>문의 내역 확인</caption>
						<%
						if(articleList != null && listCount > 0) {
						%>
						<colgroup>
						<col width="20%">
						<col width="*">
						<col width="15%">
						<col width="15%">
						</colgroup>
						<tbody>
						<tr>
							<th>글 유형</th>
							<th>문의 제목</th>
							<th>문의 유형</th>
							<th>등록일</th>
						</tr>
						<%
						for(int i = 0; i < articleList.size(); i++) {
						if(id == null){ %>
							<tr>
							</tr>
						<%}else if(id.equals(articleList.get(i).getId())){%>
							<tr>
							<td align="center">
							
							<%if(articleList.get(i).getRe_lev() != 0) { %>
									<font color="purple">답변</font>
								<%} else {%>
									<font color="orange">문의</font>
								<%}%>
							</td>
							<td>
						<a href="QnaDetail.qna?board_num=<%=articleList.get(i).getBoard_num() %>&page=<%=nowPage %>">
						<%=articleList.get(i).getTitle() %>
						</a>
						
							</td>
							<td align="center"><%=articleList.get(i).getQna_genre() %></td>
							<td align="center"><%=articleList.get(i).getDate() %></td>
						</tr>
						<%}else if(id.equals("admin")){ %>
							<tr>
							<td align="center">
							
							<%if(articleList.get(i).getRe_lev() != 0) { %>
									<font color="purple">답변</font>
								<%} else {%>
									<font color="orange">문의</font>
								<%}%>
							</td>
							<td>
						<a href="QnaDetail.qna?board_num=<%=articleList.get(i).getBoard_num() %>&page=<%=nowPage %>">
						<%=articleList.get(i).getTitle() %>
						</a>
						
							</td>
							<td align="center"><%=articleList.get(i).getQna_genre() %></td>
							<td align="center"><%=articleList.get(i).getDate() %></td>
						</tr>
						<%} %>
						<%}%>
						
						</tbody>
						</table>
						<div class ="paging">
						<a href="QnaList.qna" class="arr" data-page-num="1">
						<img src="images/p-first.png"><span class="hide">처음페이지</span>
						</a>
						<%if(nowPage <=1) {%>
									
                           <a href="QnaList.qna?page=<%=nowPage%>" class="arr prev" data-page-num="1">
							<img src="images/p-prev.png"><span class="hide">이전페이지</span>
							</a>
							<%}else{%>
							<a href="QnaList.qna?page=<%=nowPage - 1 %>" class="arr prev" data-page-num="1">
							<img src="images/p-prev.png"><span class="hide">이전페이지</span>
							</a>
								
						<%} %>
							<%for(int i = startPage; i <= endPage; i++) { 
								if(i == nowPage) { %>
								<a href="QnaList.qna?page=<%=i%>" class="on" data-page-num="<%=i%>"><%=i%></a>
							<%} else { %>
								<a href="QnaList.qna?page=<%=i%>" class="" data-page-num="<%=i%>"><%=i%></a>
							<%} %>
						<%} %>
	
						<%if(nowPage >= maxPage) { %>
									<a href="QnaList.qna?page=<%=nowPage%>" class="arr next" data-page-num="11">
	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span>
	                            	</a>
	                            <%}else{%>   
	                            	<a href="QnaList.qna?page=<%=nowPage + 1%>" class="arr next" data-page-num="11">
	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span>
	                            	</a>
                            	<%} %>
	                            	<a href="QnaList.qna?page=<%=maxPage%>" class="arr" data-page-num="781">
                                		<img src="images/p-last.png"><span class="hide">마지막페이지</span>
                               		</a>
                            </div>
                        </div>
                    </div>
                    <%}else {
					%>
					<div class="list-page">
                        <div class="list">
                            <ul class="book-list">
                            	<li>등록된 문의가 없습니다.</li>
                            </ul>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<jsp:include page="../include/footer.jsp"/>