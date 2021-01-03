<%@page import="vo.NoticeBean"%>
<%@page import="vo.QnaBean"%>
<%@page import="vo.BookBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.FreeBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 	String id = (String) session.getAttribute("id");
// if (id == null) {
// 	id = "홍길동";
// }

//String id = (String) session.getAttribute("id"); //
//if(id==null) { // 로긴안한상태면 로그인화면으로
//	response.sendRedirect("../member.login.jsp");
//}

// 전달받은 request 객체로부터 데이터 가져오기
// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
// 전부 Object타입이라 형변환 필요
ArrayList<FreeBoardBean> freeBAllList = (ArrayList<FreeBoardBean>) request.getAttribute("freeBAllList");
ArrayList<BookBean> bookAllList = (ArrayList<BookBean>)request.getAttribute("bookAllList");
ArrayList<NoticeBean> noticeAllList = (ArrayList<NoticeBean>) request.getAttribute("noticeAllList");
ArrayList<QnaBean> qnaAllList = (ArrayList<QnaBean>)request.getAttribute("qnaAllList");
String search=request.getParameter("search");


%>

<jsp:include page="../include/header.jsp" />

<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>
				<a href="../main/index.jsp">HOME</a> > 게시판
			</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="sub_container">
					
					<div class="allsec">
					<a href="BookAllList.bok?search=<%=search %>" title="더보기"><span class="more">더보기</span></a>
					<h3 class="coTitle">책검색정보</h3>
					<%
						if(bookAllList.size() != 0) {
					%>
                    <div class="list-page">
                        <div class="list">
                            <!-- *****list thum 클래스 차이로 리스트보기와 썸네일 보기로 변경됩니다.*****-->
                            <ul class="book-list">
                           		
                            	<%	int bookSize = 6;
                            		if(bookAllList.size() < 6){
                            			bookSize = bookAllList.size();
                            		}
									for(int i = 0; i < bookSize; i++) {
								%>
                                <li data-pubdate="<%=bookAllList.get(i).getPubdate()%>" data-popcount="<%=bookAllList.get(i).getCount()%>" data-reviewcount="<%=bookAllList.get(i).getReviewCount()%>">
                                	<input type="hidden" class="pudate" value="<%=bookAllList.get(i).getPubdate()%>">
                                	<input type="hidden" class="pupcount" value="<%=bookAllList.get(i).getCount()%>">
                                	<input type="hidden" class="reviewCount" value="<%=bookAllList.get(i).getReviewCount()%>">
                                	<input type="hidden" class="bookstate" value="<%=bookAllList.get(i).getState()%>">
                                	
                                    <div class="figure">
                                        <a href="BookDetail.bok?booknum=<%=bookAllList.get(i).getNum()%>&isbn=<%=bookAllList.get(i).getIsbn()%>&title=<%=bookAllList.get(i).getTitle() %>">
                                            <span class="rm_br"><img src="bookUpload/<%=bookAllList.get(i).getImage()%>" alt="도서 이미지" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="BookDetail.bok?booknum=<%=bookAllList.get(i).getNum()%>&isbn=<%=bookAllList.get(i).getIsbn()%>&title=<%=bookAllList.get(i).getTitle() %>"><%=bookAllList.get(i).getTitle() %></a></p>
                                        <p class="hot-author"><%=bookAllList.get(i).getAuthor()%><em>|</em><%=bookAllList.get(i).getPublisher()%><em>|</em>
                                        	
                                        	<%=bookAllList.get(i).getPubdate()%>
                                        </p>
                                        
                                        <div class="hot-score">
                                            <p>
                                              <%if(bookAllList.get(i).getStarcount() < 1){ %>
                                            	<span class="list-star rank0"></span>
                                            	
                                            <% }else if(bookAllList.get(i).getStarcount() < 2){%>
                                            	<span class="list-star rank1"></span>
                                            <%}else if(bookAllList.get(i).getStarcount() < 3){%>
                                            	<span class="list-star rank2"></span>
                                            <%}else if(bookAllList.get(i).getStarcount() < 4){%>
                                            	<span class="list-star rank3"></span>
                                         	<%}else if(bookAllList.get(i).getStarcount() < 5){%>
                                            	<span class="list-star rank4"></span>
                                            <%}else if(bookAllList.get(i).getStarcount() < 6){%>
                                            	<span class="list-star rank5"></span>
                                           	<%}else if(bookAllList.get(i).getStarcount() < 7){%>
                                            	<span class="list-star rank6"></span>
                                          	<%}else if(bookAllList.get(i).getStarcount() < 8){%>
                                            	<span class="list-star rank7"></span>
                                           	<%}else if(bookAllList.get(i).getStarcount() < 9){%>
                                            	<span class="list-star rank8"></span>
                                            <%}else if(bookAllList.get(i).getStarcount() < 10){%>
                                            	<span class="list-star rank9"></span>
                                           	<%}else if(bookAllList.get(i).getStarcount() < 11){%>
                                            	<span class="list-star rank10"></span>
                                            <%} %>
                                            <i>
                                            	<em>
                                            		<%=bookAllList.get(i).getStarcount()%>.0
                                           		</em> 
                                           		(<%=bookAllList.get(i).getReviewCount()%>명)
                                           		
                                         	</i>
                                         	<em>|</em>총 <%=bookAllList.get(i).getCount()%>권</p>
                                            
                                            
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p><%=bookAllList.get(i).getDescription()%></p>
                                        </div>
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                    <%}else {
					%>
					<div class="list-page">
                        <div class="list">
                            <ul class="book-list">
<!--                             	<li>검색된 도서가 없습니다.</li> -->
									<li><img class="nodate" alt="" src="images/nodata.jpg"></li>
                            </ul>
                    	</div>
                    </div>
					<%
					}
					%>
					</div>
					
					
					<div class="allsec">
					<a href="FreeBoardList.free?search=<%=search%>" title="더보기"><span class="more">더보기</span></a>
					<h3 class="coTitle">자유게시판</h3>
					<table summary="공지사항" class="customer-table notice">

						<caption>자유게시판</caption>
						<colgroup>
							<col style="width: 8%;">
							<col style="width: 50%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
							<col style="width: 7%;">

						</colgroup>
						
						<thead>
							<tr>
								<th scope="col" abbr="번호">번호</th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="작성자">작성자</th>
								<th scope="col" abbr="등록일">등록일</th>
								<th scope="col" abbr="조회수">조회수</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (freeBAllList.size() != 0) {
							%>
							<%
							int freeBAllListS = 6;
                    		if(freeBAllList.size() < 6){
                    			freeBAllListS = freeBAllList.size();
                    		}
								// 게시물목록불러오기
							for (int i = 0; i < freeBAllListS; i++) {
							%>
							<tr>
								<td class="tac"><%=freeBAllList.get(i).getBoard_num()%></td>
								<td>
									<%
										if (freeBAllList.get(i).getBoard_re_lev() != 0) {
									%> <%
									 	for (int j = 0; j <= freeBAllList.get(i).getBoard_re_lev() * 2; j++) {
									 %> &nbsp; <%
									 	}
									 %> ▶ <%
									 	}
									 %>  
									 <a	href="FreeBoardDetail.free?board_num=<%=freeBAllList.get(i).getBoard_num()%>&page=1&board_type=1&limit=10">
										<%=freeBAllList.get(i).getBoard_subject()%>
								</a>
								</td>
								<td align="center"><%=freeBAllList.get(i).getBoard_id()%></td>
								<td align="center"><%=freeBAllList.get(i).getBoard_date()%></td>
								<td align="center"><%=freeBAllList.get(i).getBoard_readcount()%></td>
							</tr>
							<%
							}
							}else{
							%>
							<tr id="emptyArea"><td colspan="5" class="tac">검색된 글이 없습니다</td></tr>
							<%
								}
							%>
						</tbody>
					</table>
						</div>
						<div class="allsec">
						<a href="QnaList.qna?search=<%=search%>" title="더보기"><span class="more">더보기</span></a>
						
						<h3 class="coTitle">문의 내역 검색결과</h3>
						<table class="customer-table" summary="문의 내역 확인 표">
						<caption>문의 내역 확인</caption>
						<colgroup>
						<col width="20%">
						<col width="*">
						<col width="15%">
						<col width="15%">
						</colgroup>
						<thead>
						<tr>
							<th>글 번호</th>
							<th>문의 제목</th>
							<th>문의 유형</th>
							<th>등록일</th>
						</tr>
						</thead>
						<tbody>
						<%
						if(qnaAllList.size() != 0) {
						%>
						<%
						int qnaAllListS= 6;
                		if(qnaAllList.size() < 6){
                			qnaAllListS = qnaAllList.size();
                		}
						for(int i = 0; i < qnaAllListS; i++) {
						%>
						<tr>
							<td align="center">
								
							<%if(qnaAllList.get(i).getRe_lev() != 0) { %>
									<font color="purple">답변</font>
								<%} else {%>
									<font color="orange">문의</font>
								<%}%>
							</td>
							<td>
							<a href="QnaDetail.qna?board_num=<%=qnaAllList.get(i).getBoard_num() %>">
							<%=qnaAllList.get(i).getTitle() %>
							</a>
						
							</td>
							<td align="center"><%=qnaAllList.get(i).getQna_genre() %></td>
							<td align="center"><%=qnaAllList.get(i).getDate() %></td>
						</tr>
						<%}%>
						<%
						} else {
						%>
						<tr id="emptyArea"><td colspan="4" class="tac">검색된 글이 없습니다</td></tr>
						<%
						}
						%>
						</tbody>
						</table>
						</div>
						
					<div class="allsec">
					<a href="NoticeBoardList.not?search=<%=search%>" title="더보기"><span class="more">더보기</span></a>
						
			
					<h3 class="coTitle">공지사항 검색결과</h3>
					<table summary="공지사항" class="customer-table notice">

						<caption>공지사항</caption>
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 50%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
							<col style="width: 7%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" abbr="번호">번호</th>
								<th scope="col" abbr="제목">제목</th>
								<th scope="col" abbr="작성자">작성자</th>
								<th scope="col" abbr="등록일">등록일</th>
							</tr>
						</thead>
						<tbody>
						<%
							if (noticeAllList.size() != 0) {
						%>
							<%
							int noticeAllListS= 6;
	                		if(noticeAllList.size() < 6){
	                			noticeAllListS = noticeAllList.size();
	                		}
								for (int i = 0; i < noticeAllListS; i++) {
							%>
							<tr>
								<td align="center"><%=noticeAllList.get(i).getNum()%></td>
								<td>
								<a href="NoticeBoardDetail.not?num=<%=noticeAllList.get(i).getNum()%>">
										<%=noticeAllList.get(i).getSubject()%></a>
								</td>
								<td align="center"><%=noticeAllList.get(i).getId()%></td>
								<td align="center"><%=noticeAllList.get(i).getDate()%></td>
							</tr>
							<%
								}
							%>
							<%
							} else {
							%><tr id="emptyArea"><td colspan="4" class="tac">검색된 글이 없습니다</td></tr>
							<%
							}
							%>
						</tbody>
					</table>			
					</div>	
			</div>
		</div>
		

</section>

<jsp:include page="../include/footer.jsp" />