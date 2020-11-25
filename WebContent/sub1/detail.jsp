<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.ReviewBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
    
<jsp:include page="../include/header.jsp"/>

   <%
    ArrayList<ReviewBean> articleList = (ArrayList<ReviewBean>)request.getAttribute("articleList");
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
				<p>HOME > <a href="/categorylist.asp?mainclass_num=00">문학</a> > <a href="/categorylist.asp?mainclass_num=00&subclass_num=11">추리/미스터리/스릴러</a></p>
			</div>
		</div>
		<div class="contents-wrap">
			<div class="detail-wrap">
				<div class="detail-title">
					<div class="detail-title-inner">
						<h3>최후의 만찬</h3>
						<p>SciFan 제186권</p>
					</div>
				</div>
				<div class="detail-inner">
					<div class="detail-book">
						<div class="book-thum">
							<div class="figure">
								<div class="thum-box">
									<span class="rm_br">
										<img src="https://bookimg.bookcube.com/270/2009/200906066.jpg" alt="도서 이미지 - 최후의 만찬" />		
									</span>
									<span class="light"></span>
								</div>
							</div>
							<div class="early-btn">
							</div>
						</div>
						<div class="book-info">
							<div class="all-volume">
								<p>
									<span>델마 햄 에반스</span> 저<em>|</em><span>TR 클럽</span> 역
								</p>
								<p><a href="/search.asp?searchString=%EC%9C%84%EC%A6%88%EB%8D%A4%EC%BB%A4%EB%84%A5%ED%8A%B8&searchOption=publisher"><strong>위즈덤커넥트</strong></a> 출판<em>|</em>2020.09.29<em></p><!-- 완결 미완결 end 클래스 유무 차이 -->
							</div>
							<div class="book-side">
								<div>
									<span class="list-star rank0"></span>
									<p class="rank-user"><span>0.0</span>(0명)</p>
									<p class="review-user">서평(<span>0</span>)</p>
									<button class="share">공유하기</button>
									<div class="js-share-box">
										<span class="share-dot"></span>
										<div class="share-box">
											<div class="share-inner">
												<h3>공유하기</h3>
												<div class="share-btn">
													<div class="sns" data-options="">
														<button class="share-facebook" data-sns="facebook" onclick="javascript:facebook('https://www.bookcube.com/detail.asp?series_num=920026812&um=');">페이스북</button>
														<button class="share-twitter" data-sns="twitter" onclick="twitter('https://www.bookcube.com/detail.asp?series_num=920026812&um=','[북큐브]최후의 만찬 | 델마 햄 에반스');">트위터</button>
														<button class="share-url" onclick="shareUrl('https://www.bookcube.com/detail.asp?series_num=920026812&page=buy');">URL</button>
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
							
							<div class="cash-info">
								<table>
									<caption>시리즈 가격정보</caption>
									<colgroup>
										<col width="163px" />
										<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th>구매</th>
											<td>0원<em class="save">+0% 적립</em></td>
										</tr>
										<tr>
											<th>출간정보</th>
											<td>2020.09.29<em>|</em>EPUB<em>|</em>1.27MB</td>
										</tr>
									</tbody>
								</table>
								<div class="tenrent-wrap">
									<div class="tenrent-inner">
										<h4>10년소장 안내</h4>
										<p>10년소장은 장기대여 상품으로 구매 상품과는 달리 다양한 프로모션 및 폭넓은 할인 혜택 제공이 가능합니다.</p>
										<p>프로모션이 없는 경우 구매 상품과 가격이 동일하지만 프로모션이 진행되게 되면 큰 폭의 할인 및 적립이 제공됩니다.</p>
										<a href="javascript:;">close</a>
									</div>
								</div>
								<script>
									$(".tenrent-dot").on("click",function(){
										$(".tenrent-wrap").fadeIn();	
									});
									$(".tenrent-inner a").on("click",function(){
										$(".tenrent-wrap").fadeOut();	
									});
								</script>
							</div>				

							<p class="support-device"><span>지원 단말기</span> :  IOS 10.0 이상, Android 4.1 이상, PC Window 7 OS 이상 지원<em>듣기(TTS) 지원(모바일에서만 이용 가능)</em></p>
							
							<div class="deduction-check">
								<p><a href="/event_detail.asp?event_num=8957">소득공제 가능(대여는 제외)</a></p>
							</div>
							<div class="detail-btn">
									<a href="javascript:;" class="d-gift book"><span>선물하기</span></a><a href="javascript:instant_view('920026812','buy','200906066');" class="effect-btn">바로보기</a>
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
						<div>5페이지 내외의 초단편 소설. 굉장히 짧은 길이임에도 결말의 반전이 놀랍다.<br>지구의 자전축의 각도에 변형이 일어나고, 지구 전역의 기후가 혹독한 겨울 상태가 된다. 그렇게 수백 년이 흘러 인류는 거의 사라진 먼 미래. 문명을 잃고 간신히 생존한 지구인들을 포획하기 위해서 지구를 방문한 외계의 우주선. 우주선의 착륙지 근처에 생존한 지구인들이 존재한다는 정보를 얻은 주인공이 그들을 추적하기 시작한다.<br>* 원작의 전체 분량을 번역한 도서입니다.<br></div>
					</div>
					<div class="d-tab book-intro second-page">
						<h3>목차</h3>
						<div class="list folded">[최후의 만찬]<br><br>표지<br>목차<br>본문<br>시리즈 및 저자 소개<br>copyrights<br>(참고) 종이책 추정 페이지수: 7<br></div>
						<div class="d-more">
							<a href="javascript:;">더보기</a>
						</div>
					</div>
					<div class="d-tab author-intro">
						<h3>저자소개</h3>
						<div class="author-intro-text">〈저자 소개〉<br>델마 햄 에반스 (Thelma Hamm Evans)는 1950년대와 60년대 활동한 미국의 SF 작가이다. T. D. Hamm 등의 필명을 사용했다.<br><br>〈번역자 소개〉<br>2014년, 활동을 시작한 TR 클럽의 구성원은 인문학과 공학 등을 전공한 전문 직업인들로, 모두 5년 이상의 유학 또는 현지 생활 경험을 가지고 있다.<br>각자의 삶의 영역을 가지고 있으나, 자신이 관심을 가진 도서와 컨텐츠가 국내에서도 널리 읽히기를 바라는 마음에서 번역을 진행하고 있다.<br>대기업 직장인, IT 벤처기업가, 출판 및 서점 편집자, 대학 교원, 음악 전문가 등 다양한 직업군을 바탕으로, 본인들의 외국어 능력과 직업적 특기를 기반으로, 모던한 컨텐츠 번역을 추구하고 있다.<br></div>						
					</div>
		
