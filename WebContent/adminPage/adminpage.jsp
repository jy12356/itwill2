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
				<iframe src="BookList.bok" width="100%" frameborder="0" name="mypageList" id="mypageList" scrolling="no" style="height: 688px;"></iframe>					
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