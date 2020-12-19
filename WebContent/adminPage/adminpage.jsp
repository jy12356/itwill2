<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id= (String)session.getAttribute("id");

%>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>HOME &gt; 관리자페이지</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="mypage">
			<div class="mypage-top">
				<div class="detail-inner">
					<h3>관리자페이지</h3>
					
					<div class="mypage-box-bottom">
						<div>
							<ul>
								<li>
									<span class="kakaotalk">로그인정보</span> <!-- bookcube,kakaotalk,naver,twitter,facebook,payco-->
									<p><span><%=id %> 님</span></p>
								<a href="MemberModifyForm.me?id=<%=id %>" class="btn">회원정보</a>
								</li>			
								<li>
									<h4>회원관리</h4>
									<ul>
										<li><a href="/mypage.asp?list=_orderbooklist" class="">회원목록</a></li>
										<li><a href="BookDibsList.bok" class="">대출관리</a></li>
										<li><a href="MyBasketList.bk" class="">책바구니</a></li>
										<li><a href="/mypage.asp?list=_orderlist" class="">대여목록</a></li>
									</ul>
								</li>
								<li>
									<h4>책정보 관리 </h4>
									<ul>
										<li><a href="BookWriteForm.bok" class="">책등록</a></li>
										<li><a href="RequestList.rq" class="">희망도서</a></li>
										<li><a href="NoticeBoardList.not?page=1" class="">게시글</a></li>
										<li><a href="/mypage.asp?list=_prefer" class="">QnA</a></li>
									</ul>
								</li>
							</ul>
						</div>
						
					</div>
				</div>
			</div>
			<div class="mypage-bottom">
				   <div class="contents-wrap">
				        <div class="customer">
				            <h3 class="coTitle">게시판</h3>
				            
				            <div class="customer-contents">
				                <div class="customer-inner">
				                    <table summary="게시판" class="customer-table notice">
				                        <caption>게시판</caption>
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
											<tr>
												<td class="tac">28</td>
												<td><a href="">test</a></td>
												<td align="center">test</td>
												<td align="center">2020-12-18</td>
												<td align="center">1</td>
											</tr>										
										</tbody>
				                    </table>
				                    <div class="btn_inner"> 
				                    	<a href="board_write.jsp" class="btn">글쓰기</a>
				                    </div>
				                    <div class="paging">
				                        <a href="/customer.asp?page=notice&pageNum=1" class="arr" data-page-num="1"><img src="images/p-first.png"><span class="hide">처음페이지</span></a>
				                        <a href="/customer.asp?page=notice&pageNum=1" class="arr prev" data-page-num="1"><img src="images/p-prev.png"><span class="hide">이전페이지</span></a>
				                        <a href="/customer.asp?page=notice&pageNum=1" class="on fir" data-page-num="1">1</a>
				                        <!-- 	<a href="/customer.asp?page=notice&pageNum=2" class="" data-page-num="2">2</a><a href="/customer.asp?page=notice&pageNum=3" class="" data-page-num="3">3</a><a href="/customer.asp?page=notice&pageNum=4" class="" data-page-num="4">4</a><a href="/customer.asp?page=notice&pageNum=5" class="" data-page-num="5">5</a><a href="/customer.asp?page=notice&pageNum=6" class="" data-page-num="6">6</a><a href="/customer.asp?page=notice&pageNum=7" class="" data-page-num="7">7</a><a href="/customer.asp?page=notice&pageNum=8" class="" data-page-num="8">8</a><a href="/customer.asp?page=notice&pageNum=9" class="" data-page-num="9">9</a><a href="/customer.asp?page=notice&pageNum=10" class="" data-page-num="10">10</a> -->
				                        <a href="/customer.asp?page=notice&pageNum=11" class="arr next" data-page-num="11">
				                            <img src="images/p-next.png"><span class="hide">다음페이지</span>
				                        </a>
				                        <a href="/customer.asp?page=notice&pageNum=27" class="arr" data-page-num="27"><img src="images/p-last.png"><span class="hide">마지막페이지</span></a>
				                    </div>
				                </div>
				            </div>
				
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