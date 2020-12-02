<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="vo.BookBean" %>
<jsp:include page="../include/header.jsp"/>

			<!-- 카카오 공유하기 20201125 서지연 추가 시작-->
<script type='text/javascript'>
	var firstImg=$(".thum-box img"); 
	var contents=""; 
	if(firstImg.attr("src")){ 
		var firstImgSrc=firstImg.attr("src"); 
		var firstImgRatio = parseInt(firstImg.css("height"))/parseInt(firstImg.css("width")); 
		if (firstImgRatio <=0.27) var firstImgRatio=0.27; 
	}else{
	// 	var firstImgSrc=location.origin+"/favicon.ico";
		var firstImgRatio=1
	} 
	// 사용할 앱의 JavaScript 키를 설정해 주세요. 
	//<![CDATA[
	Kakao.init('b528aa836fabfb8e8ebeb7dde7277a0f'); 
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: $('meta[property="og:title"]').attr( 'content' ),
        description: $('meta[property="og:description"]').attr( 'content' ),
        imageUrl: $( 'meta[property="og:image"]' ).attr( 'content' ),
        link: {
          mobileWebUrl: window.location.href,
          webUrl: window.location.href
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            webUrl: window.location.href
          }
        }
      ]
    });
  //]]>
	//링크복
	function shareUrl(){
		var urlLink = window.location.href;
		urlLink.value = window.location.href;
		alert(urlLink);
		urlLink.select();
	    document.execCommand("copy"); // 클립보드에 복사합니다. 
	 	 alert('복사되었습니다, 감사합니다.');

	}
</script>
 <!-- 카카오 공유하기 20201125 서지연 추가 끝-->
<% 
	request.setCharacterEncoding("utf-8"); 
	BookBean bookBean=(BookBean)request.getAttribute("bookBean"); 
	String nowPage=request.getParameter("page"); 
%>
<section class="sub">
<div class="category-nav">
	<div class="category-nav-inner">
		<p>
			HOME > <a href="/categorylist.asp?mainclass_num=00"><%=bookBean.getCatg1()%></a> > <a href="/categorylist.asp?mainclass_num=00&subclass_num=11"><%=bookBean.getCatg2()%></a>
		</p>
	</div>
</div>
<div class="contents-wrap">
	<div class="detail-wrap">
		<div class="detail-title">
			<div class="detail-title-inner">
				<h3><%=bookBean.getTitle()%></h3>
			</div>
		</div>
		<div class="detail-inner">
			<div class="detail-book">
				<div class="book-thum">
					<div class="figure">
						<div class="thum-box">
							<span class="rm_br">
							<img src="bookUpload/<%=bookBean.getImage()%>"/> </span>
							<span class="light"></span>
						</div>
					</div>
					<div class="early-btn">
					</div>
				</div>
				<div class="book-info">
					<div class="all-volume">
						<h3 class="bookTitle"><%=bookBean.getTitle()%></h3>
						<p>
							<span><%=bookBean.getAuthor() %></span> 저
						</p>
						<p>
							<strong><%=bookBean.getPublisher()%></strong>출판<em>|</em><%=bookBean.getPubdate() %>
						</p>
					</div>
					<div class="book-side">
						<div>
							<span class="list-star rank0"></span>
							<p class="rank-user">
								<span>0.0</span>(0명)
							</p>
							<p class="review-user">
								서평(<span>0</span>)
							</p>
							<button class="share">공유하기</button>
							<div class="js-share-box">
								<span class="share-dot"></span>
								<div class="share-box">
									<div class="share-inner">
										<h3>공유하기</h3>
										<div class="share-btn">
											<div class="sns" data-options="">
												<a class="share-facebook" data-sns="facebook" onclick="javascript:facebook('http://itwillbs6.cafe24.com/MODEL2/BookDetail.bok?isbn=<%=bookBean.getIsbn()%>&page=<%=nowPage %>&title=<%=bookBean.getTitle()%>');">페이스북</a>
												<a class="share-kakao" data-sns="kakao" id="kakao-link-btn" href="javascript:sendLink();">카카오</a>
												<a class="share-url" onClick="javascript:shareUrl();">URL</a>
											</div>
										</div>
										<button class="share-cancel">닫기</button>
									</div>
								</div>
							</div>
							<input type="hidden" class="link-area">
							<script>
										$(".share").on("mouseover",function(){
											$(".js-share-box").fadeIn();
										});
										$(".share-cancel").on("click",function(){
											$(".js-share-box").fadeOut();
										});
										$("body").on("click",function(e){
											if($(".js-share-box").css("display") == "block"){
												$(".js-share-box").fadeOut();
											}
										});
										$(".js-share-box").on("click",function(e){
											e.stopPropagation();
										})
									</script>
						</div>
					</div>
