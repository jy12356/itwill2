<%@page import="vo.MsgBean"%>
<%@page import="vo.RequestBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	MsgBean msgBean = (MsgBean) request.getAttribute("msgBean");
	String nowPage = request.getParameter("page");
%>
<jsp:include page="../include/header.jsp" />
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>HOME > 내 메세지확인 </p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="customer">
			<h3 class="coTitle">메세지</h3>
			<div class="customer-contents">
				<div class="customer-inner">
					<table summary="게시판" class="onebyone customer-notice">
						<caption>메세지 상세보기</caption>
						<colgroup>
							<col style="width: 22%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<td>보낸이</td>
								<td colspan="3"><%=msgBean.getFromId()%></td>
							</tr>
							<tr>
								<td>보낸날짜</td>
								<td><%=msgBean.getDate()%></td>
								<td class="th">읽음유무</td>
								<td>
								<%if(msgBean.getIsRead().equals("y")){ %>
									읽음
								<%}else{ %>
									읽지않음
								<%} %>
								</td>
							</tr>
							<tr>
								<td class="td" colspan="4"><%=msgBean.getContent() %></td>
								
							</tr>
						</tbody>
					</table>
					<div class="btn_inner">
						
						<input type="button" class="btn" value="삭제" onclick="location.href='RequestDeletePro.rq?num=<%=msgBean.getNum()%>&page=<%=nowPage%>'">
						<input type="button" class="btn" value="목록" onclick="location.href='MyMsg.msg?num=<%=msgBean.getNum()%>">
						
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<jsp:include page="../include/footer.jsp" />