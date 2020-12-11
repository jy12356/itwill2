<%@page import="svc.Mybasket.MyBasketListService"%>
<%@page import="vo.MyBasketBean"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@page import="vo.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@page import="vo.BookInterestBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%
	// 전달받은 request 객체로부터 데이터 가져오기
// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
ArrayList<BookBean> myBasketList = (ArrayList<BookBean>) request.getAttribute("myBasketList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
int listCount = pageInfo.getListCount();
%>
<section class="sub">
	<div class="contents-wrap">
		<div class="customer">
			<h3 class="coTitle">책바구니</h3>

			<div class="customer-contents">
				<div class="customer-inner">
					<table summary="내가 찜한 리스트" class="customer-table notice">
						<caption>책바구니2ㅁ</caption>
						<colgroup>
							<col style="width: 5%">
							<col style="width: 20%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 10%">

						</colgroup>
						<thead>
							<tr><td colspan="2">대출가능한책목록<td></tr>
							<tr>
								<th scope="col" abbr="책번호"></th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="저자">저자</th>
								<th scope="col" abbr="출판사">출판사</th>
								<th scope="col" abbr="출판일">출판일</th>
								<th scope="col" abbr="상태">상태</th>
							</tr>
						</thead>

							<%
							String isbn = "";
// 							ArrayList list = new ArrayList();
							for (int i = 0; i < myBasketList.size(); i++) {

									if (myBasketList.get(i).getState().equals("대여가능")) {
								String a = myBasketList.get(i).getState();
								a = "대출가능";
								// 대출가능한 목록리스트
							%>
							<tr>
								<td class="tac check_box"><input type="checkbox"
									id="checkbox_num" class="check_num1"
									value="<%=myBasketList.get(i).getNum()%>" name="book_num"></td>
								<td><%=myBasketList.get(i).getTitle()%></td>
								<td><%=myBasketList.get(i).getAuthor()%></td>
								<td><%=myBasketList.get(i).getPublisher()%></td>
								<td><%=myBasketList.get(i).getPubdate()%></td>
								<td><%=a%></td>
							
							</tr>
							<%
							isbn = myBasketList.get(i).getIsbn();
								} else if (myBasketList.get(i).getState().equals("대여불가능")) {
							String b = myBasketList.get(i).getState();
							b = "예약가능";
							// 예약가능한 목록 리스트
							%>
							<thead>
							<tr><td colspan="2">예약가능한책목록<td></tr>
							<tr>
								<th scope="col" abbr="책번호"></th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="저자">저자</th>
								<th scope="col" abbr="출판사">출판사</th>
								<th scope="col" abbr="출판일">출판일</th>
								<th scope="col" abbr="상태">상태</th>
							</tr>
						</thead>
							<tr>
								<td class="tac check_box"><input type="checkbox"
									id="checkbox_num" class="check_num2"
									value="<%=myBasketList.get(i).getNum()%>" name="book_num"></td>
								<td><%=myBasketList.get(i).getTitle()%></td>
								<td><%=myBasketList.get(i).getAuthor()%></td>
								<td><%=myBasketList.get(i).getPublisher()%></td>
								<td><%=myBasketList.get(i).getPubdate()%></td>
								<td><%=b%></td>

							</tr>

							<%
								} else {
									%>
					<p class="no">책바구니에 담긴 도서가 없습니다.</p>
									
									<%
									
								}
							} 
							%>
						
					</table>
<div class="btn_inner"> 
                    	<a href="javascript:void(0);" onclick="deleteBook(); return false;"class="btn">삭제하기</a>
					
					<div class="payment-result basket">
						<p>
							총 선택 도서 수 : <span class="totalbookcnt">0권</span>
						</p>
					
						<input type="button" class="orderbtn" value="대출하기" 
						onclick="location.href='rental.bk?isbn=<%=isbn%>';" >
					</div>
				</div>
				<div class="ps-box">
					<ul>
						<li>- 쿠폰/상품권은 결제하기 페이지에서 적용이 가능합니다.</li>
						<li>- 이용에 문의사항이 있으시다면, 고객센터 &gt; FAQ를 참고해 주시거나, 고객센터 &gt;
							1:1문의를 이용해 주시기 바랍니다.</li>
						<li>- 다운로드를 하신 컨텐츠는 주문 취소 및 환불이 불가능합니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		$("#checkbox_num").click(function() {
			var total_cnt = 0 ;
			$('input:checkbox[name="book_num"]').each(function() {
				if(this.checked){
					total_cnt += 1 ;
				}
			});	
	
			
			$(".totalbookcnt").html(total_cnt +"권");
		});
	
	</script>
</section>

<jsp:include page="../include/footer.jsp" />
