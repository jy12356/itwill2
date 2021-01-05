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
	ArrayList<MyBasketBean> myBasketList = (ArrayList<MyBasketBean>) request.getAttribute("myBasketList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
String memState = (String) request.getAttribute("memState");
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
int listCount = pageInfo.getListCount();
%>
<style>
.h3Tit{font-size: 15px; color: #069e89;}
</style>

<section class="sub">
	<div class="contents-wrap">
		<div class="customer">
			<h3 class="coTitle">책바구니</h3>

			<div class="customer-contents">
				<div class="customer-inner">
					<h3 class="h3Tit mt30 mb10">대여 가능 책 목록</h3>
					<table summary="책바구니" class="customer-table notice">
						<caption>책바구니2222222</caption>
						<colgroup>
							<col style="width: 5%">
							<col style="width: 35%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">

						</colgroup>
						<thead>
							<tr>
								<th scope="col" abbr="책번호"><input type="checkbox"name="checkAll1" id="checkAll1" class="checkAll1" /></th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="작가">작가</th>
								<th scope="col" abbr="출판사">출판사</th>
								<th scope="col" abbr="출판일">출판일</th>
								<th scope="col" abbr="상태">상태</th>
							</tr>
						</thead>
						<tbody>
							<%
								// 대여가능 리스트
							if (myBasketList.size() != 0) {
							String isbn;
							// 							ArrayList list = new ArrayList();
								for (int i = 0; i < myBasketList.size(); i++) {
									if (myBasketList.get(i).getState().equals("대여가능")) {
							%>
							<tr>
								<td class="tac"><input type="checkbox" id="check_box1"
									class="check_box c1" value="<%=myBasketList.get(i).getNum()%>"
									name="inter_num"></td>
								<td><a href="BookDetail.bok?isbn=<%=myBasketList.get(i).getIsbn()%>"><%=myBasketList.get(i).getTitle()%></td>
								<td><%=myBasketList.get(i).getAuthor()%></td>
								<td><%=myBasketList.get(i).getPublisher()%></td>
								<td><%=myBasketList.get(i).getPubdate()%></td>
								<td><%=myBasketList.get(i).getState()%></td>
	
							</tr>
							<%
									}
								}
							}else {%>
								<tr><td colspan="6">책바구니가 비었습니다.</td></tr>
							<%}	%>
							</tbody>
						</table>
						<h3 class="h3Tit mt30 mb10">예약 가능 책 목록</h3>
					<table summary="책바구니" class="customer-table notice">
						<caption>책바구니2222222</caption>
						<colgroup>
							<col style="width: 5%">
							<col style="width: 35%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">

						</colgroup>
						<thead>
							<tr>
								<th scope="col" abbr="책번호"><input type="checkbox"
									name="checkAll2" id="checkAll2" class="checkAll2" /></th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="작가">작가</th>
								<th scope="col" abbr="출판사">출판사</th>
								<th scope="col" abbr="출판일">출판일</th>
								<th scope="col" abbr="상태">상태</th>
							</tr>
						</thead>
						<tbody>
									<%
							if (myBasketList.size() != 0) {
								for (int i = 0; i < myBasketList.size(); i++) {
									if (myBasketList.get(i).getState().equals("대여불가능")) {
									
							%>
							<tr>
								<td class="tac"><input type="checkbox" id="check_box2" class="check_box c2" value="<%=myBasketList.get(i).getNum()%>" name="inter_num"></td>
								<td><a href="BookDetail.bok?isbn=<%=myBasketList.get(i).getIsbn()%>"><%=myBasketList.get(i).getTitle()%></td>
								<td><%=myBasketList.get(i).getAuthor()%></td>
								<td><%=myBasketList.get(i).getPublisher()%></td>
								<td><%=myBasketList.get(i).getPubdate()%></td>
								<td><%=myBasketList.get(i).getState()%></td>
	
							</tr>
							<%
										}
									}	 
								
								
								} else {%>
								<tr><td colspan="6">책바구니가 비었습니다.</td></tr>
								<%}%>
						</tbody>
					</table>
					<div class="btn_inner">
						<a href="javascript:void(0);"
							onclick="deleteBook(); return false;" class="btn">삭제하기</a>
						<div class="payment-result basket">
							<p>
								총 선택 도서 수 : <span class="totalbookcnt">0</span>권 
							</p>

						<input type="button" style="display: none;" class="rentalbtn btn" value="대여하기" onclick="rental()"> 
						<input type="button" style="display: none;" class="reservationbtn btn" value="예약하기"onclick="reservation()">
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
	<input type="hidden" value="<%=memState%>" class="isRentalable">

	<script>
		// 다중 삭제
		function deleteBook() {
			var confirm_val = confirm("정말 삭제하시겠습니까?");

			if (confirm_val) {
				var inter_num = [];
				if ($('input:checkbox[name="inter_num"]:checked').length > 0) {
					$('input:checkbox[name="inter_num"]:checked').each(
							function() {
								inter_num.push($(this).attr("value"));
							});
				} else {
					alert("삭제할 도서를 선택해주시기 바랍니다.");
					return false;
				}
				;
				var interArr = {
					"inter_num" : inter_num
				};

				$.ajax({
					url : "BasketDelete.bk",
					type : "post",
					dataType : 'text',
					data : interArr,
					success : function() {
						location.href = "MyBasketList.bk";
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}

				});
			}
		};
		
		// 예약하기 버튼 이벤트
		function reservation() {
			// 구독중이아닐때 결제페이지로 넘어가기
			if ($(".isRentalable").val() == "구독안함") {
				var unsubscribe = confirm("현재 구독중이 아닙니다.\n구독 하시겠습니까?")

				if (unsubscribe) {
					location.href = "Charge.dok";

				} else {
					return;
				}

				// 구독중일때 예약하기
			} else if ($(".isRentalable").val() == "구독중") {
				// 창하나 먼저 띄워주고
				var confirm_val = confirm("선택하신 도서를 예약하시겠습니까?");

				//확인눌렀을때
				if (confirm_val) {

					var inter_num = [];
					// 					if ($('.c1 input[type="checkbox"]:checked').length > 0) {
					if ($('input:checkbox[name="inter_num"]:checked').length > 0) {
						// 						$('.c1 input[type="checkbox"]:checked').each(
						$('input:checkbox[name="inter_num"]:checked').each(
								function() {
									inter_num.push($(this).attr("value"));
								});
						// 아무것도 체크한게없으면
					} else {
						alert("예약할 도서를 선택해주시기 바랍니다.");
						return false;
					}
					;
					// 체크한거 담아서
					var interArr = {
						"inter_num" : inter_num
					};

					$.ajax({
						url : "reservationInsert.rn",
						type : "post",
						dataType : 'text',
						data : interArr,
						success : function(data) {
							alert(data);
							var a = "이미 예약중인 도서가 있습니다.";
							var b = "예약신청이 완료되었습니다.";
							if(data == a) {
								return false;								
							} else if(data == b){
							location.href = "ReservationList.rn";
							}
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}

					});
				}

			}
		}
		
		
		// 대여하기버튼 이벤트
		function rental() {
			// 구독중이아닐때 결제페이지로 넘어가기
			if ($(".isRentalable").val() == "구독안함") {
				var unsubscribe = confirm("현재 구독중이 아닙니다.\n구독 하시겠습니까?")

				if (unsubscribe) {
					location.href = "Charge.dok";

				} else {
					return;
				}

				// 구독중일때
			} else if ($(".isRentalable").val() == "구독중") {
				// 창하나 먼저 띄워주고
				var confirm_val = confirm("선택하신 도서를 대여하시겠습니까?");

				//확인눌렀을때
				if (confirm_val) {

					var inter_num = [];
					// 					if ($('.c1 input[type="checkbox"]:checked').length > 0) {
					if ($('input:checkbox[name="inter_num"]:checked').length > 0) {
						if($('input:checkbox[name="inter_num"]:checked').length <6) {						
						// 						$('.c1 input[type="checkbox"]:checked').each(
						$('input:checkbox[name="inter_num"]:checked').each(
								function() {
									inter_num.push($(this).attr("value"));
								});
						// 아무것도 체크한게없으면
						} else {
							alert("최대 5권까지 대여가능합니다. ");
							return false;
						}
					} else {
						alert("대여할 도서를 선택해주시기 바랍니다.");
						return false;
					}
					;
					// 체크한거 담아서
					var interArr = {
						"inter_num" : inter_num
					};

					$.ajax({
						url : "rentalInsert.rn",
						type : "post",
						dataType : 'text',
						data : interArr,
						success : function(data) {
							// 대여하기 성공했으면 대여리스트로 가기
							alert(data);
							var a = "이미 대여중인 도서가 있습니다.";
							var b = "도서는 최대 5권 까지 대여 가능합니다.";
							if(data == b) {
								return false;
							}
							if(data == a) {
// 								alert(a);
								return false;								
							} else if(data == "대여신청이 완료되었습니다."){
							location.href = "rentalList.rn";
							}
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}

					});
				}

			}
		}

			
		$(document).ready(function(){
		
			// 예약도서 한권씩선택 갯수
			var total_cnt2 = $(".totalbookcnt").val();
			$(".c2").click(function() {
// 				alert( total_cnt);			
				if ($(this).is(":checked")) {
					$(".reservationbtn").show();

					total_cnt2=$('input:checkbox[id="check_box2"]:checked').length;
					$(".checkAll1").prop("checked", false);
					$(".c1").prop("checked", false);
					$(".rentalbtn").hide();
				}else{
// 					$(".reservationbtn").hide();
					total_cnt2 -=1;
					if(total_cnt2 <= 0) {
						total_ctn2 = 0;
						$(".reservationbtn").hide();
					}
				}
				
				
				$(".totalbookcnt").html(total_cnt2);
				
				
			});	
			
			// 대여도서 한권씩선택 갯수
			var total_cnt1 = $(".totalbookcnt").val();
			$(".c1").click(function() {
// 				alert(total_cnt2);			
				if ($(this).is(":checked")) {
					$(".rentalbtn").show();
					
					total_cnt1=$('input:checkbox[id="check_box1"]:checked').length;
					$(".checkAll2").prop("checked", false);
					$(".c2").prop("checked", false);
					$(".reservationbtn").hide();
				}else{
					total_cnt1 -=1;
					if(total_cnt1 <= 0) {
						$(".rentalbtn").hide();
						total_ctn1 = 0;
					}
				}
				
				
				$(".totalbookcnt").html(total_cnt1);
				
				
			});	
			
			
			
			
			
			// 예약가능도서 전체선택
			$(".checkAll2").click(function() {
				if ($(this).is(":checked")) {
					$(".c2").prop("checked", true); 
					$(".c1").prop("checked", false); 
					$(".checkAll1").prop("checked", false); 
					$(".reservationbtn").show();
					$(".rentalbtn").hide();
					total_cnt2=$('input:checkbox[id="check_box2"]:checked').length;
				} else {
					$(".reservationbtn").hide();
					$(".rentalbtn").hide();
					$(".c2").prop("checked", false); 
					total_cnt2 -=total_cnt2;
				}
				$(".totalbookcnt").html(total_cnt2);
			});
			
			// 대여가능도서 전체 선택
			$(".checkAll1").click(function() {
				if ($(this).is(":checked")) {
					$(".c1").prop("checked", true); 
					$(".c2").prop("checked", false); 
					$(".checkAll2").prop("checked", false); 
					$(".rentalbtn").show();
					$(".reservationbtn").hide();
					total_cnt1=$('input:checkbox[id="check_box1"]:checked').length;
				} else {
					$(".rentalbtn").hide();
					$(".reservationbtn").hide();
					$(".c1").prop("checked", false); 
					total_cnt1 -=total_cnt1;
				}
				$(".totalbookcnt").html(total_cnt1);
			});
	
	
		});		

	</script>
</section>

<jsp:include page="../include/footer.jsp" />

