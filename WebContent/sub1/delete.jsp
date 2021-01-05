<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	MemberBean article = (MemberBean)request.getAttribute("article");
%>    
    
<jsp:include page="../include/header.jsp"/>
	<section class="sub">
		<div class="common-title">
			<h3 id="h33">회원 탈퇴</h3>
		</div>
		<div class="user-fire">
			<ul>
				<li>- 회원님의 비밀 번호, 탈퇴 사유를 입력하셔서 본인 확인을 한 후 바로 회원탈퇴가 됩니다.</li>
				<li>- 회원 탈퇴 버튼을 클릭하시면 회원님의 주문, 결제등의 개인 정보 기록을 삭제하므로 신중하게 선택해 주세요.</li>
				<li>- 재가입시 탈퇴 전에 구매했던 주문 정보등은 복구되지 않습니다.</li>
				<li>- 본인인증 완료한 아이디를 탈퇴 후 재가입 시 본인인증 혜택은 중복으로 지급되지 않습니다. 또한, 본인인증 회원만 참여 가능한 이벤트에서 제외됩니다.</li>
			</ul>
			<div>
				<a href="#" target="_blank" class="btn">개인 정보 취급 방침</a>
			</div>
			<form action="MemberDeletePro.me" method='post' onsubmit="del_submit();">
				<fieldset>
					<legend>회원탈퇴 양식</legend>
					<table class="customer-notice">
						<caption>회원탈퇴 양식</caption>
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>아이디</td>
								<td><%=article.getId()%>
								<input type="hidden" value="<%=article.getId()%>" id="id" name="id">
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" id="password" name="password"class="pwd" /></td>
							</tr>
						</tbody>
					</table>
					<div class="one-btn">
						<input type="submit" value='회원탈퇴' />
					</div>
				</fieldset>
			</form>
		</div>
	</section>
<jsp:include page="../include/footer.jsp"/>
