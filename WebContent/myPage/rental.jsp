<%@page import="vo.RentalBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<RentalBean> rentalList = (ArrayList<RentalBean>)request.getAttribute("rentalList");
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

            
<!--             <h2 class="coTitle">주문배송조회</h2> -->
            <div class="boxmenu1-top-menu">
				<ul>
					<li class="on"><a href="rentalList.rn"><em>대여내역</em></a></li>
					<li><a href="ReturnedList.rn"><em>과거대여내역</em></a></li>
					<li><a href="ReservationList.rn"><em>예약중인도서</em></a></li>
				</ul>
			</div>
            <div class="customer-contents">
                <div class="customer-inner">
                    <table summary="" class="customer-table notice">
                        <caption></caption>
                        <colgroup>
<!--                          	<col style="width:5%"> -->
                            <col style="width:40%">
                            <col style="width:20%">
                            <col style="width:20%">
                            <col style="width:20%">
                            
                        </colgroup>
                        <thead>
                            <tr>
<!--                             	<th scope="col" abbr=""><input type="checkbox" id="allCheck"></th> -->
                                <th scope="col" abbr="">도서명</th>
                                <th scope="col" abbr="">도착일</th>
                                <th scope="col" abbr="">대여가능기간</th>
                                <th scope="col" abbr="">반납일</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        
                        for(int i=0; i < rentalList.size(); i++ ){ %>
                            <tr>
<!--                                 <td class="tac check_box"> -->
<%--                                 <input type="checkbox" id="checkbox_num" class="check_num" value="<%=rentalList.get(i).getNum()%>" name="inter_num"></td> --%>
                                <td><a href="BookDetail.bok?isbn=<%=rentalList.get(i).getIsbn()%>"><%=rentalList.get(i).getTitle()%></td>
                                <td><%=rentalList.get(i).getS_date()%></td>
                                <td><%=rentalList.get(i).getS_date()%> ~ <%=rentalList.get(i).getOnrental_date()%></td>
                                <td><%=rentalList.get(i).getE_date()%></td>
                            </tr>
                        <%} %>
                        </tbody>
                    </table>
<!--                    <div class="btn_inner"> -->
<!-- 						<a href="javascript:void(0);" -->
<!-- 							onclick="deleteBook(); return false;" class="btn">대여신청취소</a> -->
<!-- 					</div> -->
                    </div>
                    
                    
<!--                     <div class="paging"> -->
<%--                   	<%if(nowPage <= 1) {%> --%>
<!-- 						<a href="rentalList.rn?page=1" class="arr" data-page-num="1"> -->
<!-- 							<img src="images/p-first.png"><span class="hide">처음페이지</span> -->
<!-- 						</a> -->
<%--                          		<a href="rentalList.rn?page=<%=nowPage - 1 %>" class="arr prev" data-page-num="<%=nowPage - 1 %>"> --%>
<!-- 							<img src="images/p-prev.png"><span class="hide">이전페이지</span> -->
<!-- 						</a> -->
<%-- 					<%}%> --%>
<%-- 					<%for(int i = startPage; i <= endPage; i++) {  --%>
<%-- 							if(i == nowPage) { %> --%>
<%-- 								<a href="rentalList.rn?page=<%=i %>" class="on fir" data-page-num="<%=i %>"><%=i %></a> --%>
<%-- 							<%} else { %> --%>
<%-- 								<a href="rentalList.rn?page=<%=i %>" class="" data-page-num="<%=i %>"><%=i %></a> --%>
<%-- 							<%} %> --%>
<%-- 					<%} %> --%>
<%--                    	<%if(nowPage >= maxPage) { %> --%>
<%-- 						<a href="rentalList.rn?page=<%=nowPage + 1 %>" class="arr next" data-page-num="<%=nowPage + 1 %>"> --%>
<!--                         		<img src="images/p-next.png"><span class="hide">다음페이지</span> -->
<!--                        	</a> -->
<%--                        	<a href="rentalList.rn?page=<%=maxPage%>" class="arr"data-page-num="<%=maxPage%>"> --%>
<!--                       		<img src="images/p-last.png"><span class="hide">마지막페이지</span> -->
<!--                    		</a> -->
<%-- 					<%}%>                                 --%>
<!--                    </div> -->
                </div>
            </div>

        </div>
     <script>
     
     //전체체크 해제 
     $('#allCheck').click(function(){
    	 if($('input[id="allCheck"]').prop("checked")){
    	 	$('.check_box input[type="checkbox"]').prop('checked',true);
    	 }else{
    		$('.check_box input[type="checkbox"]').prop('checked',false);
    	 }
     });
     // 삭제하기
     function deleteBook(){
			var confirm_val = confirm("대여신청을 취소 하시겠습니까?");
			
			if(confirm_val) {
				var inter_num = [];
				if ($('.check_box input[type="checkbox"]:checked').length > 0) {
					$('.check_box input[type="checkbox"]:checked').each(function(){
						inter_num.push($(this).attr("value"));  
					});
				}else{
					alert("선택해주시기 바랍니다.");
					return false;	            	
				};	
				var interArr = {"inter_num" :inter_num};
				$.ajax({
					url : "rentalDelete.rn",
					type : "post",
					dataType: 'text',
					data : interArr,
					success : function(){
						location.href = "rentalList.rn";
					},error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }

				});
			} 
	    };
     
     </script>
</section>

<jsp:include page="../include/footer.jsp"/>
