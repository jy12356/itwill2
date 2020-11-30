<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="vo.PageInfo"%>
<%@page import="vo.RequestBean"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="../include/header.jsp"/>
<%
ArrayList<RequestBean> articleList = (ArrayList<RequestBean>)request.getAttribute("articleList");
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
							<th>신청자명</th>
							<th>도서 신청일</th>
						</tr>
						<%
						
						for(int i = 0; i < articleList.size(); i++) {
						%>
						<tr>
							<td align="center">
<%-- 							<%=articleList.get(i).getNum() %> --%>
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
							}
						%>
						</tbody>
						</table>
						<div class="btn_inner">
							<a href="RequestWriteForm.rq" class="btn">도서 신청</a>
						</div>
						<div class ="paging">
						<section id="pageList">
	<%if(nowPage <= 1) {%>
<!-- 			<input type="button" value="이전" class = "on fir"> -->
	<%} else {%>
			<a href="RequestList.rq?page=<%=startPage%>"><img src="sub4/boardimg/first.png"></a>
			<a href="RequestList.rq?page=<%=nowPage - 1 %>"><img src="sub4/boardimg/prev.png"></a>
<%-- 			<input type="button" value=" 이전" onclick="location.href='RequestList.rq?page=<%=nowPage - 1 %>'" class = "on fir"> --%>
	<%} %>
	
	<%for(int i = startPage; i <= endPage; i++) { 
			if(i == nowPage) { %>
				<a href="RequestList.rq?page=<%=i %>" class = "on fir" data-page-num="1"><%=i %>&nbsp;</a>
			<%} else { %>
				<a href="RequestList.rq?page=<%=i %>" class = "on fir">[<%=i %>]</a>&nbsp;
			<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) { %>
<!-- 			<input type="button" value="다음" class = "on fir"> -->
	<%} else { %>
			<a href="RequestList.rq?page=<%=nowPage + 1 %>"><img src="sub4/boardimg/next.png"></a>
			<a href="RequestList.rq?page=<%=endPage%>"><img src="sub4/boardimg/last.png"></a>
<%-- 			<input type="button" value="다음  → " onclick="location.href='RequestList.rq?page=<%=nowPage + 1 %>'" class = "on fir"> --%>
	<%} %>
	</section>
	</div>
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