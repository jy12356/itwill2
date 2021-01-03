<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("id"); %>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
	<div class="contents-wrap">
		<div class="charge">
			<div class="charge-top">
				<div class="ct-inner">
					<div>
						<h2>동서남Book 북캐시 구독하기</h2>
						<ul>
							<li> - 매월 1일 ~ 3일 동서남Book 구독 초기화 및 연장 결제(1개월 / 3개월 / 12개월 적립금 유효기간 : 30일)</li>
							<li> - 동서남Book 구독 결제 후 유료 서비스 및 콘텐츠 구매 시 환불 불가</li>
							<li> - 동서남Book 구독 결제 후 7일 이내에 유료 서비스나 콘텐츠를 구매하지 않은 경우 주문취소 및 환불 (주문취소 불가의 경우) 가능</li>
							<li> - 동서남Book 구독 환불 시에는 동서남Book 구독 시 추가적으로 제공된 적립금 차감 및 환불 수수료 공제</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="charge-bottom">
				<form name="order_info" method="post" action="ChargePro.dok">	
				<input type="hidden" name="ordr_idxx" value="97651418"/>
				<input type="hidden" name="sspay_direct" class="sspay_direct" value="N"> 
				<input type="hidden" name="good_name" value="북캐시 2,000원"/>
				<input type="hidden" name="good_mny" class="good_mny" value="2000">
				<input type="hidden" name="buyr_name" value=""/>
				<input type="hidden" name="buyr_mail" value="@" />
				<input type="hidden" name="buyr_tel1" value="--"/>
				<input type="hidden" name="buyr_tel2" value="--"/>
				<input type="hidden" name="req_tx"          value="pay" />
				<input type="hidden" name="site_cd"         value="K4282" />
				<input type="hidden" name="site_name"       value="BookCube" />
				<input type="hidden" name="quotaopt"        value="12"/>
				<input type="hidden" name="id" id="id" value="<%=id%>"/>
				
				
				<!-- 필수 항목 : 결제 금액/화폐단위 -->
				<input type="hidden" name="currency"        value="WON"/>
				<!-- PLUGIN 설정 정보입니다(변경 불가) -->
				<input type="hidden" name="module_type"     value="01"/>
				<input type="hidden" name="res_cd"          value=""/>
				<input type="hidden" name="res_msg"         value=""/>    
				<input type="hidden" name="enc_info"        value=""/>
				<input type="hidden" name="enc_data"        value=""/>
				<input type="hidden" name="ret_pay_method"  value=""/>
				<input type="hidden" name="tran_cd"         value=""/>    
				<input type="hidden" name="use_pay_method"  value=""/>
				
				<!-- 주문정보 검증 관련 정보 : Payplus Plugin 에서 설정하는 정보입니다 -->
				<input type="hidden" name="ordr_chk"        value=""/>

				<!--  현금영수증 관련 정보 : Payplus Plugin 에서 설정하는 정보입니다 -->    
				<input type="hidden" name="cash_yn"         value=""/>    
				<input type="hidden" name="cash_tr_code"    value=""/>
				<input type="hidden" name="cash_id_info"    value=""/>

				<!-- 2012년 8월 18일 전자상거래법 개정 관련 설정 부분 -->
				<!-- 제공 기간 설정 0:일회성 1:기간설정(ex 1:2012010120120131)  -->
				<input type="hidden" name="good_expr" value="0">
				<input type="hidden" name="order_info" value="bookcash"/>
					<fieldset>
						<legend>동서남Book 구독 금액 선택</legend>
						<h3>동서남Book 구독 금액 선택</h3>
						<div class="bookcash-charge">
							<table>
								<caption>동서남Book 구독 금액 및 적립금</caption>
								<colgroup>
									<col width="50%" />
									<col width="50%" />
								</colgroup>
								<tbody>
									<tr>
										<th>동서남Book 구독 </th>
										<th>※세부사항</th>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='gproduct' id="gproduct" value="1개월" checked="checked"/><label>1개월 구독(19900원)</label></td>
										<td>-</td>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='gproduct' id="gproduct" value="3개월" /><label>3개월 정기 구독(39900원)</label></td>
										<td>정기 구독을 결제 했을 시, 만료 일 전 갱신을 위한 연락을 취해드립니다. 만약 구독 갱신을 하지 않았을 시, 자동적으로 결제 되지 않습니다.</td>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='gproduct' id="gproduct" value="12개월" /><label>12개월 정기 구독(190000원)</label></td>
										<td>정기 구독을 결제 했을 시, 만료 일 전 갱신을 위한 연락을 취해드립니다. 만약 구독 갱신을 하지 않았을 시, 자동적으로 결제 되지 않습니다.</td>
									</tr>
