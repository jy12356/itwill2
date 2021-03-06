<%@page import="vo.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@page import="vo.CommentBean" %> --%>

<%@page import="vo.BookBean" %>
<%@page import="vo.PageInfo" %>
<%@page import="vo.ReviewBean" %>
<%@page import="java.util.ArrayList" %>
<jsp:include page="../include/header.jsp"/>
<% 
request.setCharacterEncoding("utf-8"); 
BookBean bookBean=(BookBean) request.getAttribute("bookBean"); 

String nowPage=request.getParameter("page");
if(nowPage==null){
	nowPage="1";
}
String id=(String) session.getAttribute("id");
String isbn=request.getParameter("isbn");
int limit=((Integer)request.getAttribute("limit")).intValue();
System.out.println("limit :" + limit);


ArrayList<ReviewBean> articleList = (ArrayList<ReviewBean>) request.getAttribute("articleList");
PageInfo pageInfo=(PageInfo)request.getAttribute("pageInfo"); 
int nowPage2 = pageInfo.getPage(); 
int maxPage = pageInfo.getMaxPage(); 
int startPage = pageInfo.getStartPage(); 
int endPage = pageInfo.getEndPage(); 
int listCount = pageInfo.getListCount();

%> 
<section class="sub">
<div class="category-nav">
	<div class="category-nav-inner">
		<p>
			 HOME > <a href="BookList.bok?catg1=<%=bookBean.getCatg1()%>">
			 <%=bookBean.getCatg1()%></a> > 
			 <a href="BookList.bok?catg1=<%=bookBean.getCatg1()%>&catg2=<%=bookBean.getCatg2()%>"><%=bookBean.getCatg2()%></a>
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
							<span class="rm_br"><img class="bookImg" src="bookUpload/<%=bookBean.getImage()%>" /> </span>
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
							<span class="bookAuthor"><%=bookBean.getAuthor()%></span> 저
						</p>
						<p>
							<strong><%=bookBean.getPublisher()%></strong>출판<em>|</em><%=bookBean.getPubdate()%>
						</p>
					</div>
					<div class="book-side">
						<div>
							<% if (bookBean.getStarcount() < 1) { %>
							<span class="list-star rank0"></span>
							<% } else if (bookBean.getStarcount() < 2) { %>
							<span class="list-star rank1"></span>
							<% } else if (bookBean.getStarcount() < 3) { %>
							<span class="list-star rank2"></span>
							<% } else if (bookBean.getStarcount() < 4) { %>
							<span class="list-star rank3"></span>
							<% } else if (bookBean.getStarcount() < 5) { %>
							<span class="list-star rank4"></span>
							<% } else if (bookBean.getStarcount() < 6) { %>
							<span class="list-star rank5"></span>
							<% } else if (bookBean.getStarcount() < 7) { %>
							<span class="list-star rank6"></span>
							<% } else if (bookBean.getStarcount() < 8) { %>
							<span class="list-star rank7"></span>
							<% } else if (bookBean.getStarcount() < 9) { %>
							<span class="list-star rank8"></span>
							<% } else if (bookBean.getStarcount() < 10) { %>
							<span class="list-star rank9"></span>
							<% } else if (bookBean.getStarcount() < 11) { %>
							<span class="list-star rank10"></span>
							<% } %>
							<p class="rank-user">
								<span><%=bookBean.getStarcount()%></span>(<%=bookBean.getReviewCount()%>명)
							</p>
							<p class="review-user">
								 서평(<span><%=listCount%></span>)
							</p>
							<button class="share">공유하기</button>
							<div class="js-share-box">
								<span class="share-dot"></span>
								<div class="share-box">
									<div class="share-inner">
										<h3>공유하기</h3>
										<div class="share-btn">
											<div class="sns" data-options="">
												<a class="share-facebook" data-sns="facebook" href="javascript:facebook('<%= request.getRequestURL()%>');">페이스북</a>
												<a class="share-kakao" data-sns="kakao" id="kakao-link-btn" href="javascript:sendLink('<%= request.getRequestURL()%>');">카카오</a>
												<a class="share-url" href="javascript:shareUrl('<%= request.getRequestURL()%>');">URL</a>
											</div>
										</div>
										<button class="share-cancel">닫기</button>
									</div>
								</div>
							</div>
							<input type="hidden" class="link-area">
							<script>
									$(".share").on("mouseover", function() {
										$(".js-share-box").fadeIn();
									});
									$(".share-cancel").on("click", function() {
										$(".js-share-box").fadeOut();
									});
									$("body").on(
											"click",
											function(e) {
												if ($(".js-share-box").css(
														"display") == "block") {
													$(".js-share-box")
															.fadeOut();
												}
											});
									$(".js-share-box").on("click", function(e) {
										e.stopPropagation();
									});
								</script>
									<!-- 카카오 공유하기 20201125 서지연 추가 시작-->
									<script type='text/javascript'>
										$(document).ready(function(){
											
											var firstImg = $(".thum-box img");
											var contents = "";
											if (firstImg.attr("src")) {
												var firstImgSrc = firstImg.attr("src");
												var firstImgRatio = parseInt(firstImg.css("height"))
														/ parseInt(firstImg.css("width"));
												if (firstImgRatio <= 0.27)
													var firstImgRatio = 0.27;
											} else {
												// 	var firstImgSrc=location.origin+"/favicon.ico";
												var firstImgRatio = 1
											}
											// 사용할 앱의 JavaScript 키를 설정해 주세요. 
											//<![CDATA[
											Kakao.init('b528aa836fabfb8e8ebeb7dde7277a0f');
											// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
											Kakao.Link.createDefaultButton({
												container : '#kakao-link-btn',
												objectType : 'feed',
												content : {
													title : $('.bookTitle').html(),
													description : $('.bookAuthor').html(),
													imageUrl : $('.bookImg').attr('src'),
													link : {
														mobileWebUrl : window.location.href,
														webUrl : window.location.href
													}
												},
												social : {
													likeCount: 286,
											        commentCount: 45,
											        sharedCount: 845
												},
												buttons : [ {
													title : '웹으로 보기',
													link : {
														mobileWebUrl : window.location.href,
														webUrl : window.location.href
													}
												} ]
											});
											//]]>
											//링크복

										});
										function shareUrl(url){ 
											var IE=(document.all)?true:false;
											if (IE) {
											if(confirm("이 글의 트랙백 주소를 클립보드에 복사하시겠습니까?"))
												window.clipboardData.setData("Text", url);
											} else {
												temp = prompt("이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", url);
											}


										}
										//페이스북 공유하기
										function facebook(url){
											window.open("https://www.facebook.com/sharer/sharer.php?u="+encodeURIComponent(url),
													"facebook","width=600,height=500,scrollbars=no,toolbar=no,resizable=yes");
										}
											
									</script>
									<!-- 카카오 공유하기 20201125 서지연 추가 끝-->
						</div>
					</div>
					<!-- 					<div class="deduction-check"> -->
					<!-- 						<p> -->
					<!-- 							<a href="/event_detail.asp?event_num=8957">소득공제 가능(대여는 제외)</a> -->
					<!-- 						</p> -->
					<!-- 					</div> -->
					<div class="detail-btn">
						<a href="MyBasketInsert.bk?isbn=<%=bookBean.getIsbn()%>" data-order-type="buy" class="d-basket"><span>책바구니</span></a>
						<a href="BookDibsInsert.bok?isbn=<%=bookBean.getIsbn()%>" class="effect-btn">찜바구니</a>

						<%if(id !=null && id.equals("admin")){ %>
							<a href="BookDeletePro.bok?book_num=<%=bookBean.getNum()%>&catg1=<%=bookBean.getCatg1()%>&catg2=<%=bookBean.getCatg2()%>" class="effect-btn">삭제하기</a>
							<a href="BookModify.bok?isbn=<%=bookBean.getIsbn()%>&page=<%=nowPage%>" class="effect-btn">수정하기</a>
						<%} %>
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
						<li><a href="javascript:;">서평<span>(<%=listCount%>) </span></a><span></span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="detail-inner">
			<div class="d-tab book-intro">
				<h3>책소개</h3>
				<div>
					<%=bookBean.getDescription()%>
				</div>
			</div>
			<div class="d-tab book-intro second-page">
				<h3>목차</h3>
				<div class="list folded">
					<%=bookBean.getIndex()%>
				</div>
				<div class="d-more">
					<a href="javascript:;">더보기</a>
				</div>
			</div>
			<div class="d-tab author-intro">
				<h3>저자소개</h3>
				<div class="author-intro-text">
					 〈저자 소개〉<br>
					<%=bookBean.getAuthor_info()%>
				</div>
			</div>
			<!-- 서평 및 댓글  -->
			<!-- 서평쓰기 -->
			<div class="d-tab review" data-sort="최신순" data-order="false" data-review-count="0" data-review-point="" data-page-num="1" data-etc-count="0">
				<form name="myReview" action="ReviewWritePro.re" method="post" onsubmit="return idYn();">
					<h3>
					서평(<span><%=listCount%></span>) </h3>
					<div class="review-text-area">
						<input type="hidden" name="id" id="myId" value="<%=id%>"> <input type="hidden" name="isbn" value="<%=isbn%>"> <input type="hidden" name="page" value="<%=nowPage%>"> <input type="hidden" name="booknum" value="<%=bookBean.getNum()%>">
						<p class="star-gogo">
							<input type="radio" name="starcount" class="star-1" id="star-1" value=1><label class="star-1" for="star-1">1</label><input type="radio" name="starcount" class="star-2" id="star-2" value=2><label class="star-2" for="star-2">2</label><input type="radio" name="starcount" class="star-3" id="star-3" value=3><label class="star-3" for="star-3">3</label><input type="radio" name="starcount" class="star-4" id="star-4" value=4><label class="star-4" for="star-4">4</label><input type="radio" name="starcount" class="star-5" id="star-5" value=5>
							<label class="star-5" for="star-5">5</label><input type="radio" name="starcount" class="star-6" id="star-6" value=6><label class="star-6" for="star-6">5</label><input type="radio" name="starcount" class="star-7" id="star-7" value=7><label class="star-7" for="star-7">5</label><input type="radio" name="starcount" class="star-8" id="star-8" value=8><label class="star-8" for="star-8">5</label><input type="radio" name="starcount" class="star-9" id="star-9" value=9><label class="star-9" for="star-9">5</label><input type="radio" name="starcount" class="star-10" id="star-10" value=10><label class="star-10" for="star-10">5</label><span></span>
						</p>
						<p class="star-vote">
							별점으로 평가해주세요.
						</p>
						<a href="javascript:;" class="my-review effect-btn" data-review-yn="N">서평쓰기</a>
						<div class="review-text">
							<div>
								<div class="checkbox">
									<label><input type="checkbox" class="spoiler" name="spoiler" value=1><span><i></i></span><input type="hidden" class="spoiler" name="spoiler" value=0>
									</label>
									<p>
										스포일러가 포함되어 있습니다.
									</p>
								</div>
								<div class="btn_inner">
									<input type="submit" value="등록" class="btn reviewInput"><input type="reset" value="취소" class="btn reviewCancel">
								</div>
							</div>
							<textarea name="content" placeholder="작품과 무관한 광고, 욕설 및 비방, 청소년보호정책에 위배되는 내용은 사전 동의 없이 비공개 처리될 수 있습니다."></textarea>
						</div>
					</div>
				</form>
				<!-- 서평쓰기 -->
				<!-- 서평리스트 목차(별점 카운트)-->
				<div class="tab">
					<ul class="tab-list orderYN">
						<li><a href="javascript:;" class="on" data-order="False">전체</a></li>
						<!--li><a href="javascript:;" class="" data-order="True">구매자</a></li-->
					</ul>
					<div class="review-score-box">
						<div class="k-array">
