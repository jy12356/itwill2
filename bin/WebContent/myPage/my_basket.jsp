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
String memState = (String) request.getAttribute("memState");
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
					<table summary="내가 찜한 리스트" class="customer-table notice" id="wow">
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
							<tr>
								<td colspan="2">대출가능한책목록
								<td>
							</tr>
							<tr>
								<th scope="col" abbr="책번호"><input type="checkbox"
									name="checkAll1" id="checkAll1" class="checkAll1" /></th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="저자">저자</th>
								<th scope="col" abbr="출판사">출판사</th>
								<th scope="col" abbr="출판일">출판일</th>
								<th scope="col" abbr="상태">상태</th>
							</tr>
						</thead>

						<%
							// 대여가능 리스트
						String isbn;
						// 							ArrayList list = new ArrayList();
						for (int i = 0; i < myBasketList.size(); i++) {
							if (myBasketList.get(i).getState().equals("대여가능")) {
								String a = myBasketList.get(i).getState();
								a = "대여가능";
								// 대출가능한 목록리스트
						%>
						<tr>
							<td class="tac check_box"><input type="checkbox"
								id="checkRow" class="checkRow1"
								value="<%=myBasketList.get(i).getNum()%>" name="checkRow1"
								onclick="checkRow1();"><%=myBasketList.get(i).getNum()%></td>
							<td><%=myBasketList.get(i).getTitle()%></td>
							<td><%=myBasketList.get(i).getAuthor()%></td>
							<td><%=myBasketList.get(i).getPublisher()%></td>
							<td><%=myBasketList.get(i).getPubdate()%></td>
							<td><%=a%></td>

						</tr>
						<%
							isbn = myBasketList.get(i).getIsbn();
						}
						}
						// 대여불가 = 예약가능 리스트
						for (int i = 0; i < myBasketList.size(); i++) {
						if (myBasketList.get(i).getState().equals("대여불가능")) {
						String b = myBasketList.get(i).getState();
						b = "예약가능";
						// 예약가능한 목록 리스트
						%>
						<thead>
							<tr>
								<td colspan="2">예약가능한책목록
								<td>
							</tr>
							<tr>
								<th scope="col" abbr="책번호"><input type="checkbox"
									name="checkAll2" id="checkAll2" class="checkAll2" /></th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="저자">저자</th>
								<th scope="col" abbr="출판사">출판사</th>
								<th scope="col" abbr="출판일">출판일</th>
								<th scope="col" abbr="상태">상태</th>
							</tr>
						</thead>
						<tr>
							<td class="tac check_box"><input type="checkbox"
								id="checkRow" class="checkRow2"
								value="<%=myBasketList.get(i).getNum()%>" name="checkRow2"
								onclick="checkRow2();"><%=myBasketList.get(i).getNum()%></td>
							<td><%=myBasketList.get(i).getTitle()%></td>
							<td><%=myBasketList.get(i).getAuthor()%></td>
							<td><%=myBasketList.get(i).getPublisher()%></td>
							<td><%=myBasketList.get(i).getPubdate()%></td>
							<td><%=b%></td>

						</tr>

						<%
							}
						}
						%>

					</table>
					<div class="btn_inner">
						<a href="javascript:void(0);"
							onclick="deleteBook(); return false;" class="btn">삭제하기</a>
						<button onclick="value_check()">checkbox 선택(체크)된 객체
							값(value) 가져오기</button>
							<input type="button" value="삭제해버려" id="selectDelete_btn" >
						<div class="payment-result basket">
							<p>
								총 선택 도서 수 : <span class="totalbookcnt">0권</span>
							</p>

							<input type="button" style="display: none;" class="rentalbtn"
								value="대여하기"> <input type="button"
								style="display: none;" class="reservationbtn" value="예약하기">
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
	</div>
	<input type="hidden" value="<%=memState%>" class="abcabc">

	<script type="text/javascript">
