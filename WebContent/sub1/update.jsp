<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	MemberBean article = (MemberBean)request.getAttribute("article");
%>    
    
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
			 <form action="MemberModifyPro.me">
<!-- 			<form action="MemberModifyPro.me" method='' id="member_register"> -->
<!-- 			<input type="hidden" name="BusinessRegistrationNum" id="BusinessRegistrationNum" value="" /> -->
<!-- 			<input type="hidden" name="register_mobile_num1" value="010"> -->
<!-- 			<input type="hidden" name="ori_nickname" value="[juny1993]"> -->
<!-- 			<input type="hidden" name="ori_email" id="ori_email" value="bonafide93@naver.com"> -->
<!-- 			<input type="hidden" name="nick_chk" id="nick_chk" value="0"> -->
<!-- 			<input type="hidden" name="email_chk" id="email_chk" value="0"> -->
<!-- 			<input type="hidden" name="register_id" id="register_id" value="juny1993"> -->
<!-- 			<input type="hidden" name="register_sms" id="register_sms" value="False"> -->
<!-- 			<input type="hidden" name="register_name" id="register_name" value="차준희"> -->
<input type="hidden" value="<%=article.getId()%>" id="id" name="id">
				<fieldset>
					<legend>회원정보수정 입력</legend>
<!-- 					<div class="register-title"><p>필수입력항목</p></div> -->
					<table>
						<caption>회원정보수정</caption>
						<colgroup>
							<col width="150px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th>북큐브 ID</th>
								<td><%=article.getId()%></td>
							</tr>
							<tr>
								<th>카카오계정</th>
								<td>
									<a href="#" class="kakaotalk outside_input">연동하기</a><span>카카오톡 계정으로 북큐브를 이용해 보세요!</span></td>								
							</tr>
							<tr>
								<th>네이버계정</th>
								<td>
<!-- 									<a href="" onClick="window.open(this.href, 'naverloginpop', 'titlebar=1, resizable=1, left='+(screen.availWidth-660)/2+,top='+(screen.availHeight-430)/2+',scrollbars=yes, width=1, height=1'); return false" class="naver outside_input">연동하기</a><span>네이버 계정으로 북큐브를 이용해 보세요!</span></td> -->
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
								<td><input type='password' name='password' id='password' placeholder='변경비밀번호' onkeyup="checkPasswd(this)"/></td>
							</tr>
							<tr>
								<th><label for='register_repwd'>변경 비밀번호 확인</label></th>
								<td><input type='password' name='password2' id='password2' placeholder='변경비밀번호 확인' onkeyup="checkPasswd2(this)"/></td>
							</tr>
							<tr>
								<th><label for='register_name'>이름</label></th>
								<td><%=article.getName() %></td>
							</tr>
							<tr>
								<th><label for='register_email_id'>e-Mail</label></th>
								<td>
									<div>
										<label><input type='text' name='email' id='email'  onkeyup="checkEmail(this)" value='<%=article.getEmail() %>' /></label>
										<input type='button' name='' value='중복체크' class="emailchk"/>
									</div>
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
							
							<tr>
								<th><label for='register_zipcode'>우편번호</label></th>
								<td><div><input type='text' name='register_zipcosample4_postcodede' id='sample4_postcode' value=''  maxlength="24" />
									<input type="button" onclick="sample4_execDaumPostcode()"  class="emailchk" value="우편번호 찾기"></div>
							
							
							<input type="hidden" name="sample4_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" class="strMail" required="required">
						<input type="hidden" name="sample4_extraAddress" id="sample4_extraAddress" placeholder="참고항목" class="strMail" required="required"></td>
						
							
							
							
							</tr>
							<tr>
								<th><label for='register_address'>도로명 주소</label></th>
								<td><input type='text' name='sample4_detailAddress' id='sample4_roadAddress' class="register_address" /></td>
							</tr>
							<tr>
								<th><label for='register_address'>상세주소</label></th>
								<td><input type='text' name='sample4_extraAddress' id='register_address' class="register_address" /></td>
							</tr>
							<tr>
								<th><label>전화번호</label></th>
								<td>
<!-- 									<div class="option"> -->
										<input type="text" name="phone" id="phone" value="<%=article.getPhone() %>" class="register_address" required="required"  onkeyup="checkPhone(this)">
<!-- 									</div> -->
								</td>
							</tr>
							<tr>
								<th><label>생년월일</label></th>
								<td>
<!-- 									<div class="option"> -->
										<input type="text" name="age" id="age" value="<%=article.getAge()%>" class="strMail" class="register_address" required="required"   onkeyup="checkAge(this)">