<!-- 							<input type="radio" name="" id=""><label for="" class="radio reviewSort" data-sort="좋아요"><span class="radio_off"><em>좋아요순</em></span></label> -->
							<input type="radio" name="" id=""><label for="" class="radio reviewSort" data-sort="최신순"><span class="radio_on"><em>최신순</em></span></label>
						</div>
						<div class="review-score">
							<% if (bookBean.getStarcount() < 1) { %>
							<span class="list-star rank0"></span>
							<% } else if (bookBean.getStarcount() < 2) { %>
							<span class="list-star rank1"></span>
							<% } else if (bookBean.getStarcount() < 3) { %>
							<span class="list-star rank2"></span>
							<% } else if (bookBean.getStarcount() < 4) { %>
							<span class="list-star rank3"></span>
							<% } else if (bookBean.getStarcount() < 5) { %>
							<span class="list-star rank4"></span>
							<% } else if (bookBean.getStarcount() < 6) { %>
							<span class="list-star rank5"></span>
							<% } else if (bookBean.getStarcount() < 7) { %>
							<span class="list-star rank6"></span>
							<% } else if (bookBean.getStarcount() < 8) { %>
							<span class="list-star rank7"></span>
							<% } else if (bookBean.getStarcount() < 9) { %>
							<span class="list-star rank8"></span>
							<% } else if (bookBean.getStarcount() < 10) { %>
							<span class="list-star rank9"></span>
							<% } else if (bookBean.getStarcount() < 11) { %>
							<span class="list-star rank10"></span>
							<% } %>
							<p class="score"><%=bookBean.getStarcount()%></p>
							<p class="rank-user">(<span><%=bookBean.getReviewCount()%></span>명)</p>
						</div>
					</div>
					<!-- 서평리스트 목차(별점 카운트)-->
					<!-- 서평리스트 내용-->
					<div id="comment">
						<!-- 서평 없을 때 -->
						<% if (articleList == null && listCount < 0) { %>
						<div class="comment_list">
							<p class="no">
								회원님께서 첫 서평의 주인공이 되어주세요.
							</p>
						</div>
						<!-- 서평 없을 때 -->
						<!-- 서평 있을 때 -->
						<% }else{ 
							for (int i = 0; i < articleList.size(); i++) { %>
						<div>
							<div class="comment comment_inner ">
								<p class="comment-vote bookcube" id="cmt_vote">
									<input type="hidden" name="board_num" value="<%=articleList.get(i).getNum()%>">
									<i><%=articleList.get(i).getId() %></i><em>|</em>
									<span class="date"><%=articleList.get(i).getDate()%></span><em>|</em>
									<span class="list-star rank<%=articleList.get(i).getStarcount()%>"><%=articleList.get(i).getStarcount()%></span><em>|</em>
									좋아요<span class="likeCountInner"><%=articleList.get(i).getLikecount()%></span><em>|</em>
									댓글<span class="listCount"></span>
									<% if (articleList.get(i).getSpoiler()==1) { %><em>|</em>스포일러 포함 <% } %>
								</p>
								<div class="comment-content">
									<span><%=articleList.get(i).getContent()%></span>
								</div>
								<div class="btn_inner">
									<% 
									if(id != null) {

										if(id.equals(articleList.get(i).getId())) {

									%>
									<a href="javascript:;" class="comment_modi_show btn rview_modi_show">수정</a>
									<% } if(id.equals(articleList.get(i).getId()) || id.equals("admin")) { %>
									<a href="ReviewDeletePro.re?num=<%=articleList.get(i).getNum()%>&id=<%=id%>&isbn=<%=isbn%>&page=<%=nowPage%>" class="delete-btn btn">삭제</a>
									<%
										}
									}
									%>

									<a href="javascript:;" class="heart-btn btn" data-review_num="<%=articleList.get(i).getNum()%>" data-like_id="<%=id%>" data-isbn="<%=isbn%>">좋아요</a>
									<a href="javascript:;" class="comment_write_show btn" data-board_num="<%=articleList.get(i).getNum()%>">댓글</a>

								</div>
							</div>
							<!-- 서평 수정-->
							<div class="cmtModi" style="display: none;">
								<form action="ReviewModifyPro.re" class="comment-write reply-write" method="post" id="MyReModify">
									<div class="checkbox clearfix mb05">
										<label class="fl">
										<%	if (articleList.get(i).getSpoiler()==1) { %>
										<input type="checkbox" class="spoiler" name="spoiler" checked="checked" value=<%=articleList.get(i).getSpoiler()%>> <span><i></i></span><input type="hidden" class="spoiler" name="spoiler" value=0><%} else {%><input type="checkbox" class="spoiler" name="spoiler" value=<%=articleList.get(i).getSpoiler()%>> <span><i></i></span><input type="hidden" class="spoiler" name="spoiler" value=1>
										<% } %>
										</label>
										<p class="fl mt05 ml5">
											스포일러가 포함되어 있습니다.
										</p>
									</div>
									<div>
										<input type="hidden" name="isbn" value="<%=isbn%>"> 
										<input type="hidden" name="page" value="<%=nowPage%>"> 
										<input type="hidden" name="num" value="<%=articleList.get(i).getNum()%>"> 
										<input type="hidden" name="id" value="<%=id%>"> 
										<textarea name="content"><%=articleList.get(i).getContent()%></textarea>
									</div>
									<div class="btn_inner">
										<input type="submit" value="수정" class="btn reviewInput">
										<input type="reset" value="취소" class="btn reviewCancele">
									</div>
								</form>
							</div>
							<!-- 서평 수정-->
							<!-- 댓글 창 -->
							<div class="cmtRly clearfix del_succ" data-review-num="" data-comment-num="" style="none">
								<!-- 댓글 등록 입력창-->
								<form action="javascript:;" class="comment-write reply-write" method="get" id="myReComment">
									<div>
										<input type="hidden" name="page" value="<%=nowPage%>"> 
										<input type="hidden" name="board_type" value="2">
<%-- 										<input	type="hidden" name="board_num" value="<%=articleList.get(i).getNum()%>">  --%>
<%-- 										<input type="hidden" name="comment_id" value="<%=id%>">  --%>
										<textarea name="comment_desc" placeholder="댓글을 작성해주세요"></textarea>
									</div>
									<div class="btn_inner">
										<input type="submit" value="등록" class="btn reviewInput ReComment_Write" data-comment_id="<%=id %>" data-board_num="<%=articleList.get(i).getNum()%>">
										<input type="reset" value="취소" class="btn reviewCancele">
									</div>
								</form>
								<!-- 댓글 등록 입력창-->
								<!-- 댓글 리스트-->
								<div class="reply">
<!-- 									<div class="comment comment_inner reIcon "> -->
<%-- 										<input type="hidden" name="isbn" value="<%=isbn%>">  --%>
<%-- 										<input type="hidden" name="page" value="<%=nowPage%>">  --%>
<!-- 										<input type="hidden" name="board_type" value="2"> -->
<%-- 										<input type="hidden" name="board_num" value="<%=articleList.get(i).getNum()%>"> --%>
<!-- 										<p class="comment-vote bookcube" id="cmt_vote"> -->
<%-- 											<i id="c_id"><%=commentList2.get(b).getComment_id()%></i><em>|</em><span id="c_date" class="date"><%=commentList2.get(b).getDate()%></span> --%>
<!-- 										</p> -->
<!-- 										<div class="comment-content"> -->
<%-- 											<span id="c_desc"><%=commentList2.get(b).getComment_desc()%></span> --%>
<!-- 										</div> -->
<!-- 										<div class="btn_inner"> -->
<!-- 											<a href="javascript:;" class="comment_modi_show btn rview_modi_show">수정</a> -->
<%-- 											<a href="ReviewDeletePro.re?num=<%=articleList.get(i).getNum()%>&id=<%=id%>&isbn=<%=isbn%>&page=<%=nowPage%>" class="delete-btn btn">삭제</a> --%>
<!-- 											<a href="javascript:;" class="comment_write_show btn" data-comment-count="0">댓글</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
							</div>	
						</div>
						<% } 
						} %>
					</div>
				</div>
				<!-- 댓글 리스트-->
				<!-- 댓글 창 -->
				<!-- 서평 있을 때 -->
				<!-- 서평 리스트 더보기 -->
				<div class="d-more reviewMore" style="display: ;">
