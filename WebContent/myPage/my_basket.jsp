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
ArrayList<MyBasketBean> rentalableList = (ArrayList<MyBasketBean>) request.getAttribute("rentalableList");
ArrayList<MyBasketBean> unRentalableList = (ArrayList<MyBasketBean>) request.getAttribute("unRentalableList");
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
					<table summary="책바구니" class="customer-table notice" id="wow">
						<caption>책바구니2ㅁ</caption>
						<colgroup>
							<col style="width: 5%">
							<col style="width: 20%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 10%">

						</colgroup>
							<tr>
								<td colspan="2">대출가능한책목록
								<td>
							</tr>
							<tr>
								<th scope="col" abbr="책번호"><input type="checkbox"
									name="checkAll1" id="checkAll1" class="checkAll1" /></th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="작가">작가</th>
								<th scope="col" abbr="출판사">출판사</th>
								<th scope="col" abbr="출판일">출판일</th>
								<th scope="col" abbr="상태">상태</th>
							</tr>

						<%
							// 대여가능 리스트
						String isbn;
						// 							ArrayList list = new ArrayList();
						for (int i = 0; i < rentalableList.size(); i++) {
							if(rentalableList.get(i).getState().equals("0")) {
								String a = rentalableList.get(i).getState();
								a = "대여가능";
								// 대출가능한 목록리스트
						%>
						<tr>
							<td class="tac check_box"><input type="checkbox" id="checkRow1" class="check_box"
								value="<%=rentalableList.get(i).getNum()%>" name="inter_num"
								onclick="checkRow1();"><%=rentalableList.get(i).getNum()%></td>
							<td><%=rentalableList.get(i).getTitle()%></td>
							<td><%=rentalableList.get(i).getAuthor()%></td>
							<td><%=rentalableList.get(i).getPublisher()%></td>
							<td><%=rentalableList.get(i).getPubdate()%></td>
							<td><%=a%></td>

						</tr>
						<%
						}
						}
						%>
								</table>
								
							
								<table summary="책바구니" class="customer-table notice" id="wow">
						<caption>책바구니2ㅁ</caption>
						<colgroup>
							<col style="width: 5%">
							<col style="width: 20%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 10%">

						</colgroup>
							<tr>
								<td colspan="2">예약가능한책목록
								<td>
							</tr>
							<tr>
								<th scope="col" abbr="책번호"><input type="checkbox" name="checkAll2" id="checkAll2" class="checkAll2" /></th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="작가">작가</th>
								<th scope="col" abbr="출판사">출판사</th>
								<th scope="col" abbr="출판일">출판일</th>
								<th scope="col" abbr="상태">상태</th>
							</tr>
								<%
						
						
						for (int j = 0; j < unRentalableList.size(); j++) {
							if(rentalableList.get(j).getState().equals("1")) {
						String b = unRentalableList.get(j).getState();
						b = "예약가능";
						// 예약가능한 목록 리스트
						%>
						<tr>
							<td class="tac check_box"><input type="checkbox"
								id="checkRow2" class="check_box"
								value="<%=unRentalableList.get(j).getNum()%>" name="inter_num"
								onclick="checkRow2();"><%=unRentalableList.get(j).getNum()%></td>
							<td><%=unRentalableList.get(j).getTitle()%></td>
							<td><%=unRentalableList.get(j).getAuthor()%></td>
							<td><%=unRentalableList.get(j).getPublisher()%></td>
							<td><%=unRentalableList.get(j).getPubdate()%></td>
							<td><%=b%></td>

						</tr>

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

							<input type="button" style="display: none;" class="rentalbtn" value="대여하기" onclick="rental()"> 
							<input type="button" style="display: none;" class="reservationbtn" value="예약하기">
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
	

	function rental(){
		if ($(".isRentalable").val()=="구독안함") {
			var unsubscribe = confirm("현재 구독중이 아닙니다.\n구독 하시겠습니까?")
			
			if(unsubscribe) {
				location.href="Charge.dok";

			} else {
				return;
			}
			
		} else if($(".isRentalable").val()=="구독중"){
			
		}
	}
// 		var confirm_val = confirm("선택하신 도서를 대여하시겠습니까?");
		
// 		if(confirm_val) {
// 			var inter_num = []; 
// 			if ($('.check_box input[type="checkbox"]:checked').length > 0) {
// 					$('.check_box input[type="checkbox"]:checked').each(function(){	
// 						inter_num.push($(this).attr("value"));  
// 					});
// 			}else{
// 				alert("대여할 도서를 선택해주시기 바랍니다.");
// 				return false;	            	
// 			};	
// 			var interArr = {"inter_num" :inter_num};
// 			$.ajax({
// 				url : "rental.bk",
// 				type : "post",
// 				dataType: 'text',
// 				data : interArr,
// 				success : function(){
// 					location.href = "MyBasketList.bk";
// 				},error:function(request,status,error){
// 			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 			       }

// 			});
// 		} 
//     };
 
	function deleteBook(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val) {
			var inter_num = [];
			if ($('.check_box input[type="checkbox"]:checked').length > 0) {
					$('.check_box input[type="checkbox"]:checked').each(function(){	
						inter_num.push($(this).attr("value"));  
					});
			}else{
				alert("삭제할 도서를 선택해주시기 바랍니다.");
				return false;	            	
			};	
			var interArr = {"inter_num" :inter_num};
			$.ajax({
				url : "BasketDelete.bk",
				type : "post",
				dataType: 'text',
				data : interArr,
				success : function(){
					location.href = "MyBasketList.bk";
				},error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }

			});
		} 
    };
    

