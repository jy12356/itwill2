<%@page import="vo.PageInfo"%>
<%@page import="vo.QnaBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../include/header.jsp"/>
<%
	// BoardBean 객체 파라미터 가져오기
	QnaBean article = (QnaBean)request.getAttribute("article");
// 	int board_num = Integer.parseInt(request.getParameter("board_num"));
	// 1. BoardDetailAction 에서 request.setAttribute() 메서드로 저장했을 경우
	// 	String nowPage = (String)request.getAttribute("page");

	// 2. 서블릿 주소로 전달된 page 값을 파라미터 그대로 사용할 경우
	String nowPage = request.getParameter("page");
%>
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>
				HOME > 고객센터
			</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="customer">
			<h3 class="coTitle">고객센터</h3>
			<div class="customer-top-menu">
				<!-- 					<ul> -->
				<!-- 						<li><a href="/customer.asp?page=faq" class=""><em>FAQ</em></a></li> -->
				<!-- 						<li><a href="/customer.asp?page=notice" class=""><em>공지사항</em></a></li> -->
				<!-- 						<li><a href="/customer.asp?page=viewer" class=""><em>뷰어 이용안내</em></a></li> -->
				<!-- 						<li><a href="/customer.asp?page=service" class=""><em>서비스 안내</em></a></li> -->
				<!-- 						<li><a href="/customer.asp?page=vs1" class="on"><em>1:1문의</em></a></li> -->
				<!-- 					</ul> -->
			</div>
			<div class="customer-contents">
				<div class="customer-inner">
					<div class="customer-contents">
						<div class="customer-use-wrap">
							<ul class="customer-s-menu one">
								<li><a href="QnaWriteForm.qna" class="">1:1 문의하기</a></li>
								<li><a href="QnaList.qna" class="on">문의 내역 확인</a></li>
							</ul>
							<form action="QnaReplyPro.qna" method="post" > 
							
							<input type="hidden" name="page" value="<%=request.getParameter("page") %>" />
							<input type="hidden" name="id" value="<%=article.getId() %>" />
							<input type="hidden" name="pass" value="<%=article.getPass() %>" />
							<input type="hidden" name="board_num" value="<%=article.getBoard_num() %>" />
							<input type="hidden" name="re_ref" value="<%=article.getRe_ref() %>" />
							<input type="hidden" name="re_lev" value="<%=article.getRe_lev() %>" />
							<input type="hidden" name="re_seq" value="<%=article.getRe_seq() %>" />
							<input type="hidden" name="title" value="<%=article.getTitle() %>" />
							<input type="hidden" name="qna_genre" value="<%=article.getQna_genre() %>" />
							<input type="hidden" name="content" value="<%=article.getContent() %>" />
							<div class="onebyone-step">
								<p>
									문의주신 내용을 24시간 내에 답변드릴 수 있도록 노력하고 있습니다.<br>
									단, <span>주말,공휴일 문의 및 확인 절차가 많아지는 경우</span>에는 지연될 수 있는 점 양해 부탁드립니다.
								</p>
							</div>
							
							<table class="onebyone" summary="1:1 문의">
						
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
								<td align="center">
								<%=article.getContent() %></td>
							</tr>
							<tr>
								<th>
									답변내용
								</th>
								<td>
								<textarea  cols="5" rows="8" name="content2" id="content2">
								</textarea>
								</td>
							</tr>
							</tbody>
							</table>
							<div class="one-btn">
								<input type="submit" value="답변글등록">&nbsp;&nbsp;
								<input type="reset" value="다시쓰기">
							</div>
						</form>
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