<%@page import="vo.BookBean"%>
<%@page import="vo.BookInterestBean"%>
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
            <h3 class="coTitle">반납 도서</h3>
            
            <div class="customer-contents">
                <div class="customer-inner">
                    <table summary="내가 찜한 리스트" class="customer-table notice">
                        <caption>반납 도서</caption>
                        <colgroup>
                         	<col style="width:5%">
                            <col style="width:10%">
                            <col style="width:40%">
                            <col style="width:25%">
                            <col style="width:10%">
                            <col style="width:10%">
                            
                        </colgroup>
                        <thead>
                            <tr>
                            	<th scope="col" abbr=""><input type="checkbox" id="allCheck"></th>
                                <th scope="col" abbr="">id</th>
                                <th scope="col" abbr="">도서명</th>
                                <th scope="col" abbr="">대여가능기간</th>
                                <th scope="col" abbr="">반납일</th>
                                <th scope="col" abbr="상태">상태</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%for(int i=0; i < rentalList.size(); i++ ){
                        	%>
                            <tr>
                                <td class="tac check_box">
                                <input type="checkbox" id="checkbox_num" class="check_num" value="<%=rentalList.get(i).getNum()%>" name="inter_num"></td>
                                <td><%=rentalList.get(i).getId()%></td>
                                <td><%=rentalList.get(i).getTitle()%></td>
                                <td><%=rentalList.get(i).getS_date()%> ~ <%=rentalList.get(i).getOnrental_date()%></td>
                                <td><%=rentalList.get(i).getE_date()%></td>
                                <td class="book_basketbtn">
                                <form method="post" action="ReturnedInsert.rt">
                                <input type="hidden" value="반납" id="state" name="state">
                                <input type="hidden" value="<%=rentalList.get(i).getIsbn()%>" id="isbn" name="isbn">
                                <input type="hidden" value="<%=rentalList.get(i).getNum()%>" id="num" name="num">
                                <input type="hidden" value="<%=rentalList.get(i).getId()%>" id="id" name="id">
                                <input type="hidden" value="<%=rentalList.get(i).getTitle()%>" id="title" name="title">
                                <input type="hidden" value="<%=rentalList.get(i).getS_date()%>" id="s_date" name="s_date">
                                <input type="hidden" value="<%=rentalList.get(i).getOnrental_date()%>" id="onrental_date" name="onrental_date">
                                <input type="hidden" value="<%=rentalList.get(i).getE_date()%>" id="e_date" name="e_date">
			                    <input type="submit" onclick="ccCheck()" class="btn" value="반납하기">
							<script>
							function ccCheck(){
								var u = alert("반납하시겠습니까?");
							}</script>
			                    </form>                             	
                               	</td>
                            </tr>
                        <%} %>
                        </tbody>
                        
                    </table>
                  <div class="btn_inner"> 
                    	<a href="javascript:void(0);" onclick="deleteBook(); return false;"class="btn">삭제하기</a>
                    	<!-- <a href="javascript:void(0);" class="btn delbtn">삭제하기</a> -->
                    	
                    </div>
                    </div>
                    
                    <div class="paging">
                  	 <%if(nowPage <= 1) {%>
			<input type="button" value="이전" class = "on fir">
	<%} else {%>
			<input type="button" value="이전" onclick="location.href='Return.rn?page=<%=nowPage - 1 %>'" class = "on fir">
	<%} %>
	
	<%for(int i = startPage; i <= endPage; i++) { 
			if(i == nowPage) { %>
				<a href="Return.rn?page=<%=i %>" class = "on fir" data-page-num="1"><%=i %>&nbsp;</a>
			<%} else { %>
					<a href="Return.rn?page=<%=i %>" class = "on fir">[<%=i %>]</a>&nbsp;
			<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) { %>
			<input type="button" value="다음" class = "on fir">
	<%} else { %>
			<input type="button" value="다음" onclick="location.href='Return.rn?page=<%=nowPage + 1 %>'" class = "on fir">
	<%} %>                              
                   </div>
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
			var confirm_val = confirm("도서를 삭제하시겠습니까?");
			
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
						location.href = "Return.rn";
					},error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }

				});
			} 
	    };
     
     </script>
</section>

<jsp:include page="../include/footer.jsp"/>
