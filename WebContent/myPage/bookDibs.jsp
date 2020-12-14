<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<%@page import="vo.BookInterestBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%
	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	ArrayList<BookInterestBean> bookListDibsList = (ArrayList<BookInterestBean>)request.getAttribute("bookListDibsList");
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
            <h3 class="coTitle">내가 찜한 리스트</h3>
            
            <div class="customer-contents">
                <div class="customer-inner">
                    <table summary="내가 찜한 리스트" class="customer-table notice">
                        <caption>내가 찜한 리스트</caption>
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:25%">
                            <col style="width:10%">
                            <col style="width:15%">
                            <col style="width:15%">
                            <col style="width:10%">
                            <col style="width:10%">
                            <col style="width:10%">
                            
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col" abbr="책번호"><input type="checkbox" id="allCheck"></th>
                                <th scope="col" abbr="제목">제목</th>
                                <th scope="col" abbr="작가">작가</th>
                                <th scope="col" abbr="isbn">isbn</th>
                                <th scope="col" abbr="출판사">출판사</th>
                                <th scope="col" abbr="출판일">출판일</th>
                                <th scope="col" abbr="상태">상태</th>
                                <th scope="col" abbr="책바구니">책바구니</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        <%for(int i=0; i < bookListDibsList.size(); i++ ){ %>
                            <tr>
                                <td class="tac check_box"><input type="checkbox" id="checkbox_num" class="check_num" value="<%=bookListDibsList.get(i).getNum()%>" name="inter_num"></td>
                                <td><p class="title"><a href="BookDetail.bok?isbn=<%=bookListDibsList.get(i).getIsbn()%>"><%=bookListDibsList.get(i).getTitle()%></a></p></td>
                                <td><p class="autor"><%=bookListDibsList.get(i).getAuthor()%></p></td>
                                <td><%=bookListDibsList.get(i).getIsbn()%></td>
                                <td><p class="publisher"><%=bookListDibsList.get(i).getPublisher()%></p></td>
                                <td><%=bookListDibsList.get(i).getPubdate()%></td>
                                <td><%=bookListDibsList.get(i).getState()%></td>
                                <td class="book_basketbtn">
                                	<%if(bookListDibsList.get(i).getState().equals("대여가능")){%>
				                    	<a href="MyBasketInsert.bk?isbn=<%=bookListDibsList.get(i).getIsbn()%>" class="btn">책바구니</a>					               
                                	<%}else{%>
                                		대여불가능
                                	<%} %>
                                	
                               	</td>
                            </tr>
                        <%} %>
                        </tbody>
                    </table>
                    <div class="btn_inner"> 
                    	<a href="javascript:void(0);" onclick="deleteBook(); return false;"class="btn">삭제하기</a>
                    	<!-- <a href="javascript:void(0);" class="btn delbtn">삭제하기</a> -->
                    	
                    </div>
                    
                    <div class="paging">
                  	<%if(nowPage <= 1) {%>
						<a href="BookDibsList.bok?page=1" class="arr" data-page-num="1">
							<img src="images/p-first.png"><span class="hide">처음페이지</span>
						</a>
                         		<a href="BookDibsList.bok?page=<%=nowPage - 1 %>" class="arr prev" data-page-num="<%=nowPage - 1 %>">
							<img src="images/p-prev.png"><span class="hide">이전페이지</span>
						</a>
					<%}%>
					<%for(int i = startPage; i <= endPage; i++) { 
							if(i == nowPage) { %>
								<a href="BookDibsList.bok?page=<%=i %>" class="on fir" data-page-num="<%=i %>"><%=i %></a>
							<%} else { %>
								<a href="BookDibsList.bok?page=<%=i %>" class="" data-page-num="<%=i %>"><%=i %></a>
							<%} %>
					<%} %>
                   	<%if(nowPage >= maxPage) { %>
						<a href="BookDibsList.bok?page=<%=nowPage + 1 %>" class="arr next" data-page-num="<%=nowPage + 1 %>">
                        		<img src="images/p-next.png"><span class="hide">다음페이지</span>
                       	</a>
                       	<a href="BookDibsList.bok?page=<%=maxPage%>" class="arr"data-page-num="<%=maxPage%>">
                      		<img src="images/p-last.png"><span class="hide">마지막페이지</span>
                   		</a>
					<%}%>                                
                   </div>
                </div>
            </div>

        </div>
    </div>
     
     <script>
     
     //전체체크 
     $('#allCheck').click(function(){
    	 if($('input[id="allCheck"]').prop("checked")){
    	 	$('.check_box input[type="checkbox"]').prop('checked',true);
    	 }else{
    		$('.check_box input[type="checkbox"]').prop('checked',false);
    	 }
     });
    	
     
//     다중삭제
	   	function deleteBook(){
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			
			if(confirm_val) {
				var inter_num = [];
				if ($('.check_box input[type="checkbox"]:checked').length > 0) {
					$('.check_box input[type="checkbox"]:checked').each(function(){
						inter_num.push($(this).attr("value"));  
					});
				}else{
					alert("게시물을 선택해주시길 바랍니다.");
					return false;	            	
				};	
				var interArr = {"inter_num" :inter_num};
				$.ajax({
					url : "BookDibsDelete.bok",
					type : "post",
					dataType: 'text',
					data : interArr,
					success : function(){
						location.href = "BookDibsList.bok";
					},error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }

				});
			} 
	    };
    	
	</script>
</section>

<jsp:include page="../include/footer.jsp"/>
