<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BookBean"%>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd a hh:mm");

	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	String id = (String) session.getAttribute("id"); 
	ArrayList<BookBean> bookList = (ArrayList<BookBean>)request.getAttribute("bookList");
	ArrayList<BookBean> bookList2 = (ArrayList<BookBean>)request.getAttribute("bookList2");
	ArrayList<BookBean> bookList3 = (ArrayList<BookBean>)request.getAttribute("bookList3");
	ArrayList<BookBean> bookList4 = (ArrayList<BookBean>)request.getAttribute("bookList4");
	ArrayList<BookBean> bookList5 = (ArrayList<BookBean>)request.getAttribute("bookList5");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
	String catg1 = "소설";
	if(request.getParameter("catg1")!=null){
		catg1 = request.getParameter("catg1");
	}
	String catg2 = "전체";
	if(request.getParameter("catg2")!=null){
		catg2 = request.getParameter("catg2");
	}
	
%>  

<jsp:include page="../include/header.jsp" />
<section class="" id="contents">
	<div class="today-hot">
		<h3 class="hot-title">오늘의 추천</h3>
		<div class="hot-inner">
			<p class="prev">
				<a href="javascript:;"><span>prev</span></a>
			</p>
			<p class="next">
				<a href="javascript:;"><span>next</span></a>
			</p>
		</div>
		<div class="slider">
			<ul>
				<%
					if(bookList5!=null){
					for(int i = 0; i < 5; i++) {
				%>
				<li>
					<div class="figure">
						<span class="label"><em>10%<span>할인</span></em></span> 
						<a href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">
							<span class="rm_br">
							<img src="<%=bookList5.get(i).getImage() %>" alt="<%=bookList5.get(i).getImage() %>" /></span>
							<span class="light"></span>
							<div class="caption">
								<div class="about">
									<p><%=bookList5.get(i).getDescription() %></p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy"><%=bookList5.get(i).getTitle() %></a>
						</p>
						<p><%=bookList5.get(i).getAuthor() %></p>
					</div>
				</li>
				<%
					}}
				%>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> 
						<a href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">
							<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100243.jpg" alt="도서 이미지 - 어떻게 말해줘야 할까" /></span> 
							<span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>채널A 〈요즘 육아 금쪽같은 내 새끼〉 SBS 〈우리 아이가 달라졌어요〉국민 육아멘토 오은영 박사가 알려주는 ‘부모의 말’육아 현실을 200퍼센트 반영한 130가지 한마디...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">어떻게 말해줘야 할까</a>
						</p>
						<p>오은영 글, 차상미 그림</p>
					</div>
				</li>
<!-- 				<li> -->
<!-- 					<div class="figure"> -->
<!-- 						<a -->
<!-- 							href="https://www.bookcube.com/detail.asp?series_num=920017326&page=buy"> -->
<!-- 							<span class="rm_br"><img -->
<!-- 								src="https://bookimg.bookcube.com/150/2007/200701496.jpg" -->
<!-- 								alt="도서 이미지 - 돈의 속성" /></span> <span class="light"></span> -->
<!-- 							<div class="caption"> -->
<!-- 								<div class="about"> -->
<!-- 									<p>유튜브 1,100만 명이 시청한 〈돈의 속성〉 완결판 최상위 부자 김승호 회장이 직접 밝히는 돈에 -->
<!-- 										통찰과 철학 맨손에서 종잣돈을 만들고 돈을 불리는 75가지 방법 이 책 『돈...</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="hot-info"> -->
<!-- 						<p class="hot-title"> -->
<!-- 							<a -->
<!-- 								href="https://www.bookcube.com/detail.asp?series_num=920017326&page=buy">돈의 -->
<!-- 								속성</a> -->
<!-- 						</p> -->
<!-- 						<p>김승호</p> -->
<!-- 					</div> -->
<!-- 				</li> -->
<!-- 				<li> -->
<!-- 					<div class="figure"> -->
<!-- 						<a -->
<!-- 							href="https://www.bookcube.com/detail.asp?series_num=920025243&page=buy"> -->
<!-- 							<span class="rm_br"><img -->
<!-- 								src="https://bookimg.bookcube.com/150/2009/200902682.jpg" -->
<!-- 								alt="도서 이미지 - 규칙 없음" /></span> <span class="light"></span> -->
<!-- 							<div class="caption"> -->
<!-- 								<div class="about"> -->
<!-- 									<p>“통제와 규정은, 무능력한 직원에게나 필요한 것!” | 넷플릭스 CEO 리드 헤이스팅스의 첫 책 | -->