<!-- 									<tr> -->
<!-- 										<td><input type="radio" class="cashamount" name='cash' value='30000' /><label for='cash30000'>30,000원</label></td> -->
<!-- 										<td>+7% (2,100원)</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td><input type="radio" class="cashamount" name='cash' value='50000' /><label for='cash50000'>50,000원</label></td> -->
<!-- 										<td>+7% (3,500원)</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td><input type="radio" class="cashamount" name='cash' value='100000' /><label for='cash100000'>100,000원</label></td> -->
<!-- 										<td>+9% (9,000원)</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td><input type="radio" class="cashamount" name='cash' value='200000' /><label for='cash200000'>200,000원</label></td> -->
<!-- 										<td>+10% (20,000원)</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td><input type="radio" class="cashamount" name='cash' value='300000' /><label for='cash300000'>300,000원</label></td> -->
<!-- 										<td>+10% (30,000원)</td> -->
<!-- 									</tr> -->
								</tbody>
							</table>
						</div>
						<h3>결제가능 수단</h3>
						<div class="pay-way">
							<ul>
								<li><label><input type="radio" name="payMethod" onclick="paymethod('naver')" value="naver"><img src="sub5/mypageimg/naver.png" alt='네이버페이' /></label></li>
								<li><label><input type="radio" name="payMethod" onclick="paymethod('kakao')" value="kakao"><img src="sub5/mypageimg/pay-kakao.png" alt='카카오페이' /></label></li>
								<li><label><input type="radio" name="payMethod" onclick="paymethod('payco')" value="payco"><img src="sub5/mypageimg/pay-payco.png" alt='페이코' /></label></li>									
								<li><label><input type="radio" name="payMethod" id="pay_samsung_card" onclick="paymethod('100000000000')" value="100000000000"><img src="sub5/mypageimg/pay-samsung.png" alt='삼성페이' /></label></li>
<!-- 								<li><label><input type="radio" name="payMethod" onclick="paymethod('paypal')" value="paypal"><img src="../images/pay-paypal.png" alt='페이팔' /></label></li> -->
								<li><label><input type="hidden" name="payMethod" onclick="paymethod('100000000000')" value="100000000000" checked="checked">신용카드</label></li>