<!-- 									</div> -->
								</td>
							</tr>
							<tr>
								<th><label>선택입력항목</label></th>
								<td>
				<!-- <div class="join-check"> -->
					<div>
						<div class="checkbox01">
							<label>
								<input type="checkbox" name="catg" id="catg" value="소설" onclick="doOpenCheck(this);">
								<span><i></i></span>
							</label>
							<p class="01">소설</p>
						</div>
						
						<div class="checkbox01">
							<label>
								<input type="checkbox" name="catg" id="catg" value="인문" onclick="doOpenCheck(this);">
								<span><i></i></span>
							</label>
							<p>인문</p>
						</div>
						
						<div class="checkbox01">
							<label>
								<input type="checkbox" name="catg" id="catg" value="자기계발" onclick="doOpenCheck(this);">
								<span><i></i></span>
							</label>
							<p id="01">자기계발</p>
						</div>
						
						<div class="checkbox01">
							<label>
								<input type="checkbox" name="catg" id="catg" value="경제" onclick="doOpenCheck(this);">
								<span><i></i></span>
							</label>
							<p id="01">경제</p>
						</div>
						
						<div class="checkbox01">
							<label>
								<input type="checkbox" name="catg" id="catg" value="과학" onclick="doOpenCheck(this);">
								<span><i></i></span>
							</label>
							<p id="01">과학</p>
						</div>
						
						<div class="checkbox01">
							<label>
								<input type="checkbox" name="catg" id="catg" value="IT" onclick="doOpenCheck(this);">
								<span><i></i></span>
							</label>
							<p id="01">IT</p>
						</div>
						
						<div class="checkbox01">
							<label>
								<input type="checkbox" name="catg" id="catg" value="취미" onclick="doOpenCheck(this);">
								<span><i></i></span>
							</label>
							<p>취미</p>
						</div>
						
						<div class="checkbox01">
							<label>
								<input type="checkbox" name="catg" id="catg" value="만화" onclick="doOpenCheck(this);">
								<span><i></i></span>
							</label>
							<p id="01">만화</p>
						</div>
						
						<div class="checkbox01">
							<label>
								<input type="checkbox" name="catg" id="catg" value="웹소설" onclick="doOpenCheck(this);">
								<span><i></i></span>
							</label>
							<p id="01">웹소설</p>
						</div>
						
					</div>
				<!-- </div> -->
								</td>
							</tr>
						</tbody>
					</table>
					<div class="register-btn">
						<input type="submit" class="btn" value="수정" >
						<input type="button" src="Main.book" class="btn" value="취소">
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
    var checkEmailResult = false, checkPhoneResult = false, 
    checkAgeResult = false, checkPasswd2Result = false; 
    
    
    function checkPasswd2(passwdForm) { // 파라미터 this 로 전달된 ID 입력폼을 매개변수에 저장
		var password2 = passwdForm.value; // ID 입력폼의 입력값을 가져와서 변수에 저장
		var password1 = document.getElementById('password').value;
		var element = document.getElementById('checkPasswdResult2');
		
		
		if(password1!=password2){
			element.innerHTML = "비밀번호가 일치하지 않습니다.";
			var myElement = document.getElementById('checkPasswdResult2');
			myElement.style.color="red";
			myElement.style.padding="0.3em";
			checkPasswd2Result = false;
		} else {
			element.innerHTML = "";
			checkPasswd2Result = true;
		}
	}
	
	
	function checkEmail (emailForm) { 
		var email = emailForm.value; 
		
		var regex =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(regex.exec(email)) { 
			checkEmailResult  = true; 
		}
	}
	function checkPhone (phoneForm) { 
		var phone = phoneForm.value; 
		
		var regex =  /^\d{3}-\d{3,4}-\d{4}$/;
		
		var element = document.getElementById('checkPhoneResult');
		
		
		if(!regex.exec(phone)){
			element.innerHTML = "예 010-1234-5678";
			var myElement = document.getElementById('checkPhoneResult');
			myElement.style.color="red";
			myElement.style.padding="0.3em";
			checkPasswd2Result = false;
		} else {
			element.innerHTML = "";
			checkPasswd2Result = true;
		}
	}
	function checkAge (phoneForm) { 
		var phone = phoneForm.value; 
		
		var regex =  /^\d{8}$/;
		
		var element = document.getElementById('checkAgeResult');
		
		
		if(!regex.exec(phone)){
			element.innerHTML = "예 19901225";
			var myElement = document.getElementById('checkAgeResult');
			myElement.style.color="red";
			myElement.style.padding="0.3em";
			checkAgeResult  = false;
		} else {
			element.innerHTML = "";
			checkAgeResult  = true;
		}
	}
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("catg");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
</script>
</html>

<jsp:include page="../include/footer.jsp"/>