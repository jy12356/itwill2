<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>HOME > 회원정보수정</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="user-modify">
			<h3>회원정보수정</h3>
			<form action='' method='' id="member_register">
			<input type="hidden" name="BusinessRegistrationNum" id="BusinessRegistrationNum" value="" />
			<input type="hidden" name="register_mobile_num1" value="010">
			<input type="hidden" name="ori_nickname" value="[juny1993]">
			<input type="hidden" name="ori_email" id="ori_email" value="bonafide93@naver.com">
			<input type="hidden" name="nick_chk" id="nick_chk" value="0">
			<input type="hidden" name="email_chk" id="email_chk" value="0">
			<input type="hidden" name="register_id" id="register_id" value="juny1993">
			<input type="hidden" name="register_sms" id="register_sms" value="False">
			<input type="hidden" name="register_name" id="register_name" value="차준희">
				<fieldset>
					<legend>회원정보수정 입력</legend>
					<div class="register-title"><p>필수입력항목</p></div>
					<table>
						<caption>회원정보수정</caption>
						<colgroup>
							<col width="150px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th>북큐브 ID</th>
								<td>juny1993</td>
							</tr>
							<tr>
								<th>카카오계정</th>
								<td>
									<a href="#" class="kakaotalk outside_input">연동하기</a><span>카카오톡 계정으로 북큐브를 이용해 보세요!</span></td>								
							</tr>
							<tr>
								<th>네이버계정</th>
								<td>
									<a href="" onClick="window.open(this.href, 'naverloginpop', 'titlebar=1, resizable=1, left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-430)/2+',scrollbars=yes, width=1, height=1'); return false" class="naver outside_input">연동하기</a><span>네이버 계정으로 북큐브를 이용해 보세요!</span></td>
							</tr>
							<tr>
								<th>페이스북계정</th>
								<td>
									<a href="#" class="facebook outside_input">연동하기</a><span>페이스북 계정으로 북큐브를 이용해 보세요!</span></td>
							</tr>
							<tr>
								<th>페이코계정</th>
								<td>
									<a href="#" class="payco outside_input">연동하기</a><span>페이코 계정으로 북큐브를 이용해 보세요!</span></td>
							</tr>
							<tr>
								<th><label for='register_pwd'>변경 비밀번호</label></th>
								<td><input type='password' name='register_pwd' id='register_pwd' placeholder='변경비밀번호' /></td>
							</tr>
							<tr>
								<th><label for='register_repwd'>변경 비밀번호 확인</label></th>
								<td><input type='password' name='register_repwd' id='register_repwd' placeholder='변경비밀번호 확인' /></td>
							</tr>
							<tr>
								<th><label for='register_name'>이름</label></th>
								<td>차준희</td>
							</tr>
							<tr>
								<th><label for='register_nickname'>닉네임</label></th>
								<td><input type='text' name='register_nickname' id='register_nickname' value='[juny1993]' maxlength='20' /><span id="check_nickname_msg">닉네임은 한글, 영문 및 숫자 20자까지 입력 가능</span></td>
							</tr>
							<tr>
								<th><label for='register_email_id'>e-Mail</label></th>
								<td>
									<div>
										<label><input type='text' name='register_email_id' id='register_email_id' value='bonafide93' /></label>
										<strong>@</strong>
										<label><input type='text' name='register_email_domain' id='register_email_domain' value='naver.com' /></label>
										<div class="arrayBox">
											<a href="javascript:;" class="s-result">직접입력</a>
											<ul>
												<li><a href="#" data="" class="on" class='register_email_domain_val'>직접입력</a></li>
												<li><a href="#" data="daum.net" class='register_email_domain_val'>daum.net</a></li>
												<li><a href="#" data="naver.com" class='register_email_domain_val'>naver.com</a></li>
												<li><a href="#" data="nate.com" class='register_email_domain_val'>nate.com</a></li>
												<li><a href="#" data="daumwiz.com" class='register_email_domain_val'>dreamwiz.com</a></li>
												<li><a href="#" data="empas.com" class='register_email_domain_val'>empas.com</a></li>
												<li><a href="#" data="yahoo.co.kr" class='register_email_domain_val'>yahoo.co.kr</a></li>
												<li><a href="#" data="yahoo.com" class='register_email_domain_val'>yahoo.com</a></li>
												<li><a href="#" data="freechal.com" class='register_email_domain_val'>freechal.com</a></li>
												<li><a href="#" data="chol.com" class='register_email_domain_val'>chol.com</a></li>
												<li><a href="#" data="paran.com" class='register_email_domain_val'>paran.com</a></li>
												<li><a href="#" data="empal.com" class='register_email_domain_val'>empal.com</a></li>
												<li><a href="#" data="gmail.com" class='register_email_domain_val'>gmail.com</a></li>
												<li><a href="#" data="hanafos.com" class='register_email_domain_val'>hanafos.com</a></li>
												<li><a href="#" data="hanmir.com" class='register_email_domain_val'>hanmir.com</a></li>
												<li><a href="#" data="korea.com" class='register_email_domain_val'>korea.com</a></li>
												<li><a href="#" data="lycos.co.kr" class='register_email_domain_val'>lycos.co.kr</a></li>
												<li><a href="#" data="netian.com" class='register_email_domain_val'>netian.com</a></li>
											</ul>
											<script>
												$(function(){
													$(".s-result").on("click focus",function(){
														$(this).next().show();
													});
													$(document).on("click",".arrayBox ul li a",function(){
														var text = $(this).text();
														$(this).parent().parent().find("li a").removeClass("on");
														$(this).parent().parent().hide();
														$(this).addClass("on");
														$(this).parent().parent().prev().text(text);
														return false;
													});
													$(".register_email_domain_val").click(function(e){
														e.preventDefault();
														var register_email_domain_val = $(this).attr("data");
														$("#register_email_domain").val(register_email_domain_val);
														if (register_email_domain_val == ""){$("#register_email_domain").focus();}
													});
												});
										</script>
										</div>
										<input type='button' name='' value='중복체크' class="emailchk"/>
									</div>
									<p>아이디, 비밀번호 확인을 위해 필요합니다.</p>
									<div>
										<div class="checkbox">
											<label>
												<input type="checkbox" name="register_newsletter" >
												<span><i></i></span>
											</label>
											북큐브 뉴스레터를 통해 신간도서, 베스트셀러, 이벤트 소식 등 유익한 정보를 전해드립니다.
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="register-title"><p>선택입력항목</p></div>
					<table class='radio-tbl'>
						<caption>선택입력항목</caption>
						<colgroup>
							<col width="150px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th><label for='register_zipcode'>우편번호</label></th>
								<td><input type='text' name='register_zipcode' id='register_zipcode' value=''  maxlength="24" readonly /></td>
							</tr>
							<tr>
								<th><label for='register_address'>상세주소</label></th>
								<td><input type='text' name='register_address1' id='register_address' class="register_address" value='' readonly /></td>
							</tr>
							<tr>
								<th>전화번호</label></th>
								<td>
									<div class="option">
										<label><input type="text" name="phone_area_num" value="" maxlength="3" onkeyup="numChk(this);checkLength(this);" maxlength="3"></label>
										<strong>-</strong>
										<label><input type="text" name="phone_num1" value="" title='전화번호 앞자리' maxlength="4" onkeyup="numChk(this);checkLength(this);"></label>
										<strong>-</strong>
										<label><input type="text" name="phone_num2" value="" title='전화번호 뒷자리'  maxlength="4" onkeyup="numChk(this);checkLength(this);"></label>
									</div>
								</td>
							</tr>
							<tr>
								<th>휴대폰 번호</label></th>
								<td>
									<div class="option">
										<div class="arrayBox">
											<a href="javascript:;" class="s-result">010</a>
											<ul>
												<li><a href="#" class="register_mobile_num1_val" data="010" class="on">010</a></li>
												<li><a href="#" class="register_mobile_num1_val" data="011">011</a></li>
												<li><a href="#" class="register_mobile_num1_val" data="016">016</a></li>
												<li><a href="#" class="register_mobile_num1_val" data="017">017</a></li>
												<li><a href="#" class="register_mobile_num1_val" data="018">018</a></li>
												<li><a href="#" class="register_mobile_num1_val" data="019">019</a></li>
											</ul>
										</div>
										<strong>-</strong>
										<label><input type="text" name="register_mobile_num2" value="" title='전화번호 앞자리' maxlength="4"></label>
										<strong>-</strong>
										<label><input type="text" name="register_mobile_num3" value="" title='전화번호 뒷자리'  maxlength="4"></label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="register-btn">
						<input type='button' name='' class="register_commit" value='수정' />
						<a href="https://www.bookcube.com" class="btn">취소</a>
					</div>
				</fieldset>
			</form>
			
			<table class="certify-tbl">
				<caption>본인인증 여부</caption>
				<colgroup>
					<col width="150px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>본인인증</th>
						<td>
							<div>
								<img src="/images/certify-banner.png" alt='적립금 2000원, 북캐시 30% 즉시적립, 전종 10% 할인쿠폰' />
								<div>
									<a href="#" class="btn" onclick="ipin_chk()">아이핀 인증</a>
									<a href="#" class="btn" onclick="phone_chk()">휴대폰 인증</a>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="user-leave">
				<p>회원 탈퇴를 원하실 경우 우측의 회원 탈퇴 버튼을 클릭하세요.</p>
				<a href="https://www.bookcube.com/member_delete.asp" class="btn">회원탈퇴</a>
			</div>
		</div>		
	</div>
	
</section>
</body>
</html>