<!-- 								<li><label><input type="radio" name="payMethod" id="pay_used_card" onclick="paymethod('100000000000')" value="100000000000">해외 신용카드</label></li>									 -->
								<li><label><input type="hidden" name="payMethod" onclick="paymethod('010000000000')" value="010000000000">계좌이체</label></li>
								<li><label><input type="hidden" name="payMethod" onclick="paymethod('000010000000')" value="000010000000">휴대폰</label></li>									
								<li><label><input type="hidden" name="payMethod" onclick="paymethod('000000001000')" value="000000001000">해피머니/도서/문화상품권</label></li>									
							</ul>
							</div>
						<div class="naver-choice">
							<dl>
								<dt>네이버페이 간편결제 안내</dt>									
							</dl>
							<p>• 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다</p>
							<p>• 네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.</p>
							<p>• 결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티, 카카오뱅크</p>
							<p>• 결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크, 카카오뱅크, 삼성증권, KDB산업은행</p>
							<p>• 네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사 별 무이자, 청구할인 혜택을 받을 수 있습니다.</p>
							<dl style="margin-top:10px;">
								<dt>유의사항</dt>
								<dd>1) 네이버페이로 북캐시 결제 시 네이버페이 포인트 적립 대상이 아닙니다.</dd>
							</dl>
						</div>
						<div class="payco-choice">
							<p>PAYCO 간편결제 안내</p>
							<p>PAYCO는 온/오프라인 쇼핑은 물론 송금, 멤버십 적립까지 가능한 통합 서비스입니다.<br>휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다.<br>- 지원카드: 모든 국내 신용/체크카드</p>
							<p class="payco-promotion">※ PAYCO 11월 결제 프로모션</p>
							<ol>
								<li>1) 생애 첫 결제 시, 최대 4,500원 혜택: 10,000원 이상 결제 시 2,000원 할인 + 2,500원 상당 할인쿠폰 추가 지급 (슈퍼세이브와 중복적용 불가)</li>
								<li>2) 결제 리워드 프로모션 : 구매금액의 0.2% 적립 (결제 완료된 달의 다음 달 15일에 포인트 또는 쿠폰으로 지급)</li>
								<li>3) 포인트 결제 2% 적립 프로모션 : PAYCO유상충전포인트로 결제 시 2% 적립</li>
							</ol>
						</div>
						<div class="paypal-choice">
							<dl>
								<dt>페이팔이란?</dt>
								<dd>페이팔은 해외 이용자를 위한 간편 결제 수단으로, 페이팔 계정에 결제정보(해외이용 가능 카드정보) 등록 시 아이디/패스워드만으로 결제가 가능합니다.</dd>
							</dl>
							<p>유의사항</p>
							<ol>
								<li>1) 3만원 이상 결제 시에만 사용 가능합니다.</li>
								<li>2) 현재 해외에 거주 또는 체류하고 계신 분만 이용 가능합니다.</li>
								<li>3) 페이팔 계정이 있는 경우에만 결제 시, 아이디/패스워드만으로 결제 가능합니다.</li>
								<li>4) 페이팔 계정 없이도 결제 가능하지만, 결제정보(해외이용 가능 카드정보)를 모두 기입해야 합니다.<br />페이팔 계정은 공식 사이트(http://bit.ly/1ldeBXy)를 통해 만드실 수 있습니다.</li>
								<li>5) 페이팔 결제로 충전한 북캐시는 취소가 불가능합니다.</li>
							</ol>
						</div>
						<div class="kakao-choice">
							<dl>
								<dt>카카오페이 이용불가 카드 안내</dt>
								<dd>농협 NH카드의 경우 카카오페이를 통한 북캐시 결제가 불가합니다. 해당 카드는 결제수단 '신용카드' 선택 후 결제 진행해 주세요.</dd>
							</dl>
						</div>															
						<div class="payment-result">
							<p>구매할 구독권 : <span class="total_pay_amount">1개월</span></p>
							<p class="deduction-result">소득공제 <span>불가</span></p>
							<%if(id == null){ %>
							<input type="button"value="결제하기"onclick='ccCheck()'>
							<script>
							function ccCheck(){
								var u = alert("로그인해 주시기 바랍니다");
							}</script>
							<%}else{ %>
							<input type="submit"value="결제하기">
							<%} %>
							<script>
							
							</script>
						</div>							
					</fieldset>
				</form>
			</div>
		</div>					
	</div>
	
</section>
<script>

function cCheck(){
	var u = "sub5/charge2.jsp";
	var name = "charge2";
	var option = "width = 900, height = 650, top = 100, left = 400, location = no"
	window.open(u,name,option);
}