// 		function value_check() {
// 			var checkRow1value = '';

// 			$('input[name="checkRow1"]:checked').each(function(index) {
// 				if (index != 0) {
// 					checkRow1value += ',';
// 				}
// 				checkRow1value += $(this).val();
// 			});

// 			alert(checkRow1value);
// 		}


		$("#checkAll1").click(function() {
			if($('input[id="checkAll1"]').prop("checked")){
				$('.check_box input[id="checkRow1"]').prop('checked',true);
				$('.check_box input[id="checkRow2"]').prop('checked',false);
				$('.checkAll2 input[id="checkAll2"]').prop('checked',false);
			} else {
				$('.check_box input[id="checkRow1"]').prop('checked',false);
			}

		});

		$("#checkAll2").click(function() {
			if($('input[id="checkAll2"]').prop("checked")){
				$('.check_box input[id="checkRow2"]').prop('checked',true);
				$('.check_box input[id="checkRow1"]').prop('checked',false);
				$('.checkAll1 input[id="checkAll1"]').prop('checked',false);
			} else {
				$('.check_box input[id="checkRow2"]').prop('checked',false);
			}

		});

		// 대여가능도서 체크했을때
		$("#checkRow1").click(function() {
			if ($(this).is(":checked")) {
				$('.check_box input[id="checkRow2"]').prop('checked',false);
				$('.checkAll2 input[id="checkAll2"]').prop('checked',false); 
				$(".rentalbtn").show();
			} else {
				$('.checkAll1 input[id="checkAll1"]').prop('checked',false);
				$(".rentalbtn").hide();
			}
			
			var total_cnt1 = 0;
			$('input:checkbox[name="checkRow1"]').each(function() {
				if (this.checked) {
					total_cnt1 += 1;
				}
			});

			$(".totalbookcnt").html(total_cnt1 + "권");
		});

		// 예약가능도서 체크했을때
		$("#checkRow2").click(function() {
			if ($(this).is(":checked")) {
				$('.check_box input[id="checkRow1"]').prop('checked',false);
				$('.checkAll1 input[id="checkAll1"]').prop('checked',false);
				$(".reservationbtn").show();
				
				var total_cnt2 = 0;
				$('input:checkbox[name="checkRow2"]').each(function() {
					if (this.checked) {
						total_cnt2 += 1;
					}
				});

				$(".totalbookcnt").html(total_cnt2 + "권");
			} else {
				$('.checkAll2 input[id="checkAll2"]').prop('checked',false);
				$(".reservationbtn").hide();
			}

		});

// 		$("#checkRow1").click(function() {
// 			if ($(this).is(":checked")) {
				
// 			} else {
				
// 			}

// 		});
// 		$("#checkRow2").click(function() {
// 			if ($(this).is(":checked")) {
				
// 			} else {
				
// 			}

// 		});

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

// 		$("#checkRow1").click(function() {
// 			var total_cnt1 = 0;
// 			$('input:checkbox[name="checkRow1"]').each(function() {
// 				if (this.checked) {
// 					total_cnt1 += 1;
// 				}
// 			});

// 			$(".totalbookcnt").html(total_cnt1 + "권");
// 		});

// 		$("#checkRow2").click(function() {
// 			var total_cnt2 = 0;
// 			$('input:checkbox[name="checkRow2"]').each(function() {
// 				if (this.checked) {
// 					total_cnt2 += 1;
// 				}
// 			});

// 			$(".totalbookcnt").html(total_cnt2 + "권");
// 		});

		$(".orderbtn").click(function() {
			if ($(".abcabc").val() == "구독안함") {
				var u = "myPage/subscribe.jsp";
				var option = "width = 900, height = 650, top = 100, left = 400, location = no"
				window.open(u, option);
			}
		});
	</script>
</section>

<jsp:include page="../include/footer.jsp" />


