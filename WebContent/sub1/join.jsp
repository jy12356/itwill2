<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<style>

/* #checkIdResult {color: red; font-weight: bold;font-size: 1em;padding: 0.2em;} 
#checkIdResult2 {color: green; font-weight: bold;font-size: 1em;padding: 0.2em;} 
#checkPasswdResult {color: red; font-weight: bold;font-size: 1em;padding: 0.2em;} */
</style>

<section class="sub">
<div class="common-title">
	<h3>회원가입</h3>
</div>
<div class="user">
	<form id="register_step2" action="MemberJoinPro.me" >
	<input type="hidden" name="" id="id_chk" value="0">
	<input type="hidden" name="" id="email_chk" value="0">
		<fieldset>
			<legend>회원가입</legend>
			<div class="join-wrap">
				<!-- 경고창 대신 input 다음의 p 태그에 해당 경고문이 들어갑니다 -->
				<div class="join-info">
					<div class="js-join">
						<input type="text" name="id" id="id" placeholder="아이디" maxlength="20" class="strId" required="required" onkeyup="checkId(this)"/>
						<p class="check" style="display: none;"><div id="checkIdResult"><!-- 자바스크립트에서 메세지 출력 공간 --></div></p>
					</div>
					<label></label><div id="id_check" style="color:red;"></div><br>
					<div class="js-join">
						<input type="password" name="password" id="password" placeholder="비밀번호" class="strPass" required="required" onkeyup="checkPasswd(this)">
						<p class="check" style="display: none;"><div id="checkPasswdResult"><!-- 자바스크립트에서 메세지 출력 공간 --></div></p>
					</div>
					<div class="js-join">
						<input type="password" name="password2" id="password2" placeholder="비밀번호 확인" class="rePass"required="required" onkeyup="checkPasswd2(this)">
						<p class="check" style="display: none;"><div id="checkPasswdResult2"><!-- 자바스크립트에서 메세지 출력 공간 --></div></p>
					</div>
				</div>
				<div class="join-info mt20">
					<div class="js-join">
						<input type="text" name="name" id="name" placeholder="이름" class="strName" required="required" onkeyup="checkName(this)">
						<p class="check" style="display: none;"></p>
					</div>
					<div class="js-join">
						<input type="text" name="email" id="email" placeholder="이메일" class="strMail" required="required" onkeyup="checkEmail(this)">
						<p class="check" style="display: none;"></p>
					</div>
					<div class="js-join">
						<input type="text" name="phone" id="phone" placeholder="전화번호" class="strMail" required="required"  onkeyup="checkPhone(this)">
						<p class="check" style="display: none;"><div id="checkPhoneResult"><!-- 자바스크립트에서 메세지 출력 공간 --></div></p>
					</div>
					<div class="js-join">
						<input type="text" name="age" id="age" placeholder="생년월일" class="strAge" required="required" onkeyup="checkAge(this)">
						<p class="check" style="display: none;"><div id="checkAgeResult"><!-- 자바스크립트에서 메세지 출력 공간 --></div></p>
					</div>
					
				<div class="join-info mt20">
					<div class="js-join">
						<input type="text" name="sample4_postcode" id="sample4_postcode" placeholder="우편번호" class="strMail" required="required">
						<p class="check" style="display: none;"></p>
					</div>
					<div class="js-join">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					</div>
					<div class="js-join">
						<input type="text" name="sample4_roadAddress" id="sample4_roadAddress" placeholder="도로명주소" class="strMail" required="required">
							<span id="guide" style="color:#999;display:none"></span>
						<p class="check" style="display: none;"></p>
					</div>
					<div class="js-join">
						<input type="hidden" name="sample4_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" class="strMail" required="required">
						<p class="check" style="display: none;"></p>
					</div><div class="js-join">
						<input type="text" name="sample4_detailAddress" id="sample4_detailAddress" placeholder="상세주소" class="strMail" required="required">
						<p class="check" style="display: none;"></p>
					</div><div class="js-join">
						<input type="hidden" name="sample4_extraAddress" id="sample4_extraAddress" placeholder="참고항목" class="strMail" required="required">
						<p class="check" style="display: none;"></p>
					</div>
				</div>
				
		<div class="register-title2"><p>선택입력항목</p></div>
				<div class="join-check">
					<div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="catg" id="catg" value="소설">
								<span><i></i></span>
							</label>
							<p>소설</p>
						</div>
						
						<div class="checkbox">
							<label>
								<input type="checkbox" name="catg" id="catg" value="인문">
								<span><i></i></span>
							</label>
							<p>인문</p>
						</div>
						
						<div class="checkbox">
							<label>
								<input type="checkbox" name="catg" id="catg" value="자기계발">
								<span><i></i></span>
							</label>
							<p>자기계발</p>
						</div>
						
						<div class="checkbox">
							<label>
								<input type="checkbox" name="catg" id="catg" value="경제">
								<span><i></i></span>
							</label>
							<p>경제</p>
						</div>
						
						<div class="checkbox">
							<label>
								<input type="checkbox" name="catg" id="catg" value="과학">
								<span><i></i></span>
							</label>
							<p>과학</p>
						</div>
						
						<div class="checkbox">
							<label>
								<input type="checkbox" name="catg" id="catg" value="IT">
								<span><i></i></span>
							</label>
							<p>IT</p>
						</div>
						
						<div class="checkbox">
							<label>
								<input type="checkbox" name="catg" id="catg" value="취미">
								<span><i></i></span>
							</label>
							<p>취미</p>
						</div>
						
						<div class="checkbox">
							<label>
								<input type="checkbox" name="catg" id="catg" value="만화">
								<span><i></i></span>
							</label>
							<p>만화</p>
						</div>
						
						<div class="checkbox">
							<label>
								<input type="checkbox" name="catg" id="catg" value="웹소설">
								<span><i></i></span>
							</label>
							<p>웹소설</p>
						</div>
						
					</div>
				</div>
								

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
</script>
						<p class="young-ps">*14세미만 회원가입 시 법정대리인의 이메일을 입력해 주세요.</p> 
					</div>
					<div class="join-check">
						<div>
							<div class="checkbox">
								<label>
									<input type="checkbox" name="all_chk" value="">
									<span><i></i></span>
								</label>
								<p>전체 동의</p>
							</div>
						</div>
						<div>
							<div class="checkbox">
								<label>
									<input type="checkbox" name="reply_chk" id="service" value="">
									<span><i></i></span>
								</label>
								<p>이용약관 동의</p>
							</div>
							<a href="/customer.asp?page=notice&num=24007&page2=view" class="btn">자세히 보기</a>
						</div>
						<div>
							<div class="checkbox">
								<label>
									<input type="checkbox" name="reply_chk" id="privacy" value="">
									<span><i></i></span>
								</label>
								<p>개인정보 취급 방침</p>
							</div>
							<a href="/customer.asp?page=notice&num=24264&page2=view" class="btn">자세히 보기</a>
						</div>
						<div>
							<div class="checkbox">
								<label>
									<input type="checkbox" name="reply_chk" id="email" value="">
									<span><i></i></span>
								</label>
									<p>이메일 수신 동의</p>
								</div>
							</div>
						</div>
						<input type="submit" name="" id="submit" value="가입하기">
					</div>
				</fieldset>
			</form>

	<script>
	</script>
	<script type="text/javascript">


	var checkIdResult = false, checkPasswdResult = false,
	checkNameResult = false, checkEmailResult = false,
	checkPhoneResult = false, checkAgeResult = false,
	checkPasswd2Result = false; 

	function checkId(idForm) { 
		var id = idForm.value; 
		
		var element = document.getElementById('checkIdResult');
		
		var regex = /^[a-z0-9][a-z0-9_\-]{4,19}$/g;
		
		if(regex.test(id)) { 
			element.innerHTML = "멋진 아이디네요!";
			checkIdResult = true; 
			var myElement = document.getElementById('checkIdResult');
			myElement.style.color="green";
			myElement.style.padding="0.3em";
		
		} else {
			element.innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
			checkIdResult = false;
			var myElement = document.getElementById('checkIdResult');
			myElement.style.color="red"
			myElement.style.padding="0.3em";
			
		}
		$.ajax({
			type:"GET",
			url:"MemberCheck.me",
			data : {
                id : id
            },
			success : function(data) {
				isIdCheckSuccess
			}
		})
		
	}
	
	
	function checkPasswd(passwdForm) { // 파라미터 this 로 전달된 ID 입력폼을 매개변수에 저장
		var passwd = passwdForm.value; // ID 입력폼의 입력값을 가져와서 변수에 저장
		
		var element = document.getElementById('checkPasswdResult');
		
		var lengthRegex = /^[A-Za-z0-9!@#$%]{6,16}$/;
		var upperCaseRegex = /[A-Z]/;
		var lowerCaseRegex = /[a-z]/;
		var digitRegex = /[0-9]/;
		var specRegex = /[!@#$%]/;
		
		if(lengthRegex.exec(passwd)) {
			var count = 0;
			if(upperCaseRegex.exec(passwd)) count++;
			if(lowerCaseRegex.exec(passwd)) count++;
			if(digitRegex.exec(passwd)) count++;
			if(specRegex.exec(passwd)) count++;
			
// 			element.innerHTML = "사용 가능 " + count;

			// 점수(count) 에 따른 안전도 출력
			if(count == 4) {
				element.innerHTML = "사용 가능(안전)";
				checkPasswdResult = true; // 전역변수 true 로 변경
				var myElement = document.getElementById('checkPasswdResult');
				myElement.style.color="green";
				myElement.style.padding="0.3em";
			} else if(count == 3) {
				element.innerHTML = "사용 가능(보통)";
				checkPasswdResult = true; // 전역변수 true 로 변경
				var myElement = document.getElementById('checkPasswdResult');
				myElement.style.color="green";
				myElement.style.padding="0.3em";
			} else if(count == 2) {
				element.innerHTML = "사용 가능(위험)";
				checkPasswdResult = true; // 전역변수 true 로 변경
				var myElement = document.getElementById('checkPasswdResult');
				myElement.style.color="green";
				myElement.style.padding="0.3em";
			} else {
				element.innerHTML = "사용 불가(두 가지 이상 조합)";
				checkPasswdResult = false; // 전역변수 false 로 변경
				var myElement = document.getElementById('checkPasswdResult');
				myElement.style.color="red";
				myElement.style.padding="0.3em";
			}

		} else {
			element.innerHTML = "사용 불가";
			checkPasswdResult = false; // 전역변수 false 로 변경
			var myElement = document.getElementById('checkPasswdResult');
			myElement.style.color="red";
			myElement.style.padding="0.3em";
		}
		
		
		
	}
	
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
	
	function checkName (nameForm) { 
		var name = nameForm.value; 
		
		var regex = /^[가-힣]{2,6}$/g;
		
		if(regex.exec(name)) { 
			checkNameResult = true; 
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
	
	// 아이디, 패스워드 정규표현식 체크 후 정상이면 true 리턴(submit), 아니면 false 리턴
	function check() {
		if(checkIdResult && checkPasswdResult) {
			return true;
		} else {
			alert('아이디 또는 패스워드 규칙 확인 필수!');
			return false;
		}
	}
	
</script>
		</div>
	</section>
	

<jsp:include page="../include/footer.jsp"/>