<%-- 				 <a href="BookDetail.bok?isbn=<%=isbn%>&limit=<%=limit+10%>">10개 더보기</a> --%>

				</div>
				<!-- 서평 리스트 더보기 -->
				<!-- 서평리스트 내용-->
				<!-- 서평 및 댓글 쓰기  -->

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
							<a href="https://www.bookcube.com/detail.asp?series_num=920028772&amp;page="><span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201003358.jpg" alt="도서 이미지 - 대통령이 사라졌다 1"></span><span class="light"></span>
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
						<li>전자책 1회 구매로 PC, 스마트폰, 태블릿 PC에서 이용하실 수 있습니다.<br/>(도서 특성에 따라 이용 가능한 기기의 제한이 있을 수 있습니다.) </li>
						<li>책파일 내 판권정보 정가와 북큐브 사이트 정가 표시가 다를 수 있으며, 실제 정가는 사이트에 표시된 정가를 기준으로 합니다.</li>
						<li>적립금 지급은 적립금 및 북큐브 상품권으로 결제한 금액을 뺀 나머지가 적립금으로 지급됩니다.<br/>(적립금 유효기간은 마이페이지>북캐시/적립금/상품권>적립금 적립내역에서 확인 가능합니다.) </li>
						<li>저작권 보호를 위해 인쇄/출력 기능은 지원하지 않습니다.</li>
						<li>구매하신 전자책은 “마이페이지 > 구매목록” 또는 “북큐브 내서재 프로그램 > 구매목록”에서 다운로드할 수 있습니다.</li>
						<li>스마트폰, 태블릿PC의 경우 북큐브 어플리케이션을 설치하여 이용할 수 있습니다. (<a href="/customer.asp?page=viewer">모바일 페이지 바로가기</a>) </li>
						<li>PC에서는 PC용 내서재 프로그램을 통해 도서를 이용하실 수 있습니다.</li>
						<li>ID 계정 당 총 5대의 기기에서 횟수 제한 없이 이용하실 수 있습니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<script type="text/javascript">
	

	function idYn() {
		var myid = document.getElementById('myId').value;
// 		alert(myid);
		if (myid == "null") {
			alert("로그인 해주시길 바랍니다.");
			return false;
		}
	};

	
	// 댓글 삭제
	function comment_delete(obj){

		var firstSec = $(obj).attr('class');
// 		alert(firstSec);		
		var isbn=$(obj).parent().siblings('#book_isbn').val();
		var board_type=$(obj).parent().siblings("#board_type").val();
		var board_num=$(obj).parent().siblings("#board_num").val();
		var comment_num=$(obj).data("comment_num");
		var comment_id= "<%=(String)session.getAttribute("id")%>";

		var page = "<%=nowPage%>"
		if (comment_id == "null") {
			alert("로그인을 해주시길 바랍니다.");
			return false;
		}
			if(confirm("댓글을 삭제하시겠습니까?")==true) {
				$.ajax({
					type : "POST",
					dataType : "json",
					url : "ReCommentDeletePro.re",
					data : {
						"page" : page,
						"isbn" : isbn,
						"board_type" : board_type,
						"board_num" : board_num,
						"comment_num" : comment_num,
						"comment_id" : comment_id,
					},
					success : function(data) {
						var text = data.text;
						alert(text);

					},
					error : function(error) {
						alert("오류발생" + error);
					}
				});
			} else {
				return false;
		}
			var board_num = data.board_num;
			$(".comment_write_show").trigger("click");
// 			reply_write(board_num);
			
	}

	
	// 댓글 수정창 열기
	function comment_Modi_Open(obj) {
		var firstSec = $(obj).attr('class');

		if($(".comment-text").css("display")=="none"){
			$(".comment-text").show();
		} else {
			$(".comment-text").hide();
			}
		}
	
	// 댓글 수정
	function comment_Modi(firstSec){
		alert(firstSec);
		var isbn = $('input[name="isbn"]').val();
		var board_type = $('input[name="board_type"]').val();
		var board_num = $('input[name="board_num"]').val();
		var comment_num = $('input[name="comment_num"]').val();
		var comment_id = '<%=(String)session.getAttribute("id")%>';
		var comment_desc = $('textarea[name="comment_desc"]').val();
		alert(isbn);
		alert(board_type);
		alert(board_num);
		alert(comment_num);
		alert(comment_id);
		alert(comment_desc);
		if(confirm("댓글을 수정하시겠습니까?")==true) {
			$.ajax({
				type : "GET",
				data : "json",
				url : "ReCommentModifyPro.re",
				data : {
					"isbn" : isbn,
					"board_type" : board_type,
					"board_num" : board_num,
					"comment_num" : comment_num,
					"comment_id" : comment_id,
					"comment_desc" : comment_desc
				},
				success : function(data) {
					alert("정상적으로 등록이 되었습니다.");
					comment_Modi_Open();
				},
				error : function(error) {
					alert("오류발생" + error);
				}
			});
		} else {
			return false;
		}
		 reply_write(board_num);
	}

	
	$(document).ready(
			function() {
				$(".my-review").on("click", function() {
					if ($(this).data("review-yn") == "N") {
						$(".review-text:not(:animated)").animate({
							height : "toggle"
						});
					} else {
						location.href = "/mypage.asp?list=_review";
					}
				});		
				
				//리뷰댓글 수정입력창 보이기
				$(".rview_modi_show").on("click",function() {
					var modi = $(this).parent().parent().next().css("display");
					if (modi == "none") {
						$(".cmtModi").hide();
						$(".cmtRly").hide();
						$(this).parent().parent().next().css("display", "block");
					} else {
						$(this).parent().parent().next().css("display", "none");
					}
				});
				
				//리뷰댓글 입력창 보이기
				$(".comment_write_show").on("click",function() {
					var board_num = $(this).data("board_num");
					var reply_display =$(this).parent().parent().next().next().css("display");
					if (reply_display == "none") {
						$(".cmtModi").hide();
						$(".cmtRly").hide();
						$(this).parent().parent().next().next().css("display", "block");
						reply_write(board_num);
					} else {
						$(this).parent().parent().next().next().css("display", "none");
					}
				});
				
				// 댓글리스트
				function reply_write(board_num){
					var id = '<%=(String)session.getAttribute("id")%>';
// 					var page = $('input[name="page"]').val();
					var isbn = $('input[name="isbn"]').val();
					var board_type = $('input[name="board_type"]').val();
					var board_num = board_num;
					$.ajax({
						type : "GET",
						data : "json",
						url : "ReCommentList.re",
						data : {
// 							"page" : page,
							"isbn" : isbn,
							"board_type" : board_type,
							"board_num" : board_num
						},
						success : function(json) {
// 							alert(json);

							$(".reply").text("");
							$.each(JSON.parse(json), function(index, entry) {
								entry["comment_id"]
								$(".reply").append(
									'<input type="hidden" name="book_isbn" id="book_isbn" value='+isbn+'>'+
	                				'<input type="hidden" name="board_type" id="board_type" value="2">'+
	                				'<input type="hidden" name="board_num" id="board_num" value="'+entry["board_num"]+'">'+
	                				'<p class="comment-vote bookcube" id="cmt_vote">'+
	                				'<span id="c_date" class="date"><댓글></span><em>|</em><i id="c_id">'+entry["comment_id"]+
	                				'</i></p>'+
	                				'<div class="comment-content">'+
	                				'<span id="c_desc">'+entry["comment_desc"]+'</span>'+
	                				'</div>'+
	                				'<div class="btn_inner">'+
// 	                				'<a href="javascript:;" class="comment_modi_show btn rview_modi_show">수정</a>'+

// 	                				'<a href="javascript:;" onclick="comment_Modi_Open(this);" class="comment_modi_show btn rview_modi_show" data-comment_num="'+entry["comment_num"]+'">수정</a>'+

	                				'<a href="javascript:;" onclick="comment_delete(this);" class="comment_delete_show btn" data-comment_num="'+entry["comment_num"]+'">삭제</a>'+
	                				'</div>'+

	                				'<div class="comment-text" style="display: none;">'+
	                				'<form action="javascript:;" class="comment-write reply-write" method="post" id="MyReModify">'+
// 	                				'<form action="ReCommentModifyPro.re" class="comment-write reply-write" method="post" id="MyReModify">'+
	                				'<div>'+
	                				'<input type="hidden" name="isbn" value="'+isbn+'">'+
// 	                				'<input type="hidden" name="page" value='+page+'>'+
	                				'<input type="hidden" name="comment_num" value="'+entry["comment_num"]+'">'+
	                				'<input type="hidden" name="board_num" value="'+entry["board_num"]+'">'+
	                				'<input type="hidden" name="board_type" value="2">'+
	                				'<input type="hidden" name="comment_id" value="'+id+'">'+
	                				'<textarea name="comment_desc">'+entry.comment_desc+'</textarea>'+
	                				'</div>'+
	                				'<div class="btn_inner">'+
	                				'<input type="submit" value="수정" onclick="comment_Modi();" class="btn reviewInput ReComment_Modify">'+
	                				'<input type="reset" value="취소" onclick="modi_close();" class="btn reviewCancele">'+
	                				'</div>'+
	                				'</form>'+
	                				'</div>'
                				);

							});
						},
						error : function(error) {
							alert("오류 발생" + error);
						}
					});
				}
				
// 				// 댓글리스트(수정해보는중)
// 				function reply_write(board_num){
<%-- 					var id = '<%=(String)session.getAttribute("id")%>'; --%>
//  					var page = $('input[name="page"]').val();
// 					var isbn = $('input[name="isbn"]').val();
// 					var board_type = $('input[name="board_type"]').val();
// 					var board_num = board_num;
// 					$.ajax({
// 						type : "GET",
// 						data : "json",
// 						url : "ReCommentList.re",
// 						data : {
// // 							"page" : page,
// 							"isbn" : isbn,
// 							"board_type" : board_type,
// 							"board_num" : board_num
// 						},
// 						success : function(json) {
// 							console.log(json);
// 							var str = "";
// 							var obj = JSON.parse(json);											
// 							$(obj).each(function () {
// 						            str +=  "<p class='comment_num>" + this.comment_num + "</p>"
// 						                +   "<p class='comment_id'>" + this.comment_id + "</p>"
// 						                +   "<p class='comment_id'>" + this.comment_desc + "</p>"
// 						                +   "<button type='button' onclick='comment_Modi();' class='btn data-toggle='modal' data-comment_num='"+ this.comment_num +"'>댓글 수정</button>"
// 						      		 	+   "<div class='comment-text' style='display: none;''>"
// 						                +	"<form action='script:;' class='comment-write reply-write' method='post' id='MyReModify'>"
// 						                + 	"<textarea name='comment_desc'>" + this.comment_desc+ "</textarea>"
// 						                + 	"</form>"
// 	 	                				+	"</div>" ;
						                

// 						        });
// 						        $(".reply").html(str);
// 						},
// 						error : function(error) {
// 							alert("오류 발생" + error);
// 						}
// 					});
// 				}
				//댓글 입력창 보이기(수정)
				$(".comment_modify").on("click",function() {
					if ($.cookie("user_num")) {
						$(this).parent().parent().parent().parent().hide();
						$(this).parent().parent().parent().parent().next().show();
					} else {
						goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
						//alert('로그인 후 이용가능합니다.');
						return;
					}
				});
				
				// 리뷰수정/댓글 입력창 닫기
				$(".reviewCancele").on("click", function() {
					$(".cmtModi").hide();
					$(".cmtRly").hide();
				});
				
				// 좋아요
				$(".heart-btn").on("click",function() {
					var num = $(this).data("review_num");
					var review_num = $(this).data("review_num");
					var like_id = $(this).data("like_id");
					var book_isbn = $(this).data("isbn");
					if (like_id == null) {
						alert("로그인을 해주시길 바랍니다.");
						return false;
					}
					var btnPar = $(this).parent().siblings("#cmt_vote").children('span.likeCountInner');
					$.ajax({
						url : 'ReviewlikeCount.re',
						type : "POST",
						dataType : 'json',
						data : {
							"num" : num,
							"review_num" : review_num,
							"like_id" : like_id,
							"book_isbn" : book_isbn
						},
						success : function(data) {
							var text = data.text;
							var likeCount = data.likeCount;
							alert(text);
							if (likeCount > 0) {
								btnPar.text(likeCount);
							}
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n"
									+ "message:" + request.responseText
									+ "\n" + "error:" + error);
						}
					});
				});
				
				// 댓글 등록
				$(".ReComment_Write").on("click",function() {
					var page = $('input[name="page"]').val();
					var isbn = $('input[name="isbn"]').val();
					var board_type = $('input[name="board_type"]').val();
// 					var board_num = $('input[name="board_num"]').val();
// 					var comment_id = $('input[name="comment_id"]').val();
					var board_num = $(this).data("board_num");
					var comment_id = '<%=(String)session.getAttribute("id")%>';
					var comment_desc = $('textarea[name="comment_desc"]').val();

					if (comment_id == null) {
						alert("로그인을 해주시길 바랍니다.");
						$("textarea[name=comment_desc]").val("");
						return false;
					}
					if(confirm("댓글을 등록하시겠습니까?")==true) {
						$.ajax({
							url : "ReCommentWritePro.re",
							type : "POST",
							dataType : "json",
							data : {
								"page" : page,
								"isbn" : isbn,
								"board_type" : board_type,
								"board_num" : board_num,
								"comment_id" : comment_id,
								"comment_desc" : comment_desc
							},
							success : function(data) {
								var text = data.text;
								alert(text);

								reply_write(board_num);
								

							<%-- <div class="comment comment_inner reIcon">
								<input type="hidden" name="isbn" value="<%=isbn%>"> 
								<input type="hidden" name="page" value="<%=nowPage%>"> 
								<input type="hidden" name="board_type" value="2">
								<input type="hidden" name="board_num" value="<%=articleList.get(i).getNum()%>">
								<p class="comment-vote bookcube" id="cmt_vote">
									<i id="c_id"><%=commentList2.get(b).getComment_id()%></i><em>|</em><span id="c_date" class="date"><%=commentList2.get(b).getDate()%></span>
								</p>
								<div class="comment-content">
									<span id="c_desc"><%=commentList2.get(b).getComment_desc()%></span>
								</div>
								<div class="btn_inner">
									<a href="javascript:;" class="comment_modi_show btn rview_modi_show">수정</a>
									<a href="ReviewDeletePro.re?num=<%=articleList.get(i).getNum()%>&id=<%=id%>&isbn=<%=isbn%>&page=<%=nowPage%>" class="delete-btn btn">삭제</a>
									<a href="javascript:;" class="comment_write_show btn" data-comment-count="0">댓글</a>
								</div>
							</div> --%>
							},
							error : function(error) {
								alert("오류발생" + error);
							}
						});


					} else {
						return false;
					}
					$('textarea[name="comment_desc"]').val("");
					reply_write(board_num);
				});
				
				// 댓글 수정

				
				// 댓글 리스트
				/* function comment_list() {
					var page = $('input[name="page"]').val();
					var isbn = $('input[name="isbn"]').val();
					var board_type = $('input[name="board_type"]').val();
					var board_num = $('input[name="board_num"]').val();
					$.ajax({
						type : "GET",
						data : "json",
						url : "ReCommentList.re",
						data : {
							"subNum":subNum,
							"page" : page,
							"isbn" : isbn,
							"board_type" : board_type,
							"board_num" : board_num
						},
						success : function(data) {
							alert(data);
							alert("성공111111?")
						},
						error : function(error) {
							alert("오류 발생" + error);
						}
					});
				} */
				
				// 댓글수정
				
				// 댓글삭제
				
				
			});
