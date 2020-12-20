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
ArrayList<MyBasketBean> myBasketList = (ArrayList<MyBasketBean>) request.getAttribute("myBasketList");

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
						<caption>책바구니2222222</caption>

						<colgroup>
							<col style="width: 5%">
							<col style="width: 20%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 10%">

						</colgroup>
							<tr>
								<td colspan="6"><span>대여 가능 책 목록</span>
								<td>
							</tr>
							<tr>
								<th scope="col" abbr="책번호">
                  <input type="checkbox" name="checkAll1" id="checkAll1" class="checkAll1" /></th>
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
						if(rentalableList.size() != 0) {
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
						
								if(unRentalableList.size() != 0) {
						for (int j = 0; j < unRentalableList.size(); j++) {
							if(unRentalableList.get(j).getState().equals("1")) {
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
<!-- 						if (myBasketList.size() != 0) {
							for (int i = 0; i < myBasketList.size(); i++) {
								if (myBasketList.get(i).getState().equals("대여가능")) {
						%>
						<tr>
							<td><input type="checkbox" id="check_box1"
								class="check_box c1" value="<%=myBasketList.get(i).getNum()%>"
								name="inter_num"></td>
							<td><%=myBasketList.get(i).getTitle()%></td>
							<td><%=myBasketList.get(i).getAuthor()%></td>
							<td><%=myBasketList.get(i).getPublisher()%></td>
							<td><%=myBasketList.get(i).getPubdate()%></td>
							<td><%=myBasketList.get(i).getState()%></td>

						</tr>
						<%
							// 예약가능 리스트
						} else if (myBasketList.get(i).getState().equals("대여불가능")) {
						%>
						<tr>
							<td colspan="6"><span>예약 가능 책 목록</span></td>
						</tr>
						<tr>
							<th scope="col" abbr="책번호"><input type="checkbox"
								name="checkAll2" id="checkAll2" class="checkAll2" /></th>
							<th scope="col" abbr="제목">제목</th>
							<th scope="col" abbr="작가">작가</th>
							<th scope="col" abbr="출판사">출판사</th>
							<th scope="col" abbr="출판일">출판일</th>
							<th scope="col" abbr="상태">상태</th>
						</tr>
						<tr>
							<td><input type="checkbox" id="check_box2"
								class="check_box c2" value="<%=myBasketList.get(i).getNum()%>"
								name="inter_num"></td>
							<td><%=myBasketList.get(i).getTitle()%></td>
							<td><%=myBasketList.get(i).getAuthor()%></td>
							<td><%=myBasketList.get(i).getPublisher()%></td>
							<td><%=myBasketList.get(i).getPubdate()%></td>
							<td><%=myBasketList.get(i).getState()%></td>  -->
						</tr>
						<%
							}
						} 
								}
						%>

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
								
							<input type="button" style="display: none;" class="reservationbtn" value="예약하기" onclick="reservation()">
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
		// 다중 삭제
// 		function deleteBook() {
// 			var confirm_val = confirm("정말 삭제하시겠습니까?");

// 			if (confirm_val) {
// 				var inter_num = [];
// 				if ($('.check_box input[type="checkbox"]:checked').length > 0) {
// 					$('.check_box input[type="checkbox"]:checked').each(
// 							function() {
// 								inter_num.push($(this).attr("value"));
// 							});
// 				} else {
// 					alert("삭제할 도서를 선택해주시기 바랍니다.");
// 					return false;
// 				}
// 				;
// 				var interArr = {
// 					"inter_num" : inter_num
// 				};

// 				$.ajax({
// 					url : "BasketDelete.bk",
// 					type : "post",
// 					dataType : 'text',
// 					data : interArr,
// 					success : function() {
// 						location.href = "MyBasketList.bk";
// 					},
// 					error : function(request, status, error) {
// 						alert("code:" + request.status + "\n" + "message:"
// 								+ request.responseText + "\n" + "error:"
// 								+ error);
// 					}

				});
			}
		};

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
// 						$('.c1 input[type="checkbox"]:checked').each(
						$('input:checkbox[name="inter_num"]:checked').each(
								function() {
									inter_num.push($(this).attr("value"));
								});
						// 아무것도 체크한게없으면
					} else {
						alert("대여할 도서를 선택해주시기 바랍니다.");
						return false;
					};
					// 체크한거 담아서
					var interArr = {"inter_num" : inter_num};
					
					$.ajax({
						url : "rentalInsert.rn",
						type : "post",
						dataType : 'text',
						data : interArr,
						success : function() {
							// 대여하기 성공했으면 대여리스트로 가기
							location.href = "rentalList.bk";
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}

					});
				}

		$("#checkAll1").click(function() {
			if($('input[id="checkAll1"]').prop("checked")){
				$('.check_box input[id="checkRow1"]').prop('checked',true);
				$('.check_box input[id="checkRow2"]').prop('checked',false);
				$('.checkAll2 input[id="checkAll2"]').prop('checked',false);
			} else {
				$('.check_box input[id="checkRow1"]').prop('checked',false);

			}
		}
		// 대여가능도서 전체 선택
//		$(".checkAll1").click(function() {
//			if ($(this).is(":checked")){
//				$(".c1").prop("checked",true);	//전체선택 체크된경우
//				$(".c2").prop("checked",false);	//전체선택 체크된경우
//				$(".checkAll2").prop("checked",false);	//전체선택 체크된경우
//				$(".rentalbtn").show();
//			} else {
//				$(".c1").prop("checked",false);	//전체선택 해제된경우
//				$(".rentalbtn").hide();

//			}
//			var play = cartset();
//		});

		$("#checkAll2").click(function() {
			if($('input[id="checkAll2"]').prop("checked")){
				$('.check_box input[id="checkRow2"]').prop('checked',true);
				$('.check_box input[id="checkRow1"]').prop('checked',false);
				$('.checkAll1 input[id="checkAll1"]').prop('checked',false);
			} else {
				$('.check_box input[id="checkRow2"]').prop('checked',false);

		// 예약가능도서 전체선택
	//	$(".checkAll2").click(function() {
	//		if ($(this).is(":checked")){
	//			$(".c2").prop("checked",true);	//전체선택 체크된경우
	//			$(".c1").prop("checked",false);	//전체선택 체크된경우
	//			$(".checkAll1").prop("checked",false);	//전체선택 체크된경우
	//			$(".reservationbtn").show();
	//		} else {
	//			$(".c2").prop("checked",false);	//전체선택 해제된경우
	//			$(".reservationbtn").hide();

			}
			var play = cartset();
		});

		// 대여가능도서 체크했을때
		$("#checkRow1").click(function() {
			if ($(this).is(":checked")) {
				$('.check_box input[id="checkRow2"]').prop('checked',false);
				$('.checkAll2 input[id="checkAll2"]').prop('checked',false); 

		
		// 하나하나 대여가능도서 체크했을때
	//	$("#check_box1").click(function() {
	//		var total_cnt1 = 0;
	//		if ($(this).is(":checked")) {
	//			$('.check_box input[id="check_box2"]').prop('checked', false);
		//		$('.checkAll2 input[id="checkAll2"]').prop('checked', false);

				$(".rentalbtn").show();
				
			} else {
				$('.checkAll1 input[id="checkAll1"]').prop('checked',false);
				$(".rentalbtn").hide();
			}
			var play = cartset();
		} );


		// 예약가능도서 체크했을때
		$("#checkRow2").click(function() {
			if ($(this).is(":checked")) {
				$('.check_box input[id="checkRow1"]').prop('checked',false);
				$('.checkAll1 input[id="checkAll1"]').prop('checked',false);

		// 하나하나 예약가능도서 체크했을때
	//	$("#check_box2").click(function() {
	//		if ($(this).is(":checked")) {
	//			$('.check_box input[id="checkRow1"]').prop('checked', false);
	//			$('.checkAll1 input[id="checkAll1"]').prop('checked', false);

				$(".reservationbtn").show();
				
			} else {
				$('.checkAll2 input[id="checkAll2"]').prop('checked',false);

				$(".reservationbtn").hide();
			}
			var play = cartset();
		});


		
		function cartset(){
			var total_cnt = 0 ;
			$('input:checkbox[name="inter_num"]').each(function() {
				if(this.checked){
					total_cnt += 1 ;
				}
			});	
	
			
			$(".totalbookcnt").html(total_cnt +"권");
		}
	</script>
</section>

<jsp:include page="../include/footer.jsp" />


