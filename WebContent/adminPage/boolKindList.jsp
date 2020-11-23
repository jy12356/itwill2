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
   
     <div class="contents-wrap">
        <div class="customer">
            <h3 class="coTitle">게시판</h3>
            
            <div class="customer-contents">
                <div class="customer-inner">
                    <table summary="게시판" class="customer-table notice">
                        <caption>게시판</caption>
                        <colgroup>
                            <col style="width:10%">
                            <col style="width:20%">
                            <col style="width:20%">
                            <col style="width:20%">
                            <col style="width:15%">
                            <col style="width:15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col" abbr="제목">
                                	<input type="checkbox" value="">
                                </th>
                                <th scope="col" abbr="등록일">제목</th>
                                <th scope="col" abbr="등록일">작가</th>
                                <th scope="col" abbr="등록일">isbn</th>
                                <th scope="col" abbr="등록일">출판사</th>
                                <th scope="col" abbr="등록일">출간일</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%for(int i=0; i < bookList.size(); i++ ){ %>
                            <tr>
                                <td class="tac"><input type="checkbox" value="<%=bookList.get(i).getNum()%>" name="book_num"></td>
                                <td><%=bookList.get(i).getTitle()%></td>
                                <td><%=bookList.get(i).getAuthor()%></td>
                                <td><%=bookList.get(i).getIsbn()%></td>
                                <td><%=bookList.get(i).getPublisher()%></td>
                                <td><%=bookList.get(i).getPubdate()%></td>
                            </tr>
                        <%} %>
                        </tbody>
                    </table>
                    <div class="btn_inner"> 
                    	<input type="button" class="btn" onclick="deleteBook();" value="삭제하기">
                    	<a href="BookWritePro.bok" class="btn">수정하기</a>
                    </div>
<!--                      href="BookDeletePro.bok"  -->
                    <script type="text/javascript">
                     $(document).ready(function(){
                    	 function deleteBook(){
                    		 var val =$('input:checkbox[id="checkbox_id"]').is(":checked");
                             if(val == true){
                            	 alert(val);
                             }
                              
                             alert(val);
                    	 }
                         
                    	 
                     })
                    
                    </script>
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

        </div>
    </div>

</section>

<jsp:include page="../include/footer.jsp"/>