</script>
<script>
	$(function() {
		var series_num = $(".wrap").data("series-num");
		var mainclass_num = $(".wrap").data("mainclass-num");
		var subclass_num = $(".wrap").data("subclass-num");
		var book_count = $(".wrap").data("book-count");
		var represent_web_class = $(".wrap").data("represent-web-class");
		var total_flat_fee_yn = $(".wrap").data("total-flat-fee-yn");
		$(".s-more").hide();
		$(".d-more").on("click", function() {
			$(this).hide();
			$(this).parent().find("li").show();
			return false;
		});
		$(".sequel_btn").on("click",function() {
		if ($.cookie("user_num")) {
			var state = $(this).data("state");
			$.post("/data/_addSequel.asp",
					{series_chk : series_num,state : state},
					function(data) {
						if (data.success) {
							if (state == 0) {
								$(".sequel_btn").data("state",1);
								$(".sequel_btn").addClass('on');
								$(".sequel_btn").html("후속권 출간 알림 해제");
								alert('후속권 출간 알림 추가 완료되었습니다.\n신규 권호 업데이트 시 알리미/앱푸시를 통해 알려드립니다.');
							} else {
								$(".sequel_btn").data("state",0);
								$(".sequel_btn").removeClass('on');
								$(".sequel_btn").html("후속권 출간 알림 추가");
								alert('후속권 출간 알림 해제되었습니다.');
							}
						} else {
							alert(data.message);
						}
					}, "json");
				} else {
					goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
				}
			});
		//작가의 출간작. 인기순, 최신순
		$('.radio.sAuthor').click(function() {
			$(".aPrefer").data("a-sort", $(this).data("sort"));
			$(this).parent().find('span').removeClass('radio_on').addClass('radio_off');
			$(this).find('span').removeClass('radio_off').addClass('radio_on');
			$('#' + $(this).attr('for')).attr('checked', 'checked');
			var play = alist(); // 작가시리즈리스트 출력
		});
		//작가시리즈 도서리스트
		function alist() {
			var author_num = $(".aPrefer").data("author-num");
			var strSort = $(".aPrefer").data("a-sort");
			$.post("/detail/_author_book.asp", {
				series_num : series_num,
				author_num : author_num,
				sort : strSort
			}, function(data) {
				$(".alist").html(data);
				$(".slider-list").each(function() {
					$(this).namilSlider({
						width : 306,
						delay : 200
					});
				});
				$(".alist .mds").slick({
					slidesToShow : 5,
					slidesToScroll : 1,
					infinite : true
				});
			}, "html");
		}
		$('.reviewCancel').click(function() {
			$(".review-text").fadeOut();
		});
		//이 분야의 베스트
		$.post("/detail/_class_best_book.asp", {
			series_num : series_num,
			mainclass_num : mainclass_num,
			subclass_num : subclass_num
		}, function(data) {
			$(".detail_class_best_book").html(data);
		}, "html");
		//$.post("/detail/_class_md_book.asp", {represent_web_class : represent_web_class}, function(data){					
		$.post("/main/_recommend_book.asp", {
			represent_web_class : represent_web_class
		}, function(data) {
			$(".detail_class_md_book").html(data);
			$(".detail_class_md_book .mds").slick({
				slidesToShow : 5,
				slidesToScroll : 1,
				infinite : true
			});
		}, "html");
	});
</script>
<jsp:include page="../include/footer.jsp"/>
