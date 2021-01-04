<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>


	<%-- <%
	ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList");
PageInfo PageInfo = (PageInfo) request.getAttribute("PageInfo");
int nowPage = PageInfo.getPage();
int maxPage = PageInfo.getMaxPage();
int startPage = PageInfo.getStartPage();
int endPage = PageInfo.getEndPage();
int listCount = PageInfo.getListCount();
%>
--%>
<footer> 
	<div class="footer-top">
		<div class="notice-wrap">
			<div class="notice-inner">
				<p><a href="NoticeBoardList.not">공지사항</a></p>
				<div class="swiper-container notice">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
						<!-- Null오류로 인한 푸터 공지사항 수정중 -->
						<a href="NoticeBoardDetail.not?num=2&page=1">동서남Book OPEN<span>2020-12-28</span></a>
<!-- 							<a href="NoticeBoardDetail.not?num=1&page=1"> -->
<%-- 										<span><%=articleList.get(i).getSubject()%></span></a> --%>
						</div>
						<div class="swiper-slide">
							<a href="NoticeBoardDetail.not?num=5&page=1">확인용 게시글<span>2021-01-04</span></a>
						</div>						
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
					<p><span>대표번호</span>010-4161-1873</p>
					<p><span>운영시간</span>월~금 09:00 - 18:00 (점심시간 12:00 - 13:00) / 주말 및 공휴일 휴무</p>
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
		</ul>
		<div class="f-banner">
			<ul>
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
				<li>상호 : 주식회사 동서남Book</li>
				<li>대표이사 : 서지연</li>
				<li>주소 : 우)80380 서울 구로구 디지털로 33길 27, 삼성IT밸리 514호</li>
				<li>사업자 등록번호 : 113-86-24199</li>
				<li>통신판매업 신고번호 : 제 2008-서울구로-0747호</li>
				<li>개인정보 관리 책임자 : 곽동현</li>
				<li>도서비 소득공제 대상 사업자 인증번호 : 312018060044</li>
				<li>E-mail : <a href="mailto:webmaster@bookcube.com">jiyeon9061@gamil.com</a></li>
				<li>전화 010-4161-1873</li>
			</ul>
		</address>
		<div class="copy-text">
			<p>Copyright © 동서남BOOKNETWORKS Co.,Ltd. All Rights Reserved.</p>
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
	
	
		

		<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5fdf5765df060f156a8ec405/1eq06qpof';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
</body>
</html>