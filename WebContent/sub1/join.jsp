<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
		<div class="common-title">
			<h3>회원가입</h3>
		</div>
		<div class="user">
			<form id="register_step2" onsubmit="return register_submit();">
			<input type="hidden" name="" id="id_chk" value="0">
			<input type="hidden" name="" id="email_chk" value="0">
				<fieldset>
					<legend>회원가입</legend>
					<div class="join-wrap">
						<!-- 경고창 대신 input 다음의 p 태그에 해당 경고문이 들어갑니다 -->
						<div class="join-info">
							<div class="js-join">
								<input type="text" name="strId" placeholder="아이디" maxlength="20" class="strId" />
								<p class="check" style="display: none;"></p>
							</div>
							<div class="js-join">
								<input type="password" name="strPass" placeholder="비밀번호" class="strPass" >
								<p class="check" style="display: none;"></p>
							</div>
							<div class="js-join">
								<input type="password" name="rePass" placeholder="비밀번호 확인" class="rePass">
								<p class="check" style="display: none;"></p>
							</div>
						</div>
						<div class="join-info mt20">
							<div class="js-join">
								<input type="text" name="name" placeholder="이름" class="strName">
								<p class="check" style="display: none;"></p>
							</div>
							<div class="js-join">
								<input type="text" name="email" placeholder="이메일" class="strMail">
								<p class="check" style="display: none;"></p>
							</div>
							<div class="js-join">
								<input type="text" name="phone" placeholder="전화번호" class="strMail">
								<p class="check" style="display: none;"></p>
							</div>
							
						<div class="join-info mt20">
							<div class="js-join">
								<input type="text" name="ad-01" id="sample4_postcode" placeholder="우편번호" class="strMail">
								<p class="check" style="display: none;"></p>
							</div>
							<div class="js-join">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							</div>
							<div class="js-join">
								<input type="text" name="ad-0" id="sample4_roadAddress" placeholder="도로명주소" class="strMail">
									<span id="guide" style="color:#999;display:none"></span>
								<p class="check" style="display: none;"></p>
							</div>
							<div class="js-join">
								<input type="text" name="ad-0" id="sample4_jibunAddress" placeholder="지번주소" class="strMail">
								<p class="check" style="display: none;"></p>
							</div><div class="js-join">
								<input type="text" name="ad-0" id="sample4_detailAddress" placeholder="상세주소" class="strMail">
								<p class="check" style="display: none;"></p>
							</div><div class="js-join">
								<input type="text" name="ad-0" id="sample4_extraAddress" placeholder="참고항목" class="strMail">
								<p class="check" style="display: none;"></p>
							</div>
						</div>
						
				<div class="register-title2"><p>선택입력항목</p></div>
						<div class="join-check">
							<div>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="catg" value="소설">
										<span><i></i></span>
									</label>
									<p>소설</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="catg" value="인문">
										<span><i></i></span>
									</label>
									<p>인문</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="catg" value="자기계발">
										<span><i></i></span>
									</label>
									<p>자기계발</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="catg" value="경제">
										<span><i></i></span>
									</label>
									<p>경제</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="catg" value="과학">
										<span><i></i></span>
									</label>
									<p>과학</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="catg" value="IT">
										<span><i></i></span>
									</label>
									<p>IT</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="catg" value="취미">
										<span><i></i></span>
									</label>
									<p>취미</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="catg" value="만화">
										<span><i></i></span>
									</label>
									<p>만화</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="catg" value="웹소설">
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
		$(function(){
			
		}
	</script>


		</div>
	</section>
	

<jsp:include page="../include/footer.jsp"/>