<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@page import="vo.BookInterestBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%
	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	ArrayList<BookInterestBean> bookListDibsList = (ArrayList<BookInterestBean>)request.getAttribute("bookListDibsList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
%>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 마이페이지</p>
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
                                <img src="mypageimg/my-1.png">
                                <p>0원</p>
                                <div class="mysel">
                                    <a href="javascript:;" class="v-btn" data-fname="bookcash">내역보기 &gt;</a>

                                    <a href="https://www.bookcube.com/order/bookcash.asp">충전하기 &gt;</a>

                                </div>
                                <div class="my-frame bookcash">
                                        <div class="mpop bookcash">
                                            <div class="mpop-inner">
                                                <h4>북캐시 상세내역</h4>
                                                <p>나의 북캐시 : <span>0원</span></p>
                                                <ul>
                                                    <li>- 북캐시 결제 후 7일 이내에 유료 서비스나 콘텐츠를 구매하지 않은 경우 환불 가능</li>
                                                    <li>- 북캐시 환불 시에는 북캐시 결제 시 추가적으로 제공된 적립금 차감 및 환불 수수료 공제</li>
                                                </ul>
                                                <!--<p class="no">충전 내역이 없습니다.</p>-->
                                                <table>
                                                    <caption>북캐시 상세내역</caption>
                                                    <colgroup>
                                                        <col width="20%">
                                                        <col width="40%">
                                                        <col width="20%">
                                                        <col width="20%">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>날짜</th>
                                                            <th>구분</th>
                                                            <th>금액</th>
                                                            <th>잔액</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">북캐시 내역이 없습니다.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <a href="javascript:;" class="mpop-close">close</a>
                                            </div>
                                        </div>

                                    </body>
                                </div>
                            </li>
                            <li>
                                <img src="mypageimg/my-2.png">
                                <p>0원</p>
                                <div class="mysel">
                                    <a href="javascript:;" class="v-btn" data-fname="saved">내역보기 &gt;</a>
                                </div>
                                <div class="my-frame saved">
                                        <div class="mpop saved">
                                            <div class="mpop-inner">
                                                <h4>적립금 상세내역</h4>
                                                <p>나의 적립금 : <span>0원</span></p>
                                                <p>7일 이내 소멸 예정 적립금 : <span>0원</span></p>
                                                <ul>
                                                    <li>- 승인일로부터 7일 이내에 주문취소 하였으나 소멸기간이 만료된 경우 적립금이 소멸</li>
                                                    <li>- 사용한 적립금 구매 후 7일 이내 주문 취소한 경우, 소멸 기간이 남은 적립금에 한하여 복원</li>
                                                </ul>
                                                <!--<p class="no">적립 내역이 없습니다.</p>-->
                                                <table class="cash-detail">
                                                    <caption>적립금 상세내역</caption>
                                                    <colgroup>
                                                        <col width="20%">
                                                        <col width="40%">
                                                        <col width="20%">
                                                        <col width="20%">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>날짜</th>
                                                            <th>구분</th>
                                                            <th>금액</th>
                                                            <th>소멸일시</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">적립금 내역이 없습니다.</td>
                                                        </tr>

                                                    </tbody>
                                                </table>

                                                <a href="javascript:;" class="mpop-close">close</a>
                                            </div>
                                        </div>
                                </div>
                            </li>
                            <li>
                                <img src="mypageimg/my-3.png">
                                <p>0장</p>
                                <div class="mysel">
                                    <a href="javascript:;" class="v-btn" data-fname="coupon">내역보기 &gt;</a>
                                    <a href="https://www.bookcube.com/coupon.asp">등록하기 &gt;</a>
                                </div>
                                <div class="my-frame coupon">
                                        <div class="mpop coupon">
                                            <div class="mpop-inner">
                                                <h4>쿠폰/상품권 상세내역</h4>
                                                <p>나의 쿠폰/상품권 : <span>0장</span></p>
                                                <ul>
                                                    <li>- 결제 시 하나의 쿠폰만 사용 가능합니다. (쿠폰 중복 사용 불가)</li>
                                                    <li>- 쿠폰 할인액(율), 쿠폰 적용금액을 확인해 주시기 바랍니다.</li>
                                                    <li>- 도서 정가제 시행에 따라 구매에 적용되는 쿠폰은 정가 대비 10% 이상 할인이 불가합니다.</li>
                                                    <li>- 사용기간이 만료된 쿠폰은 목록에서 자동 삭제 됩니다.</li>
                                                </ul>
                                                <!--<p class="no">사용 가능한 쿠폰/상품권이 없습니다.</p>-->
                                                <table>
                                                    <caption>쿠폰/상품권 상세내역</caption>
                                                    <colgroup>
                                                        <col width="20%">
                                                        <col width="20%">
                                                        <col width="40%">
                                                        <col width="20%">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>쿠폰명</th>
                                                            <th>할인액(율)</th>
                                                            <th>내용</th>
                                                            <th>사용기간</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">쿠폰/상품권 내역이 없습니다.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <a href="javascript:;" class="mpop-close">close</a>
                                            </div>
                                        </div>
                                </div>
                            </li>
                            <li>
                                <img src="mypageimg/my-4.png">
                                <p>0장</p>
                                <div class="mysel">
                                    <a href="javascript:;" class="v-btn" data-fname="free">내역보기 &gt;</a>
                                </div>
                                <div class="my-frame free">
                                        <div class="mpop free">
                                            <div class="mpop-inner">
                                                <h4>무료이용권 상세내역</h4>
                                                <p>나의 무료이용권 : <span>0장</span></p>
                                                <!--<p class="no">사용 가능한 무료이용권이 없습니다.</p>-->
                                                <table>
                                                    <caption>적립금 상세내역</caption>
                                                    <colgroup>
                                                        <col width="15%">
                                                        <col width="35%">
                                                        <col width="10%">
                                                        <col width="20%">
                                                        <col width="20%">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>날짜</th>
                                                            <th>제목</th>
                                                            <th>수량</th>
                                                            <th>이용제한</th>
                                                            <th>유효기간</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="5">무료이용권 내역이 없습니다.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <a href="javascript:;" class="mpop-close">close</a>
                                            </div>
                                        </div>
                                </div>
                            </li>
                        </ul>
                    </div>
		           <script>
		               $(function() {
		                   $(".v-btn").on("click", function() {
		                       var fname = $(this).data("fname");
		                       $(".my-frame").css("visibility", "hidden");
		                       $(".my-frame." + fname).css("visibility", "visible");
		                       return false;
		                   });
		                   $(".mpop-close").on("click", function() {
		                       $(this).parent().parent().parent().css("visibility", "hidden");
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
		                               <li><a href="my_shoplist.html" class="">구매목록</a></li>
		                               <li><a href="my_basket.html" class="on">책바구니</a></li>
		                               <li><a href="my_gudok.html" class="">구독내역</a></li>
		                           </ul>
		                       </li>
		                       <li>
		                           <h4>나의 활동</h4>
		                           <ul>
		                               <li><a href="my_active.html" class="">서평/댓글</a></li>
		                               <li><a href="my_wish.html" class="">선호장르/선호작가</a></li>
		                           </ul>
		                       </li>
		                   </ul>
		               </div>
		               <div>
		                   <ul>
		                       <li>
		                           <img src="mypageimg/my-5.png">
		                           <div>
		                               <a href="my_receivegift.html">받은 선물함 &gt;</a>
		                               <a href="my_sendgift.html">보낸 선물함 &gt;</a>
		                           </div>
		                       </li>
		                       <!--li>
			<p>장르정액권 : 29일 20시간 남음</p>
		</li-->
		                       <li>
		                           <a href="https://www.bookcube.com/order/free_ticket.asp" data-mypage-list="_gift_receive">
		                               <p>장르정액권 구매하기 &gt;</p>
		                           </a>
		                       </li>
		                       <li>
		                           <a href="https://www.bookcube.com/order/free_ticket.asp" data-mypage-list="_gift_receive">
		                               <p>만화정액권 구매하기 &gt;</p>
		                           </a>
		                       </li>
		                   </ul>
		               </div>
		           </div>
		       </div>
		   </div>
		   <div class="mypage-bottom">
		       <div class="frame">
		           <h3>책바구니</h3>
		           <div class="tab">
		               <ul>
		                   <li><a href="../javascript:;" class="on">서점 (0)</a></li>
		                   <li><a href="../javascript:parent.goUrl('/mypage.asp?list=_cart_serial');">웹소설 (0)</a></li>
		                   <li><a href="../javascript:parent.goUrl('/mypage.asp?list=_cart_toon');">웹툰 (0)</a></li>
		               </ul>
		               <div class="tab-sort">
		                   <div>
		                       <div class="checkbox">
		                           <label>
		                               <input type="checkbox" value="" class="allchkSeries">
		                               <span><i></i></span>
		                           </label>
		                       </div>
		                       <a href="javascript:;" class="btn carDel">삭제</a>
		                       <div class="k-array">
		                           <input type="radio" name="" id="" checked="">
		                           <label for="" class="radio deduction_yn" data-deduction-yn=""><span class="radio_on"><em>전체</em></span></label>
		                           <input type="radio" name="" id="" checked="">
		                           <label for="" class="radio deduction_yn" data-deduction-yn="1"><span class="radio_off"><em>소득공제 가능</em></span></label>
		                           <input type="radio" name="" id="" checked="">
		                           <label for="" class="radio deduction_yn" data-deduction-yn="0"><span class="radio_off"><em>소득공제 불가</em></span></label>
		                       </div>
		                   </div>
		               </div>
		               <p class="no">책바구니에 담긴 도서가 없습니다.</p>
		               <div class="tab-sort">
		                   <div>
		                       <div class="checkbox">
		                           <label>
		                               <input type="checkbox" value="" class="allchkSeries">
		                               <span><i></i></span>
		                           </label>
		                       </div>
		                       <a href="javascript:;" class="btn carDel">삭제</a>
		                   </div>
		               </div>
		               <div class="payment-result basket">
		                   <p>총 주문 상품 수 : <span class="totalbookcnt">0권</span></p>
		                   <p>총 결제 금액 : <span class="totalamount">0원</span></p>
		                   <a href="javascript:parent.goUrl('/main.asp');" class="btn">쇼핑 계속하기</a>
		                   <input type="button" class="orderbtn" value="주문하기">
		               </div>
		           </div>
		           <div class="ps-box">
		               <ul>
		                   <li>- 쿠폰/상품권은 결제하기 페이지에서 적용이 가능합니다.</li>
		                   <li>- 이용에 문의사항이 있으시다면, 고객센터 &gt; FAQ를 참고해 주시거나, 고객센터 &gt; 1:1문의를 이용해 주시기 바랍니다.</li>
		                   <li>- 다운로드를 하신 컨텐츠는 주문 취소 및 환불이 불가능합니다.</li>
		               </ul>
		           </div>
		       </div>
		     </div>
		</div>
	</div>
</section>

<jsp:include page="../include/footer.jsp" />