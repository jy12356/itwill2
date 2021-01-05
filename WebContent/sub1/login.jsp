<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>    
<section class="sub">
		<div class="common-title">
			<h3>로그인</h3>
		</div>
		<div class="user">
			<form id="login" action="MemberLoginPro.me">
			<input type="hidden" name="return_url" id="return_url" value="https://www.bookcube.com">
				<fieldset>
					<legend>로그인</legend>
					<div class="join-wrap">					
						<div class="join-info">
							<div class="js-join">
								<input type="text" name="id" id="id" placeholder="아이디" maxlength="20" class="strId" required="required">
								<p class="check" style="display: none;"></p>
							</div>
							<div class="js-join">
								<input type="password" name="password" id="password" placeholder="비밀번호" class="strPass" required="required">
								<p class="check" style="display: none;"></p>
							</div>
						</div>
						<div class="m-login">
							<div class="checkbox">
								<label>
									<input type="checkbox" value="">
									<span><i></i></span>
								</label>
								<p>로그인유지</p>
							</div>
							<p><a href="#" class="find-id">아이디 찾기</a><em>|</em><a href="#" class="find-pwd">비밀번호 찾기</a></p>
						</div>
						<div class="simple-login-btn">
							<p class="now-start"><span>지금 시작하세요!</span><a href="MemberJoinForm.me">북큐브 간편가입 〉</a></p>
							<input type="submit" name="" id="submit" value="로그인">
						</div>
						<div class="login-or">
							<p class="or">또는</p>
						</div>
						<div class="simple-login-btn or">
							<div class="login-btn kakaotalk">
								<a href="javascript:loginWithKakao()"><p><span class="kakaotalk">카카오톡</span>카카오로 로그인</p></a>
							</div>
							<div class="login-btn naver">
								<a href="" onclick="window.open(this.href, 'naverloginpop', 'titlebar=1, resizable=1, left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-430)/2+',scrollbars=yes, width=1, height=1'); return false"><p><span class="naver">네이버</span>네이버로 로그인</p></a>
							</div>
							<div class="login-btn facebook">
								<a href="javascript:;"><p><span class="facebook">페이스북</span>페이스북으로 로그인</p></a>
							</div>
							<div class="login-btn payco">
								<a href="javascript:;"><p><span class="payco">페이코</span>페이코로 로그인</p></a>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</section>
 <script type="text/javascript">
	var naver_id_login = new naver_id_login("bWBJf2PWa1wvH5_cl84S", "https://itwillbs6.cafe24.com/member/naver/naver.asp");

	naver_id_login.setPopup(); //Popup형태의 인증 진행
	naver_id_login.init_naver_id_login();

	var naver_url = $("#naver_id_login_anchor").attr("href");

	$(".naver a").attr("href", naver_url);
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->

<!-- 페이코 로그인 Script -->
<script type="text/javascript">
	var payco_client_id = "3RDL_pOgssXrawcbA2AG" ;
	var return_url = httpsUrl +"/member/payco/payco_https.asp";
	//var return_url = httpUrl +"/member/payco/payco.asp";
	var login_url = "https://id.payco.com/oauth2.0/authorize?response_type=code&client_id="+ payco_client_id +"&redirect_uri="+ escape(return_url) +"&serviceProviderCode=FRIENDS&userLocale=ko_KR"
	var sOption = "width=630, height=547, top=300, left=300,scrollbars=yes"

	 $(".login-btn.payco").on("click", function(e){
		var win = window.open(login_url, "payco", sOption);
	 });
</script>
<!--//페이코 로그인 Script -->

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1676308606031166',
      xfbml      : true,
      version    : 'v2.8'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

   $(".login-btn.facebook").on("click", function(e){
	   e.preventDefault();
		//FB.getLoginStatus(function(res){
			
		//});
		FB.login(function(res){
			if(res.status == "connected"){
				FB.api("/me?fields=email,name", function(res){
					//console.log(res.email);
					//console.log(res.name);
					//console.log(res.id);

					$.post("/data/_outside_join_yn.asp", {site_num : "51",ID : res.id}, function(data){						
						if (data.join_able_yn){
							sns_data_input("51", res.id, res.email, "페이스북");
						}else{
							sns_login('51',res.id,res.email);							
						}					
					}, "json");

					//alert(res);
				});
			}
		},{scope:"email"});
   });
</script>

<!-- kakao -->
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('27b43a5f358f3c1f77e6002d11090c07');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          Kakao.API.request({
			  url: '/v2/user/me',
			  success: function(res) {
				//alert(JSON.stringify(res.id));
				$.post("/data/_outside_join_yn.asp", {site_num : "21",ID : res.id}, function(data){						
					if (data.join_able_yn){
						sns_data_input("21", res.id, "", "카카오");
					}else{
						sns_login('21',res.id,'');						
					}					
				}, "json");
			  },
			  fail: function(error) {
				alert(JSON.stringify(error));
			  }
			});
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>



function sns_data_input(site_num, res_id, res_email, site_name){
	$(".sns_input_site_id").val(site_num);
	$(".sns_input_id").val(res_id);
	$(".sns_input_email").val(res_email);
	$(".sns_input_title").val(site_name);	

	$("form[name=sns_input_data]").submit();
}

function sns_login(site_num, res_id, res_email){
	$.post("/data/_outside_login_process.asp", {site_num : site_num,ID : res_id, EMAIL : res_email}, function(data){						
	if(data.success){
		location.reload();
	}else{
		alert(data.message);
	}
	}, "json");
}

function login_submit(){
	var user_id = $("#login .strId").val();
	var user_pwd = $("#login .strPass").val();
	var user_login_save = $("#login #strLoginSave").val();
	var return_url = $("#return_url").val();

	$.post("/data/_login.asp", {uid : user_id, upwd : user_pwd, loginsave : user_login_save}, function(data){					
		if(data.success){
			location.href = return_url;	
		}else{
			alert(data.message);
			//$("#login .strId").val('');
			$("#login .strPass").val('');
			$("#login .strPass").focus();										
		}
	}, "json");	
	
	return false;
}

$(function(){
	$("#login .strId").focus();
});		
</script>
<jsp:include page="../include/footer.jsp"/>