<!-- 					<div class="deduction-check"> -->
<!-- 						<p> -->
<!-- 							<a href="/event_detail.asp?event_num=8957">소득공제 가능(대여는 제외)</a> -->
<!-- 						</p> -->
<!-- 					</div> -->
					<div class="detail-btn">
						<a href="javascript:;" data-order-type="buy" class="d-basket"><span>책바구니</span></a>
						<a href="javascript:instant_view('920026812','buy','200906066');" class="effect-btn">찜바구니</a>
						<a href="BookKindList.bok?title=<%=bookBean.getTitle() %>&isbn=<%=bookBean.getIsbn() %>" class="effect-btn">삭제하기</a>
						<a href="BookModify.bok?title=<%=bookBean.getTitle()%>&isbn=<%=bookBean.getIsbn() %>&page=<%=nowPage%>" class="effect-btn">수정하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="detail-tab">
			<div class="detail-nav">
				<div class="detail-nav-inner">
					<ul class="scroll-tab series">
						<li class="on"><a href="javascript:;">책소개</a><span></span></li>
						<li><a href="javascript:;">목차</a><span></span></li>
						<li><a href="javascript:;">저자소개</a><span></span></li>
						<li><a href="javascript:;">서평<span>(0)</span></a><span></span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="detail-inner">
			<div class="d-tab book-intro">
				<h3>책소개</h3>
				<div>
					<%=bookBean.getDescription() %>
				</div>
			</div>
			<div class="d-tab book-intro second-page">
				<h3>목차</h3>
				<div class="list folded">
					<%=bookBean.getIndex() %>
				</div>
				<div class="d-more">
					<a href="javascript:;">더보기</a>
				</div>
			</div>
			<div class="d-tab author-intro">
				<h3>저자소개</h3>
				<div class="author-intro-text">
					〈저자 소개〉<br><%=bookBean.getAuthor_info() %>
				</div>
			</div>
			<div class="d-tab review" data-sort="최신순" data-order="false" data-review-count="0" data-review-point="" data-page-num="1" data-etc-count="0">
				<h3>서평(<span>0</span>)</h3>
				<div class="review-text-area">
					<p class="star-gogo">
						<input type="radio" name="star" class="star-1" id="star-1" value="0.5">
						<label class="star-1" for="star-1">1</label>
						<input type="radio" name="star" class="star-2" id="star-2" value="1">
						<label class="star-2" for="star-2">2</label>
						<input type="radio" name="star" class="star-3" id="star-3" value="1.5">
						<label class="star-3" for="star-3">3</label>
						<input type="radio" name="star" class="star-4" id="star-4" value="2">
						<label class="star-4" for="star-4">4</label>
						<input type="radio" name="star" class="star-5" id="star-5" value="2.5">
						<label class="star-5" for="star-5">5</label>
						<input type="radio" name="star" class="star-6" id="star-6" value="3">
						<label class="star-6" for="star-6">5</label>
						<input type="radio" name="star" class="star-7" id="star-7" value="3.5">
						<label class="star-7" for="star-7">5</label>
						<input type="radio" name="star" class="star-8" id="star-8" value="4">
						<label class="star-8" for="star-8">5</label>
						<input type="radio" name="star" class="star-9" id="star-9" value="4.5">
						<label class="star-9" for="star-9">5</label>
						<input type="radio" name="star" class="star-10" id="star-10" value="5">
						<label class="star-10" for="star-10">5</label>
						<span></span>
					</p>
					<p class="star-vote">
						별점으로 평가해주세요.
					</p>
					<a href="javascript:;" class="my-review effect-btn" data-review-yn="N">서평쓰기</a>
					<div class="review-text">
						<div>
							<div class="checkbox">
								<label>
								<input type="checkbox" class="spoiler">
								<span><i></i></span>
								</label>
								<p>
									스포일러가 포함되어 있습니다.
								</p>
							</div>
							<div class="text-btn">
								<a href="javascript:;" class="btn reviewInput">등록</a>
								<a href="javascript:;" class="btn reviewCancel">취소</a>
							</div>
						</div>
						<textarea placeholder="작품과 무관한 광고, 욕설 및 비방, 청소년보호정책에 위배되는 내용은 사전 동의 없이 비공개 처리될 수 있습니다."></textarea>
					</div>
				</div>
				<script>
							$(function(){
								$(".my-review").on("click",function(){
									if ($(this).data("review-yn") == "N"){
										$(".review-text:not(:animated)").animate({
											height: "toggle"
										});	
									}else{
										location.href = "/mypage.asp?list=_review";
									}									
								});	
							});
						</script>
				<div class="tab">
					<ul class="tab-list orderYN">
						<li><a href="javascript:;" class="on" data-order="False">전체</a></li>
						<!--li><a href="javascript:;" class="" data-order="True">구매자</a></li-->
					</ul>
					<div class="review-score-box">
						<div class="k-array">
							<input type="radio" name="" id="">
							<label for="" class="radio reviewSort" data-sort="좋아요"><span class="radio_off"><em>좋아요순</em></span></label>
							<input type="radio" name="" id="">
							<label for="" class="radio reviewSort" data-sort="최신순"><span class="radio_on"><em>최신순</em></span></label>
						</div>
						<div class="review-score">
							<span class="list-star rank0"></span>
							<p class="score">
								0.0
							</p>
							<p class="rank-user">
								(<span>0</span>명)
							</p>
						</div>
					</div>
					<div id="comment">
						<div class="comment_list">
							<p class="no">
								회원님께서 첫 서평의 주인공이 되어주세요.
							</p>
						</div>
						<div class="d-more reviewMore">
							<a href="javascript:;">20개 더보기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="detail_class_best_book">
			</div>
			<div class="md">
				<div class="md-title">
					<h3 class="coTitle">이 분야의 베스트</h3>
					<a href="https://www.bookcube.com/categorylist.asp?mainclass_num=00&amp;subclass_num=11&amp;page=best" class="more">더보기</a>
				</div>
				<ul>
					<li>
					<div class="figure">
						<a href="https://www.bookcube.com/detail.asp?series_num=920028772&amp;page=">
						<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201003358.jpg" alt="도서 이미지 - 대통령이 사라졌다 1"></span>
						<span class="light"></span>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							대통령이 사라졌다 1
						</p>
						<p>
							빌 클린턴, 제임스 패터슨 저
						</p>
					</div>
					</li>
				</ul>
			</div>
			<div class="detail_class_md_book">
			</div>
			<div class="e-book-ps">
				<h3>동서남북 이용안내</h3>
				<ul>
					<li>구매 후 배송이 필요 없이 다운로드를 통해 이용 가능한 전자책 상품입니다.</li>
					<li>전자책 1회 구매로 PC, 스마트폰, 태블릿 PC에서 이용하실 수 있습니다.<br/>(도서 특성에 따라 이용 가능한 기기의 제한이 있을 수 있습니다.)</li>
					<li>책파일 내 판권정보 정가와 북큐브 사이트 정가 표시가 다를 수 있으며, 실제 정가는 사이트에 표시된 정가를 기준으로 합니다.</li>
					<li>적립금 지급은 적립금 및 북큐브 상품권으로 결제한 금액을 뺀 나머지가 적립금으로 지급됩니다.<br/>(적립금 유효기간은 마이페이지>북캐시/적립금/상품권>적립금 적립내역에서 확인 가능합니다.)</li>
					<li>저작권 보호를 위해 인쇄/출력 기능은 지원하지 않습니다.</li>
					<li>구매하신 전자책은 “마이페이지 > 구매목록” 또는 “북큐브 내서재 프로그램 > 구매목록”에서 다운로드할 수 있습니다.</li>
					<li>스마트폰, 태블릿PC의 경우 북큐브 어플리케이션을 설치하여 이용할 수 있습니다. (<a href="/customer.asp?page=viewer">모바일 페이지 바로가기</a>)</li>
					<li>PC에서는 PC용 내서재 프로그램을 통해 도서를 이용하실 수 있습니다.</li>
					<li>ID 계정 당 총 5대의 기기에서 횟수 제한 없이 이용하실 수 있습니다.</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</section>

		    
