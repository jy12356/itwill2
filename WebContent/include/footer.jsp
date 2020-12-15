<%@page import="vo.PageInfo"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 	<% --%>
<!-- // 	ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList"); -->
<!-- // PageInfo PageInfo = (PageInfo) request.getAttribute("PageInfo"); -->
<!-- // int nowPage = PageInfo.getPage(); -->
<!-- // int maxPage = PageInfo.getMaxPage(); -->
<!-- // int startPage = PageInfo.getStartPage(); -->
<!-- // int endPage = PageInfo.getEndPage(); -->
<!-- // int listCount = PageInfo.getListCount(); -->
<%-- %> --%>
<footer>
	<div class="footer-top">
		<div class="notice-wrap">
			<div class="notice-inner">
				<p><a href="NoticeBoardList.not">공지사항</a></p>
				<div class="swiper-container notice">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
						<!-- Null오류로 인한 푸터 공지사항 수정중 -->
<!-- 							<a href="NoticeBoardDetail.not?num=1&page=1"> -->
<%-- 										<span><%=articleList.get(i).getSubject()%></span></a> --%>
						</div>
<!-- 						<div class="swiper-slide"> -->
<!-- 							<a href="/customer.asp?page=notice&num=112679&page2=view&pageNum=1">메리 미 (Marry Me)〉 적립금 지급 안내<span>2020-10-27</span></a> -->
<!-- 						</div>						 -->
					</div>
				</div>
				<div class="notice-control">
					<div class="notice-prev"></div>
					<div class="notice-next"></div>
				</div>
			</div>
		</div>
		<div class="cs-wrap">
			<div class="cs">
				<h4>고객센터</h4>
				<div>
					<p><span>대표번호</span>1588-1925</p>
					<p><span>운영시간</span>월~금 09:00 - 18:00 (점심시간 12:00 - 13:00) / 주말 및 공휴일 휴무</p>
				</div>
			</div>
			<div class="service">
				<h4>서비스</h4>
				<div>
					<p><a href="/b2b.asp">전자도서관</a></p>
					<p><a href="/customer.asp?page=viewer">앱 다운로드</a></p>
				</div>
			</div>
			<div class="short-cut">
				<h4>바로가기</h4>
				<div>
					<p><a href="/coupon.asp">쿠폰등록</a></p>
					<p><a href="https://www.898.tv/bookcube">원격 연결</a></p>
					<p><a href="/order/bookcash.asp">북캐시 충전</a></p>
					<p><a href="/mypage.asp?list=_main">마이페이지</a></p>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-inner">
		<ul class="f-lnb">
			<li><a href="http://www.bookcubenetworks.co.kr">회사소개</a></li>
			<li><a href="/customer.asp?page=notice&num=24007&page2=view&pageNum=15">이용약관</a></li>
			<li><a href="/customer.asp?page=notice&num=24264&page2=view&pageNum=15">개인정보보호정책</a></li>
			<li><a href="/customer.asp?page=notice&num=104583&page2=view&pageNum=1">청소년보호정책</a></li>
			<li><a href="javascript:;" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1138624199', 'bizCommPop', 'scrollbars=yes, width=750,height=700;')">사업자정보확인</a></li>
			<li><a href="/partner.asp">제휴문의</a></li>
			<li><a href="http://scm.bookcubenetworks.com">작가/출판사 전용메뉴</a></li>
		</ul>
		<div class="f-banner">
			<ul>
				<li><a href="https://play.google.com/store/apps/details?id=com.bookcube.bookplayer">구글플레이</a></li>
				<li><a href="https://itunes.apple.com/kr/app/bugkyubeu-naeseojae/id576288015?mt=8">앱스토어</a></li>
				<li><a href="javascript:;" onclick="pop.open('#so')">도서.공연비 소득공제 사업자</a></li>
				<li><a href="mailto:webmaster@bookcube.com"><span></span>이메일문의</a></li>
			</ul>
			<div class="so-pop blind" id="so">
				<div class="login-bg"></div>
				<div class="so">
					<img src="images/so-img.png" alt="도서.공연비 소득공제 사업자 관련 이미지">
					<p>소득공제 대상 사업자 인증번호<br><span>312018060044</span></p>
					<button onclick="pop.close('#so')">닫기</button>
				</div>
			</div>
		</div>
		<address>
			<ul>
				<li>상호 : 주식회사 북큐브네트웍스</li>
				<li>대표이사 : 유철종</li>
				<li>주소 : 우)80380 서울 구로구 디지털로 33길 27, 삼성IT밸리 514호</li>
				<li>사업자 등록번호 : 113-86-24199</li>
				<li>통신판매업 신고번호 : 제 2008-서울구로-0747호</li>
				<li>개인정보 관리 책임자 : 남지원</li>
				<li>도서비 소득공제 대상 사업자 인증번호 : 312018060044</li>
				<li>E-mail : <a href="mailto:webmaster@bookcube.com">webmaster@bookcube.com</a></li>
				<li>전화 1588-1925</li>
			</ul>
		</address>
		<div class="copy-text">
			<p>Copyright © BOOKCUBENETWORKS Co.,Ltd. All Rights Reserved.</p>
			<img src="images/site.png" alt='클린사이트' usemap="#cleanSite" />
			<map name="cleanSite">
				<area shape="RECT" coords="1,1,47,43" href="https://www.copyrightok.kr/" target="_blank" />
			</map>
		</div>
	</div>
</footer>
<div class="topBtn">
	<a href="javascript:;">TOP</a>
</div>

<script>
$(function(){
//탑버튼
// 	var top_left = $(".footer-inner").offset().left + $(".footer-inner").width();
// 	$(".topBtn").css({
// 		"left" : top_left + 20
// 	});
	$(".topBtn").on("click",function(){
		$("html,body").animate({
			scrollTop : 0
		},100); 
	});	
	var noticeSwiper = new Swiper('.notice',{
		direction: 'vertical',
		autoplay: {
			delay: 3000,
			disableOnInteraction: false
		},
		navigation: {
			nextEl: '.notice-next',
			prevEl: '.notice-prev'
		}
	});
});
//팝업
var $pop = null;
var pop = {
	open : function(item){
		$pop = $(item);
		$pop.removeClass("blind");
	},
	close :function(item){
		$pop = $(item);
		$pop.addClass("blind");
	}
}
</script>
	
		
	</div>	
</body>
</html>