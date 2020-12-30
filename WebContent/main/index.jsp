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
	ArrayList<BookBean> articleList = (ArrayList<BookBean>)request.getAttribute("BookBean");
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
					for(int i = 0; i < 12; i++) {
				%>
				<li>
					<div class="figure">
						<span class="label"><em>10%<span>할인</span></em></span> 
						<a href="BookDetail.bok?booknum=<%=bookList5.get(i).getNum()%>&isbn=<%=bookList5.get(i).getIsbn()%>">
							<span class="rm_br">
							<img src="bookUpload/<%=bookList5.get(i).getImage() %>" alt="<%=bookList5.get(i).getImage()%>" /></span>
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
							<a href="BookDetail.bok?booknum=<%=bookList5.get(i).getNum()%>&isbn=<%=bookList5.get(i).getIsbn()%>&title=<%=bookList5.get(i).getTitle()%>"><%=bookList5.get(i).getTitle() %></a>
						</p>
						<p><%=bookList5.get(i).getAuthor() %></p>
					</div>
				</li>
				<%
					}
				}
				%>
			</ul>
		</div>
	</div>
	<div class="main-inner">
		<div class="main_new_book">
			<div class="md">
				<div class="md-title">
					<h3 class="coTitle">신간</h3>
<!-- 					<a href="https://www.bookcube.com/new.asp?page=nm" class="more">더보기</a> -->
				</div>
				<ul>
					<%
						for(int i = 0; i < 5; i++) {
					%>
					<li>
						<div class="figure">
							<a href="BookDetail.bok?booknum=<%=bookList.get(i).getNum()%>&isbn=<%=bookList.get(i).getIsbn()%>&title=<%=bookList.get(i).getTitle()%>">
								<span class="rm_br">
									<img src="bookUpload/<%=bookList5.get(i).getImage() %>" >
								</span> 
								<span class="light"></span>
							</a>
						</div>
						<div class="hot-info">
							<p class="hot-title">
								<a href="BookDetail.bok?booknum=<%=bookList.get(i).getNum()%>&isbn=<%=bookList.get(i).getIsbn()%>&title=<%=bookList.get(i).getTitle()%>"><%=bookList.get(i).getTitle() %></a>
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
<!-- 									<a href="/webtoon/best/realtime" class="BookList.bok?catg1=소설">더보기  -->
										<span class="more"></span>
<!-- 									</a> -->
								</p>
								<p class="comic">
									<strong class="fn-comic">인문/경제</strong> 
<!-- 									<a href="/comic/best/all/realtime" class="BookList.bok?catg1=인문/경제">더보기 -->
										<span class="more"></span>
<!-- 									</a> -->
								</p>
								<p class="fiction">
									<strong class="fn-fiction">과학/IT</strong> 
<!-- 									<a href="/novel/best/all/realtime" class="BookList.bok?catg1=과학">더보기  -->
										<span class="more"></span>
<!-- 									</a> -->
								</p>
							</li>
						<%
						if(bookList2!=null){
						for(int i = 0; i < 2; i++) {
						%>							
							<li class="top-rank top-one">
								<p class="rank">
									<span><strong><%=i+1%></strong></span>
									<span class="icon"></span>
								</p>
								<div class="webtoon">
									<p>
										<strong><%=bookList2.get(i).getTitle()%></strong>
										<span><%=bookList2.get(i).getAuthor()%></span>
									</p>
									<div>
										<a title="<%=bookList2.get(i).getTitle()%>" href="BookDetail.bok?booknum=<%=bookList2.get(i).getNum()%>&isbn=<%=bookList2.get(i).getIsbn()%>&title=<%=bookList2.get(i).getTitle()%>">
											<div>
												<img src="bookUpload/<%=bookList2.get(i).getImage()%>" alt="">
											</div> 
											<span><strong><%=bookList2.get(i).getTitle()%></strong></span>
											<span><%=bookList2.get(i).getAuthor()%></span>
											<span><%=bookList2.get(i).getCatg2()%></span>
										</a>
									</div>
								</div>
								<div class="comic">
									<p>
										<strong><%=bookList3.get(i).getTitle()%></strong>
										<span><%=bookList3.get(i).getAuthor()%></span>
									</p>
									<div>
										<a title="<%=bookList3.get(i).getTitle()%>" href="BookDetail.bok?booknum=<%=bookList3.get(i).getNum()%>&isbn=<%=bookList3.get(i).getIsbn()%>&title=<%=bookList3.get(i).getTitle()%>">
											<div>
												<img src="bookUpload/<%=bookList3.get(i).getImage()%>" alt="">
											</div> 
											<span><strong><%=bookList3.get(i).getTitle()%></strong></span>
											<span><%=bookList3.get(i).getAuthor()%></span>
											<span><%=bookList3.get(i).getCatg2()%></span>
										</a>
									</div>
								</div>
								
								<div class="fiction">
									<p>
										<strong><%=bookList4.get(i).getTitle()%></strong>
										<span><%=bookList4.get(i).getAuthor()%></span>
									</p>
									<div>
										<a title="<%=bookList4.get(i).getTitle()%>" href="BookDetail.bok?booknum=<%=bookList4.get(i).getNum()%>&isbn=<%=bookList4.get(i).getIsbn()%>&title=<%=bookList4.get(i).getTitle()%>">
											<div>
												<img src="bookUpload/<%=bookList4.get(i).getImage()%>" alt="">
											</div> 
											<span><strong><%=bookList4.get(i).getTitle()%></strong></span>
											<span><%=bookList4.get(i).getAuthor()%></span>
											<span><%=bookList4.get(i).getCatg2()%></span>
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
					<li><a href="BookList.bok?catg1=소설">소설<span class="ct-arrow"></span></a></li>
					<li><a href="BookList.bok?catg1=인문/경제">인문/경제<span class="ct-arrow"></span></a></li>
					<li><a href="BookList.bok?catg1=과학">과학/IT<span class="ct-arrow"></span></a></li>
					<li><a href="BookList.bok?catg1=취미">취미<span class="ct-arrow"></span></a></li>
					<li><a href="BookList.bok?catg1=만화/웹소설">만화/웹소설<span class="ct-arrow"></span></a></li>
				</ul>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp" />
