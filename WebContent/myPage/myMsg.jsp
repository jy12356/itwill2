<%@page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.MsgBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id= (String)session.getAttribute("id");
	ArrayList<MsgBean> myMsgList = (ArrayList<MsgBean>) request.getAttribute("msgList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();

%>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>HOME &gt; 마이페이지</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="mypage">
			<div class="mypage-top">
				<div class="detail-inner">
					<h3>마이페이지</h3>
					
					<div class="mypage-box-bottom">
						<div>
							<ul>
								<li>
									<span class="kakaotalk">로그인정보</span> <!-- bookcube,kakaotalk,naver,twitter,facebook,payco-->
									<p><span><%=id %> 님</span></p>
								<a href="MemberModifyForm.me?id=<%=id %>" class="btn">회원정보</a>
								</li>			
								<li>
									<h4>구매관리</h4>
									<ul>
										<li><a href="ChargeList2.dok" class="">나의이용권</a></li>
										<li><a href="rentalList.rn" class="">대여목록</a></li>
										<li><a href="MyBasketList.bk" class="">책바구니</a></li>
										<li><a href="BookDibsList.bok" class="">찜바구니</a></li>
									</ul>
								</li>
								<li>
									<h4>나의 활동</h4>
									<ul>
										<li><a href="/mypage.asp?list=_review" class="">서평/댓글</a></li>
										<li><a href="/mypage.asp?list=_prefer" class="">희망도서</a></li>
										<li><a href="/mypage.asp?list=_prefer" class="">게시글</a></li>
										<li><a href="/mypage.asp?list=_prefer" class="">QnA</a></li>
									</ul>
								</li>
							</ul>
						</div>
						
					</div>
				</div>
			</div>
			
			<div class="mypage-bottom mb60"> 
				<h3 class="coTitle">내 메세지</h3>
               	<div class="customer-contents">
	                <div class="customer-inner">
						<table summary="내 메세지" class="customer-table notice swiper-container-vertical">
				            <caption>내 메세지</caption>
				            <colgroup>
				                <col style="width:10%">
				                <col style="width:50%">
				                <col style="width:20%">
				                <col style="width:20%">
				              </colgroup>
				              <thead>
				                  <tr>
				                      <th scope="col" abbr="번호"><input type="checkbox" id="allCheck"></th>
				                      <th scope="col" abbr="내용">내용</th>
				                      <th scope="col" abbr="읽음표시">읽음표시</th>
				                      <th scope="col" abbr="날짜">날짜</th>
				                  </tr>
				              </thead>
				              <tbody>
				              	<%if(myMsgList !=null && listCount >0){ %>
				              	<%for(int i=0; i < myMsgList.size(); i++){ %>
		              			  <tr>
		                      		<td><input type="checkbox" value="<%=myMsgList.get(i).getNum() %>" name="num" class="checkbox"></td>
									<td>
										<a class="content" href=MyMsgDetail.msg?num=<%=myMsgList.get(i).getNum()%>"><%=myMsgList.get(i).getContent() %></a>
								    </td>
		                  			<td>
		                  			<%if(myMsgList.get(i).getIsRead().equals("y")){ %>
		                  				읽음
		                  			<%}else{ %>
		                  				읽지않음
		                  			<%} %>	
		                  			</td>
		                  			<td><%=myMsgList.get(i).getDate()%></td>
		                 		</tr>
				              			
				              <%}
				              }else{ %>
		              			  <tr>
	                      			<td colspan="4" class="tac">도착한 메세지가 없습니다.</td>
		                 		  </tr>
				              			
				              <%} %>
				              
				              </tbody>
				          </table>
				           <div class="btn_inner"> 
	                    		<a href="javascript:void(0);" onclick="deleteMsg(); return false;"class="btn">삭제하기</a>
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
    	
     
//     다중삭제
	   	function deleteMsg(){
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			
			if(confirm_val) {
				var msgNum = [];
				if ($('.check_box input[type="checkbox"]:checked').length > 0) {
					$('.check_box input[type="checkbox"]:checked').each(function(){
						msgNum.push($(this).attr("value"));  
					});
				}else{
					alert("게시물을 선택해주시길 바랍니다.");
					return false;	            	
				};	
				var msgNumArr = {"inter_num" :msgNum};
				$.ajax({
					url : "MyMsgDel.msg",
					type : "post",
					dataType: 'text',
					data : msgNumArr,
					success : function(data){
						if(data == "성공"){
							location.href = "MyMsg.msg";
						}else{
							alert("메세지 삭제 실패하였습니다.");
							return false;
						}
					},error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }

				});
			} 
	    };
    	
	</script>
<!-- 	<script> -->
<!-- // 		$(function(){ -->
<!-- // 			$(".v-btn").on("click",function(){ -->
<!-- // 				var fname = $(this).data("fname"); -->
<!-- // 				$(".my-frame").css("visibility","hidden"); -->
<!-- // 				$(".my-frame."+ fname).css("visibility","visible");	 -->
<!-- // 				return false; -->
<!-- // 			});	 -->
<!-- // 			$(".mpop-close").on("click",function(){ -->
<!-- // 				$(this).parent().parent().parent().css("visibility","hidden"); -->
<!-- // 				return false; -->
<!-- // 			}); -->
<!-- // 		}); -->
<!-- 	</script> -->
</section>
<jsp:include page="../include/footer.jsp"/>