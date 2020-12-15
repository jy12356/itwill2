<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"/>
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>HOME &gt; 마이페이지</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="mypage">
			<div class="mypage-top">
				<div class="detail-inner">
					<h3>마이페이지</h3>
					<div class="mypage-box-top">
						<ul>
							<li>
								<span class="kakaotalk">로그인정보</span> <!-- bookcube,kakaotalk,naver,twitter,facebook,payco-->
								<p><span>계정 님</span></p>
								<a href="https://www.bookcube.com/member_info.asp" class="btn">회원정보</a>
							</li>
							<li>
								<p>북캐시</p>
								<p>0원</p>
								<div class="mysel">
									<a href="javascript:;" class="v-btn" data-fname="bookcash">내역보기 &gt;</a>
									<a href="https://www.bookcube.com/order/bookcash.asp">충전하기 &gt;</a>
								</div>
								<div class="my-frame bookcash">
								<iframe src="/mypage/_bookcash_history.asp?bookcash=0" width="100%" frameborder="0" name="bookcash_history" id="bookcash_history" scrolling="no" style="height: 263px;"></iframe>
								</div>
							</li>
							<li>
								<p>적립금</p>
								<p>0원</p>
								<div class="mysel">
									<a href="javascript:;" class="v-btn" data-fname="saved">내역보기 &gt;</a>
								</div>
								<div class="my-frame saved">
								<iframe src="/mypage/_savemoney_history.asp?savemoney=0&amp;expire_savemoney=0" width="100%" frameborder="0" name="savemoney_history" id="savemoney_history" scrolling="no" style="height: 289px;"></iframe>
								</div>
							</li>
							<li>
								<p>쿠폰/상품권</p>
								<p>0장</p>
								<div class="mysel">
									<a href="javascript:;" class="v-btn" data-fname="coupon">내역보기 &gt;</a>
									<a href="https://www.bookcube.com/coupon.asp">등록하기 &gt;</a>
								</div>
								<div class="my-frame coupon">
								<iframe src="/mypage/_coupon_history.asp" width="100%" frameborder="0" name="coupon_history" id="coupon_history" scrolling="no" style="height: 307px;"></iframe>
								</div>
							</li>
							<li>
								<p>무료이용권</p>
								<p>0장</p>
								<div class="mysel">
									<a href="javascript:;" class="v-btn" data-fname="free">내역보기 &gt;</a>
								</div>
								<div class="my-frame free">
									<iframe src="/mypage/_freeticket_history.asp" width="100%" frameborder="0" name="freeticket_history" id="freeticket_history" scrolling="no" style="height: 172px;"></iframe>
								</div>
							</li>
						</ul>
					</div>
					<script>
						$(function(){
							$(".v-btn").on("click",function(){
								var fname = $(this).data("fname");
								$(".my-frame").css("visibility","hidden");
								$(".my-frame."+ fname).css("visibility","visible");	
								return false;
							});	
							$(".mpop-close").on("click",function(){
								$(this).parent().parent().parent().css("visibility","hidden");
								return false;
							});
						});
					</script>
					<div class="mypage-box-bottom">
						<div>
							<ul>
								<li>
									<h4>구매관리</h4>
									<ul>
										<li><a href="/mypage.asp?list=_orderbooklist" class="">구매목록</a></li>
										<li><a href="/mypage.asp?list=_cart" class="">책바구니</a></li>
										<li><a href="/mypage.asp?list=_orderlist" class="">주문내역</a></li>
									</ul>
								</li>
								<li>
									<h4>나의 활동</h4>
									<ul>
										<li><a href="/mypage.asp?list=_my_serial" class="">나의작품</a></li>
										<li><a href="/mypage.asp?list=_review" class="">서평/댓글</a></li>
										<li><a href="/mypage.asp?list=_prefer" class="">선호작/선호작가/후속권알림</a></li>
									</ul>
								</li>
							</ul>
						</div>
						<div>
							<ul>
								<li>
									<p>선물함</p>
									<div>
										<a href="/mypage.asp?list=_gift_receive">받은 선물함 &gt;</a>
										<a href="/mypage.asp?list=_gift_send">보낸 선물함 &gt;</a>
									</div>
								</li>
								<!--li>
									<p>장르정액권 : 29일 20시간 남음</p>
								</li-->
								<li>
									<a href="https://www.bookcube.com/order/free_ticket.asp" data-mypage-list="_gift_receive"><p>장르정액권 구매하기 &gt;</p></a>
								</li>
								<li>
									<a href="https://www.bookcube.com/order/free_ticket.asp" data-mypage-list="_gift_receive"><p>만화정액권 구매하기 &gt;</p></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="mypage-bottom">
				<iframe src="../sub5/wwish.jsp" width="100%" frameborder="0" name="mypageList" id="mypageList" scrolling="no" style="height: 688px;"></iframe>					
			</div>
		</div>				
	</div>
	
</section>
<jsp:include page="../include/footer.jsp"/>