$(function(){	
	var page = $(".wrap").data("page");
	var series_num = $(".wrap").data("serial-num");

	$('.cashamount').click(function(){
		$(".total_pay_amount").text(commify($(this).val()));
		document.order_info.good_mny.value = $(this).val();
		document.order_info.good_name.value = "북캐시 "+ commify($(this).val())
		
		//document.order_info.user_good_mny.value = $(this).val();
		document.regForm.item_0_product.value = 'BOOKCASH '+ $(this).val() ;
		document.regForm.amt.value = $(this).val() ;
		document.regForm.item_0_unitPrice.value = $(this).val() ;
	});	
});

/* Payplus Plug-in 실행 */
function jsf__pay( form )
{
	var good_mny = $(".good_mny").val();
	var pay_method = $("input:radio[name='payMethod']:checked").val();

	$(".used_card_YN").val('');
	$(".used_card").val('');
	


	
	//계좌이체, 해피머니
	if (pay_method == "010000000000" || pay_method == "000000001000"){
		if (parseInt(good_mny) < 1000){
			alert('1000원이상 결제 가능합니다.');
			mny_reset();
			return ;
		}
	}
	if (pay_method == "kakao"){
		kakao_set();	
		return false ;
	}
	if (pay_method == "naver"){
		naver_set();	
		return false ;	
	}
	try
	{
		KCP_Pay_Execute( form ); 
	}
	catch (e)
	{
		/* IE 에서 결제 정상종료시 throw로 스크립트 종료 */ 
	}
} 

/* 결제수단 선택 */
function paymethod(arg){
	if (arg == 'payco'){
		$(".payco-choice").show();
		$(".paypal-choice").hide();
		$(".kakao-choice").hide();
		$(".naver-choice").hide();	
	}else if (arg == 'paypal'){
		$(".paypal-choice").show();
		$(".payco-choice").hide();
		$(".kakao-choice").hide();
		$(".naver-choice").hide();	
		$(".cashamount").eq(0).attr("disabled", true); 
		$(".cashamount").eq(1).attr("disabled", true); 
		$(".cashamount").eq(2).attr("disabled", true); 
		if ($(".cashamount").eq(0).is(":checked") || $(".cashamount").eq(1).is(":checked") || $(".cashamount").eq(2).is(":checked")){			
			alert('페이팔 결제는 30,000원 이상 가능합니다.');
			$(".cashamount").eq(3).attr("checked", true);
			$(".cashamount").eq(3).trigger('click');
		}
	}else if (arg == 'kakao'){
		$(".paypal-choice").hide();
		$(".payco-choice").hide();
		$(".naver-choice").hide();	
		$(".kakao-choice").show();
	}else if (arg == 'naver'){
		$(".paypal-choice").hide();
		$(".payco-choice").hide();
		$(".kakao-choice").hide();
		$(".naver-choice").show();		
	}else{
		$(".payco-choice").hide();
		$(".paypal-choice").hide();
		$(".kakao-choice").hide();
		$(".naver-choice").hide();	
		$(".cashamount").eq(0).attr("disabled", false); 
		$(".cashamount").eq(1).attr("disabled", false); 
		$(".cashamount").eq(2).attr("disabled", false);
		document.order_info.pay_method.value = arg ;
	}
}
function naver_order(){
	var order_info = "bookcash";
	var order_num = $(".wrap").data("order-num");
//	var order_title = $(".good_name").val();
	var total_amount = document.order_info.good_mny.value ;
	var naver_use_ymdt = $(".wrap").data("naver-use-ymdt");
	var gift_yn = "";
	var npayMode = $(".wrap").data("npay-mode");
	var cart_count = 1;
	var isbn_list = "";
	var title_list = document.order_info.good_name.value ;

	if ( total_amount != 2000 && total_amount != 5000 && total_amount != 10000 && total_amount != 30000 && total_amount != 50000 && total_amount != 100000 && total_amount != 200000 && total_amount != 300000){
		alert("충전 가능한 금액이 아닙니다.");
		return ;
	}		
}
</script>

<jsp:include page="../include/footer.jsp"/>