<!-- 										1997년 설립 당시, 넷플릭스는 우편으로 DVD를 대여해 주는 회사에 불과했다. ...</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="hot-info"> -->
<!-- 						<p class="hot-title"> -->
<!-- 							<a -->
<!-- 								href="https://www.bookcube.com/detail.asp?series_num=920025243&page=buy">규칙 -->
<!-- 								없음</a> -->
<!-- 						</p> -->
<!-- 						<p>리드 헤이스팅스, 에린 마이어</p> -->
<!-- 					</div> -->
<!-- 				</li> -->
<!-- 				<li> -->
<!-- 					<div class="figure"> -->
<!-- 						<span class="label"><em>10% <span>할인</span></em></span> <a -->
<!-- 							href="https://www.bookcube.com/detail.asp?series_num=920028916&page=buy"> -->
<!-- 							<span class="rm_br"><img -->
<!-- 								src="https://bookimg.bookcube.com/150/2010/201003746.jpg" -->
<!-- 								alt="도서 이미지 - 워터 댄서" /></span> <span class="light"></span> -->
<!-- 							<div class="caption"> -->
<!-- 								<div class="about"> -->
<!-- 									<p>* 뉴욕타임스 베스트셀러 1위 * 아마존 베스트셀러 1위 * 오프라 윈프리 북클럽 선정도서 * -->
<!-- 										[타임] 외 13개 매체가 뽑은 올해의 책 * 전미도서상 수상작가 신작 소설 전미도서상 ...</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="hot-info"> -->
<!-- 						<p class="hot-title"> -->
<!-- 							<a -->
<!-- 								href="https://www.bookcube.com/detail.asp?series_num=920028916&page=buy">워터 -->
<!-- 								댄서</a> -->
<!-- 						</p> -->
<!-- 						<p>타네히시 코츠</p> -->
<!-- 					</div> -->
<!-- 				</li> -->
<!-- 				<li> -->
<!-- 					<div class="figure"> -->
<!-- 						<a -->
<!-- 							href="https://www.bookcube.com/detail.asp?series_num=920029916&page=buy"> -->
<!-- 							<span class="rm_br"><img -->
<!-- 								src="https://bookimg.bookcube.com/150/2011/201100423.jpg" -->
<!-- 								alt="도서 이미지 - 이만하면 괜찮은 죽음" /></span> <span class="light"></span> -->
<!-- 							<div class="caption"> -->
<!-- 								<div class="about"> -->
<!-- 									<p>‘괜찮은 죽음’을 말하는 슬프고도 유쾌한 문장들 이만하면 괜찮은 죽음이란 게 과연 존재할까? 모든 -->
<!-- 										죽음은 무너지는 아픔과 깊은 슬픔이 뒤따른다. 검은색으로 가득한 장례식장...</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="hot-info"> -->
<!-- 						<p class="hot-title"> -->
<!-- 							<a -->
<!-- 								href="https://www.bookcube.com/detail.asp?series_num=920029916&page=buy">이만하면 -->
<!-- 								괜찮은 죽음</a> -->
<!-- 						</p> -->
<!-- 						<p>데이비드 재럿</p> -->
<!-- 					</div> -->
<!-- 				</li> -->
<!-- 				<li> -->
<!-- 					<div class="figure"> -->
<!-- 						<span class="label"><em>10%<span>할인</span></em></span> <a -->
<!-- 							href="https://www.bookcube.com/detail.asp?series_num=920029909&page=buy"> -->
<!-- 							<span class="rm_br"><img -->
<!-- 								src="https://bookimg.bookcube.com/150/2011/201100254.jpg" -->
<!-- 								alt="도서 이미지 - 주식하는 마음" /></span> <span class="light"></span> -->
<!-- 							<div class="caption"> -->
<!-- 								<div class="about"> -->
<!-- 									<p>“당신이 주식투자로 부자가 되면 좋겠습니다.” 출연만으로 유튜브 누적 조회수 100만 회 기록! -->
<!-- 										트레바리에서 가장 빨리 마감되는 클럽의 주인공! 투자 고수 홍진채가 전하는 ‘주...</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="hot-info"> -->
<!-- 						<p class="hot-title"> -->
<!-- 							<a href="https://www.bookcube.com/detail.asp?series_num=920029909&page=buy">주식하는 마음</a> -->
<!-- 						</p> -->
<!-- 						<p>홍진채</p> -->
<!-- 					</div> -->
<!-- 				</li> -->
<!-- 								<li> -->
<!-- 					<div class="figure"> -->
<!-- 						<span class="label"><em>10%<span>할인</span></em></span> <a -->
<!-- 							href="https://www.bookcube.com/detail.asp?series_num=920029909&page=buy"> -->
<!-- 							<span class="rm_br"><img -->
<!-- 								src="https://bookimg.bookcube.com/150/2011/201100254.jpg" -->
<!-- 								alt="도서 이미지 - 주식하는 마음" /></span> <span class="light"></span> -->
<!-- 							<div class="caption"> -->
<!-- 								<div class="about"> -->
<!-- 									<p>“당신이 주식투자로 부자가 되면 좋겠습니다.” 출연만으로 유튜브 누적 조회수 100만 회 기록! -->
<!-- 										트레바리에서 가장 빨리 마감되는 클럽의 주인공! 투자 고수 홍진채가 전하는 ‘주...</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="hot-info"> -->
<!-- 						<p class="hot-title"> -->
<!-- 							<a href="https://www.bookcube.com/detail.asp?series_num=920029909&page=buy">주식하는 마음</a> -->
<!-- 						</p> -->
<!-- 						<p>홍진채</p> -->
<!-- 					</div> -->
<!-- 				</li> -->
<!-- 								<li> -->
<!-- 					<div class="figure"> -->
<!-- 						<span class="label"><em>10%<span>할인</span></em></span> <a -->
<!-- 							href="https://www.bookcube.com/detail.asp?series_num=920029909&page=buy"> -->
<!-- 							<span class="rm_br"><img -->
<!-- 								src="https://bookimg.bookcube.com/150/2011/201100254.jpg" -->
<!-- 								alt="도서 이미지 - 주식하는 마음" /></span> <span class="light"></span> -->
<!-- 							<div class="caption"> -->
<!-- 								<div class="about"> -->
<!-- 									<p>“당신이 주식투자로 부자가 되면 좋겠습니다.” 출연만으로 유튜브 누적 조회수 100만 회 기록! -->
<!-- 										트레바리에서 가장 빨리 마감되는 클럽의 주인공! 투자 고수 홍진채가 전하는 ‘주...</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="hot-info"> -->
<!-- 						<p class="hot-title"> -->
<!-- 							<a href="https://www.bookcube.com/detail.asp?series_num=920029909&page=buy">주식하는 마음</a> -->
<!-- 						</p> -->
<!-- 						<p>홍진채</p> -->
<!-- 					</div> -->
<!-- 				</li> -->
<!-- 								<li> -->
<!-- 					<div class="figure"> -->
<!-- 						<span class="label"><em>10%<span>할인</span></em></span> <a -->
<!-- 							href="https://www.bookcube.com/detail.asp?series_num=920029909&page=buy"> -->
<!-- 							<span class="rm_br"><img -->
<!-- 								src="https://bookimg.bookcube.com/150/2011/201100254.jpg" -->
<!-- 								alt="도서 이미지 - 주식하는 마음" /></span> <span class="light"></span> -->
<!-- 							<div class="caption"> -->
<!-- 								<div class="about"> -->
<!-- 									<p>“당신이 주식투자로 부자가 되면 좋겠습니다.” 출연만으로 유튜브 누적 조회수 100만 회 기록! -->
<!-- 										트레바리에서 가장 빨리 마감되는 클럽의 주인공! 투자 고수 홍진채가 전하는 ‘주...</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="hot-info"> -->
<!-- 						<p class="hot-title"> -->
<!-- 							<a href="https://www.bookcube.com/detail.asp?series_num=920029909&page=buy">주식하는 마음</a> -->
<!-- 						</p> -->
<!-- 						<p>홍진채</p> -->
<!-- 					</div> -->
<!-- 				</li> -->
			</ul>
		</div>
	</div>
	<div class="main-inner">
		<div class="main_new_book">
			<div class="md">
				<div class="md-title">
					<h3 class="coTitle">신간</h3>
					<a href="https://www.bookcube.com/new.asp?page=nm" class="more">더보기</a>
				</div>
				
				<ul>
					<%
						for(int i = 0; i < 5; i++) {
					%>
					<li>
						<div class="figure">
							<a href="BookDetail.bok?isbn<%=bookList.get(i).getIsbn()%>">
								<span class="rm_br">
									<img src="bookUpload/aa.PNG" alt="도서 이미지 - 가족사진">
								</span> 
								<span class="light"></span>
							</a>
						</div>
						<div class="hot-info">
							<p class="hot-title">
								<a href="BookDetail.bok?isbn<%=bookList.get(i).getIsbn()%>"><%=bookList.get(i).getTitle() %></a>
							</p>
							<p><%=bookList.get(i).getAuthor() %></p>
						</div>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="rank_inner">
		<div class="main-inner">
			<div class="cover-section realtime-hot-box">
				<div class="cover-section-inner">
					<div class="special-title">
						<h3 class="coTitle coTitleL">실시간 인기작품</h3>
						<span class="date"><%=sf.format(nowTime)%>기준</span>
					</div>
					<div class="realtime-hot-list">
						<ul>
							<li class="head">
								<p class="rank">
									<span>순위</span>
								</p>
								<p class="webtoon">
									<strong class="fn-webtoon">소설</strong> 
									<a href="/webtoon/best/realtime" class="btn-type03">더보기 
										<span class="more"></span>
									</a>
								</p>
								<p class="comic">
									<strong class="fn-comic">인문/경제</strong> 
									<a href="/comic/best/all/realtime" class="btn-type03">더보기
										<span class="more"></span>
									</a>
								</p>
								<p class="fiction">
									<strong class="fn-fiction">과학/IT</strong> 
									<a href="/novel/best/all/realtime" class="btn-type03">더보기 
										<span class="more"></span>
									</a>
								</p>
							</li>
						<%
						if(bookList2!=null){
						for(int i = 0; i < 1; i++) {
						%>							
							<li class="top-rank top-one">
								<p class="rank">
									<span><strong>1</strong></span>
									<span class="icon"></span>
								</p>
								<div class="webtoon">
									<p>
										<strong><%=bookList2.get(1).getTitle()%></strong>
										<span><%=bookList2.get(1).getAuthor()%></span>
									</p>
									<div>
										<a title="<%=bookList2.get(1).getTitle()%>" href="/webtoon/wt_closet_wz">
											<div>
												<img src="<%=bookList2.get(1).getTitle()%>" alt="">
											</div> 
											<span><strong><%=bookList2.get(1).getTitle()%></strong></span>
											<span><%=bookList2.get(1).getAuthor()%></span>
											<span><%=bookList2.get(1).getCatg2()%></span>
										</a>
									</div>
								</div>
								<div class="comic">
									<p>
										<strong><%=bookList3.get(1).getTitle()%></strong>
										<span><%=bookList3.get(1).getAuthor()%></span>
									</p>
									<div>
										<a title="<%=bookList3.get(1).getTitle()%>" href="/comic/goe">
											<div>
												<img src="<%=bookList3.get(1).getImage()%>" alt="">
											</div> 
											<span><strong><%=bookList3.get(1).getTitle()%></strong></span>
											<span><%=bookList3.get(1).getAuthor()%></span>
											<span><%=bookList3.get(1).getCatg2()%></span>
										</a>
									</div>
								</div>
								
								<div class="fiction">
									<p>
										<strong><%=bookList4.get(1).getTitle()%></strong>
										<span><%=bookList4.get(1).getAuthor()%></span>
									</p>
									<div>
										<a title="<%=bookList4.get(1).getTitle()%>" href="/novel/E000072153">
											<div>
												<img src="<%=bookList4.get(1).getTitle()%>" alt="">
											</div> 
											<span><strong><%=bookList4.get(1).getTitle()%></strong></span>
											<span><%=bookList4.get(1).getAuthor()%></span>
											<span><%=bookList4.get(1).getCatg2()%></span>
										</a>
									</div>
								</div>
							</li>
							
							<li class="top-rank top-one">
								<p class="rank">
									<span><strong>2</strong></span>
									<span class="icon"></span>
								</p>
								<div class="webtoon">
									<p>
										<strong><%=bookList2.get(2).getTitle()%></strong>
										<span><%=bookList2.get(2).getAuthor()%></span>
									</p>
									<div>
										<a title="<%=bookList2.get(2).getTitle()%>" href="/webtoon/wt_closet_wz">
											<div>
												<img src="<%=bookList2.get(2).getTitle()%>" alt="">
											</div> 
											<span><strong><%=bookList2.get(2).getTitle()%></strong></span>
											<span><%=bookList2.get(2).getAuthor()%></span>
											<span><%=bookList2.get(2).getCatg2()%></span>
										</a>
									</div>
								</div>
								<div class="comic">
									<p>
										<strong><%=bookList3.get(2).getTitle()%></strong>
										<span><%=bookList3.get(2).getAuthor()%></span>
									</p>
									<div>
										<a title="<%=bookList3.get(2).getTitle()%>" href="/comic/goe">
											<div>
												<img src="<%=bookList3.get(2).getImage()%>" alt="">
											</div> 
											<span><strong><%=bookList3.get(2).getTitle()%></strong></span>
											<span><%=bookList3.get(2).getAuthor()%></span>
											<span><%=bookList3.get(2).getCatg2()%></span>
										</a>
									</div>
								</div>
								
								<div class="fiction">
									<p>
										<strong><%=bookList4.get(2).getTitle()%></strong>
										<span><%=bookList4.get(2).getAuthor()%></span>
									</p>
									<div>
										<a title="<%=bookList4.get(2).getTitle()%>" href="/novel/E000072153">
											<div>
												<img src="<%=bookList4.get(2).getTitle()%>" alt="">
											</div> 
											<span><strong><%=bookList4.get(2).getTitle()%></strong></span>
											<span><%=bookList4.get(2).getAuthor()%></span>
											<span><%=bookList4.get(2).getCatg2()%></span>
										</a>
									</div>
								</div>
							</li>
							
							<%
								}}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main-inner">
		<div class="main_ct_best">
			<div class="ct-best">
				<h3>카테고리별 베스트</h3>
				<ul>
					<li><a href="../sub1/list.html">소설<span class="ct-arrow"></span></a></li>
					<li><a href="../sub1/list.html">인문/경제<span class="ct-arrow"></span></a></li>
					<li><a href="../sub1/list.html">자기개발<span class="ct-arrow"></span></a></li>
					<li><a href="../sub1/list.html">과학<span class="ct-arrow"></span></a></li>
					<li><a href="../sub1/list.html">IT<span class="ct-arrow"></span></a></li>
					<li><a href="../sub1/list.html">건강<span class="ct-arrow"></span></a></li>
				</ul>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp" />