<script>
		$(function(){
		 
			var series_num = $(".wrap").data("series-num");
			var mainclass_num = $(".wrap").data("mainclass-num");
			var subclass_num = $(".wrap").data("subclass-num");
			var book_count = $(".wrap").data("book-count"); 
			var represent_web_class = $(".wrap").data("represent-web-class");
			var total_flat_fee_yn = $(".wrap").data("total-flat-fee-yn");
			$(".s-more").hide();
			$(".d-more").on("click",function(){	
				$(this).hide();
				$(this).parent().find("li").show();	
				return false;
			});	
			$(".sequel_btn").on("click",function(){	
				if($.cookie("user_num")){
					var state = $(this).data("state");
					$.post("/data/_addSequel.asp", {series_chk : series_num, state : state}, function(data){						
						if(data.success){
							if (state == 0)	{
								$(".sequel_btn").data("state", 1);
								$(".sequel_btn").addClass('on');
								$(".sequel_btn").html("후속권 출간 알림 해제");
								alert('후속권 출간 알림 추가 완료되었습니다.\n신규 권호 업데이트 시 알리미/앱푸시를 통해 알려드립니다.');
							}else{
								$(".sequel_btn").data("state", 0);
								$(".sequel_btn").removeClass('on');
								$(".sequel_btn").html("후속권 출간 알림 추가");					
								alert('후속권 출간 알림 해제되었습니다.');
							}							
						}else{
							alert(data.message);
						}
					}, "json");
				}else{
					goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
				}
			});			
			//작가의 출간작. 인기순, 최신순
			$('.radio.sAuthor').click(function(){
				$(".aPrefer").data("a-sort", $(this).data("sort"));
				$(this).parent().find('span').removeClass('radio_on').addClass('radio_off');
				$(this).find('span').removeClass('radio_off').addClass('radio_on');
				$('#'+$(this).attr('for')).attr('checked','checked');
				var play = alist();	// 작가시리즈리스트 출력
			});
			//작가시리즈 도서리스트
			function alist(){	
				var author_num = $(".aPrefer").data("author-num"); 
				var strSort = $(".aPrefer").data("a-sort");				
				$.post("/detail/_author_book.asp", {series_num : series_num, author_num : author_num, sort : strSort}, function(data){					
					$(".alist").html(data);						
					$(".slider-list").each(function(){
						$(this).namilSlider({width : 306,delay : 200});	
					});
					$(".alist .mds").slick({slidesToShow: 5,slidesToScroll: 1,	infinite: true});
				}, "html");		
			}		 
			//장바구니 담기
			 $(".basket").click(function(){ 				
				var order_type = $(".wrap").data("order-type"); 
				//var book_cnt = $(".wrap").data("order-book-count");
				//var total_price = $(".wrap").data("order-book-price");
				var book_num_arr = $(".wrap").data("order-book-num-arr");
				$.post("/data/_addcart.asp", {series_num : series_num, order_type : order_type, book_num_arr : book_num_arr}, function(data){						
					if(data.success){
						if (confirm("책바구니에 담겼습니다. 지금 확인하시겠습니까?")){
							goUrl('/mypage.asp?list=_cart');
						}
					}else{
						alert(data.message);
					}
				}, "json");
			 });
			$('.reviewCancel').click(function(){
				$(".review-text").fadeOut();
			});
			
			//이 분야의 베스트
			$.post("/detail/_class_best_book.asp", {series_num : series_num, mainclass_num : mainclass_num, subclass_num : subclass_num}, function(data){					
				$(".detail_class_best_book").html(data);						
			}, "html");	
			//$.post("/detail/_class_md_book.asp", {represent_web_class : represent_web_class}, function(data){					
			$.post("/main/_recommend_book.asp", {represent_web_class : represent_web_class}, function(data){					
				$(".detail_class_md_book").html(data);		
				$(".detail_class_md_book .mds").slick({slidesToShow: 5,slidesToScroll: 1,	infinite: true});
			}, "html");	
			
		});	
	</script>
<jsp:include page="../include/footer.jsp"/>