$(document).ready(function(){
	$(".selectDelete_btn").click(function(){
		  var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
		   var checkArr = new Array();
		   
		   $("input[id='checkRow']:checked").each(function(){
		    checkArr.push($(this).attr("value"));
		   });
		    
		   $.ajax({
		    url : "delete.bk",
		    type : "post",
		    data : { chbox : checkArr },
		    success : function(){
		     location.href = "/shop/cartList";
		    }
		   });
		  } 
		 });
 
		function value_check() {
			var checkRow1value = '';
			$('input[name="checkRow1"]:checked').each(function(index) {
				if (index != 0) {
					checkRow1value += ',';
				}
				checkRow1value += $(this).val();
			});
			alert(checkRow1value);
		}
		// 배열선언
// 		var arrValues = new Array();
// 		for (var i = 1; i <= checkRow1value.length; i++) {
// 			arrValues.push(checkRowvalue)
// 		}
		$("#checkAll1").click(function() {
			if ($(this).is(":checked")) {
				$(".checkRow1").prop("checked", true);
				$(".checkAll1").prop("checked", true);
				$(".checkRow2").prop("checked", false);
				$(".checkAll2").prop("checked", false);
			} else {
				$(".checkRow1").prop("checked", false);
				$(".checkAll1").prop("checked", false);
			}
		});
		$("#checkAll2").click(function() {
			if ($(this).is(":checked")) {
				$(".checkRow2").prop("checked", true);
				$(".checkAll2").prop("checked", true);
				$(".checkRow1").prop("checked", false);
				$(".checkAll1").prop("checked", false);
			} else {
				$(".checkRow2").prop("checked", false);
				$(".checkAll2").prop("checked", false);
			}
		});
		$("#checkRow1").click(function() {
			if ($(this).is(":checked")) {
				$(".checkRow2").prop("checked", false);
				$(".checkAll2").prop("checked", false);
			} else {
				$(".checkAll1").prop("checked", false);
			}
		});
		$("#checkRow2").click(function() {
			if ($(this).is(":checked")) {
				$(".checkRow1").prop("checked", false);
				$(".checkAll1").prop("checked", false);
			} else {
				$(".checkAll2").prop("checked", false);
			}
		});
		$("#checkRow1").click(function() {
			if ($(this).is(":checked")) {
				$(".rentalbtn").show();
			} else {
				$(".rentalbtn").hide();
			}
		});
		$("#checkRow2").click(function() {
			if ($(this).is(":checked")) {
				$(".reservationbtn").show();
			} else {
				$(".reservationbtn").hide();
			}
		});
		// 		function checkRow1() {
		// 			if($("#checkRow1").is(':checked') ) {
		// 				$("input[name=checkRow2]").prop("checked", false);
		// 				$("input[name=checkAll2]").prop("checked", false);
		// 			}
		// 		}
		// 		function checkRow2() {
		// 			if($("#checkRow2").is(':checked') ) {
		// 				$("input[name=checkRow1]").prop("checked", false);
		// 				$("input[name=checkAll1]").prop("checked", false);
		// 			}
		// 		}
		$("#checkRow1").click(function() {
			var total_cnt1 = 0;
			$('input:checkbox[name="checkRow1"]').each(function() {
				if (this.checked) {
					total_cnt1 += 1;
				}
			});
			$(".totalbookcnt").html(total_cnt1 + "권");
		});
		$("#checkRow2").click(function() {
			var total_cnt2 = 0;
			$('input:checkbox[name="checkRow2"]').each(function() {
				if (this.checked) {
					total_cnt2 += 1;
				}
			});
			$(".totalbookcnt").html(total_cnt2 + "권");
		});
		$(".orderbtn")
				.click(
						function() {
							if ($(".abcabc").val() == "구독안함") {
								var u = "myPage/subscribe.jsp";
								var option = "width = 900, height = 650, top = 100, left = 400, location = no"
								window.open(u, option);
							}
						});
});
	</script>
</section>

<jsp:include page="../include/footer.jsp" />


