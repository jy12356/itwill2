<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="vo.PageInfo"%>
<%@page import="vo.RequestBean"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<RequestBean> articleList = (ArrayList<RequestBean>)request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
String id = (String)session.getAttribute("id");
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
int listCount = pageInfo.getListCount();
%>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
<div class="category-nav">
	<div class="category-nav-inner">
		<p>
			HOME > 희망도서 신청 목록
		</p>
	</div>
</div>
<div class="contents-wrap">
	<div class="customer">
	<h3 class="coTitle">희망도서 신청 목록</h3>
		<div class="customer-contents">
			<div class="customer-inner">
					<div class="customer-use-wrap">
						<div class="onebyone-step">
							<img src="sub4/boardimg/step.jpg" alt="1.신청 접수 2.신청 내용 확인 3.도서 구매 완료">
							<p>신청 도서를 일주일 안에 확인 및 구매 할 수 있도록 노력하고 있습니다.<br>단, <span>주말,공휴일 신청 및 확인 절차가 많아지는 경우</span>에는 지연될 수 있는 점 양해 부탁드립니다.</p>
						</div>
						<table class="onebyone-list" summary="희망도서 신청 목록">
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
							<th>유형</th>
							<th>신청 도서명</th>
							<th>작성자명</th>
							<th>등록일</th>
						</tr>
						<%
							for(int i = 0; i < articleList.size(); i++) {
								if(id == null){ 
						%>
								<tr></tr>
						<%
							}else if(id.equals(articleList.get(i).getId())){
						%>
						<tr>
							<td align="center">
								<%if(articleList.get(i).getRe_lev() != 0){%>
									<font color="purple">답변</font>
								<%} else {%>
									<font color="orange">문의</font>
								<%}%>
							</td>
							<td>
								<a href="RequestDetail.rq?num=<%=articleList.get(i).getNum() %>&page=<%=nowPage %>">
								<%=articleList.get(i).getSubject() %>
								</a>
							</td>
							<td align="center"><%=articleList.get(i).getId() %></td>
							<td align="center"><%=articleList.get(i).getDate() %></td>
						</tr>
						<%
							}}
						%>
						</tbody>
						</table>
						<%
						id = (String) session.getAttribute("id");
						%>
						<div class="btn_inner">
							<input type="button" class="btn" value="도서 신청" onclick="location.href='RequestWriteForm.rq'">
						</div>
						<input type="hidden" name="id" id="myId" value="<%=id%>">
						
						<script type="text/javascript">
						$(".btn").on("click", function() {
							var myid = document.getElementById('myId').value;
							if (myid == "null") {
								alert("비회원 상태로 작성 시 차후 수정 및 삭제가 불가능합니다.");
								return true;
							}
						});
						</script>					
						
<!-- 						<div class="paging"> -->
<!--                             	<a href="RequestMyList.rq?page=1" class="arr" data-page-num="1"> -->
<!-- 										<img src="images/p-first.png"><span class="hide">처음페이지</span> -->
<!-- 								</a> -->
<%--                             	<%if(nowPage <=1) {%> --%>
									
<%--                             		<a href="RequestMyList.rq?page=<%=nowPage%>" class="arr prev" data-page-num="1"> --%>
<!-- 										<img src="images/p-prev.png"><span class="hide">이전페이지</span> -->
<!-- 									</a> -->
<%-- 								<%}else{%> --%>
<%-- 								<a href="RequestMyList.rq?page=<%=nowPage - 1 %>" class="arr prev" data-page-num="1"> --%>
<!-- 										<img src="images/p-prev.png"><span class="hide">이전페이지</span> -->
<!-- 									</a> -->
								
<%-- 								<%} %> --%>
								
<%-- 								<%for(int i = startPage; i <= endPage; i++) {  --%>
<%-- 										if(i == nowPage) { %> --%>
<%-- 											<a href="RequestMyList.rq?page=<%=i%>" class="on" data-page-num="<%=i%>"><%=i%></a> --%>
<%-- 										<%} else { %> --%>
<%-- 											<a href="RequestMyList.rq?page=<%=i%>" class="" data-page-num="<%=i%>"><%=i%></a> --%>
<%-- 										<%} %> --%>
<%-- 								<%} %> --%>
								
<%--                             	<%if(nowPage >= maxPage) { %> --%>
<%-- 									<a href="RequestMyList.rq?page=<%=nowPage%>" class="arr next" data-page-num="11"> --%>
<!-- 	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span> -->
<!-- 	                            	</a> -->
<%-- 	                            <%}else{%>    --%>
<%-- 	                            	<a href="RequestMyList.rq?page=<%=nowPage + 1%>" class="arr next" data-page-num="11"> --%>
<!-- 	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span> -->
<!-- 	                            	</a> -->
<%--                             	<%} %> --%>
<%-- 	                            	<a href="RequestMyList.rq?page=<%=maxPage%>" class="arr" data-page-num="781"> --%>
<!--                                 		<img src="images/p-last.png"><span class="hide">마지막페이지</span> -->
<!--                                		</a>                         -->
<!--                             </div> -->
							<%
							} else {
							%>
							<section id="emptyArea">등록된 글이 없습니다</section>
							<%
							}
							%>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp"/>