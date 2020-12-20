<%@page import="vo.PageInfo"%>
<%@page import="vo.QnaBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../include/header.jsp"/>
<%
	// BoardBean 객체 파라미터 가져오기
	QnaBean article = (QnaBean)request.getAttribute("article");
	String id = (String)session.getAttribute("id");	
	// 1. BoardDetailAction 에서 request.setAttribute() 메서드로 저장했을 경우
	// 	String nowPage = (String)request.getAttribute("page");

	// 2. 서블릿 주소로 전달된 page 값을 파라미터 그대로 사용할 경우
	String nowPage = request.getParameter("page");
%>
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>
				HOME > 고객센터 > 1:1문의
			</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="customer">
			<h3 class="coTitle">1:1문의</h3>
			<div class="boxmenu1-top-menu">
			<ul>
				<li class="on"><a href="QnaList.qna"><em>1:1문의</em></a></li>
				<li><a href="../customer.asp?page=faq"><em>FAQ</em></a></li>
				<li><a href="NoticeBoardList.not?page=1"><em>공지사항</em></a></li>
			</ul>
		</div>
			<div class="customer-contents">
				<div class="customer-inner">
					<div class="customer-contents">
						<div class="customer-use-wrap">
							<ul class="customer-s-menu one">
								<li><a href="QnaWriteForm.qna" class="">1:1 문의하기</a></li>
								<li><a href="QnaList.qna" class="on">문의 내역 확인</a></li>
							</ul>
							
			
							<table class="onebyone customer-notice" summary="1:1 문의">
						
							<caption>1:1 문의하기</caption>
							<colgroup>
							<col width="100px">
							<col width="*">
							</colgroup>
							<tbody>
<!-- 							<input type="hidden" id="board_num" name="board_num" value=""/> -->
							<tr>
								<th>
									문의제목
								</th>
								<td align="center"><%=article.getTitle() %></td>
							</tr>
							<tr>
								<th>
									문의유형
								</th>
									<td align="center">오류문의 &gt;<%=article.getQna_genre() %>
									</td>
							</tr>
							<tr>
								<th>
									문의내용
								</th>
								<td align="center"><%=article.getContent() %></td>
							</tr>
							<tr>
								<th>
									답변내용
								</th>
								<%if(article.getContent2() == null){%>
									<td align="center"></td>
								<% }else{%>
									<td align="center"><%=article.getContent2() %></td>
									<% }%>
							</tr>
							</tbody>
							</table>
							<%if(article.getContent2() == null){%>
								<%if(id.equals("admin")){ %>
									<div class="btn_inner">
								<input type="button" class="btn" value="수정" onclick="location.href='QnaModifyForm.qna?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>'">
								<input type="button" class="vs1Del btn" value="삭제" onclick="location.href='QnaDeletePro.qna?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>'">
								<input type="button" class="btn" value="목록" onclick="location.href='QnaList.qna?page=<%=nowPage%>'">
								<input type="button" class="btn" value="답변" onclick="location.href='QnaReplyForm.qna?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>'">
									</div>
								<%}else{ %>
									<div class="btn_inner">
								<input type="button" class="btn" value="수정" onclick="location.href='QnaModifyForm.qna?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>'">
								<input type="button" class="vs1Del btn" value="삭제" onclick="location.href='QnaDeletePro.qna?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>'">
								<input type="button" class="btn" value="목록" onclick="location.href='QnaList.qna?page=<%=nowPage%>'">
									</div>
								<%} %>
							<%}else if(id.equals("admin")){ %>
									<div class="btn_inner">
								<input type="button" class="btn" value="수정" onclick="location.href='QnaModifyForm.qna?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>'">
								<input type="button" class="vs1Del btn" value="삭제" onclick="location.href='QnaDeletePro.qna?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>'">
								<input type="button" class="btn" value="목록" onclick="location.href='QnaList.qna?page=<%=nowPage%>'">
									</div>
							<%}else{ %>
									<div class="btn_inner">
								<input type="button" class="btn" value="목록" onclick="location.href='QnaList.qna?page=<%=nowPage%>'">
									</div>
							<%}%>
						</div>
					</div>
				</div>
			</div>
			<script>
		$(function(){
			$(".vs1Del").on("click",function(){		
				var msg_num = $(this).data("num");
				$.post("/data/_vs1del.asp", {num : msg_num}, function(data){					
					if(data.success){
						alert('삭제되었습니다.');
						location.href = "/customer.asp?page=vs1&page2=list";
					}else{
						alert(data.message);
					}				
				}, "json");			
			});
		});
			</script>
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp"/>