<!-- 서평 및 댓글 쓰기  -->					
<form action="ReviewWritePro.re" method="get" id="myReview">
<div class="d-tab review" data-sort="최신순" data-order="false" data-review-count="0" data-review-point="" data-page-num="1" data-etc-count="0">
						
			
<h3>서평(<span><%=listCount %></span>)</h3>
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
	<p class="star-vote">별점으로 평가해주세요.</p>
		<a href="javascript:;" class="my-review effect-btn" data-review-yn="N">서평쓰기</a>
		<div class="review-text">
		<div>
			<div class="checkbox">
				<label>
					<input type="checkbox" class="spoiler" value="1">
					<span><i></i></span>
				</label>
				<p>스포일러가 포함되어 있습니다.</p>
			</div>
			<div class="text-btn">
				<input type="submit" value="등록" class="btn reviewInput">
				<input type="reset" value="취소" class="btn reviewCancel">
			</div>
		</div>
		<textarea name="content" placeholder="작품과 무관한 광고, 욕설 및 비방, 청소년보호정책에 위배되는 내용은 사전 동의 없이 비공개 처리될 수 있습니다."></textarea>
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
		<p class="score">0.0</p>
		<p class="rank-user">(<span>0</span>명)</p>
	</div>
</div>
<div id="comment">
	<div class="comment_list">
		<p class="no">회원님께서 첫 서평의 주인공이 되어주세요.</p>
	<div class="comment_list">
		<% for(int i = 0; i < articleList.size(); i++) {%>
		<div class="comment">
			<i id="test"><%=articleList.get(i).getId() %></i>
			<em> | </em>
			<span class="data"><%=articleList.get(i).getDate() %></span>
			<em> | </em>
			<span class="list-star rank10"><%=articleList.get(i).getStarcount() %></span>
			<em> | </em>
			<i>좋아요 <%=articleList.get(i).getLikecount() %></i>
			<em> | </em>
			<i>댓글Count()</i>
			<i><input type="button" value="수정" onclick="location.href='ReviewModifyPro.re?num=<%=articleList.get(i).getNum()%>&id=<%=articleList.get(i).getId()%>'"></i>
			<i><input type="button" value="삭제" onclick="location.href='ReviewDeletePro.re?num=<%=articleList.get(i).getNum()%>&id=<%=articleList.get(i).getId()%>'"></i>



<!-- ------------------------------------------------------------------------------ -->

<!-- ------------------------------------------------------------------------------ -->
			<div class="comment-content">
			<span><%=articleList.get(i).getContent() %></span>
			</div>
		<div class="comment-btn">
			<div>
				<a href="javascript:;" class="heart-btn" data-review-num="533867">좋아요</a>
				<a href="javascript:;" class="comment_write_show" data-comment-count="0">댓글</a>
			</div>
		</div>
		</div>
	</div>
		<%} %>
	</div>
		<div class="d-more reviewMore">
			<a href="javascript:;">20개 더보기</a>
		</div>
	</div>
</div>
</div>					
</form>


<!-- 서평 및 댓글 쓰기  -->
					
<div class="detail_class_best_book"></div>
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
				<p class="hot-title">대통령이 사라졌다 1</p>
				<p>빌 클린턴, 제임스 패터슨 저</p>
			</div>
		</li>
		<li>
			<div class="figure">
				<a href="https://www.bookcube.com/detail.asp?series_num=920018023&amp;page=">
					<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2007/200702038.jpg" alt="도서 이미지 - 교통경찰의 밤"></span>
					<span class="light"></span>
				</a>
			</div>
			<div class="hot-info">
				<p class="hot-title">교통경찰의 밤</p>
				<p>히가시노 게이고 저</p>
			</div>
		</li>
		<li>
			<div class="figure">
				<a href="https://www.bookcube.com/detail.asp?series_num=920027798&amp;page=">
					<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201001685.jpg" alt="도서 이미지 - 컬러, 옐로우"></span>
					<span class="light"></span>
				</a>
			</div>
			<div class="hot-info">
				<p class="hot-title">컬러, 옐로우</p>
				<p>김성진 저</p>
			</div>
		</li>
		<li>
			<div class="figure">
				<a href="https://www.bookcube.com/detail.asp?series_num=920009151&amp;page=">
					<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2004/200402500.jpg" alt="도서 이미지 - 어둠의 눈"></span>
					<span class="light"></span>
				</a>
			</div>
			<div class="hot-info">
				<p class="hot-title">어둠의 눈</p>
				<p>딘 쿤츠 저</p>
			</div>
		</li>
		<li>
			<div class="figure">
				<a href="https://www.bookcube.com/detail.asp?series_num=920014259&amp;page=">
					<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2006/200600353.jpg" alt="도서 이미지 - 숙명"></span>
					<span class="light"></span>
				</a>
			</div>
			<div class="hot-info">
				<p class="hot-title">숙명</p>
				<p>히가시노 게이고 저</p>
			</div>
		</li>
	</ul>
