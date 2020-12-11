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

							for (int i = 0; i < myBasketList.size(); i++) {

									if (myBasketList.get(i).getState().equals("대여가능")) {
								String a = myBasketList.get(i).getState();
								a = "대출가능";
								// 대출가능한 목록리스트
							%>
							<tr>
								<td class="tac check_box"><input type="checkbox"
									id="checkbox_num" class="check_num"
									value="<%=myBasketList.get(i).getNum()%>" name="book_num"></td>
								<td><%=myBasketList.get(i).getTitle()%></td>
								<td><%=myBasketList.get(i).getAuthor()%></td>
								<td><%=myBasketList.get(i).getPublisher()%></td>
								<td><%=myBasketList.get(i).getPubdate()%></td>
								<td><%=a%></td>

							</tr>




							<%
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
									id="checkbox_num" class="check_num"
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
					<div class="tab-sort">
						<div>
							<div class="checkbox">
								<label> <input type="checkbox" value=""
									class="allchkSeries"> <span><i></i></span>
								</label>
							</div>
							<a href="javascript:;" class="btn carDel">삭제</a>
						</div>
					</div>
					<div class="payment-result basket">
						<p>
							총 주문 상품 수 : <span class="totalbookcnt">0권</span>
						</p>
						<p>
							총 결제 금액 : <span class="totalamount">0원</span>
						</p>
						<a href="javascript:parent.goUrl('/main.asp');" class="btn">쇼핑
							계속하기</a> <input type="button" class="orderbtn" value="주문하기">
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
		// 		파라미터 들고오기
		function Request() {
			var requestParam = "";
			//getParameter 펑션
			this.getParameter = function(param) {
				//현재 주소를 decoding
				var url = unescape(location.href);
				//파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다.
				var paramArr = (url.substring(url.indexOf("?") + 1, url.length))
						.split("&");
				for (var i = 0; i < paramArr.length; i++) {
					var temp = paramArr[i].split("="); //파라미터 변수명을 담음

					if (temp[0].toUpperCase() == param.toUpperCase()) {
						// 변수명과 일치할 경우 데이터 삽입
						requestParam = paramArr[i].split("=")[1];
						break;
					}
				}
				return requestParam;
			}
		}
		//다중 체크 안되게 방지
		$(function() {
			$(".check_num").bind('click', function() {
				$(".check_num").not(this).prop("checked", false);
			})
		});
		//삭제
		function deleteBook() {
			if (confirm("삭제하시겠습니까?")) {
				var requestParam = new Request();
				var title = requestParam.getParameter("title");
				var isbn = requestParam.getParameter("isbn");
				var checked_seq = "";
				if ($('.check_box input[type="checkbox"]:checked').length != 0) {
					checked_seq = $('.check_box input[type="checkbox"]:checked')
							.val();
				} else {
					alert("게시물을 선택해주시길 바랍니다.");
					return false;
				}
				location.href = "myBasket.bk?book_num=" + checked_seq
						+ "&title=" + title + "&isbn=" + isbn;
				return true;
			} else {
				alert("삭제에 실패하였습니다.");
				return false;
			}
		};
		//수정
		function modifyBook() {
			if (confirm("수정하시겠습니까?")) {
				var checked_seq = "";
				var requestParam = new Request();
				;
				var title = requestParam.getParameter("title");
				var isbn = requestParam.getParameter("isbn");
				var check_count = document.getElementsByName("book_num").length;

				if ($('.check_box input[type="checkbox"]:checked').length != 0) {
					checked_seq = $('.check_box input[type="checkbox"]:checked')
							.val();
					alert(checked_seq);
				} else {
					alert("게시물을 선택해주시길 바랍니다.");
					return false;
				}
				alert(title);
				location.href = "BookModify.bok?book_num=" + checked_seq
						+ "&title=" + title + "&isbn=" + isbn;
				return true;
			} else {
				alert("수정에 실패하였습니다.")
				return false;
			}
		};
	</script>
</section>

<jsp:include page="../include/footer.jsp" />