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
				                      <th scope="col" abbr="번호">번호</th>
				                      <th scope="col" abbr="내용">내용</th>
				                      <th scope="col" abbr="읽음표시">읽음표시</th>
				                      <th scope="col" abbr="날짜">날짜</th>
				                  </tr>
				              </thead>
				              <tbody>
				              	<%if(myMsgList !=null && listCount >0){ %>
				              	<%for(int i=0; i < myMsgList.size(); i++){ %>
		              			  <tr>
		                      		<td><%=myMsgList.get(i).getNum() %></td>
									<td>
										<p class="content"><%=myMsgList.get(i).getContent() %></p>
								    </td>
		                  			<td>
		                  			<%if(myMsgList.get(i).getIsRead().equals("y"){ %>
		                  				읽음
		                  			<%}else{ %>
		                  				읽지않음
		                  			<%} %>	
		                  			</td>
		                  			<td><%=myMsgList.get(i).getDate() %></td>
		                 		</tr>
				              			
				              <%}
				              }else{ %>
		              			  <tr>
	                      			<td colspan="4" class="tac">도착한 메세지가 없습니다.</td>
		                 		  </tr>
				              			
				              <%} %>
				              
				              </tbody>
				          </table>
					</div>
				</div>
			</div>
		</div>				
	</div>
	<script>
		$(function(){
			$(".v-btn").on("click",function(){
				var fname = $(this).data("fname");
				$(".my-frame").css("visibility","hidden");
				$(".my-frame."+ fname).css("visibility","visible");	
				return false;
			});	
			$(".mpop-close").on("click",function(){
				$(this).parent().parent().parent().css("visibility","hidden");
				return false;
			});
		});
	</script>
</section>
<jsp:include page="../include/footer.jsp"/>