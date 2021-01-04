<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BookBean"%>
<%
	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	String id = (String) session.getAttribute("id"); 
	ArrayList<BookBean> bookList = (ArrayList<BookBean>)request.getAttribute("bookList");
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
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 책 리스트  </p>
        </div>
    </div>
    <div class="contents-wrap">
        <div class="detail-inner">
            <div class="search-result">
                <h3 class="coTitle">책 리스트 </h3>
               
                <div class="tab">
<!--                     <ul class="tab-list"> -->
<!--                         <li><a href="../sub1/list.html" class="on">전체</a></li> -->
<!--                         <li><a href="../sub1/list_best.html" class="">베스트</a></li> -->
<!--                         <li><a href="../sub1/list_new.html" class="">신간</a></li> -->
<!--                     </ul> -->
                    <div class="list-sort">
                        <div class="k-array">
                            <input type="radio" name="" id="">
                            <label for="" class="radio" id="date_sort" data-sort="pubdate"><span class="radio_on"><em>최신순</em></span></label>
                            <input type="radio" name="" id="">
                            <label for="" class="radio" id="pupular_sort" data-sort="popcount"><span class="radio_off"><em>인기순</em></span></label>
                            <input type="radio" name="" id="">
                            <label for="" class="radio" id="review_sort" data-sort="reviewcount"><span class="radio_off"><em>서평순</em></span></label>
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
                                <li data-pubdate="<%=bookList.get(i).getPubdate()%>" data-popcount="<%=bookList.get(i).getCount()%>" data-reviewcount="<%=bookList.get(i).getReviewCount()%>">
                                	<input type="hidden" class="pudate" value="<%=bookList.get(i).getPubdate()%>">
                                	<input type="hidden" class="pupcount" value="<%=bookList.get(i).getCount()%>">
                                	<input type="hidden" class="reviewCount" value="<%=bookList.get(i).getReviewCount()%>">
                                	<input type="hidden" class="bookstate" value="<%=bookList.get(i).getState()%>">
                                	
                                    <div class="figure">
                                        <a href="BookDetail.bok?booknum=<%=bookList.get(i).getNum()%>&isbn=<%=bookList.get(i).getIsbn()%>&page=<%=nowPage%>&title=<%=bookList.get(i).getTitle() %>">
                                            <span class="rm_br"><img src="bookUpload/<%=bookList.get(i).getImage()%>" alt="도서 이미지" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="BookDetail.bok?booknum=<%=bookList.get(i).getNum()%>&isbn=<%=bookList.get(i).getIsbn()%>&page=<%=nowPage%>&title=<%=bookList.get(i).getTitle() %>"><%=bookList.get(i).getTitle() %></a></p>
                                        <p class="hot-author"><%=bookList.get(i).getAuthor()%><em>|</em><%=bookList.get(i).getPublisher()%><em>|</em>
                                        	
                                        	<%=bookList.get(i).getPubdate()%>
                                        </p>
                                        
                                        <div class="hot-score">
                                            <p>
                                            <%if(bookList.get(i).getStarcount() < 1){ %>
                                            	<span class="list-star rank0"></span>
                                            	
                                            <% }else if(bookList.get(i).getStarcount() < 2){%>
                                            	<span class="list-star rank1"></span>
                                            <%}else if(bookList.get(i).getStarcount() < 3){%>
                                            	<span class="list-star rank2"></span>
                                            <%}else if(bookList.get(i).getStarcount() < 4){%>
                                            	<span class="list-star rank3"></span>
                                         	<%}else if(bookList.get(i).getStarcount() < 5){%>
                                            	<span class="list-star rank4"></span>
                                            <%}else if(bookList.get(i).getStarcount() < 6){%>
                                            	<span class="list-star rank5"></span>
                                           	<%}else if(bookList.get(i).getStarcount() < 7){%>
                                            	<span class="list-star rank6"></span>
                                          	<%}else if(bookList.get(i).getStarcount() < 8){%>
                                            	<span class="list-star rank7"></span>
                                           	<%}else if(bookList.get(i).getStarcount() < 9){%>
                                            	<span class="list-star rank8"></span>
                                            <%}else if(bookList.get(i).getStarcount() < 10){%>
                                            	<span class="list-star rank9"></span>
                                           	<%}else if(bookList.get(i).getStarcount() < 11){%>
                                            	<span class="list-star rank10"></span>
                                            <%} %>
                                            <i>
                                            	<em>
                                            		<%=bookList.get(i).getStarcount()%>.0
                                           		</em> 
                                           		(<%=bookList.get(i).getReviewCount()%>명)
                                           		
                                         	</i>
                                         	<em>|</em>총 <%=bookList.get(i).getCount()%>권</p>
                                            
                                            
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p><%=bookList.get(i).getDescription()%></p>
                                        </div>
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                    		<%if(id != null && id.equals("admin")){ %>
                            <div class="btn_inner">
								<a href="BookWriteForm.bok" class="btn">글쓰기</a>
							</div>
							<%} %>
                            <div class="paging">
                            	<%if(nowPage <=1) {%>
									<a href="BookAllList.bok?catg1=<%=catg1%>&catg2=<%=catg2%>&page=1" class="arr" data-page-num="1">
										<img src="images/p-first.png"><span class="hide">처음페이지</span>
									</a>
                            		<a href="BookAllList.bok?catg1=<%=catg1%>&catg2=<%=catg2%>&page=<%=nowPage - 1 %>" class="arr prev" data-page-num="1">
										<img src="images/p-prev.png"><span class="hide">이전페이지</span>
									</a>
								<%}%>
								<%for(int i = startPage; i <= endPage; i++) { 
										if(i == nowPage) { %>
											<a href="BookAllListbok?catg1=<%=catg1%>&catg2=<%=catg2%>&page=<%=i%>" class="on fir" data-page-num="<%=i%>"><%=i%></a>
										<%} else { %>
											<a href="BookAllList.bok?catg1=<%=catg1%>&catg2=<%=catg2%>&page=<%=i%>" class="" data-page-num="<%=i%>"><%=i%></a>
										<%} %>
								<%} %>
                            	<%if(nowPage >= maxPage) { %>
									<a href="BookAllList.bok?catg1=<%=catg1%>&catg2=<%=catg2%>&page=<%=nowPage + 1%>" class="arr next" data-page-num="11">
	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span>
	                            	</a>
	                            	<a href="BookAllList.bok?catg1=<%=catg1%>&catg2=<%=catg2%>&page=<%=maxPage%>" class="arr" data-page-num="781">
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
<!--                             	<li>검색된 도서가 없습니다.</li> -->
									<li><img class="nodate" alt="" src="images/nodata.jpg"></li>
                            </ul>
                    	</div>
                    	<%if(id != null && id.equals("admin")){ %>
	                   	<div class="btn_inner">
								<a href="BookWriteForm.bok" class="btn">글쓰기</a>
						</div>
						<%} %>
                    </div>
					<%
					}
					%>
                </div>
                <script>
                	$(function() {
                    	
                    	// 리스트 보기 방식 변경
                    	$("#date_sort, #pupular_sort, #review_sort").click(function(){
                    		$(".list-sort .radio span").removeClass("radio_on");
	                        $(".list-sort .radio span").addClass("radio_off");
	                        $(this).children().removeClass("radio_off");
	                        $(this).children().addClass("radio_on");
                    		var sort = $(this).data("sort"); //data-이름 
                    		listSort($(this), sort);
                    	});
                    	function listSort($targetObj, sort){
                    		//정렬하고자 하는 목록에 대해 sort 해서 다시 html로 뿌려주는 부분.
                    		$(".book-list").html(
                    			$(".book-list li").sort(function(a, b){
                    				//날짜는 - 가 있기때문에 비교시 제거 
                    				if(sort == "pubdate"){
                    					a = $(a).data(sort).replace(/-/gi,"");
                    					b = $(b).data(sort).replace(/-/gi,"");
	                    				return b-a;//내림차순 
                    				}else{
	                    				return $(b).data(sort) - $(a).data(sort);//내림차순 
    	                	            //return $(a).data(dataNm) - $(b).data(dataNm); //오름차순             					
                    				}
                    			})
                    		);
                    	}
                    	//전체 대여 바뀌면 보이는 값 바뀌기 
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
                        //대여가능한 리스트만 띄우기 
                        $(document).on("click", ".arrayBox ul li a", function() {
                            var text = $(this).text();
                            $(this).parent().parent().find("li a").removeClass("on");
                            $(this).parent().parent().hide();
                            $(this).addClass("on");
                            $(this).parent().parent().prev().text(text);                            
                            var bookListli = $(".book-list li");
                           	if($(this).data("list-type")=="대여"){
                           		for(i=0; i< bookListli.length; i++){
                           			if(bookListli.eq(i).children('.bookstate').val() != 0){
                           				bookListli.eq(i).hide();
                           			}                           			
                           		}
                           		return 	
                           	}else{
                           		for(i=0; i< bookListli.length; i++){
                           			bookListli.eq(i).show();                           			
                           		}
                           	}                           
                        });
                    });
                </script>
            </div>
        </div>
    </div>

</section>

<jsp:include page="../include/footer.jsp"/>