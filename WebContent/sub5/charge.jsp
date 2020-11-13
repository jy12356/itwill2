<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
	<div class="contents-wrap">
		<div class="charge">
			<div class="charge-top">
				<div class="ct-inner">
					<div>
						<h2>북큐브 북캐시 충전하기</h2>
						<ul>
							<li> - 매월 1일 ~ 3일 북캐시 충전 금액별 추가 적립금 지급 (2,000원 / 5,000원은 제외, 적립금 유효기간 : 30일)</li>
							<li> - 북캐시 결제 후 유료 서비스 및 콘텐츠 구매 시 환불 불가</li>
							<li> - 북캐시 결제 후 7일 이내에 유료 서비스나 콘텐츠를 구매하지 않은 경우 주문취소 및 환불 (주문취소 불가의 경우) 가능</li>
							<li> - 북캐시 환불 시에는 북캐시 결제 시 추가적으로 제공된 적립금 차감 및 환불 수수료 공제</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="charge-bottom">
				<form name="order_info" method="post" action="https://www.bookcube.com/order/kcp/pp_ax_hub.asp">	
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
				
				<!-- 해외카드 관련 정보 -->
				<input type="hidden" name="used_card_YN" class="used_card_YN" value="">
				<input type="hidden" name="used_card" class="used_card"  value="">
				<!-- 문화상품권 관련 shop_id 처리-->
				<input type="hidden" name="tk_shop_id" value="n20201105095815"/>
				<input type="hidden" name="shop_user_id" value="n20201105095815"/>
				<input type="hidden" name="pay_method" value="100000000000">
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
						<legend>북캐시 충전 금액 선택</legend>
						<h3>북캐시 충전 금액 선택</h3>
						<div class="bookcash-charge">
							<table>
								<caption>북캐시 충전 금액 및 적립금</caption>
								<colgroup>
									<col width="50%" />
									<col width="50%" />
								</colgroup>
								<tbody>
									<tr>
										<th>북캐시 충전 금액</th>
										<th>추가 지급 적립금</th>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='cash' value='2000' checked="checked"/><label for='cash2000'>2,000원</label></td>
										<td>-</td>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='cash' value='5000' /><label for='cash5000'>5,000원</label></td>
										<td>-</td>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='cash' value='10000' /><label for='cash10000'>10,000원</label></td>
										<td>+5% (500원)</td>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='cash' value='30000' /><label for='cash30000'>30,000원</label></td>
										<td>+7% (2,100원)</td>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='cash' value='50000' /><label for='cash50000'>50,000원</label></td>
										<td>+7% (3,500원)</td>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='cash' value='100000' /><label for='cash100000'>100,000원</label></td>
										<td>+9% (9,000원)</td>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='cash' value='200000' /><label for='cash200000'>200,000원</label></td>
										<td>+10% (20,000원)</td>
									</tr>
									<tr>
										<td><input type="radio" class="cashamount" name='cash' value='300000' /><label for='cash300000'>300,000원</label></td>
										<td>+10% (30,000원)</td>
									</tr>
								</tbody>
							</table>
						</div>
						<h3>결제수단 선택</h3>
						<div class="pay-way">
							<ul>
								<li><label><input type="radio" name="payMethod" onclick="paymethod('naver')" value="naver"><img src="../images/pay-naver.png" alt='네이버페이' /></label></li>
								<li><label><input type="radio" name="payMethod" onclick="paymethod('kakao')" value="kakao"><img src="../images/pay-kakao.png" alt='카카오페이' /></label></li>
								<li><label><input type="radio" name="payMethod" onclick="paymethod('payco')" value="payco"><img src="../images/pay-payco.png" alt='페이코' /></label></li>									
								<li><label><input type="radio" name="payMethod" id="pay_samsung_card" onclick="paymethod('100000000000')" value="100000000000"><img src="../images/pay-samsung.png" alt='삼성페이' /></label></li>
								<li><label><input type="radio" name="payMethod" onclick="paymethod('paypal')" value="paypal"><img src="../images/pay-paypal.png" alt='페이팔' /></label></li>
								<li><label><input type="radio" name="payMethod" onclick="paymethod('100000000000')" value="100000000000" checked="checked">신용카드</label></li>
								<li><label><input type="radio" name="payMethod" id="pay_used_card" onclick="paymethod('100000000000')" value="100000000000">해외 신용카드</label></li>									
								<li><label><input type="radio" name="payMethod" onclick="paymethod('010000000000')" value="010000000000">계좌이체</label></li>
								<li><label><input type="radio" name="payMethod" onclick="paymethod('000010000000')" value="000010000000">휴대폰</label></li>									
								<li><label><input type="radio" name="payMethod" onclick="paymethod('000000001000')" value="000000001000">해피머니/도서/문화상품권</label></li>									
							</ul>
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
							<p>총 결제 금액 : <span class="total_pay_amount">2,000원</span></p>
							<p class="deduction-result">소득공제 <span>불가</span></p>
							<input type="button" onclick="jsf__pay(this.form);" value="결제하기">
							<!--input type="button"  value='결제하기' onclick="kakao_set();" class="kakaoBtn"/-->
						</div>							
					</fieldset>
				</form>
			</div>
		</div>					
	</div>
	
</section>

<jsp:include page="../include/footer.jsp"/>