</div>
					
					<div class="detail_class_md_book"></div>
					<div class="e-book-ps">
						<h3>ebook 이용안내</h3>
						<ul>
							<li>구매 후 배송이 필요 없이 다운로드를 통해 이용 가능한 전자책 상품입니다.</li>
							<li>전자책 1회 구매로 PC, 스마트폰, 태블릿 PC에서 이용하실 수 있습니다.<br />(도서 특성에 따라 이용 가능한 기기의 제한이 있을 수 있습니다.)</li>
							<li>책파일 내 판권정보 정가와 북큐브 사이트 정가 표시가 다를 수 있으며, 실제 정가는 사이트에 표시된 정가를 기준으로 합니다.</li>
							<li>적립금 지급은 적립금 및 북큐브 상품권으로 결제한 금액을 뺀 나머지가 적립금으로 지급됩니다.<br />(적립금 유효기간은 마이페이지>북캐시/적립금/상품권>적립금 적립내역에서 확인 가능합니다.)</li>
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

			$(".d-gift.series").on("click",function(){
				$(".d-gift-wrap").fadeIn();	
				var play = glist();	// 선물하기시리즈리스트 출력
			});
			$(".d-gift-close").on("click",function(){
				$(".d-gift-wrap").fadeOut();	
			});

			//작가의 출간작. 인기순, 최신순
			$('.radio.sAuthor').click(function(){
				$(".aPrefer").data("a-sort", $(this).data("sort"));
				$(this).parent().find('span').removeClass('radio_on').addClass('radio_off');
				$(this).find('span').removeClass('radio_off').addClass('radio_on');
				$('#'+$(this).attr('for')).attr('checked','checked');
				var play = alist();	// 작가시리즈리스트 출력
			});
		
			//작가의 출간작 작가 선택
			$(".pub-select a").click(function(){ 
				$(".aPrefer").data("author-num", $(this).data("author-num"));//선호작가번호 세팅
				$(".aPrefer").data("author-name", $(this).data("author-name"));//선호작가명 세팅
				$(".aPrefer").data("author-yn", $(this).data("author-yn"));//선호여부			
				
				$(".pub-select a").removeClass('on');
				$(this).addClass("on");  
				var play = alist();		// 작가시리즈리스트 출력
			 });		

			 //작가의 출간작 작가 추가
			$(".aPrefer").click(function(){ 
				var author_num = $(this).data("author-num");
				var author_name = $(this).data("author-name");
				var author_yn = $(this).data("author-yn");	//1:추가되어 있음, 0:추가되어 있지 않음

				$.post("/data/_addPreferAuthor.asp", {author_num : author_num, delete_yn : author_yn}, function(data){						
					if(data.success){
						if (author_yn == "False"){
							$(".aPrefer").html('선호작가 삭제');
							$(".aPrefer").data("author-yn", "True");
							alert('선호 작가에 '+ author_name +'작가가 추가되었습니다');
						}else{
							$(".aPrefer").html('선호작가 추가');
							$(".aPrefer").data("author-yn", "False");			
							alert('선호 작가에 '+ author_name +'작가가 삭제되었습니다');
						}
					}else{
						alert(data.message);
					}
				}, "json");
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

			//1권부터정렬, 신간부터 정렬
			$('.radio.booklist').click(function(){
				$(".wrap").data("sort", $(this).data("sort"));
				$(this).parent().find('span').removeClass('radio_on').addClass('radio_off');
				$(this).find('span').removeClass('radio_off').addClass('radio_on');
				$('#'+$(this).attr('for')).attr('checked','checked');
				var play = list();
			});

			//선물하기 1권부터정렬, 신간부터 정렬
			$('.radio.giftbooklist').click(function(){
				$(".d-gift-wrap").data("sort", $(this).data("sort"));
				$(this).parent().find('span').removeClass('radio_on').addClass('radio_off');
				$(this).find('span').removeClass('radio_off').addClass('radio_on');
				$('#'+$(this).attr('for')).attr('checked','checked');
				var play = glist();
			});
			
			//전권구매, 전권대여, 전권10년소장
			$(".d-series-tab a").click(function(){ 
				var order_type = $(this).data("order-type");
				$(".wrap").data("order-type", order_type);
				$(".d-series-tab a").removeClass('on');
				$(".btn.orderSel").html("선택구매");

				$(this).addClass("on");
				var play = list();				
			 });		

			 //전권구매, 전권대여, 전권10년소장 - 선물
			$(".d-gift-sort a").click(function(){ 
				var order_type = $(this).data("order-type");
				$(".d-gift-wrap").data("order-type", order_type);
				$(".d-gift-sort a").removeClass('on');
				$(this).addClass("on");

				if ($(".wrap").data("deduction-yn")){
					if (order_type == "rental")	{
						$(".p-deduction-check p").text('- 대여 결제 시 소득공제가 불가능합니다. 소득공제를 원하실 경우 구매로 주문해시길 바랍니다.');
					}else{
						$(".p-deduction-check p").text('카드 · 북캐시로 구매 시 소득공제 가능 (대여는 제외)');
					}	
				}				
				var play = glist();				
			 });		

			//전체 선택
			$(".allchk").click(function(){ 				
				if ($(this).is(":checked")){   
					$(".chk").prop("checked",true);	//전체선택 체크된경우 
				}else{
					$(".chk").prop("checked",false);	         //전체선택 체크 해제된경우
				}
				var play = cashcnt();
			 });

			 //전체 선택 (선물)
			$(".allchkgift").click(function(){ 				
				if ($(this).is(":checked")){   
					$(".chkgift").prop("checked",true);	//전체선택 체크된경우 
				}else{
					$(".chkgift").prop("checked",false);	         //전체선택 체크 해제된경우
				}
				var play = gcashcnt();
			 });			 

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

			//선택구매
			 $(".orderSel").click(function(){ 				
				var order_type = $(".wrap").data("order-type"); 
				var book_num_arr = $(".wrap").data("order-book-num-arr");
				var gift_yn = false ;
				var chklen = 0 ;

				$('.chk').each(function() {
					chklen += 1 ;
				});

				if (order_type == "rental" && total_flat_fee_yn && chklen == 0){
					if (confirm("이미 모든 도서가 추가되었습니다. 지금 확인하시겠습니까?")){
						goUrl("/mypage.asp?list=_orderbooklist&item=대여");
					}
					return ;
				}
				
				if($.cookie("user_num")){
				
					$.post("/data/_instantBuy.asp", {series_num : series_num, order_type : order_type, book_num_arr : book_num_arr, gift_yn : gift_yn, total_flat_fee_yn : total_flat_fee_yn}, function(data){						
						if(data.success){
							if (order_type == "rental" && data.total_flat_fee_yn){
								if (confirm("대여/정액 다운로드 페이지에 추가되었습니다. 지금 확인하시겠습니까?")){
									goUrl("/mypage.asp?list=_orderbooklist&item=대여");
								}else{							
									window.location.reload();
								}
							}else{
								goUrl("/order/book.asp");
							}
							//alert('즉시 구매 페이지로 이동');
						}else{
							alert(data.message);
						}
					}, "json");
				}else{
					goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
				}
			 });

			 //선택구매(선물하기)
			 $(".giftorderSel").click(function(){ 				
				var order_type = $(".d-gift-wrap").data("order-type"); 
				var book_num_arr = $(".d-gift-wrap").data("order-book-num-arr");
				var gift_yn = true ;

				if($.cookie("user_num")){
					$.post("/data/_instantBuy.asp", {series_num : series_num, order_type : order_type, book_num_arr : book_num_arr, gift_yn : gift_yn, total_flat_fee_yn : total_flat_fee_yn}, function(data){						
						if(data.success){
							goUrl("/order/book.asp?order_type="+ order_type +"&gift_order_type="+ order_type);
							//alert(book_num_arr);
							//alert('선물하기 즉시 구매 결제페이지로 이동');
						}else{
							alert(data.message);
						}
					}, "json");
				}else{
					goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
				}
			 });
			 
			 //단권구매, 단권10년소장, 단권대여
			 $(".bookbuy").click(function(){ 				
				var order_type = $(this).data("order-type"); 
				var book_num_arr = $(".wrap").data("order-book-num-arr");
				var gift_yn = false ;

				if($.cookie("user_num")){
					$.post("/data/_instantBuy.asp", {series_num : series_num, order_type : order_type, book_num_arr : book_num_arr, gift_yn : gift_yn, total_flat_fee_yn : total_flat_fee_yn}, function(data){						
						if(data.success){
							if (order_type == "rental" && data.total_flat_fee_yn)	{
								window.location.reload();
							}else{
								goUrl("/order/book.asp?order_type="+ order_type);
							}
							//alert('즉시 구매 결제페이지로 이동');
						}else{
							alert(data.message);							
						}
					}, "json");	
				}else{
					goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
				}
			 });

			//단권 선물
			$(".d-gift.book").on("click",function(){
				var order_type = $(".wrap").data("order-type"); 
				var book_num_arr = $(".wrap").data("order-book-num-arr");
				var gift_yn = "True" ;

				if($.cookie("user_num")){
					$.post("/data/_instantBuy.asp", {series_num : series_num, order_type : order_type, book_num_arr : book_num_arr, gift_yn : gift_yn, total_flat_fee_yn : total_flat_fee_yn}, function(data){						
						if(data.success){
							goUrl("/order/book.asp?order_type="+ order_type +"&gift_order_type="+ order_type);
						}else{
							alert(data.message);
						}
					}, "json");
				}else{
					goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
				}
			});

			//전체구매, 전체10년소장, 전체대여
			 $(".allbuy").click(function(){ 				
				if($.cookie("user_num")){
					var order_type = $(this).data("order-type"); 
					$('.d-series-tab a').each(function() {
						if ($(this).data("order-type") == order_type){
							$(".wrap").data("all-buy","1");	//전체구매여부
							$(this).trigger("click");				
						}
					});
				}else{
					goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
//					alert('로그인 후 이용해주세요');
					return ;
				}
			 });

			 //전체장바구니			 
			 $(".d-basket").click(function(){ 				
				var order_type = $(this).data("order-type"); 	
				var own_able_yn = $(".wrap").data("own-able-yn");
				var rental_able_yn = $(".wrap").data("rental-able-yn");
		
				//단권시리즈
				if (book_count == "1"){
					if (rental_able_yn == "True" && own_able_yn == "True"){						
						$(".basket-wrap").show();
					}else{
						bookaddcart(order_type);
					}								
				}else{
					var offset = $(".d-list").offset();
			        $('html, body').animate({scrollTop : offset.top-80}, 0);
				}
			 });

			//단권시리즈
			 $(".basket-put").on("click",function(){				 
				 var order_type_val = $("input[name=b-chk]:checked").val();
				 var order_type = "buy";
				 if (order_type_val == "0"){ var order_type = "rental" }

				 bookaddcart(order_type);				 
			});

			function bookaddcart(order_type){

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
			}

			//도서리스트
			function list(){					
				var strSort = $(".wrap").data("sort"); 
				var order_type = $(".wrap").data("order-type"); 
				var all_buy = $(".wrap").data("all-buy");
				var all_cart = $(".wrap").data("all-cart");
				var total_order_price = "0";				
				var total_flat_fee_yn = $(".wrap").data("total-flat-fee-yn");
				var order_type_val = "구매";
				var unable_buy_val = $(".wrap").data("unable-buy-val");
				var unable_rental_val = $(".wrap").data("unable-rental-val");

				$(".stop").html();
				if (order_type == "buy"){
					$(".stop").html(unable_buy_val);
				}else{
					$(".stop").html(unable_rental_val);
				}				
				$(".fix-series-wrap").css("height",$(".fix-series").outerHeight());

				if (order_type == "rental")	{ 
					if (total_flat_fee_yn == "True"){
						$(".btn.orderSel").html("선택담기");	
					}else{
						$(".btn.orderSel").html("선택대여");	
					}
				}
				
				if (order_type == "buy"){ total_order_price = $(".wrap").data("total-price");order_type_val = "구매";}
				if (order_type == "rental"){ total_order_price = $(".wrap").data("total-rental-price");order_type_val = "대여";}
				if (order_type == "rent_long"){ total_order_price = $(".wrap").data("total-long-term-rental-price");order_type_val = "10년 소장";}

				$.post("/detail/_book_list.asp", {series_num : series_num, sort : strSort, book_count : book_count, order_type : order_type, total_flat_fee_yn : total_flat_fee_yn}, function(data){					
					$(".book_list").html(data);		

					var play = cashcnt();

					$(".s-more").hide();
					$(".d-more").on("click",function(){	
						$(this).hide();
						$(this).parent().find("li").show();	
						return false;
					});			

					$(".bookOrder").click(function(){ 				
						$(".chk").prop("checked",false);
						//$(this).parent().parent().find("input").prop("checked",true);

						$(this).parent().parent().find("input").trigger("click");
//						$(this).data("price");
						$(".orderSel").trigger("click");					
					 });

					 $(".chk").click(function(){ 	
						cashcnt();
					 });

					 if (all_buy == "1"){
						 $(".wrap").data("all-buy","0");
						 $(".allchk").prop("checked",true);
						 $(".chk").prop("checked",true);
						 cashcnt();

						 if (order_type == "rental" && total_flat_fee_yn == "True"){
							 $(".orderSel").trigger("click");
						 }else{
							if (total_order_price == $(".wrap").data("order-book-price")){
								$(".orderSel").trigger("click");
							}else{
								if (confirm('이미 결제한 도서가 있습니다.\n잔여 도서를 결제하시겠습니까?'))	{
									$(".orderSel").trigger("click");
								}
							}
						 }
					 }

					 if (all_cart == "1"){
						 $(".wrap").data("all-cart","0");
						 $(".allchk").prop("checked",true);
						 $(".chk").prop("checked",true);
						 cashcnt();
						 $(".basket").trigger("click");
					 }
				}, "html");					
			}

			//선물하기도서리스트
			function glist(){	
				var strSort = $(".d-gift-wrap").data("sort"); 
				var order_type = $(".d-gift-wrap").data("order-type"); 
				var gift_yn = "True" ;

				$.post("/detail/_book_list.asp", {series_num : series_num, sort : strSort, book_count : book_count, order_type : order_type, gift_yn : gift_yn}, function(data){					
					$(".gift-list").html(data);		
					if($(".allchkgift").is(':checked')){
						$(".chkgift").prop("checked",true);
					}					
					var play = gcashcnt();
					$(".chkgift").click(function(){ 	
						gcashcnt();
					});
					$('.gift-list').slimScroll({position: 'right',height: 'auto',alwaysVisible: true,color : "#f26532",size : "8px"});
					
				}, "html");					
			}

			//계산
			function cashcnt(){
				var book_num_arr = "";
				var order_total_price = 0;
				var order_book_cnt = 0 ;
				var chk_book_cnt = 0 ;
				var order_type = $(".wrap").data("order-type"); 
				if (order_type == "buy"){ total_order_price = $(".wrap").data("total-price");}
				if (order_type == "rental"){ total_order_price = $(".wrap").data("total-rental-price");}
				if (order_type == "rent_long"){ total_order_price = $(".wrap").data("total-long-term-rental-price");}

				var book_cnt = $('input:checkbox[id=book_num]:checked').length;
				$("input[id=book_num]:checked").each(function() {
					if($(this).is(':checked')){
						if (book_num_arr.length > 0 ){book_num_arr += "," ;}
						book_num_arr += $(this).val();
						order_total_price += $(this).data("price");
					}
				});

				$(".d-series-list li").each(function() {						
					if ($(this).data("price") > 0){
						order_book_cnt += 1 ;
					}					
				});

				$("input[id=book_num]:checked").each(function() {			
					if($(this).is(':checked')){
						if ($(this).data("price") > 0){chk_book_cnt += 1 ;	}						
					}					
				});
			
				if (order_book_cnt == chk_book_cnt){order_total_price = total_order_price;}

				$(".orderbookinfo").text('총 '+ book_cnt +'권 '+ order_total_price +'원');

				$(".wrap").data("order-book-count", book_cnt);
				$(".wrap").data("order-book-price", order_total_price);
				$(".wrap").data("order-book-num-arr", book_num_arr);				
			}

			//계산
			function gcashcnt(){
				var book_num_arr = "";
				var order_total_price = 0;
				var order_book_cnt = 0 ;
				var chk_book_cnt = 0 ;
				var order_type = $(".d-gift-wrap").data("order-type"); 
				if (order_type == "buy"){ total_order_price = $(".wrap").data("total-price");}
				if (order_type == "rental"){ total_order_price = $(".wrap").data("total-rental-price");}
				if (order_type == "rent_long"){ total_order_price = $(".wrap").data("total-long-term-rental-price");}
				var book_cnt = $('input:checkbox[id=gift_book_num]:checked').length;
				$("input[id=gift_book_num]:checked").each(function() {
					if($(this).is(':checked')){
						if (book_num_arr.length > 0)	{book_num_arr += ",";}
						book_num_arr += $(this).val();
						order_total_price += $(this).data("price");
					}
				});

				$(".checkbox").each(function() {						
					if ($(this).data("price") > 0){
						order_book_cnt += 1 ;
					}					
				});

				$("input[id=gift_book_num]:checked").each(function() {			
					if($(this).is(':checked')){
						if ($(this).data("price") > 0){chk_book_cnt += 1 ;	}						
					}					
				});

				if (order_book_cnt == chk_book_cnt){order_total_price = total_order_price;}

				$(".ordergiftbookinfo").text('총 '+ book_cnt +'권 '+ order_total_price +'원');

				$(".d-gift-wrap").data("order-book-count", book_cnt);
				$(".d-gift-wrap").data("order-book-price", order_total_price);
				$(".d-gift-wrap").data("order-book-num-arr", book_num_arr);				
			}

// 			if($.cookie("user_num")){
// 				$.post("/data/_series_point_view.asp", {series_num : series_num}, function(data){						
// 					if(data.success){
// 						if (data.point > 0){
// 							$('#star-'+data.point).attr('checked','checked');							
// 						}
// 						if (data.review_num != ""){
// 							$(".my-review.effect-btn").data("review-yn", "Y");
// 							$(".my-review.effect-btn").html("내가 쓴 서평 보기");
// 						}
// 					}
// 				}, "json");
// 			}
				
// 			$("input[name=star]").click(function() {  //click 함수
// 				var point = $(this).val();
// 				if($.cookie("user_num")){
// 					$.post("/data/_series_point_input.asp", {series_num : series_num, point : point}, function(data){						
// 						if(data.success){
// 							$(".d-tab.review").data("review-point",point);
// 							var play = reviewlist();	// 리뷰리스트 출력
// 						}else{
// 							alert(data.message);
// 						}
// 					}, "json");
// 				}else{
// 					goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
// 					alert('로그인 후 이용가능합니다.');
// 					return;
// 				}
// 			});

// 			$('.reviewCancel').click(function(){
// 				$(".review-text").fadeOut();
// 			});
			
// 			$(".review-text .reviewInput").on("click",function(){
// 				var spoiler = $(".spoiler").is(':checked');
// 				var content = $(".review-text").find("textarea").val();
// 				var point = $(".d-tab.review").data("review-point");

// 				$.post("/data/_review_process.asp", {series_num : series_num, spoiler : spoiler, content : content, point : point}, function(data){						
// 					if(data.success){
// 						$(".review-text").hide();
// 						$(".my-review.effect-btn").data("review-yn", "Y");						
// 						$(".my-review.effect-btn").html("내가 쓴 서평 보기");
// 						var play = reviewlist();	// 리뷰리스트 출력
// 					}else{
// 						alert(data.message);
// 					}
// 				}, "json");
// 			});

// 			//리뷰 정렬순서
// 			$('.radio.reviewSort').click(function(){
// 				$(".d-tab.review").data("sort", $(this).data("sort"));
// 				$(".reviewSort").find("span").removeClass('radio_on').addClass('radio_off')
// 				$(".reviewSort[data-sort='"+ $(this).data("sort") +"']").find('span').removeClass('radio_off').addClass('radio_on');


// 				//$(this).parent().find('span').removeClass('radio_on').addClass('radio_off');
// 				//$(this).find('span').removeClass('radio_off').addClass('radio_on');
// 				//$('#'+$(this).attr('for')).attr('checked','checked');
// 				localStorage["review_sort"] = $(this).data("sort") ;
// 				var play = reviewlist();	// 리뷰리스트 출력
// 			});

// 			//리뷰(전체/구매자)
// 			$(".orderYN a").on("click",function(){
// 				var orderYN = $(this).data("order");
// 				if($.cookie("user_num")){
// 					$(".orderYN a").removeClass("on");
// 					$(this).addClass("on");
// 					$(".d-tab.review").data("order", orderYN);
// 					var play = reviewlist();	// 리뷰리스트 출력
// 				}else{
// 					goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
// //					alert('로그인 후 이용가능합니다.');
// 					return;
// 				}				
// 			});

// 			//리뷰 더보기
// 			$(".reviewMore a").on("click",function(){
// 				var review_page_num = $(".d-tab.review").data("page-num"); 
// 				$(".d-tab.review").data("page-num", review_page_num+1); 

// 				var play = reviewlist();	// 리뷰리스트 출력
// 			});

// 			//리뷰리스트
// 			function reviewlist(){	
// 				var strSort = $(".d-tab.review").data("sort"); 
// 				var sell_yn = $(".d-tab.review").data("order"); 
// 				var review_page_num = $(".d-tab.review").data("page-num"); 
// 				var review_count = 10 ;
// 				var total_count = 0 ;

// 				$.post("/data/_review_count.asp", {series_num : series_num, sort : strSort, sell_yn : sell_yn}, function(data){						
// 					$(".d-tab.review").data("order-count",data.list_count); 

// 					var etc_count = data.list_count - 10 - (review_page_num-1) * 20 ; 

// 					//1페이지인경우
// 					if (data.list_count < 11){						
// 						$(".reviewMore").hide();
// 					}else{
// 						//2페이지부터
// 						if (etc_count > 0){
// 							if ( etc_count > 20){							
// 								$(".reviewMore a").html("20개 더보기");
// 							}else{
// 								$(".reviewMore a").html(etc_count +"개 더보기");
// 							}								
// 						}													
// 					}
// 					$(".d-tab.review").data("etc-count", etc_count); 
// 				}, "json");	

// 				$.post("/detail/_review_list.asp", {series_num : series_num, sort : strSort, sell_yn : sell_yn, review_page_num : review_page_num}, function(data){					
// 					$(".comment_list").html(data);	

// 					if ($(".d-tab.review").data("etc-count") > 0 ){
// 						$(".reviewMore").show();
// 					}else{
// 						$(".reviewMore").hide();
// 					}
					
					//스포일러
// 					$(".comment-content .blur").each(function(){
// 						var height = $(this).parent().height();
// 						$(this).prev().css({"height":"68px","overflow":"hidden"});
// 					});
// 					$(".comment-content .blur a").on("click",function(){
// 						$(this).parent().parent().hide();
// 						$(this).parent().parent().prev().css("height","auto");
// 					});

// 					//댓글 입력창
// 					$(".reply-write").hide();

// 					//댓글 입력창 보이기
// 					$(".comment_write_show").on("click",function(){
// 						if ($(this).parent().parent().parent().next().css("display") == "none"){
// 							$(this).parent().parent().parent().next().show();
// 						}else{
// 							$(this).parent().parent().parent().next().hide();
// 						}
// 						if ($(this).data("comment-count") > 0)	{
// 							if ($(this).parent().parent().parent().next().next().css("display") == "none"){
// 								$(this).parent().parent().parent().next().next().show();
// 							}else{
// 								$(this).parent().parent().parent().next().next().hide();
// 							}

// 						}
// 					});
// 					//댓글 입력창 보이기(수정)
// 					$(".comment_modify").on("click",function(){
// 						if($.cookie("user_num")){
// 							$(this).parent().parent().parent().parent().hide();
// 							$(this).parent().parent().parent().parent().next().show();
// 						}else{
// 							goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
// //							alert('로그인 후 이용가능합니다.');
// 							return;
// 						}
// 					});
// 					//댓글 좋아요
// 					$(".heart-btn").on("click",function(){
// 						var review_num = $(this).data("review-num");
// 						var heart_btn = $(this);

// 						$.post("/data/_review_heart.asp", {review_num : review_num}, function(data){					
// 							if(data.success){
// 								if (data.add_yn){
// 									heart_btn.addClass("on");
// 								}else{
// 									heart_btn.removeClass("on");
// 								}
// 							}else{
// 								alert(data.message);
// 							}					
// 						}, "json");
// 					});

// 					//댓글 삭제
// 					$(".comment_del").on("click",function(){
// 						var comment_num = $(this).data("comment-num");
// 						var series_comment = $(this);
// 						$.post("/data/_comment_del.asp", {comment_num : comment_num}, function(data){					
// 							if(data.success){
// 								series_comment.parent().parent().parent().parent().hide();
// 							}else{
// 								alert(data.message);
// 							}					
// 						}, "json");
// 					});					
// 					//댓글 작성
// 					$(".comment-write .commit").on("click",function(){
// 						var content = $(this).parent().parent().find("textarea").val();
// 						var review_num = $(this).parent().parent().data("review-num");
// 						var comment_num = $(this).parent().parent().data("comment-num");
// 						$.post("/data/_comment_input.asp", {comment_num : comment_num, review_num : review_num, content : content}, function(data){					
// 							if(data.success){
// 								var play = reviewlist(); //댓글목록
// 							}else{
// 								alert(data.message);
// 							}					
// 						}, "json");
// 					});

// 					//댓글 취소
// 					$(".comment-write .cancel").on("click",function(){
// 						$(this).parent().parent().hide();
// 					});

// 					//댓글 입력창 글쓰기
// 					$(".comment-write.reply-write textarea").each(function(){
// 						var maxcount = 500;
// 						$(this).on("click",function(){
// 							if(!$.cookie("user_num")){alert('로그인 후 작성 가능합니다.'); goUrl('/login.asp?return_url='+encodeURIComponent("/detail.asp?series_num="+ series_num));	}

// 							var input = $(this);
// 							var update = function(){
// 								var count = input.val().length;
// 								var li_len = 0;
// 								var push = 0;
// 								for (i = 0; i < count; i++) {
// 									push++;
// 									if (push <= maxcount) {
// 										li_len = i + 1;
// 									}
// 								}
// 								if(count > maxcount){
// 									alert("500글자가 초과되었습니다.\r\n\n초과된 부분은 자동으로 삭제됩니다.");
// 									var str2 = input.val().substr(0, li_len);
// 									input.val(str2);
// 									$(".comment-write p span em").text("500");
// 								}
// 								input.keyup(function(){
// 									var content = input.val().length;	
// 									input.next().find("span em").text(content);
// 								});
// 							}
// 							input.bind('input keyup keydown paste change', function() {
// 								setTimeout(update, 0)
// 							});
// 						});	
// 					});

// 					$(".heart-btn").on("click",function(){ 
// 						if($(this).hasClass("on")){ 
// 							$(this).removeClass("on"); 
// 						}else{ 
// 							$(".ani").show(); 
// 							$(this).addClass("on"); 
// 							$(".heart-wrapper").addClass("active").delay(800).queue(function(){ 
// 								$(this).removeClass("active").dequeue(); 
// 								$(".ani").hide(); 
// 							}); 
// 						} 
// 						return false; 
// 					}); 
// 				}, "html");						
// 			}
			
			//이 분야의 베스트
			$.post("/detail/_class_best_book.asp", {series_num : series_num, mainclass_num : mainclass_num, subclass_num : subclass_num}, function(data){					
				$(".detail_class_best_book").html(data);						
			}, "html");	
			//$.post("/detail/_class_md_book.asp", {represent_web_class : represent_web_class}, function(data){					
			$.post("/main/_recommend_book.asp", {represent_web_class : represent_web_class}, function(data){					
				$(".detail_class_md_book").html(data);		
				$(".detail_class_md_book .mds").slick({slidesToShow: 5,slidesToScroll: 1,	infinite: true});
			}, "html");	
			/**
			//추천 전자책
			$.post("/main/_recommend_book.asp", {page : page}, function(data){					
				$(".main_recommend_book").html(data);		
			}, "html");	
			
			
			//ONLY 웹툰
			$.post("/main/_only_toon.asp", {page : page}, function(data){					
				$(".main_only_toon").html(data);				
				//마지막에 호출
				$(".slider-list").each(function(){
					$(this).namilSlider({width : 306,delay : 200});	
				});
				$(".mds").slick({slidesToShow: 5,slidesToScroll: 1,	infinite: true});
			}, "html");
			*/
			
			//상세페이지 스크롤 이벤트
			var fix = {};
			fix = {
				init : function(){
					this.scroll();
					this.animate();
					this.off();
				},
				el :{
					payFix : $(".fix-series"), // 시리즈 리스트 위 가격 정보
					payFixWrap : $(".fix-series-wrap"), // 시리즈 리스트 위 가격 정보 높이값 고정해주는 박스
					tab : $(".detail-nav"),
					seriesTab : $(".d-series-tab"), 
					tabLen : $(".scroll-tab li").length,
					tabLi : $(".scroll-tab li"),
					fixHeight : $(".detail-nav").outerHeight()
				},
				off : function(){
					var _that = this;
					setTimeout(function(){
						for(var i = 1; i<=_that.el.tabLen;i++){
							_that.top["tab"+i] = $(".d-tab").eq(i-1).offset().top - _that.el.fixHeight;
						}
						if($(".publish-book").length > 0){
							$(".all-volume p span").css("cursor","pointer");
						}
					},1000);
				},
				top : {
					// top 객체에 각 탭의 갯수 만큼 key,value 생성과 각종 위치값 들어갑니다.
				},
				scroll : function(){
						var _that = this;
						var step = 0;
						$(window).scroll(function(){
							var scrollTop = $(window).scrollTop();
							for(var i = 1; i<=_that.el.tabLen;i++){
								_that.top["tab"+i] = $(".d-tab").eq(i-1).offset().top - _that.el.fixHeight;
							}

							if(_that.top.tab1 <= scrollTop){
								_that.el.tab.css({"position":"fixed","left":0,"top":0});
							}else{
								_that.el.tab.css("position","static");
							}

							if($(".d-list").length > 0){ //  시리즈 리스트가 있음.
								_that.top["fix"] = _that.el.payFixWrap.offset().top - _that.el.fixHeight;
								_that.top["seriesTab"] = _that.el.seriesTab.offset().top - _that.el.fixHeight;
								if(_that.top.fix <=scrollTop){
									_that.el.payFix.css({"position":"fixed","left":"0","top":_that.el.fixHeight,"border-bottom":"1px solid #f4f4f4","box-shadow":"0 2px 8px 2px rgba(0,0,0,.2)"}).addClass("on");
									_that.el.payFix.find("div:first").css({"width":"880px","margin":"0 auto"});
								}else{
									_that.el.payFix.css({"position":"static","border-bottom":"none","margin-left":"0","box-shadow":"none"}).removeClass("on");
								}

								if($(".d-list").offset().top + ($(".d-list").next().offset().top - $(".d-list").offset().top) - 100 <=scrollTop){
									_that.el.payFix.fadeOut(300);
								}else{
									_that.el.payFix.fadeIn(300);
								}

								
							}

							for(var len = 1; len <=_that.el.tabLen; len++){
								if(eval("_that.top.tab"+len)<=scrollTop+1){
									_that.el.tabLi.removeClass("on");
									_that.el.tabLi.eq(len-1).addClass("on");
								}else{
									_that.el.tabLi.eq(len-1).removeClass("on");
								}
							}
							if(eval("_that.top.tab"+1)>=scrollTop+1){
								_that.el.tabLi.eq(0).addClass("on");
							}
						});
				},
				animate : function(){
						var _that = this;
						_that.el.tabLi.find("a").on("click",function(){
							var scrollTop = $(window).scrollTop();
							var idx = $(this).parent().index()+1;
							for(var i = 1; i<=_that.el.tabLen;i++){
								_that.top["tab"+i] = $(".d-tab").eq(i-1).offset().top - _that.el.fixHeight;
							}
							$('html, body').animate({scrollTop: eval("_that.top.tab"+idx)}, 0);
						});
						$(".review-user").on("click",function(){
							var scrollTop = $(window).scrollTop();
							$('html, body').animate({scrollTop: eval("_that.top.tab"+_that.el.tabLen)}, 0);
						});
						$(".all-volume p span").on("click",function(){
							var scrollTop = $(window).scrollTop();
							if($(".publish-book").length > 0){
								var pub = $(".publish-book").offset().top - 140;
								$('html, body').animate({scrollTop: pub}, 0);	
							}else{
								return
							}
						});
				}
			};

			fix.init();

			if (book_count > 1){	var play = list();}	//도서리스트			
			var play = alist();	//작가의 출간작 리스트

			if(localStorage.review_sort){
				strReviewSort = localStorage.review_sort ;
				$(".d-tab.review").data("sort", strReviewSort);
				$(".reviewSort").find("span").removeClass('radio_on').addClass('radio_off')
				$(".reviewSort[data-sort='"+ strReviewSort +"']").find('span').removeClass('radio_off').addClass('radio_on');
			}
			var play = reviewlist(); //댓글목록
			
			var _sl = $(".second-page .list");
			var _slBtn = $(".detail-inner .book-intro.second-page .d-more");
			if(_sl.height() >= 220){
				_sl.addClass("folded");
				_slBtn.css("display","block");
			}
			_slBtn.on("click",function(){
				_sl.removeClass("folded");
				$(this).css("display","none");
			});						
		});	
	</script>
	
<jsp:include page="../include/footer.jsp"/>