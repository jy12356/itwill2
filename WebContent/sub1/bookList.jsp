<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%
	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	ArrayList<BookBean> bookList = (ArrayList<BookBean>)request.getAttribute("bookList");
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
            <p>HOME > 문학</p>
        </div>
    </div>
    <div class="contents-wrap">
        <div class="detail-inner">
            <div class="search-result">
                <h3 class="coTitle">소설</h3>
                <div class="field">
                    <ul class="field-list">
                        <li><a href="/categorylist.asp?mainclass_num=00" class="on">전체</a></li>
                        <li><a href="/categorylist.asp?mainclass_num=00&subclass_num=00" class="">소설</a></li>
                        <li><a href="/categorylist.asp?mainclass_num=00&subclass_num=01" class="">에세이</a></li>
                        <li><a href="/categorylist.asp?mainclass_num=00&subclass_num=02" class="">여행</a></li>
                        <li><a href="/categorylist.asp?mainclass_num=00&subclass_num=03" class="">시</a></li>
                    </ul>

                    <div class="main_event"></div>
                </div>
                <div class="tab">
                    <ul class="tab-list">
                        <li><a href="../sub1/list.html" class="on">전체</a></li>
                        <li><a href="../sub1/list_best.html" class="">베스트</a></li>
                        <li><a href="../sub1/list_new.html" class="">신간</a></li>
                        <li><a href="../sub1/list_free.html" class="">무료</a></li>
                    </ul>
                    <div class="list-sort">
                        <div class="k-array">
                            <input type="radio" name="" id="">
                            <label for="" class="radio" data-sort="최신순"><span class="radio_on"><em>최신순</em></span></label>
                            <input type="radio" name="" id="">
                            <label for="" class="radio" data-sort="인기순"><span class="radio_off"><em>인기순</em></span></label>
                            <input type="radio" name="" id="">
                            <label for="" class="radio" data-sort="서평순"><span class="radio_off"><em>서평순</em></span></label>
                            <input type="radio" name="" id="">
                            <label for="" class="radio" data-sort="가격순"><span class="radio_off"><em>낮은가격순</em></span></label>
                        </div>
                        <div class="view-array">
                            <div class="arrayBox">
                                <a href="javascript:;" class="s-result" title="해당 리스트 정렬">전체</a>
                                <ul>
                                    <li><a href="#" data-list-type="" class="on">전체</a><span></span></li>
                                    <li><a href="#" data-list-type="대여" class="">대여</a><span></span></li>
                                </ul>
                            </div>
                            <div class="view-select">
                                <ul>
                                    <li class="list"><a href="javascript:;" class="on">리스트보기</a></li>
                                    <li class="thum"><a href="javascript:;" class="">썸네일보기</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%
						if(bookList != null && listCount > 0) {
					%>
                    <div class="list-page">
                        <div class="list">
                            <!-- *****list thum 클래스 차이로 리스트보기와 썸네일 보기로 변경됩니다.*****-->
                            <ul class="book-list">
                           	
                            	<%
									for(int i = 0; i < bookList.size(); i++) {
								%>
                                <li>
                                    <div class="figure">
                                        <a href="BookDetail.bok?isbn=<%=bookList.get(i).getIsbn()%>&page=<%=nowPage%>&title=<%=bookList.get(i).getTitle() %>">
                                            <span class="rm_br"><img src="bookUpload/<%=bookList.get(i).getImage()%>" alt="도서 이미지 - 식스센스" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="BookDetail.bok?isbn=<%=bookList.get(i).getIsbn()%>&page=<%=nowPage%>&title=<%=bookList.get(i).getTitle() %>"><%=bookList.get(i).getTitle() %></a></p>
                                        <p class="hot-author"><%=bookList.get(i).getAuthor()%><em>|</em><%=bookList.get(i).getPublisher()%><em>|</em><%=bookList.get(i).getPubdate()%></p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 <%=bookList.get(i).getCount()%>권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p><%=bookList.get(i).getDescription()%></p>
                                        </div>
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                            <div class="btn_inner">
								<a href="BookWriteForm.bok" class="btn">글쓰기</a>
							</div>
                            <div class="paging">
                            	<%if(nowPage <= 1) {%>
									<a href="BoardList.bok?page=1" class="arr" data-page-num="1">
										<img src="images/p-first.png"><span class="hide">처음페이지</span>
									</a>
                            		<a href="BoardList.bok?page=<%=nowPage - 1 %>" class="arr prev" data-page-num="1">
										<img src="images/p-prev.png"><span class="hide">이전페이지</span>
									</a>
								<%}%>
								<%for(int i = startPage; i <= endPage; i++) { 
										if(i == nowPage) { %>
											<a href="BoardList.bok?page=<%=i %>" class="on fir" data-page-num="<%=i %>"><%=i %></a>
										<%} else { %>
											<a href="BoardList.bok?page=<%=i %>" class="" data-page-num="<%=i %>"><%=i %></a>
										<%} %>
								<%} %>
                            	<%if(nowPage >= maxPage) { %>
									<a href="BoardList.bok?page=<%=nowPage + 1 %>" class="arr next" data-page-num="11">
	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span>
	                            	</a>
	                            	<a href="BoardList.bok?page=<%=maxPage%>" class="arr" data-page-num="781">
                                		<img src="images/p-last.png"><span class="hide">마지막페이지</span>
                               		</a>
								<%}%>                                
                            </div>
                        </div>
                    </div>
                    <%}else {
					%>
					<div class="list-page">
                        <div class="list">
                            <ul class="book-list">
                            	<li>등록된 도서가 없습니다.</li>
                            </ul>
                    	</div>
	                   	<div class="btn_inner">
								<a href="BookWriteForm.bok" class="btn">글쓰기</a>
						</div>
                    </div>
					<%
					}
					%>
                </div>
                <script>
                    // 리스트 보기 방식 변경
                    $(function() {
                        $(".view-select ul li a").on("click", function() {
                            var cls = $(this).parent().attr("class");
                            $(".view-select ul li a").removeClass("on");
                            $(this).addClass("on");
                            $(".list-page > div").attr("class", cls);
                            $.cookie("viewType", cls);
                        });
                        $(".s-result").on("click focus", function() {
                            $(this).next().show();
                        });
                        $(document).on("click", ".arrayBox ul li a", function() {
                            var text = $(this).text();
                            $(this).parent().parent().find("li a").removeClass("on");
                            $(this).parent().parent().hide();
                            $(this).addClass("on");
                            $(this).parent().parent().prev().text(text);

                            goUrl('/categorylist.asp?page=' + $(".wrap").data("page") + '&mainclass_num=' + $(".wrap").data("mainclass-num") + '&subclass_num=' + $(".wrap").data("subclass-num") + '&sort=' + $(".wrap").data("sort") + '&list_type=' + $(this).data("list-type"));
                            return false;
                        });
                    });
                </script>
            </div>
        </div>
    </div>

</section>

<jsp:include page="../include/footer.jsp"/>