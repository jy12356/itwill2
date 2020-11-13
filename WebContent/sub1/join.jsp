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
								<input type="text" name="register_id" placeholder="아이디" maxlength="20" class="strId" />
								<p class="check" style="display: none;"></p>
							</div>
							<div class="js-join">
								<input type="password" name="register_pass" placeholder="비밀번호" class="strPass">
								<p class="check" style="display: none;"></p>
							</div>
							<div class="js-join">
								<input type="password" name="re_register_pass" placeholder="비밀번호 확인" class="rePass">
								<p class="check" style="display: none;"></p>
							</div>
						</div>
						<div class="join-info mt20">
							<div class="js-join">
								<input type="text" name="register_name" placeholder="이름" class="strName">
								<p class="check" style="display: none;"></p>
							</div>
							<div class="js-join">
								<input type="text" name="register_email" placeholder="이메일" class="strMail">
								<p class="check" style="display: none;"></p>
							</div>
							
							
							
							
							
							
							<!-- 수정중 -->
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
										<input type="checkbox" name="all_chk" value="">
										<span><i></i></span>
									</label>
									<p>소설</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="all_chk" value="">
										<span><i></i></span>
									</label>
									<p>인문</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="all_chk" value="">
										<span><i></i></span>
									</label>
									<p>자기계발</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="all_chk" value="">
										<span><i></i></span>
									</label>
									<p>경제</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="all_chk" value="">
										<span><i></i></span>
									</label>
									<p>과학</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="all_chk" value="">
										<span><i></i></span>
									</label>
									<p>IT</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="all_chk" value="">
										<span><i></i></span>
									</label>
									<p>취미</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="all_chk" value="">
										<span><i></i></span>
									</label>
									<p>만화</p>
								</div>
								
								<div class="checkbox">
									<label>
										<input type="checkbox" name="all_chk" value="">
										<span><i></i></span>
									</label>
									<p>웹소설</p>
								</div>
								
							</div>
						</div>
								
						
							<!-- 
