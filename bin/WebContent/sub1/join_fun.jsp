<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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





</body>
</html>