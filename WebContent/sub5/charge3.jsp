<%@page import="vo.GudokBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%
	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	String id = (String)session.getAttribute("id");
	ArrayList<GudokBean> articleList = (ArrayList<GudokBean>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
%>    
<section class="sub">
     <div class="contents-wrap">
        <div class="customer">
            <h3 class="coTitle">구독 내역</h3>
            
            <div class="customer-contents">
                <div class="customer-inner">
                    <table summary="내가 찜한 리스트" class="customer-table notice">
                        <caption>구독 내역</caption>
                        <colgroup>
                            <col style="width:20%">
                            <col style="width:15">
                            <col style="width:*%">
                            <col style="width:15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col" abbr="구매번호">번호</th>
                                <th scope="col" abbr="아이디">아이디</th>
                                <th scope="col" abbr="구매내역">구매내역</th>
                                <th scope="col" abbr="구매일">구매일</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        for(int i = 0; i < articleList.size(); i++){
                        	if(id.equals(articleList.get(i).getId())){
                        			%>
                        			  <tr>
                                		<td><p class="autor" align="center"><%=articleList.get(i).getGnum() %></p></td>
										<td><p class="autor" ><%=articleList.get(i).getId() %></p></td>
                            			<td><p class="autor" ><%=articleList.get(i).getGproduct()%></p></td>
                            			<td><%=articleList.get(i).getGdate()%></td>
                           			 </tr>
                        			<%}
                        			%>
                        <%} %>
                        </tbody>
                    </table>
                        <div class="ps-box">
		<p><span>정기구독권</span>과 <span>이미 배송받으신 책</span>이 있다면 <span>환불이 불가</span>합니다. 기타 환불 관련 <span>문의</span>는 <span>010-4161-1873</span>로 연락해 주세요.</p>
		<ul>
			<li>- 결제/환불 문의는 1:1문의 페이지에서 문의가 가능합니다.</li>
			<li>- 이용에 문의사항이 있으시다면, 고객센터 > FAQ를 참고해 주시거나, 고객센터를 이용해 주시기 바랍니다.</li>
			<li>- 구매하신 구독권은 도서 주문 시 취소 및 환불이 불가능합니다.</li>
		</ul>
	</div>
                    <div class ="paging">
						<a href="ChargeList2.dok" class="arr" data-page-num="1">
						<img src="images/p-first.png"><span class="hide">처음페이지</span>
						</a>
                  	<%if(nowPage <=1) {%>
									
                           <a href="ChargeList2.dok?page=<%=nowPage%>" class="arr prev" data-page-num="1">
							<img src="images/p-prev.png"><span class="hide">이전페이지</span>
							</a>
							<%}else{%>
							<a href="ChargeList2.dok?page=<%=nowPage - 1 %>" class="arr prev" data-page-num="1">
							<img src="images/p-prev.png"><span class="hide">이전페이지</span>
							</a>
								
						<%} %>
					<%for(int i = startPage; i <= endPage; i++) { 
								if(i == nowPage) { %>
								<a href="ChargeList2.dok?page=<%=i%>" class="on" data-page-num="<%=i%>"><%=i%></a>
							<%} else { %>
								<a href="ChargeList2.dok?page=<%=i%>" class="" data-page-num="<%=i%>"><%=i%></a>
							<%} %>
						<%} %>
	
						<%if(nowPage >= maxPage) { %>
									<a href="ChargeList2.dok?page=<%=nowPage%>" class="arr next" data-page-num="11">
	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span>
	                            	</a>
	                            <%}else{%>   
	                            	<a href="ChargeList2.dok?page=<%=nowPage + 1%>" class="arr next" data-page-num="11">
	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span>
	                            	</a>
                            	<%} %>
	                            	<a href="ChargeList2.dok?page=<%=maxPage%>" class="arr" data-page-num="781">
                                		<img src="images/p-last.png"><span class="hide">마지막페이지</span>
                               		</a>
                            </div>
                        </div>
                    </div>
					</div>
                </div>

     <script>
    
	</script>
</section>

<jsp:include page="../include/footer.jsp"/>