<input type="text" id="sample4_postcode" placeholder="우편번호">
<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
<input type="text" id="sample4_detailAddress" placeholder="상세주소">
<input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->

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
							
							
							
							<!-- 수정중 -->
							
							
							
							
						
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
						//$(".join-info input[type='text']:first").focus().css("border","1px solid #dc4510");;
						$(".js-join input").on("focus",function(){
							$(".js-join p.check").hide();
							if($(this).hasClass("strId")){
								$(this).attr("placeholder","6~20자 영문, 숫자");
							}
							if($(this).hasClass("strPass")){
								$(this).attr("placeholder","최소 6자 이상");	
							}
						});

						$(".js-join input").on("blur",function(){
							if($(this).hasClass("strId")){
								$(this).attr("placeholder","아이디");
							}
							if($(this).hasClass("strPass")){
								$(this).attr("placeholder","비밀번호");
							}
						});

						
						$(".strId").keyup(function(e){
	
							if (!(e.keyCode >=37 && e.keyCode<=40)) {
								var inputVal = $(".strId").val();
								$(".strId").val(inputVal.replace(/[^a-z0-9]/gi,''));
							}

							var uid = $(".strId").val() ;

							if (uid.length >= 6){
								$.post("/data/_id_check_process.asp", {uid : uid}, function(data){	
									if(data.success){
										$("#id_chk").val('1');
										$(".strId").next().text("사용 가능합니다.").show();
									}else{
										$("#id_chk").val('0');
										$(".strId").next().text("아이디 중복").show();
									}
								}, "json");
							}else{
								$("#id_chk").val('0');
								$(".strId").next().text("6~20자의 영문 및 숫자로만 가능합니다.").show();
							}
						});

						$("input[name=all_chk]").on("click", function(){
							$(this).prop("checked") ? $("input[name=reply_chk]").prop("checked", true) : $("input[name=reply_chk]").prop("checked", false);
						});

						$("input[name=reply_chk]").on("click", function(){
							if($(this).prop("checked")){
								if($("input[name=reply_chk]").length > 0 && $("input[name=reply_chk]:not(:checked)").length == 0){
									$("input[name=all_chk]").prop("checked", true);
								}
							}else{
								$("input[name=all_chk]").prop("checked", false);
							}
						});
					});

					var idCheck = /^[a-z][a-z0-9_-]{5,19}$/;
					var passCheck =  /^[A-Za-z0-9_-]{6,18}$/;
					var mailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
					var phoneCheck = /^\d{3}\d{3,4}\d{4}$/;
					var _idval = $(".strId");
					var _pass = $(".strPass");
					var _repass = $(".rePass");
					var	_strName = $(".strName");
					var _strMail = $(".strMail");
					
					var form = {
						id : function(){
							if(idCheck.test(_idval.val()) != true){
								$(".strId").next().text("6~20자의 영문 및 숫자로만 가능합니다.").show();
								if($.trim(_idval.val()).length == 0){
									$(".strId").next().text("필수 정보입니다.").show();
								}	
								return false;
							}else{
								var uid = $(".strId").val() ;
								if (uid.length >= 6){
									$.post("/data/_id_check_process.asp", {uid : uid}, function(data){	
										if(data.success){
											$("#id_chk").val('1');
											$(".strId").next().text("사용 가능합니다.").show();
										}else{
											$("#id_chk").val('0');
											$(".strId").next().text("아이디 중복").show();
										}
									}, "json");
								}
								return false;
							}
						},
						pass : function(){
							if($.trim(_pass.val()).length < 6){
								$(".strPass").next().text("6자 이상만 입력 가능합니다.").show();
								if($.trim(_pass.val()).length == 0){
									$(".strId").next().text("필수 정보입니다.").show();
								}
								return false;
							}
						},
						repass : function(){
							if($.trim(_repass.val()) != $.trim(_pass.val())){
								$(".rePass").next().text("비밀번호가 일치하지 않습니다.").show();
								if($.trim(_repass.val()).length == 0){
									$(".strpass").next().text("필수 정보입니다.").show();
								}
								return false;
							}
						},
						name : function(){
							if($.trim(_strName.val()).length == 0){
								$(".strName").next().text("필수 정보입니다.").show();	
								return false;
							}
						},
						mail : function(){
							if(mailCheck.test(_strMail.val()) != true){
								$(".strMail").next().text("잘못된 이메일 주소입니다.").show();
								if($.trim(_strMail.val()).length == 0){
									$(".strMail").next().text("필수 정보입니다.").show();
								}	
								$("#email_chk").val("0");
								return false;
							}else{
								/* 이메일 중복 체크 */
								var email = $(".strMail").val();

								$.ajax({
									url: '/data/_email_check_process.asp',
									type: 'POST',
									dataType: 'json',
									data: {email : email},
									async   : false,
									success : function(data) {
										if(data.success){
											$(".strMail").next().text("사용 가능합니다.").show();
											$("#email_chk").val("1");
										}else{
											$(".strMail").next().text("이메일 중복").show();
											$("#email_chk").val("0");
										}
									}
								});

								return false;
							}
							
						}
					}

					function register_submit(){						
						with(form){
							id();
							pass();
							repass();
							name();
							mail();
						}

						if ($(".strId").val() == ""){alert('아이디를 입력해주세요.');return false;}
						if ($("#id_chk").val() == "0"){alert('사용 불가능한 아이디입니다.');return false;}							
						if ($(".strPass").val() == ""){alert('비밀번호를 입력해주세요.');return false;}
						if ($(".strPass").val().length < 6){alert('비밀번호는 6자 이상만 가능합니다.');return false;}						
						if ($(".strPass").val() != $(".rePass").val()){alert('비밀번호가 일치하지 않습니다.');return false;}

						if ($(".strName").val() == ""){alert('이름을 입력해주세요.');return false;}
						if ($(".strMail").val() == ""){alert('이메일을 입력해주세요.');return false;}
						if ($("#email_chk").val() == "0"){alert('이메일을 확인해주세요.');return false;}														

						if (!$("#service" ).is(":checked")){alert('이용 약관에 동의해주세요.');return false;}
						if (!$("#privacy" ).is(":checked")){alert('개인정보 취급 방침에 동의해주세요.');return false;}

						$("#register_id").val($(".strId").val());
						$("#register_pwd").val($(".strPass").val());
						$("#register_repwd").val($(".rePass").val());
						$("#register_name").val($(".strName").val());
						var tmpEmail = $(".strMail").val().split("@");
						$("#register_email_id").val(tmpEmail[0]);
						$("#register_email_domain").val(tmpEmail[1]);
						$(".strMail").val('');
						$("#register_newsletter").val($("#email").val());

						//https://dev1.bookcube.com/member/register_step2.asp?register_id=heemanz&register_pass=123456&re_register_pass=123456&register_name=%EC%B5%9C%ED%9D%AC%EC%B2%A0&register_email=heemanx%40bookcube.com&all_chk=on&reply_chk=service&reply_chk=privacy&reply_chk=email
						$.ajax({
							type: "POST",
							url : httpsUrl+'/data/_register_process.asp',
							data : $('#rlnmchk').serialize(),
							success: function(msg){	

								var arr = msg.split('|');

								//BOOKCUBE.getInstance("pageLoading").hide();

								if (arr[0] == "OK"){
									//document.register_di.submit();
									goUrl(httpsUrl + "/member/register_complete.asp");
								}else{
									alert(arr[1]);					
								}
							},
								onFailure : function(){
								alert('잘못된 요청입니다.');
							}			 
						});

						return false;
					}


				</script>
		</div>
	</section>
	

<jsp:include page="../include/footer.jsp"/>